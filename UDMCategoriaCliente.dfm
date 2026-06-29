object DMCategoriaCliente: TDMCategoriaCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 448
  Top = 241
  Height = 150
  Width = 365
  object DSQMCategoriaCliente: TDataSource
    DataSet = QMCategoriaCliente
    Left = 144
    Top = 24
  end
  object QMCategoriaCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CATEGORIA_CLIENTE'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CATEGORIA_CLIENTE'
      '  (CODIGO,TITULO)'
      'VALUES'
      '  (?CODIGO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CATEGORIA_CLIENTE'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CATEGORIA_CLIENTE'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CATEGORIA_CLIENTE'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CATEGORIA_CLIENTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMCategoriaClienteCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMCategoriaClienteTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
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
    Left = 288
    Top = 24
  end
end
