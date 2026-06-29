object DMRegInventario: TDMRegInventario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 659
  Top = 384
  Height = 352
  Width = 362
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 16
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_REG_INVENTARIO'
      'WHERE'
      '  ID_REG = ?ID_REG')
    InsertSQL.Strings = (
      'INSERT INTO ART_REG_INVENTARIO'
      
        '  (ID_REG,EMPRESA,CANAL,RIG,FECHA_MOV,EJERCICIO_MOV,SERIE_MOV,ES' +
        'TADO,ENTRADA,ALMACEN,TIPO,TIPO_INV,DESCRIPCION,STOCK_FECHA)'
      'VALUES'
      
        '  (?ID_REG,?EMPRESA,?CANAL,?RIG,?FECHA_MOV,?EJERCICIO_MOV,?SERIE' +
        '_MOV,?ESTADO,?ENTRADA,?ALMACEN,?TIPO,?TIPO_INV,?DESCRIPCION,?STO' +
        'CK_FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_REG_INVENTARIO'
      'WHERE'
      '  ID_REG = ?ID_REG')
    SelectSQL.Strings = (
      'SELECT * FROM ART_REG_INVENTARIO'
      'WHERE EMPRESA = ?EMPRESA AND'
      '  EJERCICIO_MOV = ?EJERCICIO AND'
      '  CANAL = ?CANAL'
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_REG_INVENTARIO'
      'SET'
      '  ID_REG=?ID_REG '
      '  ,FECHA_MOV=?FECHA_MOV '
      '  ,EJERCICIO_MOV=?EJERCICIO_MOV '
      '  ,SERIE_MOV=?SERIE_MOV '
      '  ,ESTADO=?ESTADO '
      '  ,ENTRADA=?ENTRADA '
      '  ,TIPO=?TIPO '
      '  ,TIPO_INV = ?TIPO_INV'
      '  ,DESCRIPCION=?DESCRIPCION'
      ' ,STOCK_FECHA = ?STOCK_FECHA'
      'WHERE'
      '   ID_REG = ?ID_REG')
    AfterDelete = Graba
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = Graba
    AfterScroll = QMCabeceraAfterScroll
    BeforeDelete = QMCabeceraBeforeDelete
    BeforeEdit = QMCabeceraBeforeEdit
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID_REG'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_REG_INVENTARIO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMCabeceraID_REG: TIntegerField
      DisplayLabel = 'ID Reg.'
      FieldName = 'ID_REG'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      OnChange = QMCabeceraALMACENChange
      Size = 3
    end
    object QMCabeceraFECHA_MOV: TDateTimeField
      DisplayLabel = 'Fecha Mov.'
      FieldName = 'FECHA_MOV'
    end
    object QMCabeceraEJERCICIO_MOV: TIntegerField
      DisplayLabel = 'Ejer. Mov.'
      FieldName = 'EJERCICIO_MOV'
    end
    object QMCabeceraSERIE_MOV: TFIBStringField
      DisplayLabel = 'Serie Mov.'
      FieldName = 'SERIE_MOV'
      Size = 10
    end
    object QMCabeceraTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraTIPO_INV: TIntegerField
      DisplayLabel = 'Tipo Inv.'
      FieldName = 'TIPO_INV'
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMCabeceraSTOCK_FECHA: TIntegerField
      DisplayLabel = 'Stock Fecha'
      FieldName = 'STOCK_FECHA'
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_REG_INVENTARIO_DETALLE'
      'WHERE'
      '  ID_REG_DETALLE=?old_ID_REG_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_REG_INVENTARIO_DETALLE'
      
        '  (ID_REG_DETALLE,'#13#10'ID_REG,EMPRESA,CANAL,RIG,LINEA,ID_A,ARTICULO' +
        ',TITULO,UNIDADES,PRECIO,'#13#10'STOCK,NSERIE,PROCESADO,FECHA_CREACION,' +
        'FAMILIA,SUBFAMILIA,LOTEABLE,CONTROL_STOCK,ALFA_1,ALFA_2,'#13#10'ALFA_3' +
        ',ALFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,TITULO_FAMILIA,DECIMALES,UNI' +
        'DAD,TIPO_ARTICULO,'#13#10'PESO,VOLUMEN_UNIT,DIAMETRO_UNIT,ALTO,ANCHO,F' +
        'ONDO,LITROS_POR_UNIDAD)'
      'VALUES'
      
        '  (?ID_REG_DETALLE,'#13#10'?ID_REG,?EMPRESA,?CANAL,?RIG,?LINEA,?ID_A,?' +
        'ARTICULO,?TITULO,?UNIDADES,?PRECIO,'#13#10'?STOCK,?NSERIE,?PROCESADO,?' +
        'FECHA_CREACION,?FAMILIA,?SUBFAMILIA,?LOTEABLE,?CONTROL_STOCK,?AL' +
        'FA_1,?ALFA_2,'#13#10'?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?' +
        'TITULO_FAMILIA,?DECIMALES,?UNIDAD,?TIPO_ARTICULO,'#13#10'?PESO,?VOLUME' +
        'N_UNIT,?DIAMETRO_UNIT,?ALTO,?ANCHO,?FONDO,?LITROS_POR_UNIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_REG_INVENTARIO_DETALLE'
      'WHERE'
      '  ID_REG_DETALLE=?ID_REG_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_REG_INVENTARIO_DETALLE '
      'WHERE'
      'ID_REG=?ID_REG'
      '/*'
      'No poner orden. Se crea dinamicamente.'
      '*/')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_REG_INVENTARIO_DETALLE'
      'SET'
      '  ID_REG=?ID_REG '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ID_A=?ID_A '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,STOCK=?STOCK '
      '  ,NSERIE=?NSERIE '
      '  ,PROCESADO=?PROCESADO '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FAMILIA=?FAMILIA '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,LOTEABLE=?LOTEABLE '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,DECIMALES=?DECIMALES '
      '  ,UNIDAD=?UNIDAD '
      '  ,TIPO_ARTICULO=?TIPO_ARTICULO '
      '  ,PESO=?PESO '
      '  ,VOLUMEN_UNIT=?VOLUMEN_UNIT '
      '  ,DIAMETRO_UNIT=?DIAMETRO_UNIT '
      '  ,ALTO=?ALTO '
      '  ,ANCHO=?ANCHO '
      '  ,FONDO=?FONDO '
      '  ,LITROS_POR_UNIDAD=?LITROS_POR_UNIDAD '
      'WHERE'
      '  ID_REG_DETALLE=?ID_REG_DETALLE ')
    DataSource = DSQMCabecera
    AfterDelete = GrabaDetalle
    AfterPost = GrabaDetalle
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = QMDetalleBeforeEdit
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_REG_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_REG_INVENTARIO_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMDetalleID_REG_DETALLE: TIntegerField
      DisplayLabel = 'Id Reg. Det.'
      FieldName = 'ID_REG_DETALLE'
    end
    object QMDetalleID_REG: TIntegerField
      DisplayLabel = 'Id Reg.'
      FieldName = 'ID_REG'
    end
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      Size = 15
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnGetText = QMDetalleUNIDADESGetText
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
      OnGetText = QMDetalleSTOCKGetText
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetallePROCESADO: TIntegerField
      DisplayLabel = 'Procesado'
      FieldName = 'PROCESADO'
    end
    object QMDetalleFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object QMDetalleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMDetalleSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object QMDetalleALFA_4: TFIBStringField
      DisplayLabel = 'Campo 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMDetalleALFA_6: TFIBStringField
      DisplayLabel = 'Campo 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
    end
    object QMDetalleTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Fam.'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetalleCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Prov.'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetalleCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Control Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMDetalleALMACEN: TStringField
      DisplayLabel = 'Alm.'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'ALMACEN'
      OnGetText = QMDetalleALMACENGetText
      Size = 3
      Calculated = True
    end
    object QMDetalleCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMDetalleALFA_2: TFIBStringField
      DisplayLabel = 'Campo 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMDetalleALFA_1: TFIBStringField
      DisplayLabel = 'Campo 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMDetalleALFA_3: TFIBStringField
      DisplayLabel = 'Campo 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMDetalleALFA_5: TFIBStringField
      DisplayLabel = 'Campo 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMDetalleALFA_7: TFIBStringField
      DisplayLabel = 'Campo 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMDetalleALFA_8: TFIBStringField
      DisplayLabel = 'Campo 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleDECIMALES: TIntegerField
      DisplayLabel = 'Decimales Unidad'
      FieldName = 'DECIMALES'
    end
    object QMDetalleUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMDetalleTIPO_ARTICULO: TFIBStringField
      DisplayLabel = 'Tipo Mat.'
      FieldName = 'TIPO_ARTICULO'
      Size = 3
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetalleVOLUMEN_UNIT: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN_UNIT'
    end
    object QMDetalleDIAMETRO_UNIT: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO_UNIT'
    end
    object QMDetalleALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMDetalleANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMDetalleFONDO: TFloatField
      DisplayLabel = 'Fondo'
      FieldName = 'FONDO'
    end
    object QMDetalleLITROS_POR_UNIDAD: TFloatField
      DisplayLabel = 'Litros/Unid.'
      FieldName = 'LITROS_POR_UNIDAD'
    end
    object QMDetallePROVEEDOR_LOTE: TIntegerField
      DisplayLabel = 'Prov. Lote'
      FieldName = 'PROVEEDOR_LOTE'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 16
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 64
  end
  object xInfoMovimientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_ST'
      'WHERE ((EMPRESA   = ?EMPRESA      ) AND'
      '       (EJERCICIO = ?EJERCICIO_MOV) AND'
      '       (SERIE     = ?SERIE_MOV    ) AND'
      '       (ID_REG    = ?ID_REG       ))')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 112
    object xInfoMovimientosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoMovimientosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xInfoMovimientosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xInfoMovimientosCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object xInfoMovimientosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xInfoMovimientosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
  end
  object DSxInfoMovimientos: TDataSource
    DataSet = xInfoMovimientos
    Left = 128
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
    Left = 288
    Top = 16
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    UniDirectional = True
    Left = 32
    Top = 160
  end
  object TInsertaArticulo: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 288
    Top = 64
  end
  object QInsertaArticulo: THYFIBQuery
    Database = DMMain.DataBase
    GoToFirstRecordOnExecute = False
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE A_ART_REG_INSERTA_ARTICULO(:EMPRESA, :CANAL, :' +
        'RIG, :ID_REG, :ID_A, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :AL' +
        'MACEN, :TIPO, :MODO, :FECHA, :REEMPLAZAR_UNIDADES, :MODO_STOCK, ' +
        ':TIPO_INV, :STOCK_FECHA)')
    Transaction = TInsertaArticulo
    AutoTrans = False
    Left = 208
    Top = 64
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_LOTE FROM ART_ARTICULOS_LOTES'
      'WHERE'
      'ID_A = :ID_A'
      'ORDER BY ID_LOTE')
    UniDirectional = True
    Left = 32
    Top = 208
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 128
    Top = 160
  end
end
