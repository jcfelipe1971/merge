object DMMarcas: TDMMarcas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 414
  Top = 219
  Height = 220
  Width = 412
  object DSQMMarcas: TDataSource
    DataSet = QMMarcas
    Left = 136
    Top = 8
  end
  object QMMarcas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MARCA'
      'WHERE'
      '  MARCA=?old_MARCA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MARCA'
      '  (ID_MARCA,MARCA,TITULO,ID_IMAGEN)'
      'VALUES'
      '  (?ID_MARCA,?MARCA,?TITULO,?ID_IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MARCA'
      'WHERE'
      '  MARCA=?MARCA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MARCA'
      'ORDER BY MARCA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MARCA'
      'SET'
      '  ID_MARCA=?ID_MARCA '
      '  ,TITULO=?TITULO '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      'WHERE'
      '  MARCA=?MARCA ')
    AfterOpen = QMMarcasAfterOpen
    BeforeClose = QMMarcasBeforeClose
    BeforePost = QMMarcasBeforePost
    OnNewRecord = QMMarcasNewRecord
    ClavesPrimarias.Strings = (
      'MARCA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MARCA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMMarcasID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object QMMarcasMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object QMMarcasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMarcasID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 56
  end
  object DSxModelos: TDataSource
    DataSet = xModelos
    Left = 136
    Top = 56
  end
  object xModelos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MODELO'
      'WHERE'
      '  ID_MARCA=?old_ID_MARCA AND '
      '  MODELO=?old_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MODELO'
      '  (ID_MODELO,ID_MARCA,ID_IMAGEN,TITULO,MODELO)'
      'VALUES'
      '  (?ID_MODELO,?ID_MARCA,?ID_IMAGEN,?TITULO,?MODELO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODELO'
      'WHERE'
      '  ID_MARCA=?ID_MARCA AND '
      '  MODELO=?MODELO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODELO'
      'WHERE'
      '  ID_MARCA=?ID_MARCA '
      'ORDER BY MODELO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MODELO'
      'SET'
      '  ID_MODELO=?ID_MODELO '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID_MARCA=?ID_MARCA AND '
      '  MODELO=?MODELO ')
    DataSource = DSQMMarcas
    BeforePost = xModelosBeforePost
    OnNewRecord = xModelosNewRecord
    ClavesPrimarias.Strings = (
      'ID_MARCA'
      'MODELO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MODELO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object xModelosID_MODELO: TIntegerField
      DisplayLabel = 'Id Modelo'
      FieldName = 'ID_MODELO'
    end
    object xModelosID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object xModelosMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object xModelosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xModelosID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
  end
end
