object DMTipoAcreedor: TDMTipoAcreedor
  OldCreateOrder = False
  OnCreate = DMTipoAcreedorCreate
  Left = 522
  Top = 346
  Height = 201
  Width = 244
  object QMTipoAcreedor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_ACREEDOR'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_ACREEDOR'
      '  (TIPO,TITULO)'
      'VALUES'
      '  (?TIPO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ACREEDOR'
      'WHERE'
      '  TIPO=?old_TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_ACREEDOR'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_ACREEDOR'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  TIPO=?old_TIPO ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMTipoAcreedorBeforePost
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_ACREEDOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMTipoAcreedorTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipoAcreedorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMTipoAcreedor: TDataSource
    DataSet = QMTipoAcreedor
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 80
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 136
    Top = 80
  end
end
