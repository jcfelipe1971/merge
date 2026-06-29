object DMEquivalenciaColores: TDMEquivalenciaColores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 458
  Top = 180
  Height = 269
  Width = 375
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 296
    Top = 16
  end
  object DSEquivalenciaColores: TDataSource
    DataSet = QMEquivalenciaColores
    Left = 176
    Top = 16
  end
  object QMEquivalenciaColores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DESPIECE_COLOR'
      'WHERE'
      '  ID_A_CORRESP=?old_ID_A_CORRESP AND '
      '  ID_A_BASE=?old_ID_A_BASE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DESPIECE_COLOR'
      
        '  (ID_A_BASE,ID_A_CORRESP,COLOR,EMPRESA,ARTICULO_BASE,ARTICULO_C' +
        'ORRESP)'
      'VALUES'
      
        '  (?ID_A_BASE,?ID_A_CORRESP,?COLOR,?EMPRESA,?ARTICULO_BASE,?ARTI' +
        'CULO_CORRESP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DESPIECE_COLOR'
      'WHERE'
      '  ID_A_CORRESP=?ID_A_CORRESP AND '
      '  ID_A_BASE=?ID_A_BASE ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DESPIECE_COLOR'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'ORDER BY COLOR, ARTICULO_BASE, ARTICULO_CORRESP')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DESPIECE_COLOR'
      'SET'
      '  COLOR=?COLOR '
      '  ,EMPRESA=?EMPRESA '
      '  ,ARTICULO_BASE=?ARTICULO_BASE '
      '  ,ARTICULO_CORRESP=?ARTICULO_CORRESP '
      'WHERE'
      '  ID_A_CORRESP=?ID_A_CORRESP AND '
      '  ID_A_BASE=?ID_A_BASE ')
    Plan.Strings = (
      'PLAN (PRO_DESPIECE_COLOR NATURAL)')
    BeforePost = QMEquivalenciaColoresBeforePost
    OnNewRecord = QMEquivalenciaColoresNewRecord
    ClavesPrimarias.Strings = (
      'ID_A_CORRESP '
      'ID_A_BASE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DESPIECE_COLOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMEquivalenciaColoresID_A_BASE: TIntegerField
      DisplayLabel = 'Id Articulo Base'
      FieldName = 'ID_A_BASE'
      Visible = False
    end
    object QMEquivalenciaColoresID_A_CORRESP: TIntegerField
      DisplayLabel = 'Id Articulo Correspondiente'
      FieldName = 'ID_A_CORRESP'
      Visible = False
    end
    object QMEquivalenciaColoresCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 2
    end
    object QMEquivalenciaColoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Visible = False
    end
    object QMEquivalenciaColoresARTICULO_BASE: TFIBStringField
      DisplayLabel = 'Articulo Base'
      FieldName = 'ARTICULO_BASE'
      Size = 15
    end
    object QMEquivalenciaColoresARTICULO_CORRESP: TFIBStringField
      DisplayLabel = 'Articulo Correspondiente'
      FieldName = 'ARTICULO_CORRESP'
      Size = 15
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
    Left = 296
    Top = 64
  end
end
