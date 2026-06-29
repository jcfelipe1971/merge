object IsoDMManualTipo: TIsoDMManualTipo
  OldCreateOrder = False
  OnCreate = DMIsoManualTipoCreate
  Left = 554
  Top = 228
  Height = 116
  Width = 293
  object QMIsoManualTipo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_TIPO_CLASIFICACION_MANUAL'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_TIPO_CLASIFICACION_MANUAL'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_TIPO_CLASIFICACION_MANUAL'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_TIPO_CLASIFICACION_MANUAL'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_TIPO_CLASIFICACION_MANUAL'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = QMIsoManualTipoAfterPost
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_TIPO_CLASIFICACION_MANUAL'
    UpdateTransaction = TLocal
    Left = 48
    Top = 16
    object QMIsoManualTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMIsoManualTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      DisplayWidth = 35
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
  object DSQMIsoManualTipo: TDataSource
    DataSet = QMIsoManualTipo
    Left = 152
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
    Left = 236
    Top = 18
  end
end
