object IsoDMIncTipo: TIsoDMIncTipo
  OldCreateOrder = False
  OnCreate = DMIsoIncTipoCreate
  Left = 430
  Top = 248
  Height = 112
  Width = 319
  object QMIsoIncTipo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_NO_CONFORMIDAD_TIPO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_NO_CONFORMIDAD_TIPO'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NO_CONFORMIDAD_TIPO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NO_CONFORMIDAD_TIPO'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NO_CONFORMIDAD_TIPO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = QMIsoIncTipoAfterPost
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NO_CONFORMIDAD_TIPO'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMIsoIncTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMIsoIncTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      DisplayWidth = 35
      FieldName = 'DESCRIPCION'
    end
  end
  object DSQMIsoIncTipo: TDataSource
    DataSet = QMIsoIncTipo
    Left = 120
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
    Left = 228
    Top = 18
  end
end
