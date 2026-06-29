object DMAsignacionDeGarantias: TDMAsignacionDeGarantias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 424
  Top = 210
  Height = 354
  Width = 525
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 392
    Top = 8
  end
  object xGarantiaCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_GARANTIAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_GARANTIAS'
      
        '  (OBSERVACIONES,FECHA_VENTA,FECHA_EMBALAJE,CLIENTE,ID,IMPRESO,U' +
        'SUARIO,EMPRESA,ARTICULO,ORDEN_TRABAJO)'
      'VALUES'
      
        '  (?OBSERVACIONES,?FECHA_VENTA,?FECHA_EMBALAJE,?CLIENTE,?ID,?IMP' +
        'RESO,?USUARIO,?EMPRESA,?ARTICULO,?ORDEN_TRABAJO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_GARANTIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_GARANTIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA'
      'ORDER BY ID desc, FECHA_EMBALAJE desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_GARANTIAS'
      'SET'
      '  OBSERVACIONES=?OBSERVACIONES '
      '  ,FECHA_VENTA=?FECHA_VENTA '
      '  ,FECHA_EMBALAJE=?FECHA_EMBALAJE '
      '  ,CLIENTE=?CLIENTE '
      '  ,IMPRESO=?IMPRESO '
      '  ,USUARIO=?USUARIO '
      '  ,ORDEN_TRABAJO=?ORDEN_TRABAJO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ID=?ID ')
    AfterOpen = xGarantiaCabeceraAfterOpen
    AfterPost = xGarantiaCabeceraAfterPost
    BeforeClose = xGarantiaCabeceraBeforeClose
    BeforePost = xGarantiaCabeceraBeforePost
    OnNewRecord = xGarantiaCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_GARANTIAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object xGarantiaCabeceraEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xGarantiaCabeceraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xGarantiaCabeceraID: TIntegerField
      FieldName = 'ID'
    end
    object xGarantiaCabeceraUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xGarantiaCabeceraFECHA_EMBALAJE: TDateTimeField
      DisplayLabel = 'Fec. Embalaje'
      FieldName = 'FECHA_EMBALAJE'
      DisplayFormat = 'c'
      EditMask = '!99/99/00;1;_'
    end
    object xGarantiaCabeceraFECHA_VENTA: TDateTimeField
      DisplayLabel = 'Fec. Venta'
      FieldName = 'FECHA_VENTA'
      DisplayFormat = 'c'
      EditMask = '!99/99/00;1;_'
    end
    object xGarantiaCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xGarantiaCabeceraOBSERVACIONES: TBlobField
      DisplayLabel = 'Obs.'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object xGarantiaCabeceraIMPRESO: TIntegerField
      DisplayLabel = 'Impreso'
      FieldName = 'IMPRESO'
    end
    object xGarantiaCabeceraORDEN_TRABAJO: TFIBStringField
      FieldName = 'ORDEN_TRABAJO'
      Size = 15
    end
    object xGarantiaCabeceraALBARAN: TStringField
      DisplayLabel = 'Albaran'
      FieldKind = fkCalculated
      FieldName = 'ALBARAN'
      OnGetText = xGarantiaCabeceraALBARANGetText
      Calculated = True
    end
    object xGarantiaCabeceraID_DETALLES_S_ALB: TIntegerField
      FieldName = 'ID_DETALLES_S_ALB'
    end
  end
  object xGarantiaDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_GARANTIAS_DET'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  ID=?old_ID AND '
      '  DETALLE=?old_DETALLE ')
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_GARANTIAS_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ID=?ID AND '
      '  DETALLE=?DETALLE ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_GARANTIAS_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ID=?ID AND '
      '  DETALLE=?DETALLE ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_GARANTIAS_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ID=?ID'
      'ORDER BY ORDEN'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_GARANTIAS_DET'
      'SET'
      '  REFERENCIA=?REFERENCIA '
      '  ,ORDEN_TRABAJO=?ORDEN_TRABAJO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ID=?ID AND '
      '  DETALLE=?DETALLE ')
    DataSource = DSxGarantiaCabecera
    BeforeInsert = xGarantiaDetalleBeforeInsert
    OnNewRecord = xGarantiaDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'ID '
      'DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_GARANTIAS_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object xGarantiaDetalleEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xGarantiaDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xGarantiaDetalleID: TIntegerField
      FieldName = 'ID'
    end
    object xGarantiaDetalleDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object xGarantiaDetalleREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object xGarantiaDetalleORDEN_TRABAJO: TFIBStringField
      DisplayLabel = 'Ord. Trab.'
      FieldName = 'ORDEN_TRABAJO'
      Size = 15
    end
    object xGarantiaDetalleORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
  end
  object DSxGarantiaCabecera: TDataSource
    DataSet = xGarantiaCabecera
    Left = 152
    Top = 8
  end
  object DSxGarantiaDetalle: TDataSource
    DataSet = xGarantiaDetalle
    Left = 152
    Top = 56
  end
  object xLstGarantia: TFIBTableSet
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
      '  (DESCRIPCION,EMPRESA,DETALLE,ARTICULO)'
      'VALUES'
      '  (?DESCRIPCION,?EMPRESA,?DETALLE,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_GARANTIA_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_GARANTIAS cab '
      'left join art_articulos art '
      'on cab.empresa = art.empresa and'
      '     cab.articulo = art.articulo '
      'left join art_articulos_barras bar'
      'on art.id_a=bar.id_a'
      'where cab.empresa = ?empresa and'
      '           cab.articulo = ?articulo and'
      '           cab.id = ?id')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_GARANTIA_DET'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    AfterOpen = xLstGarantiaAfterOpen
    BeforeClose = xLstGarantiaBeforeClose
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
    Left = 40
    Top = 104
  end
  object dsxLstGarantia: TDataSource
    DataSet = xLstGarantia
    Left = 152
    Top = 104
  end
  object frReport1: TfrReport
    Dataset = frDBxLstGarantia
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Etiqueta de Garantias'
    RebuildPrinter = False
    Left = 272
    Top = 56
    ReportForm = {19000000}
  end
  object frDBxLstGarantia: TfrDBDataSet
    DataSet = xLstGarantia
    Left = 272
    Top = 104
  end
  object xLstGarantiaDetalle: TFIBTableSet
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
      '  (DESCRIPCION,EMPRESA,DETALLE,ARTICULO)'
      'VALUES'
      '  (?DESCRIPCION,?EMPRESA,?DETALLE,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESC_GARANTIA_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_GARANTIAS_DET det '
      'left join art_articulos ar1 '
      'on det.empresa = ar1.empresa and'
      '     det.detalle = ar1.articulo'
      'left join art_articulos_barras bar'
      'on ar1.id_a=bar.id_a'
      'where det.empresa = ?empresa and'
      '          det.articulo = ?articulo and'
      '          det.id = ?id'
      'order by det.orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_GARANTIA_DET'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    DataSource = dsxLstGarantia
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
    Left = 40
    Top = 152
  end
  object DsxLstGarantiaDetalle: TDataSource
    DataSet = xLstGarantiaDetalle
    Left = 152
    Top = 152
  end
  object frDBxLstGarantiaDetalle: TfrDBDataSet
    DataSet = xLstGarantiaDetalle
    Left = 272
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'no_rec_version'
      'read_committed'
      'nowait')
    Left = 456
    Top = 8
  end
end
