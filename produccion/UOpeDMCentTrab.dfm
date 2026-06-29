object OpeDMCentTrab: TOpeDMCentTrab
  OldCreateOrder = False
  OnCreate = OpeDMCentTrabCreate
  Left = 489
  Top = 120
  Height = 110
  Width = 309
  object QMCentroTrabajo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_CENT_TRABAJO'
      'WHERE'
      '  CENTRO=?old_CENTRO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_CENT_TRABAJO'
      '  (EMPRESA,CENTRO,DESCRIPCION,SECCION)'
      'VALUES'
      '  (?EMPRESA,?CENTRO,?DESCRIPCION,?SECCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_CENT_TRABAJO'
      'WHERE'
      '  CENTRO=?CENTRO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_CENT_TRABAJO'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY CENTRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_CENT_TRABAJO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION ,'
      '  SECCION = ?SECCION'
      'WHERE'
      '  CENTRO=?CENTRO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = QMCentroTrabajoAfterPost
    BeforePost = QMCentroTrabajoBeforePost
    ClavesPrimarias.Strings = (
      'CENTRO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_CENT_TRABAJO'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMCentroTrabajoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentroTrabajoCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object QMCentroTrabajoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMCentroTrabajoSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
  end
  object DSQMCentroTrabajo: TDataSource
    DataSet = QMCentroTrabajo
    Left = 140
    Top = 12
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
