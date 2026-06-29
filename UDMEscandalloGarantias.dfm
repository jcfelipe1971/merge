object DMEscandalloGarantias: TDMEscandalloGarantias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 472
  Top = 154
  Height = 150
  Width = 363
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 8
  end
  object xEscandalloGarantia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_ESC_GARANTIA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_ESC_GARANTIA'
      '  (NRO_ETIQUETAS,DESCRIPCION,EMPRESA,ARTICULO)'
      'VALUES'
      '  (?NRO_ETIQUETAS,?DESCRIPCION,?EMPRESA,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_GARANTIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_GARANTIA'
      'WHERE'
      '  EMPRESA=?EMPRESA '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_GARANTIA'
      'SET'
      '  NRO_ETIQUETAS=?NRO_ETIQUETAS '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    AfterOpen = xEscandalloGarantiaAfterOpen
    AfterScroll = xEscandalloGarantiaAfterScroll
    BeforeClose = xEscandalloGarantiaBeforeClose
    OnNewRecord = xEscandalloGarantiaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_ESC_GARANTIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object xEscandalloGarantiaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xEscandalloGarantiaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEscandalloGarantiaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
      BlanksToNULL = False
    end
    object xEscandalloGarantiaNRO_ETIQUETAS: TIntegerField
      DisplayLabel = 'Nro. Etiquetas'
      FieldName = 'NRO_ETIQUETAS'
    end
  end
  object xEscandalloGarantiaDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_ESC_GARANTIA_DET'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  DETALLE=?old_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_ESC_GARANTIA_DET'
      '  (DESCRIPCION,EMPRESA,DETALLE,ARTICULO,ORDEN)'
      'VALUES'
      '  (?DESCRIPCION,?EMPRESA,?DETALLE,?ARTICULO,?ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_GARANTIA_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_GARANTIA_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_GARANTIA_DET'
      'SET'
      '  DESCRIPCION=?DESCRIPCION,'
      '  ORDEN=?ORDEN'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    DataSource = DSxEscandalloGarantia
    BeforeInsert = xEscandalloGarantiaDetalleBeforeInsert
    OnNewRecord = xEscandalloGarantiaDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_ESC_GARANTIA_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object xEscandalloGarantiaDetalleEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xEscandalloGarantiaDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEscandalloGarantiaDetalleDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      OnChange = xEscandalloGarantiaDetalleDETALLEChange
      Size = 15
    end
    object xEscandalloGarantiaDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
      BlanksToNULL = False
    end
    object xEscandalloGarantiaDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSxEscandalloGarantia: TDataSource
    DataSet = xEscandalloGarantia
    Left = 200
    Top = 8
  end
  object DSxEscandalloGarantiaDetalle: TDataSource
    DataSet = xEscandalloGarantiaDetalle
    Left = 200
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 56
  end
end
