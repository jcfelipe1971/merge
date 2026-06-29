object DMImprimirCodBarras: TDMImprimirCodBarras
  OldCreateOrder = False
  OnCreate = DMImprimirCodBarrasCreate
  OnDestroy = DMImprimirCodBarrasDestroy
  Left = 524
  Top = 266
  Height = 447
  Width = 485
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 152
    Top = 16
  end
  object QMImpCBCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_IMPRESION_CB_CABECERA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NUMERO=?old_NUMERO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_IMPRESION_CB_CABECERA'
      '  (NUMERO,ID_DOC,TITULO,CANAL,EJERCICIO,EMPRESA,TIPO_DOC)'
      'VALUES'
      '  (?NUMERO,?ID_DOC,?TITULO,?CANAL,?EJERCICIO,?EMPRESA,?TIPO_DOC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_IMPRESION_CB_CABECERA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_IMPRESION_CB_CABECERA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY NUMERO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_IMPRESION_CB_CABECERA'
      'SET'
      '  ID_DOC=?ID_DOC '
      '  ,TITULO=?TITULO '
      '  ,TIPO_DOC=?TIPO_DOC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO ')
    AfterOpen = QMImpCBCabeceraAfterOpen
    AfterPost = QMImpCBCabeceraAfterPost
    BeforeClose = QMImpCBCabeceraBeforeClose
    BeforePost = QMImpCBCabeceraBeforePost
    OnCalcFields = QMImpCBCabeceraCalcFields
    OnNewRecord = QMImpCBCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NUMERO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_IMPRESION_CB_CABECERA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMImpCBCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMImpCBCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMImpCBCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMImpCBCabeceraNUMERO: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'NUMERO'
    end
    object QMImpCBCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMImpCBCabeceraTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object QMImpCBCabeceraID_DOC: TIntegerField
      DisplayLabel = 'Id. Doc.'
      FieldName = 'ID_DOC'
    end
    object QMImpCBCabeceraDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Size = 60
      Calculated = True
    end
    object QMImpCBCabeceraCLIENTE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CLIENTE'
      Calculated = True
    end
  end
  object DSQMImpCBCabecera: TDataSource
    DataSet = QMImpCBCabecera
    Left = 152
    Top = 64
  end
  object QMImpCBDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_IMPRESION_CB_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NUMERO=?old_NUMERO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_IMPRESION_CB_DETALLE'
      
        '  (NUM_COPIAS,NUMERO,LINEA,ID_DETALLE_DOC,TIPO,CANAL,EJERCICIO,E' +
        'MPRESA,COD_BARRAS,ARTICULO,PESO,TARIFA,PRECIO_VENTA)'
      'VALUES'
      
        '  (?NUM_COPIAS,?NUMERO,?LINEA,?ID_DETALLE_DOC,?TIPO,?CANAL,?EJER' +
        'CICIO,?EMPRESA,?COD_BARRAS,?ARTICULO,?PESO,?TARIFA,?PRECIO_VENTA' +
        ')')
    RefreshSQL.Strings = (
      'SELECT D.*,'
      '       (SELECT FIRST 1 TITULO_LARGO'
      '        FROM ART_ARTICULOS'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        ARTICULO = D.ARTICULO) AS TITULO,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM ART_ARTICULOS_LOTES'
      '        WHERE'
      '        ID_LOTE = D.ID_LOTE) AS LOTE'
      'FROM ART_IMPRESION_CB_DETALLE D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT D.*,'
      '       (SELECT FIRST 1 TITULO_LARGO'
      '        FROM ART_ARTICULOS'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        ARTICULO = D.ARTICULO) AS TITULO,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM ART_ARTICULOS_LOTES'
      '        WHERE'
      '        ID_LOTE = D.ID_LOTE) AS LOTE'
      'FROM ART_IMPRESION_CB_DETALLE D'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO = :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.NUMERO = :NUMERO'
      'ORDER BY D.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_IMPRESION_CB_DETALLE'
      'SET'
      '  NUM_COPIAS=?NUM_COPIAS '
      '  ,ID_DETALLE_DOC=?ID_DETALLE_DOC '
      '  ,TIPO=?TIPO '
      '  ,COD_BARRAS=?COD_BARRAS '
      '  ,ARTICULO=?ARTICULO '
      '  ,UNIDADES=?UNIDADES'
      '  ,TARIFA=?TARIFA'
      '  ,PRECIO_VENTA=?PRECIO_VENTA'
      '  ,PESO=?PESO  '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMImpCBCabecera
    AfterOpen = QMImpCBDetalleAfterOpen
    BeforeClose = QMImpCBDetalleBeforeClose
    BeforeInsert = QMImpCBDetalleBeforeInsert
    BeforePost = QMImpCBDetalleBeforePost
    OnNewRecord = QMImpCBDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NUMERO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_IMPRESION_CB_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMImpCBDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMImpCBDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMImpCBDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMImpCBDetalleNUMERO: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'NUMERO'
    end
    object QMImpCBDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMImpCBDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMImpCBDetalleARTICULOChange
      Size = 15
    end
    object QMImpCBDetalleCOD_BARRAS: TFIBStringField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'COD_BARRAS'
      OnChange = QMImpCBDetalleCOD_BARRASChange
      Size = 25
    end
    object QMImpCBDetalleNUM_COPIAS: TIntegerField
      DisplayLabel = 'Nro. Copias'
      FieldName = 'NUM_COPIAS'
    end
    object QMImpCBDetalleTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMImpCBDetalleID_DETALLE_DOC: TIntegerField
      DisplayLabel = 'Id. Det. Doc.'
      FieldName = 'ID_DETALLE_DOC'
    end
    object QMImpCBDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMImpCBDetalleALFA_6: TFIBStringField
      DisplayLabel = 'Ubicaci'#243'n'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMImpCBDetalleID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMImpCBDetalleUNIDADES: TIntegerField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMImpCBDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnGetText = QMImpCBDetalleLOTEGetText
    end
    object QMImpCBDetalleTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMImpCBDetalleTARIFAChange
      Size = 3
    end
    object QMImpCBDetallePRECIO_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMImpCBDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMImpCBDetalleIMPORTE_VENTA: TFloatField
      DisplayLabel = 'Imp. Venta'
      FieldName = 'IMPORTE_VENTA'
    end
    object QMImpCBDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSQMImpCBDetalle: TDataSource
    DataSet = QMImpCBDetalle
    Left = 152
    Top = 112
  end
  object frCodBarras: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frCodBarrasGetValue
    OnBeforePrint = frCodBarrasEnterRect
    OnEnterRect = frCodBarrasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object frUserDSCodBarras: TfrUserDataset
    RangeEnd = reCount
    Left = 376
    Top = 112
  end
  object frDBQMImpCBDetalle: TfrDBDataSet
    DataSource = DSQMImpCBDetalle
    OnFirst = frDBQMImpCBDetalleFirst
    OnNext = frDBQMImpCBDetalleNext
    Left = 264
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 256
    Top = 16
  end
  object DSQMImpCBArticulo: TDataSource
    DataSet = QMImpCBArticulo
    Left = 152
    Top = 160
  end
  object QMImpCBArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSQMImpCBDetalle
    Left = 40
    Top = 160
  end
  object DSQMImpCBLote: TDataSource
    DataSet = QMImpCBLote
    Left = 152
    Top = 208
  end
  object QMImpCBLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_LOTES'
      'WHERE '
      'ID_LOTE = :ID_LOTE')
    UniDirectional = False
    DataSource = DSQMImpCBDetalle
    Left = 40
    Top = 208
  end
  object DSQMImpCBCodCliente: TDataSource
    DataSet = QMImpCBCodCliente
    Left = 152
    Top = 256
  end
  object QMImpCBCodCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_CODCLI'
      'WHERE'
      '  EMPRESA = :EMPRESA AND'
      '  ARTICULO = :ARTICULO AND'
      '  CLIENTE = :CLIENTE'
      'ORDER BY CODIGO_CLIENTE')
    UniDirectional = False
    DataSource = DSQMImpCBDetalle
    BeforeOpen = QMImpCBCodClienteBeforeOpen
    Left = 40
    Top = 256
  end
  object xTrabajoExterno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PRO_ORD_TAREA_TEX_MOVS'
      'WHERE'
      'ID_DOC = :ID_DOC')
    UniDirectional = False
    DataSource = DSQMImpCBCabecera
    Left = 40
    Top = 304
  end
  object DSxTrabajoExterno: TDataSource
    DataSet = xTrabajoExterno
    Left = 150
    Top = 304
  end
end
