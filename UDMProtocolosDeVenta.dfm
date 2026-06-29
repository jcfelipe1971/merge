object DMProtocolosDeVenta: TDMProtocolosDeVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 244
  Top = 170
  Height = 174
  Width = 294
  object DSQMProtocolos: TDataSource
    DataSet = QMProtocolos
    Left = 172
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 46
    Top = 4
  end
  object QMProtocolos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PROTOCOLO'
      'WHERE'
      '  PROTOCOLO=?old_PROTOCOLO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PROTOCOLO'
      '  (PROTOCOLO,TITULO,DEFECTO)'
      'VALUES'
      '  (?PROTOCOLO,?TITULO,?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PROTOCOLO'
      'WHERE'
      '  PROTOCOLO=?PROTOCOLO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PROTOCOLO'
      ' ORDER BY PROTOCOLO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PROTOCOLO'
      'SET'
      '  TITULO=?TITULO '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  PROTOCOLO=?PROTOCOLO ')
    ClavesPrimarias.Strings = (
      'PROTOCOLO')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PROTOCOLO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 49
    Top = 68
    object QMProtocolosPROTOCOLO: TFIBStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Size = 5
    end
    object QMProtocolosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProtocolosDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
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
    Left = 174
    Top = 4
  end
end
