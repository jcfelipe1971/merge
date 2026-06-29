object ProDMRelacionUds: TProDMRelacionUds
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 150
  Width = 215
  object QMRelacionUds: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_RELACION_UNIDADES'
      'WHERE'
      '  UNIDAD_DEST=?old_UNIDAD_DEST AND '
      '  UNIDAD=?old_UNIDAD ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_RELACION_UNIDADES'
      '  (UNIDAD,UNIDAD_DEST,CANTIDAD_DEST)'
      'VALUES'
      '  (?UNIDAD,?UNIDAD_DEST,?CANTIDAD_DEST)')
    RefreshSQL.Strings = (
      'SELECT'
      ' 1 as cantidad_orig, cantidad_dest, unidad, unidad_dest'
      'FROM PRO_SYS_RELACION_UNIDADES'
      'WHERE'
      '  UNIDAD_DEST=?UNIDAD_DEST AND '
      '  UNIDAD=?UNIDAD ')
    SelectSQL.Strings = (
      'SELECT 1 as cantidad_orig, unidad, unidad_dest, cantidad_dest'
      'FROM PRO_SYS_RELACION_UNIDADES'
      'where cantidad_dest>1'
      'order by unidad, cantidad_dest')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_RELACION_UNIDADES'
      'SET'
      '  CANTIDAD_DEST=?CANTIDAD_DEST '
      'WHERE'
      '  UNIDAD_DEST=?UNIDAD_DEST AND '
      '  UNIDAD=?UNIDAD ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMRelacionUdsNewRecord
    ClavesPrimarias.Strings = (
      'UNIDAD_DEST'
      'UNIDAD')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_RELACION_UNIDADES'
    Left = 33
    Top = 14
    object QMRelacionUdsCANTIDAD_ORIG: TIntegerField
      DisplayLabel = 'Cantidad Origen'
      FieldName = 'CANTIDAD_ORIG'
    end
    object QMRelacionUdsUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad Origen'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMRelacionUdsCANTIDAD_DEST: TFloatField
      DisplayLabel = 'Cantidad Destino'
      FieldName = 'CANTIDAD_DEST'
    end
    object QMRelacionUdsUNIDAD_DEST: TFIBStringField
      DisplayLabel = 'Unidad Destino'
      FieldName = 'UNIDAD_DEST'
      Size = 2
    end
  end
  object DSRelacionUds: TDataSource
    DataSet = QMRelacionUds
    Left = 33
    Top = 66
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 16
  end
end
