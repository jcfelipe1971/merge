object ProDMFases: TProDMFases
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 449
  Top = 148
  Height = 265
  Width = 221
  object QMProSysFases: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_FASES'
      'WHERE'
      '  FASE=?old_FASE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_FASES'
      '  (FASE,TITULO)'
      'VALUES'
      '  (?FASE,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_FASES'
      'WHERE'
      '  FASE=?FASE ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_FASES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_FASES'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  FASE=?FASE ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'FASE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_FASES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 16
    object QMProSysFasesFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
    object QMProSysFasesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
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
    Left = 128
    Top = 80
  end
  object DSQMProSysFases: TDataSource
    DataSet = QMProSysFases
    Left = 120
    Top = 16
  end
  object frProFases: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado c'#243'digo barras'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 96
    ReportForm = {19000000}
  end
  object frDBLstFases: TfrDBDataSet
    DataSource = DSQMProSysFases
    Left = 40
    Top = 152
  end
end
