object DMPostizos: TDMPostizos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 565
  Top = 294
  Height = 163
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 123
    Top = 18
  end
  object QMPostizos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_POSTIZOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  NUM_POSTIZO=?old_NUM_POSTIZO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_POSTIZOS'
      '  (ID_UBICACION,NUM_POSTIZO,EMPRESA,DESCRIPCION)'
      'VALUES'
      '  (?ID_UBICACION,?NUM_POSTIZO,?EMPRESA,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_POSTIZOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  NUM_POSTIZO=?NUM_POSTIZO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_POSTIZOS'
      'where empresa=?empresa'
      'order by num_postizo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_POSTIZOS'
      'SET'
      '  ID_UBICACION=?ID_UBICACION '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  NUM_POSTIZO=?NUM_POSTIZO ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMPostizosBeforePost
    OnNewRecord = QMPostizosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'NUM_POSTIZO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_POSTIZOS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 16
    object QMPostizosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMPostizosNUM_POSTIZO: TIntegerField
      DisplayLabel = 'N'#250'm. Postizo'
      FieldName = 'NUM_POSTIZO'
    end
    object QMPostizosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
    object QMPostizosID_UBICACION: TIntegerField
      DisplayLabel = 'Ubicaci'#243'n'
      FieldName = 'ID_UBICACION'
    end
  end
  object DSQMPostizos: TDataSource
    DataSet = QMPostizos
    Left = 34
    Top = 71
  end
end
