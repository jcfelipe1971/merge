object ProDMTurnos: TProDMTurnos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 747
  Top = 218
  Height = 224
  Width = 339
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 24
  end
  object QMTurno: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TURNOS'
      'WHERE'
      '  TURNO=?old_TURNO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TURNOS'
      '  (EMPRESA,TURNO,DESCRIPCION,ORDEN)'
      'VALUES'
      '  (?EMPRESA,?TURNO,?DESCRIPCION,?ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TURNOS'
      'WHERE'
      '  TURNO=?TURNO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TURNOS'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY TURNO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TURNOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION,'
      '  ORDEN=?ORDEN '
      'WHERE'
      '  TURNO=?TURNO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMTurnoNewRecord
    ClavesPrimarias.Strings = (
      'TURNO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TURNOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMTurnoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTurnoTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object QMTurnoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMTurnoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSQMTurno: TDataSource
    DataSet = QMTurno
    Left = 120
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 24
  end
end
