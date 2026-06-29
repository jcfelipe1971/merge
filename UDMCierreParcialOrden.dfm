object DMCierreParcialOrden: TDMCierreParcialOrden
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 427
  Top = 165
  Height = 424
  Width = 496
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 72
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
    Left = 256
    Top = 16
  end
  object DSQMCierreParcial: TDataSource
    DataSet = QMCierreParcial
    Left = 256
    Top = 64
  end
  object QMCierreParcial: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CIERRE_PARCIAL'
      'WHERE'
      '  CIERRE=?old_CIERRE AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CIERRE_PARCIAL'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,CIERRE,FECHA_CREACION,ESTADO,CO' +
        'MENTARIO,ID,ENTRADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CIERRE,?FECHA_CREACION,?ES' +
        'TADO,?COMENTARIO,?ID,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT * FROM PRO_ORD_CIERRE_PARCIAL'
      'WHERE'
      'EMPRESA=?EMPRESA AND  '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'SERIE=?SERIE AND '
      'CIERRE=?CIERRE')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_CIERRE_PARCIAL'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'SERIE=?SERIE AND'
      'ESTADO=0 '
      'ORDER BY CIERRE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CIERRE_PARCIAL'
      'SET'
      '  FECHA_CREACION=?FECHA_CREACION '
      '  ,ESTADO=?ESTADO '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,ID=?ID '
      '  ,ENTRADA=?ENTRADA '
      'WHERE'
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMCierreParcialAfterOpen
    BeforeClose = QMCierreParcialBeforeClose
    BeforePost = QMCierreParcialBeforePost
    OnNewRecord = QMCierreParcialNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'CIERRE'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CIERRE_PARCIAL'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 64
    object QMCierreParcialEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fecha Creaci'#243'n'
      FieldName = 'FECHA_CREACION'
    end
    object QMCierreParcialESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      OnChange = QMCierreParcialESTADOChange
    end
    object QMCierreParcialCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMCierreParcialID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCierreParcialENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object QMCierreParcialDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CIERRE_PARCIAL_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CIERRE=?old_CIERRE AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CIERRE_PARCIAL_DET'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,CIERRE,LINEA,RIG_OF,ARTICULO,TI' +
        'TULO,ORIGEN,ALMACEN,UNIDADES,ID,ID_CIERRE,ID_ORDEN,RIG_MOV,ENTRA' +
        'DA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CIERRE,?LINEA,?RIG_OF,?ART' +
        'ICULO,?TITULO,?ORIGEN,?ALMACEN,?UNIDADES,?ID,?ID_CIERRE,?ID_ORDE' +
        'N,?RIG_MOV,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_CIERRE_PARCIAL_DET'
      'WHERE'
      '  CIERRE=?CIERRE AND'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CIERRE_PARCIAL_DET'
      'SET'
      '  RIG_OF=?RIG_OF '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,ORIGEN=?ORIGEN '
      '  ,ALMACEN=?ALMACEN '
      '  ,UNIDADES=?UNIDADES '
      '  ,ID=?ID '
      '  ,ID_CIERRE=?ID_CIERRE '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,ENTRADA=?ENTRADA '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCierreParcial
    AfterOpen = QMCierreParcialDetalleAfterOpen
    BeforeClose = QMCierreParcialDetalleBeforeClose
    BeforeEdit = QMCierreParcialDetalleBeforeEdit
    BeforePost = QMCierreParcialDetalleBeforePost
    OnNewRecord = QMCierreParcialDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CIERRE '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CIERRE_PARCIAL_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 112
    object QMCierreParcialDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialDetalleCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCierreParcialDetalleRIG_OF: TIntegerField
      DisplayLabel = 'Orden Prod.'
      FieldName = 'RIG_OF'
    end
    object QMCierreParcialDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCierreParcialDetalleORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QMCierreParcialDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCierreParcialDetalleID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCierreParcialDetalleID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMCierreParcialDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMCierreParcialDetalleRIG_MOV: TIntegerField
      DisplayLabel = 'Mov. Man. Stock'
      FieldName = 'RIG_MOV'
    end
    object QMCierreParcialDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCierreParcialDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMCierreParcialDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCierreParcialDetalleID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMCierreParcialDetalleDescLote: TStringField
      DisplayLabel = 'Desc. Lote'
      FieldKind = fkCalculated
      FieldName = 'DescLote'
      OnGetText = QMCierreParcialDetalleDescLoteGetText
      Calculated = True
    end
    object QMCierreParcialDetalleDescSituacion: TStringField
      DisplayLabel = 'Situaci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescSituacion'
      OnGetText = QMCierreParcialDetalleDescSituacionGetText
      Size = 60
      Calculated = True
    end
    object QMCierreParcialDetalleCLASIFICACION: TStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'CLASIFICACION'
      OnGetText = QMCierreParcialDetalleCLASIFICACIONGetText
      Size = 100
      Calculated = True
    end
  end
  object QMCierreParcialDetalleLote: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
      'WHERE'
      '  SUB_LINEA=?old_SUB_LINEA AND '
      '  LINEA=?old_LINEA AND '
      '  CIERRE=?old_CIERRE AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,CIERRE,LINEA,SUB_LINEA,RIG_OF,T' +
        'IPO_UNIDAD_LOGISTICA,LOTE,ALM_DEST,UBICACION,UNIDADES_LOGISITCAS' +
        ',UNIDADES_POR_UL,UNIDADES,ID,ID_CIERRE,ID_DET,ESTADO,ID_DETALLES' +
        '_ST,ID_UBICACION,LINEA_UBICACION,ID_D_ST_UBICACION,ENTRADA,ID_LO' +
        'TE,OPERARIO,NOTAS,CALIDAD,FECHA,NUM_ETIQUETAS,ORDEN_LOTE_SECUENC' +
        'IAL,ARTICULO,UNIDADES_RECHAZO,ID_RESERVA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CIERRE,?LINEA,?SUB_LINEA,?' +
        'RIG_OF,?TIPO_UNIDAD_LOGISTICA,?LOTE,?ALM_DEST,?UBICACION,?UNIDAD' +
        'ES_LOGISITCAS,?UNIDADES_POR_UL,?UNIDADES,?ID,?ID_CIERRE,?ID_DET,' +
        '?ESTADO,?ID_DETALLES_ST,?ID_UBICACION,?LINEA_UBICACION,?ID_D_ST_' +
        'UBICACION,?ENTRADA,?ID_LOTE,?OPERARIO,?NOTAS,?CALIDAD,?FECHA,?NU' +
        'M_ETIQUETAS,?ORDEN_LOTE_SECUENCIAL,?ARTICULO,?UNIDADES_RECHAZO,?' +
        'ID_RESERVA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
      'WHERE'
      '  SUB_LINEA=?SUB_LINEA AND '
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY SUB_LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
      'SET'
      '  RIG_OF=?RIG_OF '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,LOTE=?LOTE '
      '  ,ALM_DEST=?ALM_DEST '
      '  ,UBICACION=?UBICACION '
      '  ,UNIDADES_LOGISITCAS=?UNIDADES_LOGISITCAS '
      '  ,UNIDADES_POR_UL=?UNIDADES_POR_UL '
      '  ,UNIDADES=?UNIDADES '
      '  ,ID=?ID '
      '  ,ID_CIERRE=?ID_CIERRE '
      '  ,ID_DET=?ID_DET '
      '  ,ESTADO=?ESTADO '
      '  ,ID_DETALLES_ST=?ID_DETALLES_ST '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,LINEA_UBICACION=?LINEA_UBICACION '
      '  ,ID_D_ST_UBICACION=?ID_D_ST_UBICACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_LOTE=?ID_LOTE'
      '  ,OPERARIO=?OPERARIO'
      '  ,NOTAS=?NOTAS'
      '  ,CALIDAD=?CALIDAD'
      '  ,FECHA=?FECHA'
      '  ,NUM_ETIQUETAS=?NUM_ETIQUETAS'
      '  ,ORDEN_LOTE_SECUENCIAL=?ORDEN_LOTE_SECUENCIAL'
      '  ,ARTICULO=?ARTICULO'
      '  ,UNIDADES_RECHAZO=?UNIDADES_RECHAZO '
      '  ,ID_RESERVA=?ID_RESERVA'
      'WHERE'
      '  SUB_LINEA=?SUB_LINEA AND '
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCierreParcialDetalle
    AfterCancel = QMCierreParcialDetalleLoteAfterCancel
    AfterEdit = QMCierreParcialDetalleLoteAfterEdit
    AfterOpen = QMCierreParcialDetalleLoteAfterOpen
    AfterPost = QMCierreParcialDetalleLoteAfterPost
    BeforeClose = QMCierreParcialDetalleLoteBeforeClose
    BeforeEdit = QMCierreParcialDetalleLoteBeforeEdit
    BeforeInsert = QMCierreParcialDetalleLoteBeforeInsert
    BeforePost = QMCierreParcialDetalleLoteBeforePost
    OnNewRecord = QMCierreParcialDetalleLoteNewRecord
    ClavesPrimarias.Strings = (
      'SUB_LINEA '
      'LINEA '
      'CIERRE '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 160
    object QMCierreParcialDetalleLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialDetalleLoteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialDetalleLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialDetalleLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialDetalleLoteCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialDetalleLoteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCierreParcialDetalleLoteSUB_LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'SUB_LINEA'
    end
    object QMCierreParcialDetalleLoteRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMCierreParcialDetalleLoteALM_DEST: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALM_DEST'
      OnChange = QMCierreParcialDetalleLoteALM_DESTChange
      Size = 3
    end
    object QMCierreParcialDetalleLoteUBICACION: TFIBStringField
      DisplayLabel = 'Ubic.'
      FieldName = 'UBICACION'
    end
    object QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISITCAS'
      OnChange = QMCierreParcialDetalleLoteUNIDADES_LOGISITCASChange
    end
    object QMCierreParcialDetalleLoteUNIDADES_POR_UL: TFloatField
      DisplayLabel = 'Cant.x U.L.'
      FieldName = 'UNIDADES_POR_UL'
      OnChange = QMCierreParcialDetalleLoteUNIDADES_POR_ULChange
    end
    object QMCierreParcialDetalleLoteUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMCierreParcialDetalleLoteUNIDADESChange
    end
    object QMCierreParcialDetalleLoteID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCierreParcialDetalleLoteID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMCierreParcialDetalleLoteID_DET: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DET'
    end
    object QMCierreParcialDetalleLoteESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCierreParcialDetalleLoteID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMCierreParcialDetalleLoteID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
      OnChange = QMCierreParcialDetalleLoteID_UBICACIONChange
    end
    object QMCierreParcialDetalleLoteLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMCierreParcialDetalleLoteID_D_ST_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_ST_UBICACION'
    end
    object QMCierreParcialDetalleLoteENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCierreParcialDetalleLoteDescLote: TStringField
      DisplayLabel = 'Desc. Lote'
      FieldKind = fkCalculated
      FieldName = 'DescLote'
      OnGetText = QMCierreParcialDetalleDescLoteGetText
      Calculated = True
    end
    object QMCierreParcialDetalleLoteID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMCierreParcialDetalleLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo Ud. Log.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      OnChange = QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICAChange
      Size = 5
    end
    object QMCierreParcialDetalleLoteOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMCierreParcialDetalleLoteNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCierreParcialDetalleLoteCALIDAD: TFIBStringField
      DisplayLabel = 'Calidad'
      FieldName = 'CALIDAD'
    end
    object QMCierreParcialDetalleLoteFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      OnChange = QMCierreParcialDetalleLoteFECHAChange
    end
    object QMCierreParcialDetalleLoteNUM_ETIQUETAS: TIntegerField
      DisplayLabel = 'Num. Etiquetas'
      FieldName = 'NUM_ETIQUETAS'
    end
    object QMCierreParcialDetalleLoteORDEN_LOTE_SECUENCIAL: TIntegerField
      DisplayLabel = 'Orden Lote Sec.'
      FieldName = 'ORDEN_LOTE_SECUENCIAL'
    end
    object QMCierreParcialDetalleLoteARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCierreParcialDetalleLoteARTICULOChange
      Size = 15
    end
    object QMCierreParcialDetalleLoteDescArticulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMCierreParcialDetalleLoteDescArticuloGetText
      Size = 256
      Calculated = True
    end
    object QMCierreParcialDetalleLoteSUM_UNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldKind = fkCalculated
      FieldName = 'SUM_UNIDADES'
      OnGetText = QMCierreParcialDetalleLoteSUM_UNIDADESGetText
      Calculated = True
    end
    object QMCierreParcialDetalleLoteUNIDADES_RECHAZO: TFloatField
      DisplayLabel = 'Unidades rechazo'
      FieldName = 'UNIDADES_RECHAZO'
    end
    object QMCierreParcialDetalleLoteID_RESERVA: TIntegerField
      DisplayLabel = 'Id Reserva'
      FieldName = 'ID_RESERVA'
    end
    object QMCierreParcialDetalleLoteCLASIFICACION: TStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'CLASIFICACION'
      OnGetText = QMCierreParcialDetalleLoteCLASIFICACIONGetText
      Size = 100
      Calculated = True
    end
  end
  object DSQMCierreParcialDetalle: TDataSource
    DataSet = QMCierreParcialDetalle
    Left = 256
    Top = 112
  end
  object DSQMCierreParcialDetalleLote: TDataSource
    DataSet = QMCierreParcialDetalleLote
    Left = 256
    Top = 160
  end
  object frLotes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = 'Listado de Cierre Parcial'
    RebuildPrinter = False
    OnGetValue = frLotesGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 376
    Top = 16
    ReportForm = {
      190000005E00000019000000001D004D6963726F736F66742058505320446F63
      756D656E742057726974657200FEFEFF000000000000000000000000FDFF0100
      000000FC00000000000000000000000000000000580063450D7ED5F9E340BF44
      3218188CE640}
  end
  object QMCierreParcialDetalleComponente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CIERRE_PARCIAL_DET_COM'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  CIERRE=?old_CIERRE AND '
      '  LINEA=?old_LINEA AND '
      '  SUB_LINEA=?old_SUB_LINEA AND '
      '  SUB_LINEA_COMPONENTE=?old_SUB_LINEA_COMPONENTE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CIERRE_PARCIAL_DET_COM'
      
        '  (SERIE,UNIDADES_LOGISITCAS,UNIDADES_POR_UL,UNIDADES,FECHA,UNID' +
        'ADES_DEVOLVER,CIERRE,LINEA,SUB_LINEA,SUB_LINEA_COMPONENTE,RIG_OF' +
        ',ID,ID_CIERRE,ID_DET,ID_DETALLES_ST,ID_UBICACION,LINEA_UBICACION' +
        ',ID_D_ST_UBICACION,ENTRADA,ID_LOTE,OPERARIO,RIG_MOV_COMPONENTE_D' +
        'EVOLUCION,ID_DETALLES_ST_DEV,ID_D_ST_UBICACION_DEV,EMPRESA,EJERC' +
        'ICIO,CANAL,LOTE,UBICACION,ESTADO,ARTICULO,TIPO_UNIDAD_LOGISTICA,' +
        'ALM_DEST,ALMACEN_DEVOLVER,UNIDADES_REALES,ID_DETALLES_ST_REPOSIC' +
        'ION)'
      'VALUES'
      
        '  (?SERIE,?UNIDADES_LOGISITCAS,?UNIDADES_POR_UL,?UNIDADES,?FECHA' +
        ',?UNIDADES_DEVOLVER,?CIERRE,?LINEA,?SUB_LINEA,?SUB_LINEA_COMPONE' +
        'NTE,?RIG_OF,?ID,?ID_CIERRE,?ID_DET,?ID_DETALLES_ST,?ID_UBICACION' +
        ',?LINEA_UBICACION,?ID_D_ST_UBICACION,?ENTRADA,?ID_LOTE,?OPERARIO' +
        ',?RIG_MOV_COMPONENTE_DEVOLUCION,?ID_DETALLES_ST_DEV,?ID_D_ST_UBI' +
        'CACION_DEV,?EMPRESA,?EJERCICIO,?CANAL,?LOTE,?UBICACION,?ESTADO,?' +
        'ARTICULO,?TIPO_UNIDAD_LOGISTICA,?ALM_DEST,?ALMACEN_DEVOLVER,?UNI' +
        'DADES_REALES,?ID_DETALLES_ST_REPOSICION)')
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.CIERRE, C.LIN' +
        'EA, C.SUB_LINEA, C.SUB_LINEA_COMPONENTE, C.RIG_OF,'
      
        '       C.ARTICULO, A.TITULO, C.TIPO_UNIDAD_LOGISTICA, C.ALM_DEST' +
        ', C.UBICACION, C.UNIDADES_LOGISITCAS, C.UNIDADES_POR_UL, C.UNIDA' +
        'DES,'
      
        '       C.ID, C.ID_CIERRE, ID_DET, C.ESTADO, C.ID_DETALLES_ST, C.' +
        'ID_UBICACION, C.LINEA_UBICACION, C.ID_D_ST_UBICACION,'
      
        '       C.ENTRADA, C.OPERARIO, C.FECHA, C.UNIDADES_DEVOLVER, C.AL' +
        'MACEN_DEVOLVER, C.UNIDADES_REALES,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) ID_LOTE,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) LOTE,'
      '        (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) ID_LOTE_DEV,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) LOTE_DEV'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C'
      'JOIN ART_ARTICULOS A'
      'ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.CIERRE = :CIERRE AND'
      'C.LINEA = :LINEA AND'
      'C.SUB_LINEA = :SUB_LINEA AND'
      'C.SUB_LINEA_COMPONENTE = :SUB_LINEA_COMPONENTE'
      '')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.CIERRE, C.LIN' +
        'EA, C.SUB_LINEA, C.SUB_LINEA_COMPONENTE, C.RIG_OF,'
      
        '       C.ARTICULO, A.TITULO, C.TIPO_UNIDAD_LOGISTICA, C.ALM_DEST' +
        ', C.UBICACION, C.UNIDADES_LOGISITCAS, C.UNIDADES_POR_UL, C.UNIDA' +
        'DES,'
      
        '       C.ID, C.ID_CIERRE, ID_DET, C.ESTADO, C.ID_DETALLES_ST, C.' +
        'ID_UBICACION, C.LINEA_UBICACION, C.ID_D_ST_UBICACION,'
      
        '       C.ENTRADA, C.OPERARIO, C.FECHA, C.UNIDADES_DEVOLVER, C.AL' +
        'MACEN_DEVOLVER, C.UNIDADES_REALES,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) ID_LOTE,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) LOTE,'
      '        (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) ID_LOTE_DEV,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV'
      '        WHERE'
      '        ID_CIERRE_PAR_DET_COM = C.ID'
      '        ORDER BY ID_LOTE) LOTE_DEV'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C'
      'JOIN ART_ARTICULOS A'
      'ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.CIERRE = :CIERRE AND'
      'C.LINEA = :LINEA AND'
      'C.SUB_LINEA = :SUB_LINEA'
      'ORDER BY C.SUB_LINEA_COMPONENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CIERRE_PARCIAL_DET_COM'
      'SET'
      '  UNIDADES_LOGISITCAS=?UNIDADES_LOGISITCAS '
      '  ,UNIDADES_POR_UL=?UNIDADES_POR_UL '
      '  ,UNIDADES=?UNIDADES '
      '  ,FECHA=?FECHA '
      '  ,UNIDADES_DEVOLVER=?UNIDADES_DEVOLVER '
      '  ,RIG_OF=?RIG_OF '
      '  ,ID=?ID '
      '  ,ID_CIERRE=?ID_CIERRE '
      '  ,ID_DET=?ID_DET '
      '  ,ID_DETALLES_ST=?ID_DETALLES_ST '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,LINEA_UBICACION=?LINEA_UBICACION '
      '  ,ID_D_ST_UBICACION=?ID_D_ST_UBICACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,OPERARIO=?OPERARIO '
      '  ,RIG_MOV_COMPONENTE_DEVOLUCION=?RIG_MOV_COMPONENTE_DEVOLUCION '
      '  ,ID_DETALLES_ST_DEV=?ID_DETALLES_ST_DEV '
      '  ,ID_D_ST_UBICACION_DEV=?ID_D_ST_UBICACION_DEV '
      '  ,LOTE=?LOTE '
      '  ,UBICACION=?UBICACION '
      '  ,ESTADO=?ESTADO '
      '  ,ARTICULO=?ARTICULO '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,ALM_DEST=?ALM_DEST '
      '  ,ALMACEN_DEVOLVER=?ALMACEN_DEVOLVER '
      '  ,UNIDADES_REALES=?UNIDADES_REALES '
      '  ,ID_DETALLES_ST_REPOSICION=?ID_DETALLES_ST_REPOSICION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  CIERRE=?CIERRE AND '
      '  LINEA=?LINEA AND '
      '  SUB_LINEA=?SUB_LINEA AND '
      '  SUB_LINEA_COMPONENTE=?SUB_LINEA_COMPONENTE ')
    DataSource = DSQMCierreParcialDetalleLote
    AfterScroll = QMCierreParcialDetalleComponenteAfterScroll
    OnNewRecord = QMCierreParcialDetalleComponenteNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CIERRE_PARCIAL_DET_COM'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 208
    object QMCierreParcialDetalleComponenteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialDetalleComponenteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialDetalleComponenteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialDetalleComponenteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialDetalleComponenteCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialDetalleComponenteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCierreParcialDetalleComponenteSUB_LINEA: TIntegerField
      DisplayLabel = 'Sub Linea'
      FieldName = 'SUB_LINEA'
    end
    object QMCierreParcialDetalleComponenteSUB_LINEA_COMPONENTE: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'SUB_LINEA_COMPONENTE'
    end
    object QMCierreParcialDetalleComponenteRIG_OF: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'RIG_OF'
    end
    object QMCierreParcialDetalleComponenteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCierreParcialDetalleComponenteTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo Ud. Log.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMCierreParcialDetalleComponenteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMCierreParcialDetalleComponenteALM_DEST: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALM_DEST'
      Size = 3
    end
    object QMCierreParcialDetalleComponenteUBICACION: TFIBStringField
      DisplayLabel = 'Ubic.'
      FieldName = 'UBICACION'
    end
    object QMCierreParcialDetalleComponenteUNIDADES_LOGISITCAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISITCAS'
    end
    object QMCierreParcialDetalleComponenteUNIDADES_POR_UL: TFloatField
      DisplayLabel = 'Uds x Ud. Log.'
      FieldName = 'UNIDADES_POR_UL'
    end
    object QMCierreParcialDetalleComponenteUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCierreParcialDetalleComponenteID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCierreParcialDetalleComponenteID_CIERRE: TIntegerField
      DisplayLabel = 'Id. Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMCierreParcialDetalleComponenteID_DET: TIntegerField
      DisplayLabel = 'Id. Det.'
      FieldName = 'ID_DET'
    end
    object QMCierreParcialDetalleComponenteESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCierreParcialDetalleComponenteID_DETALLES_ST: TIntegerField
      DisplayLabel = 'Id. Det. Mov.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMCierreParcialDetalleComponenteID_UBICACION: TIntegerField
      DisplayLabel = 'Id. Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMCierreParcialDetalleComponenteLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Lin. Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMCierreParcialDetalleComponenteID_D_ST_UBICACION: TIntegerField
      DisplayLabel = 'Id. Det. Mov. Ubic.'
      FieldName = 'ID_D_ST_UBICACION'
    end
    object QMCierreParcialDetalleComponenteENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCierreParcialDetalleComponenteID_LOTE: TIntegerField
      DisplayLabel = 'Id. Lote'
      FieldName = 'ID_LOTE'
      OnChange = QMCierreParcialDetalleComponenteID_LOTEChange
    end
    object QMCierreParcialDetalleComponenteOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMCierreParcialDetalleComponenteFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCierreParcialDetalleComponenteCLASIFICACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'CLASIFICACION'
      OnGetText = QMCierreParcialDetalleComponenteCLASIFICACIONGetText
      Size = 100
      Calculated = True
    end
    object QMCierreParcialDetalleComponenteUNIDADES_DEVOLVER: TFloatField
      DisplayLabel = 'U. Devolver'
      FieldName = 'UNIDADES_DEVOLVER'
    end
    object QMCierreParcialDetalleComponenteALMACEN_DEVOLVER: TFIBStringField
      DisplayLabel = 'Alm. Devolver'
      FieldName = 'ALMACEN_DEVOLVER'
      Size = 3
    end
    object QMCierreParcialDetalleComponenteID_LOTE_DEV: TIntegerField
      DisplayLabel = 'Id. Lote Dev'
      FieldName = 'ID_LOTE_DEV'
      OnChange = QMCierreParcialDetalleComponenteID_LOTE_DEVChange
    end
    object QMCierreParcialDetalleComponenteLOTE_DEV: TFIBStringField
      DisplayLabel = 'Lote Dev'
      FieldName = 'LOTE_DEV'
    end
    object QMCierreParcialDetalleComponenteTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCierreParcialDetalleComponenteUNIDADES_REALES: TFloatField
      DisplayLabel = 'Unidades Reales'
      FieldName = 'UNIDADES_REALES'
      OnChange = QMCierreParcialDetalleComponenteUNIDADES_REALESChange
    end
  end
  object DSQMCierreParcialDetalleComponente: TDataSource
    DataSet = QMCierreParcialDetalleComponente
    Left = 256
    Top = 208
  end
  object QMCierrePCompuesto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CIERRE_PARCIAL_DET_CPO'
      'WHERE'
      '  SUB_LINEA_COMPUESTO=?old_SUB_LINEA_COMPUESTO AND '
      '  SUB_LINEA=?old_SUB_LINEA AND '
      '  LINEA=?old_LINEA AND '
      '  CIERRE=?old_CIERRE AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CIERRE_PARCIAL_DET_CPO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,CIERRE,LINEA,SUB_LINEA,SUB_LINE' +
        'A_COMPUESTO,RIG_OF,ARTICULO,TIPO_UNIDAD_LOGISTICA,LOTE,ALM_DEST,' +
        'UBICACION,UNIDADES_LOGISITCAS,UNIDADES_POR_UL,UNIDADES,ID,ID_CIE' +
        'RRE,ID_DET,ID_DETALLES_ST,ID_UBICACION,LINEA_UBICACION,ID_D_ST_U' +
        'BICACION,ENTRADA,ID_LOTE,OPERARIO,FECHA,UNIDADES_RECHAZO,ID_DETA' +
        'LLES_ST_REC,ID_RESERVA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CIERRE,?LINEA,?SUB_LINEA,?' +
        'SUB_LINEA_COMPUESTO,?RIG_OF,?ARTICULO,?TIPO_UNIDAD_LOGISTICA,?LO' +
        'TE,?ALM_DEST,?UBICACION,?UNIDADES_LOGISITCAS,?UNIDADES_POR_UL,?U' +
        'NIDADES,?ID,?ID_CIERRE,?ID_DET,?ID_DETALLES_ST,?ID_UBICACION,?LI' +
        'NEA_UBICACION,?ID_D_ST_UBICACION,?ENTRADA,?ID_LOTE,?OPERARIO,?FE' +
        'CHA,?UNIDADES_RECHAZO,?ID_DETALLES_ST_REC,?ID_RESERVA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  C.*, A.TITULO'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET_CPO C'
      'JOIN ART_ARTICULOS A'
      'ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO'
      'WHERE'
      '  C.SUB_LINEA_COMPUESTO=?SUB_LINEA_COMPUESTO AND '
      '  C.SUB_LINEA=?SUB_LINEA AND '
      '  C.LINEA=?LINEA AND '
      '  C.CIERRE=?CIERRE AND '
      '  C.SERIE=?SERIE AND '
      '  C.CANAL=?CANAL AND '
      '  C.EJERCICIO=?EJERCICIO AND '
      '  C.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  C.*, A.TITULO'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET_CPO C'
      'JOIN ART_ARTICULOS A'
      'ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO'
      'WHERE'
      '  C.SUB_LINEA=?SUB_LINEA AND '
      '  C.LINEA=?LINEA AND '
      '  C.CIERRE=?CIERRE AND '
      '  C.SERIE=?SERIE AND '
      '  C.CANAL=?CANAL AND '
      '  C.EJERCICIO=?EJERCICIO AND '
      '  C.EMPRESA=?EMPRESA '
      'ORDER BY C.SUB_LINEA_COMPUESTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CIERRE_PARCIAL_DET_CPO'
      'SET'
      '  RIG_OF=?RIG_OF '
      '  ,ARTICULO=?ARTICULO '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,LOTE=?LOTE '
      '  ,ALM_DEST=?ALM_DEST '
      '  ,UBICACION=?UBICACION '
      '  ,UNIDADES_LOGISITCAS=?UNIDADES_LOGISITCAS '
      '  ,UNIDADES_POR_UL=?UNIDADES_POR_UL '
      '  ,UNIDADES=?UNIDADES '
      '  ,ID=?ID '
      '  ,ID_CIERRE=?ID_CIERRE '
      '  ,ID_DET=?ID_DET '
      '  ,ID_DETALLES_ST=?ID_DETALLES_ST '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,LINEA_UBICACION=?LINEA_UBICACION '
      '  ,ID_D_ST_UBICACION=?ID_D_ST_UBICACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,OPERARIO=?OPERARIO '
      '  ,FECHA=?FECHA '
      '  ,UNIDADES_RECHAZO=?UNIDADES_RECHAZO '
      '  ,ID_DETALLES_ST_REC=?ID_DETALLES_ST_REC '
      '  ,ID_RESERVA=?ID_RESERVA '
      'WHERE'
      '  SUB_LINEA_COMPUESTO=?SUB_LINEA_COMPUESTO AND '
      '  SUB_LINEA=?SUB_LINEA AND '
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCierreParcialDetalleLote
    BeforePost = QMCierrePCompuestoBeforePost
    OnNewRecord = QMCierrePCompuestoNewRecord
    ClavesPrimarias.Strings = (
      'SUB_LINEA_COMPUESTO '
      'SUB_LINEA '
      'LINEA '
      'CIERRE '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CIERRE_PARCIAL_DET_CPO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 256
    object QMCierrePCompuestoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierrePCompuestoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierrePCompuestoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierrePCompuestoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierrePCompuestoCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierrePCompuestoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCierrePCompuestoSUB_LINEA: TIntegerField
      DisplayLabel = 'Sub Linea'
      FieldName = 'SUB_LINEA'
    end
    object QMCierrePCompuestoSUB_LINEA_COMPUESTO: TIntegerField
      DisplayLabel = 'Sub Linea Compuesto'
      FieldName = 'SUB_LINEA_COMPUESTO'
    end
    object QMCierrePCompuestoRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMCierrePCompuestoARTICULO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCierrePCompuestoTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.L.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMCierrePCompuestoLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMCierrePCompuestoALM_DEST: TFIBStringField
      DisplayLabel = 'Alm. Dest.'
      FieldName = 'ALM_DEST'
      Size = 3
    end
    object QMCierrePCompuestoUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
    end
    object QMCierrePCompuestoUNIDADES_LOGISITCAS: TFloatField
      DisplayLabel = 'U. Logisticas'
      FieldName = 'UNIDADES_LOGISITCAS'
    end
    object QMCierrePCompuestoUNIDADES_POR_UL: TFloatField
      DisplayLabel = 'UxU.Logistica'
      FieldName = 'UNIDADES_POR_UL'
    end
    object QMCierrePCompuestoUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCierrePCompuestoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCierrePCompuestoID_CIERRE: TIntegerField
      DisplayLabel = 'Id Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMCierrePCompuestoID_DET: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID_DET'
    end
    object QMCierrePCompuestoID_DETALLES_ST: TIntegerField
      DisplayLabel = 'Id Det. Mov Stock'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMCierrePCompuestoID_UBICACION: TIntegerField
      DisplayLabel = 'Id Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMCierrePCompuestoLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMCierrePCompuestoID_D_ST_UBICACION: TIntegerField
      DisplayLabel = 'Id Det. Mov Stock Ubic.'
      FieldName = 'ID_D_ST_UBICACION'
    end
    object QMCierrePCompuestoENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCierrePCompuestoID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMCierrePCompuestoOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMCierrePCompuestoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCierrePCompuestoUNIDADES_RECHAZO: TFloatField
      DisplayLabel = 'Uds. Rechazadas'
      FieldName = 'UNIDADES_RECHAZO'
    end
    object QMCierrePCompuestoID_DETALLES_ST_REC: TIntegerField
      DisplayLabel = 'Id Det. Mov. Stock Rechazadas'
      FieldName = 'ID_DETALLES_ST_REC'
    end
    object QMCierrePCompuestoID_RESERVA: TIntegerField
      DisplayLabel = 'Id Reserva'
      FieldName = 'ID_RESERVA'
    end
    object QMCierrePCompuestoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMCierrePCompuesto: TDataSource
    DataSet = QMCierrePCompuesto
    Left = 256
    Top = 256
  end
end
