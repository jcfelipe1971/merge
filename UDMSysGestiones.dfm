object DMSysGestiones: TDMSysGestiones
  OldCreateOrder = False
  OnCreate = DMSysCuentasCreate
  Left = 789
  Top = 275
  Height = 365
  Width = 316
  object QMGestiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CUENTAS_GESTION'
      'WHERE'
      '  PGC=?old_PGC AND '
      '  GESTION=?old_GESTION AND '
      '  PAIS=?old_PAIS ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CUENTAS_GESTION'
      '  (TITULO,GESTION,PAIS,PGC)'
      'VALUES'
      '  (?TITULO,?GESTION,?PAIS,?PGC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CUENTAS_GESTION'
      'WHERE'
      '  PGC=?PGC AND '
      '  GESTION=?GESTION AND '
      '  PAIS=?PAIS ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CUENTAS_GESTION'
      'WHERE PGC=?PGC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CUENTAS_GESTION'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  PGC=?PGC AND '
      '  GESTION=?GESTION AND '
      '  PAIS=?PAIS ')
    DataSource = DSxPgC
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMGestionesNewRecord
    ClavesPrimarias.Strings = (
      'PGC '
      'GESTION '
      'PAIS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CUENTAS_GESTION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 68
    object QMGestionesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMGestionesGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
    end
    object QMGestionesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMGestionesPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
  end
  object DSGestiones: TDataSource
    DataSet = QMGestiones
    Left = 136
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 238
    Top = 58
  end
  object xPgC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      ' FROM SYS_PLANES_CONTABLES'
      'ORDER BY PGC')
    UniDirectional = False
    AfterOpen = xPgCAfterOpen
    Left = 42
    Top = 138
    object xPgCPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xPgCPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object xPgCTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPgCDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxPgC: TDataSource
    DataSet = xPgC
    Left = 132
    Top = 138
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 238
    Top = 122
  end
end
