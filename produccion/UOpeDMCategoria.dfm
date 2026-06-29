object OpeDMCategoria: TOpeDMCategoria
  OldCreateOrder = False
  OnCreate = opedmcategoriaCreate
  Left = 278
  Top = 224
  Height = 119
  Width = 304
  object QMCategoria: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SYS_EMPLEADO_CAT'
      'WHERE'
      '  CATEGORIA=?old_CATEGORIA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SYS_EMPLEADO_CAT'
      '  (CATEGORIA,DESCRIPCION)'
      'VALUES'
      '  (?CATEGORIA,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SYS_EMPLEADO_CAT'
      'WHERE'
      '  CATEGORIA=?CATEGORIA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SYS_EMPLEADO_CAT'
      'ORDER BY CATEGORIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SYS_EMPLEADO_CAT'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CATEGORIA=?CATEGORIA ')
    AfterDelete = Graba
    AfterPost = QMCategoriaAfterPost
    BeforePost = QMCategoriaBeforePost
    ClavesPrimarias.Strings = (
      'CATEGORIA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SYS_EMPLEADO_CAT'
    UpdateTransaction = TLocal
    Left = 32
    Top = 16
    object QMCategoriaCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      OnValidate = duplicados
      Size = 3
    end
    object QMCategoriaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSQMCategoria: TDataSource
    DataSet = QMCategoria
    Left = 120
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 16
  end
end
