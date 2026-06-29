object ZDMTiposArticulo: TZDMTiposArticulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 443
  Top = 217
  Height = 235
  Width = 385
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 24
  end
  object DSQMTiposArticulo: TDataSource
    DataSet = QMTiposArticulo
    Left = 144
    Top = 24
  end
  object QMTiposArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPOS_ARTICULO_TYC'
      'WHERE'
      '  TIPO_ARTICULO_TYC=?old_TIPO_ARTICULO_TYC ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPOS_ARTICULO_TYC'
      '  (DESCRIPCION,TIPO_ARTICULO_TYC)'
      'VALUES'
      '  (?DESCRIPCION,?TIPO_ARTICULO_TYC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_ARTICULO_TYC'
      'WHERE'
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_ARTICULO_TYC'
      'ORDER BY TIPO_ARTICULO_TYC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPOS_ARTICULO_TYC'
      'SET'
      '  DESCRIPCION=?DESCRIPCION, '
      '  CADENA_INICIO=?CADENA_INICIO'
      'WHERE'
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC ')
    AfterOpen = QMTiposArticuloAfterOpen
    ClavesPrimarias.Strings = (
      'TIPO_ARTICULO_TYC ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPOS_ARTICULO_TYC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMTiposArticuloTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'TIPO_ARTICULO_TYC'
      ReadOnly = True
      Size = 3
    end
    object QMTiposArticuloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
    object QMTiposArticuloCADENA_INICIO: TFIBStringField
      DisplayLabel = 'Cadena Inicio'
      FieldName = 'CADENA_INICIO'
      Size = 3
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 24
  end
  object DSSubtipoArticulo: TDataSource
    DataSet = QMSubtipoArticulo
    Left = 144
    Top = 72
  end
  object QMSubtipoArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_SUBTIPOS_ARTICULO_TYC'
      'WHERE'
      '  TIPO_ARTICULO_TYC=?old_TIPO_ARTICULO_TYC AND '
      '  SUBTIPO_ARTICULO_TYC=?old_SUBTIPO_ARTICULO_TYC ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_SUBTIPOS_ARTICULO_TYC'
      '  (TIPO_ARTICULO_TYC,'#13#10'SUBTIPO_ARTICULO_TYC,TITULO)'
      'VALUES'
      '  (?TIPO_ARTICULO_TYC,'#13#10'?SUBTIPO_ARTICULO_TYC,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_SUBTIPOS_ARTICULO_TYC'
      'WHERE'
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC AND '
      '  SUBTIPO_ARTICULO_TYC=?SUBTIPO_ARTICULO_TYC ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_SUBTIPOS_ARTICULO_TYC'
      'WHERE'
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC '
      'ORDER BY SUBTIPO_ARTICULO_TYC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_SUBTIPOS_ARTICULO_TYC'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC AND '
      '  SUBTIPO_ARTICULO_TYC=?SUBTIPO_ARTICULO_TYC ')
    DataSource = DSQMTiposArticulo
    OnNewRecord = QMSubtipoArticuloNewRecord
    ClavesPrimarias.Strings = (
      'TIPO_ARTICULO_TYC'
      'SUBTIPO_ARTICULO_TYC')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_SUBTIPOS_ARTICULO_TYC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 72
    object QMSubtipoArticuloTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object QMSubtipoArticuloSUBTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO_ARTICULO_TYC'
      Size = 3
    end
    object QMSubtipoArticuloTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
end
