object DMParamArticulos: TDMParamArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 238
  Top = 555
  Height = 188
  Width = 474
  object TMaestro_Estructura: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_MOD_ESTRUCTURA_CAB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  COD_MODELO=?old_COD_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_MOD_ESTRUCTURA_CAB'
      '  (COD_MODELO,TITULO,EMPRESA)'
      'VALUES'
      '  (?COD_MODELO,?TITULO,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_MOD_ESTRUCTURA_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  COD_MODELO=?COD_MODELO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_MOD_ESTRUCTURA_CAB'
      'WHERE'
      'EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_MOD_ESTRUCTURA_CAB'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  COD_MODELO=?COD_MODELO ')
    AfterDelete = Graba
    AfterOpen = TMaestro_EstructuraAfterOpen
    AfterPost = Graba
    AfterScroll = TMaestro_EstructuraAfterScroll
    BeforeOpen = TMaestro_EstructuraBeforeOpen
    OnNewRecord = TMaestro_EstructuraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'COD_MODELO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_MOD_ESTRUCTURA_CAB'
    UpdateTransaction = TLocal
    Left = 128
    Top = 16
    object TMaestro_EstructuraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TMaestro_EstructuraCOD_MODELO: TFIBStringField
      DisplayLabel = 'Cod. Modelo'
      FieldName = 'COD_MODELO'
      Size = 15
    end
    object TMaestro_EstructuraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object TDetalle_Estructura: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_MOD_ESTRUCTURA_DET'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  COD_MODELO=?old_COD_MODELO AND '
      '  ORDEN=?old_ORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO ART_MOD_ESTRUCTURA_DET'
      '  (ORDEN,EMPRESA,TIPO,DIGITOS,LIBRE,COD_MODELO)'
      'VALUES'
      '  (?ORDEN,?EMPRESA,?TIPO,?DIGITOS,?LIBRE,?COD_MODELO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_MOD_ESTRUCTURA_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  COD_MODELO=?COD_MODELO AND '
      '  ORDEN=?ORDEN ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_MOD_ESTRUCTURA_DET'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'COD_MODELO=?COD_MODELO'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_MOD_ESTRUCTURA_DET'
      'SET'
      '  TIPO=?TIPO '
      '  ,DIGITOS=?DIGITOS '
      '  ,LIBRE=?LIBRE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  COD_MODELO=?COD_MODELO AND '
      '  ORDEN=?ORDEN ')
    DataSource = DSTMaestro_Estructura
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = TDetalle_EstructuraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'COD_MODELO '
      'ORDEN ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_MOD_ESTRUCTURA_DET'
    UpdateTransaction = TLocal
    Left = 248
    Top = 16
    object TDetalle_EstructuraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TDetalle_EstructuraCOD_MODELO: TFIBStringField
      DisplayLabel = 'Cod. Modelo'
      FieldName = 'COD_MODELO'
      Size = 15
    end
    object TDetalle_EstructuraORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object TDetalle_EstructuraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 31
    end
    object TDetalle_EstructuraLIBRE: TFIBStringField
      DisplayLabel = 'Libre'
      FieldName = 'LIBRE'
      Size = 15
    end
    object TDetalle_EstructuraDIGITOS: TIntegerField
      DisplayLabel = 'Digitos'
      FieldName = 'DIGITOS'
    end
  end
  object DSTMaestro_Estructura: TDataSource
    DataSet = TMaestro_Estructura
    Left = 128
    Top = 64
  end
  object DSTDetalle_Estructura: TDataSource
    DataSet = TDetalle_Estructura
    Left = 248
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 16
  end
end
