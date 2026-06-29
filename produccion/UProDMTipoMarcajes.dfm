object ProDMTipoMarcajes: TProDMTipoMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 840
  Top = 117
  Height = 270
  Width = 247
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 140
    Top = 16
  end
  object DSQMProTipoMarc: TDataSource
    DataSet = QMProTipoMarc
    Left = 41
    Top = 68
  end
  object QMProTipoMarc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPO_MARCAJE'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPO_MARCAJE'
      '  (PRODUCTIVO,TIPO,DESCRIPCION)'
      'VALUES'
      '  (?PRODUCTIVO,?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPO_MARCAJE'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPO_MARCAJE'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPO_MARCAJE'
      'SET'
      '  PRODUCTIVO=?PRODUCTIVO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMProTipoMarcNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPO_MARCAJE'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 40
    Top = 16
    object QMProTipoMarcTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProTipoMarcDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
    object QMProTipoMarcPRODUCTIVO: TIntegerField
      DisplayLabel = 'Productivo'
      FieldName = 'PRODUCTIVO'
    end
  end
  object frHYTipoMarcajes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Tipo de Marcajes'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 155
    Top = 92
    ReportForm = {19000000}
  end
  object frDBQMTipoMarc: TfrDBDataSet
    DataSource = DSQMProTipoMarc
    Left = 157
    Top = 140
  end
end
