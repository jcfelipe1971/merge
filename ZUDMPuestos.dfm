object ZDMPuestos: TZDMPuestos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 582
  Top = 202
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 120
    Top = 18
  end
  object QMPuestos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_PUESTOS'
      'WHERE'
      '  PUESTO=?old_PUESTO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_PUESTOS'
      '  (PUESTO,DESCRIPCION,TAREA,DESPRECIA_DC)'
      'VALUES'
      '  (?PUESTO,?DESCRIPCION,?TAREA,?DESPRECIA_DC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_PUESTOS'
      'WHERE'
      '  PUESTO=?PUESTO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_PUESTOS'
      'order by puesto')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_PUESTOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,TAREA=?TAREA '
      '  ,DESPRECIA_DC=?DESPRECIA_DC '
      'WHERE'
      '  PUESTO=?PUESTO ')
    OnNewRecord = QMPuestosNewRecord
    ClavesPrimarias.Strings = (
      'PUESTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_PUESTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 19
    object QMPuestosPUESTO: TFIBStringField
      DisplayLabel = 'Puesto'
      FieldName = 'PUESTO'
      Size = 5
    end
    object QMPuestosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object QMPuestosTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 1
    end
    object QMPuestosDESPRECIA_DC: TIntegerField
      DisplayLabel = 'Desprecia DC'
      FieldName = 'DESPRECIA_DC'
    end
  end
  object DSQMPuestos: TDataSource
    DataSet = QMPuestos
    Left = 32
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
    Left = 120
    Top = 66
  end
end
