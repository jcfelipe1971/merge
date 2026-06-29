object DMFacturacionAlbDet: TDMFacturacionAlbDet
  OldCreateOrder = False
  OnCreate = DMFacturacionAlbaranesCreate
  Left = 576
  Top = 189
  Height = 376
  Width = 398
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_ALBARAN_FAC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ALBARAN_FAC'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,UNIDADES,UNIDADES_ORIGINALES,UN' +
        'IDADES_FACTURADAS,UNIDADES_POR_FACTURAR,UNIDADES_A_FACTURAR,LINE' +
        'A_SERVIDA,PRECIO,DESCUENTO,P_COSTE,M_MOV_STOCK,PAIS,TIPO_IVA,P_I' +
        'VA,P_RECARGO,BRUTO,I_DESCUENTO,B_IMPONIBLE,TIPO,RIG,LINEA,ALMACE' +
        'N,PROVEEDOR,ARTICULO,TITULO,ENTRADA,ENTRADA_FACTURACION)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?UNIDADES,?UNIDADES_ORIGINA' +
        'LES,?UNIDADES_FACTURADAS,?UNIDADES_POR_FACTURAR,?UNIDADES_A_FACT' +
        'URAR,?LINEA_SERVIDA,?PRECIO,?DESCUENTO,?P_COSTE,?M_MOV_STOCK,?PA' +
        'IS,?TIPO_IVA,?P_IVA,?P_RECARGO,?BRUTO,?I_DESCUENTO,?B_IMPONIBLE,' +
        '?TIPO,?RIG,?LINEA,?ALMACEN,?PROVEEDOR,?ARTICULO,?TITULO,?ENTRADA' +
        ',?ENTRADA_FACTURACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ALBARAN_FAC'
      'WHERE'
      '  ID_DETALLES_E = ?ID_DETALLES_E')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_FAC'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO='#39'ALP'#39' AND'
      '  PROVEEDOR=?PROVEEDOR AND'
      '  LINEA_SERVIDA=0 AND'
      '  ESTADO=0'
      'ORDER BY EJERCICIO,RIG,LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ALBARAN_FAC'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,UNIDADES_ORIGINALES=?UNIDADES_ORIGINALES '
      '  ,UNIDADES_FACTURADAS=?UNIDADES_FACTURADAS '
      '  ,UNIDADES_POR_FACTURAR=?UNIDADES_POR_FACTURAR '
      '  ,UNIDADES_A_FACTURAR=?UNIDADES_A_FACTURAR '
      '  ,LINEA_SERVIDA=?LINEA_SERVIDA '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,P_COSTE=?P_COSTE '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,BRUTO=?BRUTO '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,ALMACEN=?ALMACEN '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,ENTRADA=?ENTRADA '
      '  ,ENTRADA_FACTURACION=?ENTRADA_FACTURACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterOpen = QMDetalleAfterOpen
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_E'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_ALBARAN_FAC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetalleUNIDADES_ORIGINALES: TFloatField
      DisplayLabel = 'Entregadas'
      FieldName = 'UNIDADES_ORIGINALES'
    end
    object QMDetalleUNIDADES_FACTURADAS: TFloatField
      DisplayLabel = 'Facturadas'
      FieldName = 'UNIDADES_FACTURADAS'
    end
    object QMDetalleUNIDADES_POR_FACTURAR: TFloatField
      DisplayLabel = 'Por Facturar'
      FieldName = 'UNIDADES_POR_FACTURAR'
    end
    object QMDetalleUNIDADES_A_FACTURAR: TFloatField
      DisplayLabel = 'A Facturar'
      FieldName = 'UNIDADES_A_FACTURAR'
      OnChange = QMDetalleUNIDADES_A_FACTURARChange
    end
    object QMDetalleLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'Servida'
      FieldName = 'LINEA_SERVIDA'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
      OnGetText = QMDetalleP_COSTEGetText
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. L'#237'nea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_FACTURACION'
      OnChange = QMDetalleENTRADA_FACTURACIONChange
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'ID E'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det. E.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleFAMILIA: TStringField
      DisplayLabel = 'Familia'
      FieldKind = fkCalculated
      FieldName = 'FAMILIA'
      Size = 5
      Calculated = True
    end
    object QMDetalleSUBFAMILIA: TStringField
      DisplayLabel = 'SubFamilia'
      FieldKind = fkCalculated
      FieldName = 'SUBFAMILIA'
      Size = 5
      Calculated = True
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleNUM_ALBARAN: TStringField
      DisplayLabel = 'Referencia Albar'#225'n Proveedor'
      FieldName = 'NUM_ALBARAN'
      Size = 40
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 8
  end
  object xSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_CANALES_SERIES'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l))'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterScroll = xSeriesAfterScroll
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CANALES_SERIES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object xSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSeriesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 128
    Top = 56
  end
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
  object xSeriesDest: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_CANALES_SERIES'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l))'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CANALES_SERIES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object xSeriesDestEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeriesDestEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSeriesDestCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSeriesDestSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSeriesDestTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSeriesDest: TDataSource
    DataSet = xSeriesDest
    Left = 128
    Top = 104
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      'FROM GES_CABECERAS_E C'
      
        'JOIN TMP_PROCESOS_AUTO T ON C.EMPRESA = T.EMPRESA AND C.EJERCICI' +
        'O = T.EJERCICIO AND C.CANAL = T.CANAL AND C.SERIE = T.SERIE AND ' +
        'C.TIPO = T.TIPO AND C.RIG = T.RIG'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.TIPO = :TIPO AND'
      'T.CONTADOR = :CONTADOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG')
    UniDirectional = False
    Left = 40
    Top = 152
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 128
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 56
  end
end
