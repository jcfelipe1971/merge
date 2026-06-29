object CrmDmArticulos: TCrmDmArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 520
  Top = 177
  Height = 344
  Width = 448
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 232
    Top = 8
  end
  object QMArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_ARTICULO'
      'WHERE'
      '  ID_ARTICULO=?old_ID_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_ARTICULO'
      '  (ID_ARTICULO,CODIGO,DESCRIPCION,CANTIDAD)'
      'VALUES'
      '  (?ID_ARTICULO,?CODIGO,?DESCRIPCION,?CANTIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_ARTICULO'
      'WHERE'
      '  ID_ARTICULO=?ID_ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_ARTICULO'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_ARTICULO'
      'SET'
      '  CODIGO=?CODIGO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CANTIDAD=?CANTIDAD '
      'WHERE'
      '  ID_ARTICULO=?ID_ARTICULO ')
    BeforePost = QMArticulosBeforePost
    ClavesPrimarias.Strings = (
      'ID_ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_ARTICULO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMArticulosID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Articulo'
      FieldName = 'ID_ARTICULO'
    end
    object QMArticulosCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMArticulosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMArticulosCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSQMArticulo: TDataSource
    DataSet = QMArticulos
    Left = 136
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
    Left = 296
    Top = 8
  end
end
