object IsoDMEnsayo: TIsoDMEnsayo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 708
  Top = 274
  Height = 211
  Width = 342
  object QMIsoEnsayo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO'
      '  (CODIGO,ISO_TIPO_ENSAYO,ISO_NORMATIVAS,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?ISO_TIPO_ENSAYO,?ISO_NORMATIVAS,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO'
      'SET'
      '  ISO_TIPO_ENSAYO=?ISO_TIPO_ENSAYO '
      '  ,ISO_NORMATIVAS=?ISO_NORMATIVAS'
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterDelete = Graba
    AfterPost = QMIsoEnsayoAfterPost
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 44
    Top = 16
    object QMIsoEnsayoCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMIsoEnsayoISO_TIPO_ENSAYO: TFIBStringField
      DisplayLabel = 'Tipo Ensayo'
      FieldName = 'ISO_TIPO_ENSAYO'
      Size = 3
    end
    object QMIsoEnsayoISO_NORMATIVAS: TFIBStringField
      DisplayLabel = 'Normativas'
      FieldName = 'ISO_NORMATIVAS'
      Size = 3
    end
    object QMIsoEnsayoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSQMIsoEnsayo: TDataSource
    DataSet = QMIsoEnsayo
    Left = 128
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
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
    Left = 236
    Top = 64
  end
end
