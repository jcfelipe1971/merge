object ZDMMaestros: TZDMMaestros
  OldCreateOrder = False
  OnCreate = ZDMMaestrosCreate
  OnDestroy = ZDMMaestrosDestroy
  Left = 342
  Top = 223
  Height = 268
  Width = 281
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 212
    Top = 8
  end
  object QMTablasMaestras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TABLAS_AUXILIARES'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  TIPO_AUX=?old_TIPO_AUX ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TABLAS_AUXILIARES'
      '  (TIPO_AUX,CODIGO,DESCRIPCION,CANTIDAD,PORCENTAJE)'
      'VALUES'
      '  (?TIPO_AUX,?CODIGO,?DESCRIPCION,?CANTIDAD,?PORCENTAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TABLAS_AUXILIARES'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  TIPO_AUX=?TIPO_AUX ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TABLAS_AUXILIARES'
      'where tipo_aux = ?tipo_aux'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TABLAS_AUXILIARES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      ' ,CANTIDAD=?CANTIDAD'
      ' ,PORCENTAJE=?PORCENTAJE'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  TIPO_AUX=?TIPO_AUX ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMTablasMaestrasNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'TIPO_AUX ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TABLAS_AUXILIARES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 101
    object QMTablasMaestrasTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object QMTablasMaestrasCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 8
    end
    object QMTablasMaestrasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMTablasMaestrasCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMTablasMaestrasPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMTablasMaestras: TDataSource
    DataSet = QMTablasMaestras
    Left = 56
    Top = 149
  end
  object DSxTiposTablasMaestras: TDataSource
    DataSet = xTiposTablasMaestras
    Left = 56
    Top = 56
  end
  object xTiposTablasMaestras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_TIPOS_AUXILIARES'
      'WHERE'
      '  TIPO_AUX=?old_TIPO_AUX ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_TIPOS_AUXILIARES'
      '  (TIPO_AUX,DESC_TIPO_AUX)'
      'VALUES'
      '  (?TIPO_AUX,?DESC_TIPO_AUX)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_TIPOS_AUXILIARES'
      'WHERE'
      '  TIPO_AUX=?TIPO_AUX ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPOS_AUXILIARES'
      'where tipo_aux = ?tipo_aux')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_TIPOS_AUXILIARES'
      'SET'
      '  DESC_TIPO_AUX=?DESC_TIPO_AUX '
      'WHERE'
      '  TIPO_AUX=?TIPO_AUX ')
    ClavesPrimarias.Strings = (
      'TIPO_AUX ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_TIPOS_AUXILIARES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object xTiposTablasMaestrasTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object xTiposTablasMaestrasDESC_TIPO_AUX: TFIBStringField
      DisplayLabel = 'Desc. Tipo'
      FieldName = 'DESC_TIPO_AUX'
      Size = 40
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 212
    Top = 56
  end
end
