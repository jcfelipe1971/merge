object ZDMMaquinas: TZDMMaquinas
  OldCreateOrder = False
  OnCreate = ZDMMaquinasCreate
  OnDestroy = ZDMMaquinasDestroy
  Left = 417
  Top = 358
  Height = 176
  Width = 282
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 60
    Top = 8
  end
  object QMMaquinas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_EMP_MAQUINAS'
      'WHERE'
      '  MAQUINA=?old_MAQUINA AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_EMP_MAQUINAS'
      '  (EMPRESA,MAQUINA,DESCRIPCION,ACTIVO,TIPO_MAQUINA)'
      'VALUES'
      '  (?EMPRESA,?MAQUINA,?DESCRIPCION,?ACTIVO,?TIPO_MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_EMP_MAQUINAS'
      'WHERE'
      '  MAQUINA=?MAQUINA AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_EMP_MAQUINAS'
      'where EMPRESA=?EMPRESA'
      'ORDER BY MAQUINA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_EMP_MAQUINAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,ACTIVO=?ACTIVO '
      '  ,TIPO_MAQUINA=?TIPO_MAQUINA '
      'WHERE'
      '  MAQUINA=?MAQUINA AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMMaquinasNewRecord
    ClavesPrimarias.Strings = (
      'MAQUINA '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_EMP_MAQUINAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 72
    object QMMaquinasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasMAQUINA: TFIBStringField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      Size = 4
    end
    object QMMaquinasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMMaquinasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMMaquinasTIPO_MAQUINA: TFIBStringField
      DisplayLabel = 'Tipo Maq.'
      FieldName = 'TIPO_MAQUINA'
      Size = 1
    end
    object QMMaquinasDESC_TIPO_MAQUINA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_TIPO_MAQUINA'
      OnGetText = QMMaquinasDESC_TIPO_MAQUINAGetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMMaquinas: TDataSource
    DataSet = QMMaquinas
    Left = 168
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 164
    Top = 8
  end
end
