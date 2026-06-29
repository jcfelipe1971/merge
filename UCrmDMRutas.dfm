object CrmDMRutas: TCrmDMRutas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 284
  Height = 266
  Width = 315
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 240
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
    Left = 240
    Top = 96
  end
  object QMRutas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACTOS_RUTAS'
      'WHERE'
      '  ID_RUTA=?old_ID_RUTA ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACTOS_RUTAS'
      '  (ID_RUTA,AGENTE,EMPRESA,TITULO,RUTA)'
      'VALUES'
      '  (?ID_RUTA,?AGENTE,?EMPRESA,?TITULO,?RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_RUTAS'
      'WHERE'
      '  ID_RUTA=?ID_RUTA ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_CONTACTOS_RUTAS'
      'WHERE EMPRESA=:EMPRESA'
      'ORDER BY RUTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONTACTOS_RUTAS'
      'SET'
      '  AGENTE=?AGENTE '
      '  ,EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      '  ,RUTA=?RUTA '
      'WHERE'
      '  ID_RUTA=?ID_RUTA ')
    BeforePost = QMRutasBeforePost
    OnNewRecord = QMRutasNewRecord
    ClavesPrimarias.Strings = (
      'ID_RUTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONTACTOS_RUTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMRutasID_RUTA: TIntegerField
      DisplayLabel = 'ID Ruta'
      FieldName = 'ID_RUTA'
    end
    object QMRutasRUTA: TFIBStringField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      Size = 5
    end
    object QMRutasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRutasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMRutasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMRutas: TDataSource
    DataSet = QMRutas
    Left = 112
    Top = 24
  end
end
