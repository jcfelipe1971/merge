object OpeDMTiposContratos: TOpeDMTiposContratos
  OldCreateOrder = False
  OnCreate = OpeDMTiposContratosCreate
  Left = 260
  Top = 129
  Height = 282
  Width = 410
  object QMTipoContratos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SYS_TIPOS_CONTRATOS'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SYS_TIPOS_CONTRATOS'
      '  (HORAS_MES,ESPECIFICACIONES,DESCRIPCION,TIPO)'
      'VALUES'
      '  (?HORAS_MES,?ESPECIFICACIONES,?DESCRIPCION,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SYS_TIPOS_CONTRATOS'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SYS_TIPOS_CONTRATOS'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SYS_TIPOS_CONTRATOS'
      'SET'
      '  HORAS_MES=?HORAS_MES '
      '  ,ESPECIFICACIONES=?ESPECIFICACIONES '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = QMTipoContratosAfterPost
    OnNewRecord = QMTipoContratosNewRecord
    ClavesPrimarias.Strings = (
      'TIPO')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SYS_TIPOS_CONTRATOS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 8
    object QMTipoContratosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnValidate = Duplicados
      Size = 3
    end
    object QMTipoContratosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descrip.'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMTipoContratosHORAS_MES: TFloatField
      DisplayLabel = 'H. al mes'
      FieldName = 'HORAS_MES'
    end
    object QMTipoContratosESPECIFICACIONES: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'ESPECIFICACIONES'
      Size = 8
    end
  end
  object DSQMTipoContratos: TDataSource
    DataSet = QMTipoContratos
    Left = 144
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 268
    Top = 10
  end
end
