object DMUnidades: TDMUnidades
  OldCreateOrder = False
  OnCreate = DMUnidadesCreate
  Left = 516
  Top = 264
  Height = 196
  Width = 327
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object QMUnidades: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_UNIDADES_ARTICULOS'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_UNIDADES_ARTICULOS'
      '  (TIPO,DECIMALES,SIGNO,TITULO)'
      'VALUES'
      '  (?TIPO,?DECIMALES,?SIGNO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_UNIDADES_ARTICULOS'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_UNIDADES_ARTICULOS'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_UNIDADES_ARTICULOS'
      'SET'
      '  DECIMALES=?DECIMALES '
      '  ,SIGNO=?SIGNO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterOpen = QMUnidadesAfterOpen
    AfterPost = Graba
    BeforeClose = QMUnidadesBeforeClose
    OnNewRecord = QMUnidadesNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_UNIDADES_ARTICULOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMUnidadesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 2
    end
    object QMUnidadesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 25
    end
    object QMUnidadesSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 3
    end
    object QMUnidadesDECIMALES: TIntegerField
      DisplayLabel = 'Decimales'
      FieldName = 'DECIMALES'
    end
  end
  object DSQMUnidades: TDataSource
    DataSet = QMUnidades
    Left = 144
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 144
    Top = 8
  end
  object QMUnidadesIdioma: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_UNIDADES_ARTICULOS_IDIOMAS'
      'WHERE'
      '  IDIOMA=?old_IDIOMA AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_UNIDADES_ARTICULOS_IDIOMAS'
      '  (TIPO,IDIOMA,TITULO)'
      'VALUES'
      '  (?TIPO,?IDIOMA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_UNIDADES_ARTICULOS_IDIOMAS'
      'WHERE'
      '  IDIOMA=?IDIOMA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_UNIDADES_ARTICULOS_IDIOMAS'
      'WHERE TIPO = ?TIPO'
      'ORDER BY IDIOMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_UNIDADES_ARTICULOS_IDIOMAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  IDIOMA=?IDIOMA AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMUnidades
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMUnidadesIdiomaNewRecord
    ClavesPrimarias.Strings = (
      'IDIOMA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_UNIDADES_ARTICULOS_IDIOMAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMUnidadesIdiomaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 2
    end
    object QMUnidadesIdiomaIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMUnidadesIdiomaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSQMUnidadesIdioma: TDataSource
    DataSet = QMUnidadesIdioma
    Left = 144
    Top = 104
  end
end
