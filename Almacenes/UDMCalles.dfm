object DMCalles: TDMCalles
  OldCreateOrder = False
  OnCreate = DMCanalesCreate
  Left = 806
  Top = 240
  Height = 127
  Width = 243
  object QMCalles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_CALLES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CALLE=?old_CALLE ')
    InsertSQL.Strings = (
      'INSERT INTO ART_CALLES'
      '  (CALLE,DESCRIPCION,EMPRESA)'
      'VALUES'
      '  (?CALLE,?DESCRIPCION,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_CALLES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CALLE=?CALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_CALLES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_CALLES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CALLE=?CALLE ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCallesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_CALLES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'ART_CALLES')
    CamposBloqueo.Strings = (
      'EMPRESA'
      'CALLE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 10
    Top = 12
    object QMCallesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMCallesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCallesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMCalles: TDataSource
    DataSet = QMCalles
    Left = 72
    Top = 10
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 126
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
    Left = 174
    Top = 10
  end
end
