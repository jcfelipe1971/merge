object ProDMCabPlanif: TProDMCabPlanif
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 258
  Top = 149
  Height = 263
  Width = 346
  object QMProCabPlanif: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CAB_PLANIF'
      'WHERE'
      '  ID_PLANIF=?old_ID_PLANIF ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CAB_PLANIF'
      '  (ID_PLANIF,TITULO)'
      'VALUES'
      '  (?ID_PLANIF,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CAB_PLANIF'
      'WHERE'
      '  ID_PLANIF=?ID_PLANIF ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CAB_PLANIF')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CAB_PLANIF'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID_PLANIF=?ID_PLANIF ')
    Plan.Strings = (
      'PLAN (PRO_SYS_FASES NATURAL)')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMProCabPlanifBeforePost
    ClavesPrimarias.Strings = (
      'ID_PLANIF ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CAB_PLANIF'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMProCabPlanifID_PLANIF: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_PLANIF'
    end
    object QMProCabPlanifTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 176
    Top = 16
  end
  object DSQMProCabPlanif: TDataSource
    DataSet = QMProCabPlanif
    Left = 40
    Top = 64
  end
end
