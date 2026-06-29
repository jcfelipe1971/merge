object DMCodigosBarra: TDMCodigosBarra
  OldCreateOrder = False
  OnCreate = DMCodigosBarraCreate
  Left = 552
  Top = 349
  Height = 215
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 80
  end
  object QMCodigosBarra: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_CODIGO_BARRAS'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_CODIGO_BARRAS'
      '  (LONGITUD,TITULO,TIPO)'
      'VALUES'
      '  (?LONGITUD,?TITULO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_CODIGO_BARRAS'
      'WHERE'
      '  TIPO=?OLD_TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_CODIGO_BARRAS'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_CODIGO_BARRAS'
      'SET'
      '  LONGITUD=?LONGITUD '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  TIPO=?OLD_TIPO ')
    AfterDelete = QMCodigosBarraAfterDelete
    AfterPost = QMCodigosBarraAfterPost
    BeforePost = QMCodigosBarraBeforePost
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_CODIGO_BARRAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMCodigosBarraTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCodigosBarraTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMCodigosBarraLONGITUD: TIntegerField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
  end
  object DSQMCodigosBarra: TDataSource
    DataSet = QMCodigosBarra
    Left = 136
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 80
  end
end
