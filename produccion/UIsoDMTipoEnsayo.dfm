object IsoDMTipoEnsayo: TIsoDMTipoEnsayo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 430
  Top = 248
  Height = 178
  Width = 382
  object QMIsoTipoEnsayo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_TIPO_ENSAYO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_TIPO_ENSAYO'
      '  (CODIGO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_TIPO_ENSAYO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_TIPO_ENSAYO'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_TIPO_ENSAYO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_TIPO_ENSAYO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMIsoTipoEnsayoCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMIsoTipoEnsayoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSQMIsoTipoEnsayo: TDataSource
    DataSet = QMIsoTipoEnsayo
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 244
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 244
    Top = 64
  end
end
