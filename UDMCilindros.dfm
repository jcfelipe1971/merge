object DMCilindros: TDMCilindros
  OldCreateOrder = False
  OnCreate = DMCilindrosCreate
  Left = 590
  Top = 325
  Height = 406
  Width = 441
  object QMCilindros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CILINDROS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CILINDRO=?old_CILINDRO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CILINDROS'
      '  (ARTICULO,Z,BANDA,CILINDRO,CODMAQ,EMPRESA,DESCRIPCION)'
      'VALUES'
      '  (?ARTICULO,?Z,?BANDA,?CILINDRO,?CODMAQ,?EMPRESA,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CILINDROS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CILINDRO=?CILINDRO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CILINDROS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CILINDROS'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,Z=?Z '
      '  ,BANDA=?BANDA '
      '  ,CODMAQ=?CODMAQ '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CILINDRO=?CILINDRO ')
    BeforePost = QMCilindrosBeforePost
    OnNewRecord = QMCilindrosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CILINDRO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CILINDROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMCilindrosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCilindrosCILINDRO: TIntegerField
      DisplayLabel = 'Cilindro'
      FieldName = 'CILINDRO'
    end
    object QMCilindrosZ: TFloatField
      FieldName = 'Z'
    end
    object QMCilindrosBANDA: TFloatField
      DisplayLabel = 'Banda'
      FieldName = 'BANDA'
    end
    object QMCilindrosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCilindrosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCilindrosCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
  end
  object DSQMCilindros: TDataSource
    DataSet = QMCilindros
    Left = 184
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 56
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
    Left = 184
    Top = 8
  end
end
