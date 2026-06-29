object IsoDMAccionesTipo: TIsoDMAccionesTipo
  OldCreateOrder = False
  OnCreate = DMIsoAccionesTipoCreate
  Left = 390
  Top = 280
  Height = 164
  Width = 414
  object QMIsoAccionesTipo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_INC_ACCIONES_TIPO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_INC_ACCIONES_TIPO'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_INC_ACCIONES_TIPO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_INC_ACCIONES_TIPO'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_INC_ACCIONES_TIPO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = QMIsoAccionesTipoAfterPost
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_INC_ACCIONES_TIPO'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMIsoAccionesTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      DisplayWidth = 35
      FieldName = 'DESCRIPCION'
    end
    object QMIsoAccionesTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object DSQMAccionesTipo: TDataSource
    DataSet = QMIsoAccionesTipo
    Left = 160
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 18
  end
end
