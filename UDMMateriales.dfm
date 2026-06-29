object DMMateriales: TDMMateriales
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 494
  Top = 342
  Height = 224
  Width = 300
  object DSQMMateriales: TDataSource
    DataSet = QMMateriales
    Left = 134
    Top = 18
  end
  object QMMateriales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MATERIALES'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MATERIALES'
      '  (CODIGO,TITULO)'
      'VALUES'
      '  (?CODIGO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MATERIALES'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MATERIALES'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MATERIALES'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'sys_materiales'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 16
    object QMMaterialesCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 10
    end
    object QMMaterialesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 134
    Top = 74
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 30
    Top = 74
  end
end
