object DMPosiciones: TDMPosiciones
  OldCreateOrder = False
  OnCreate = DMCanalesCreate
  Left = 806
  Top = 240
  Height = 127
  Width = 243
  object QMPosiciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_POSICION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  POSICION=?old_POSICION ')
    InsertSQL.Strings = (
      'INSERT INTO ART_POSICION'
      '  (DESCRIPCION,EMPRESA,POSICION)'
      'VALUES'
      '  (?DESCRIPCION,?EMPRESA,?POSICION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_POSICION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  POSICION=?POSICION ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_POSICION'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_POSICION'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  POSICION=?POSICION ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMPosicionesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'POSICION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_POSICION'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'ART_POSICION')
    CamposBloqueo.Strings = (
      'EMPRESA'
      'POSICION')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 12
    object QMPosicionesPOSICION: TFIBStringField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMPosicionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMPosicionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMPosiciones: TDataSource
    DataSet = QMPosiciones
    Left = 88
    Top = 26
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 142
    Top = 10
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 182
    Top = 26
  end
end
