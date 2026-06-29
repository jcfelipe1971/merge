object DMEstanterias: TDMEstanterias
  OldCreateOrder = False
  OnCreate = DMCanalesCreate
  Left = 806
  Top = 240
  Height = 127
  Width = 251
  object QMEstanterias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ESTANTERIAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESTANTERIA=?old_ESTANTERIA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ESTANTERIAS'
      '  (ESTANTERIA,DESCRIPCION,EMPRESA)'
      'VALUES'
      '  (?ESTANTERIA,?DESCRIPCION,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ESTANTERIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESTANTERIA=?ESTANTERIA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ESTANTERIAS'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ESTANTERIAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESTANTERIA=?ESTANTERIA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEstanteriasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESTANTERIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ESTANTERIAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 12
    object QMEstanteriasESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanter'#237'a'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMEstanteriasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMEstanteriasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMEstanterias: TDataSource
    DataSet = QMEstanterias
    Left = 96
    Top = 34
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 150
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
    Left = 198
    Top = 34
  end
end
