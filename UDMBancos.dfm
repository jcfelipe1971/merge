object DMBancos: TDMBancos
  OldCreateOrder = False
  OnCreate = DMBancosCreate
  Left = 449
  Top = 329
  Height = 137
  Width = 323
  object QMBancos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_BANCOS'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  ENTIDAD=?old_ENTIDAD ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_BANCOS'
      '  (ENTIDAD,'#13#10'TITULO,PAIS)'
      'VALUES'
      '  (?ENTIDAD,'#13#10'?TITULO,?PAIS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_BANCOS'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  ENTIDAD=?ENTIDAD ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_BANCOS'
      'ORDER BY PAIS, ENTIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_BANCOS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  ENTIDAD=?ENTIDAD ')
    OnNewRecord = QMBancosNewRecord
    ClavesPrimarias.Strings = (
      'PAIS'
      'ENTIDAD')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_BANCOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMBancosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object QMBancosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMBancosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSQMBancos: TDataSource
    DataSet = QMBancos
    Left = 104
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 176
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 24
  end
end
