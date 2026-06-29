object DMNominasPlantillas: TDMNominasPlantillas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 800
  Top = 310
  Height = 528
  Width = 691
  object DSQMNomPlantilla: TDataSource
    DataSet = QMNomPlantilla
    Left = 168
    Top = 16
  end
  object QMNomPlantilla: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_NOMINAS_PLANTILLA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_NOMINAS_PLANTILLA'
      '  (ID,EMPRESA,TITULO)'
      'VALUES'
      '  (?ID,?EMPRESA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_NOMINAS_PLANTILLA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_NOMINAS_PLANTILLA'
      'WHERE '
      'EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_NOMINAS_PLANTILLA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID=?ID ')
    AfterOpen = QMNomPlantillaAfterOpen
    BeforeClose = QMNomPlantillaBeforeClose
    BeforePost = QMNomPlantillaBeforePost
    OnNewRecord = QMNomPlantillaNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_NOMINAS_PLANTILLA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMNomPlantillaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomPlantillaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomPlantillaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 100
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 576
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 576
    Top = 64
  end
  object DSQMNomPlantillaConf: TDataSource
    DataSet = QMNomPlantillaConf
    Left = 168
    Top = 64
  end
  object QMNomPlantillaConf: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_NOMINA_PLANTILLA_CONF'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_NOMINA_PLANTILLA_CONF'
      '  (ID,'#13#10'ORDEN,TIPO,CONCEPTO,ID_PLANTILLA)'
      'VALUES'
      '  (?ID,'#13#10'?ORDEN,?TIPO,?CONCEPTO,?ID_PLANTILLA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_NOMINA_PLANTILLA_CONF'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_NOMINA_PLANTILLA_CONF'
      'WHERE'
      '  ID_PLANTILLA=?ID '
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_NOMINA_PLANTILLA_CONF'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,TIPO=?TIPO '
      '  ,CONCEPTO=?CONCEPTO '
      '  ,ID_PLANTILLA=?ID_PLANTILLA '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMNomPlantilla
    BeforePost = QMNomPlantillaConfBeforePost
    OnCalcFields = QMNomPlantillaConfCalcFields
    OnNewRecord = QMNomPlantillaConfNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_NOMINA_PLANTILLA_CONF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 64
    object QMNomPlantillaConfID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomPlantillaConfCONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      DisplayWidth = 15
      FieldName = 'CONCEPTO'
      Size = 15
    end
    object QMNomPlantillaConfORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMNomPlantillaConfTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMNomPlantillaConfID_PLANTILLA: TIntegerField
      DisplayLabel = 'Id Plantilla'
      FieldName = 'ID_PLANTILLA'
    end
    object QMNomPlantillaConfGLOSA: TStringField
      DisplayLabel = 'Glosa'
      FieldKind = fkCalculated
      FieldName = 'GLOSA'
      Calculated = True
    end
  end
end
