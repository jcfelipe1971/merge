object DMGruposTextos: TDMGruposTextos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 447
  Top = 201
  Height = 242
  Width = 284
  object QMGrupos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TEXTOS_GRUPOS'
      'WHERE'
      '  GRUPO=?old_GRUPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TEXTOS_GRUPOS'
      '  (GRUPO,NOTA,TEXTO)'
      'VALUES'
      '  (?GRUPO,?NOTA,?TEXTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TEXTOS_GRUPOS'
      'WHERE'
      '  GRUPO=?GRUPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TEXTOS_GRUPOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TEXTOS_GRUPOS'
      'SET'
      '  NOTA=?NOTA '
      '  ,TEXTO=?TEXTO '
      'WHERE'
      '  GRUPO=?GRUPO ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMGruposBeforePost
    OnNewRecord = QMGruposNewRecord
    ClavesPrimarias.Strings = (
      'GRUPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TEXTOS_GRUPOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMGruposGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMGruposNOTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'NOTA'
      Size = 60
    end
    object QMGruposTEXTO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'TEXTO'
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
    Left = 224
    Top = 16
  end
  object DSGrupos: TDataSource
    DataSet = QMGrupos
    Left = 136
    Top = 16
  end
  object QMGruposIdiomas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TEXTOS_IDIOMAS'
      'WHERE'
      '  GRUPO=?old_GRUPO AND '
      '  IDIOMA=?old_IDIOMA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TEXTOS_IDIOMAS'
      '  (GRUPO,IDIOMA,NOTA,TEXTO)'
      'VALUES'
      '  (?GRUPO,?IDIOMA,?NOTA,?TEXTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TEXTOS_IDIOMAS'
      'WHERE'
      '  GRUPO=?GRUPO AND '
      '  IDIOMA=?IDIOMA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TEXTOS_IDIOMAS'
      '  where grupo=?grupo'
      '  order by grupo,idioma')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TEXTOS_IDIOMAS'
      'SET'
      '  NOTA=?NOTA '
      '  ,TEXTO=?TEXTO '
      'WHERE'
      '  GRUPO=?GRUPO AND '
      '  IDIOMA=?IDIOMA ')
    DataSource = DSGrupos
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMGruposIdiomasNewRecord
    ClavesPrimarias.Strings = (
      'GRUPO '
      'IDIOMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TEXTOS_IDIOMAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMGruposIdiomasGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMGruposIdiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMGruposIdiomasNOTA: TFIBStringField
      DisplayLabel = 'Nota'
      FieldName = 'NOTA'
      Size = 60
    end
    object QMGruposIdiomasTEXTO: TFIBStringField
      DisplayLabel = 'Traducci'#243'n'
      FieldName = 'TEXTO'
      Size = 60
    end
  end
  object DSQMGruposIdiomas: TDataSource
    DataSet = QMGruposIdiomas
    Left = 136
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 64
  end
end
