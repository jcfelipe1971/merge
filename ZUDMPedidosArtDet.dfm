object ZDMPedidosArtDet: TZDMPedidosArtDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 405
  Top = 275
  Height = 362
  Width = 553
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 48
    Top = 16
  end
  object QMPedidosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_DETALLES_S_PED_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_DETALLES_S_PED_DET'
      '  (ID_DETALLES_S,DETALLE,ESCANDALLO,ID_A_DET,UNIDADES,MEDIDA)'
      'VALUES'
      
        '  (?ID_DETALLES_S,?DETALLE,?ESCANDALLO,?ID_A_DET,?UNIDADES,?MEDI' +
        'DA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_DETALLES_S_PED_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_GES_DETALLES_S_PED_DET'
      'where id_detalles_s=?id_detalles_s')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_DETALLES_S_PED_DET'
      'SET'
      '  DETALLE=?DETALLE'
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,UNIDADES=?UNIDADES'
      '  ,MEDIDA=?MEDIDA'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    AfterDelete = GrabaDetalle
    AfterPost = QMPedidosDetAfterPost
    AfterScroll = QMPedidosDetAfterScroll
    BeforeEdit = QMPedidosDetBeforeEdit
    BeforeInsert = QMPedidosDetBeforeInsert
    BeforePost = QMPedidosDetBeforePost
    OnCalcFields = QMPedidosDetCalcFields
    OnNewRecord = QMPedidosDetNewRecord
    ClavesPrimarias.Strings = (
      'DETALLE '
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_DETALLES_S_PED_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 112
    object QMPedidosDetID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMPedidosDetTIPO_ARTICULO_TYC: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
      Calculated = True
    end
    object QMPedidosDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      OnChange = QMPedidosDetDETALLEChange
      Size = 15
    end
    object QMPedidosDetDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      Size = 60
      Calculated = True
    end
    object QMPedidosDetPCoste: TFloatField
      DisplayLabel = 'P. Coste'
      FieldKind = fkCalculated
      FieldName = 'PCoste'
      Calculated = True
    end
    object QMPedidosDetPVenta: TFloatField
      DisplayLabel = 'P. Venta'
      FieldKind = fkCalculated
      FieldName = 'PVenta'
      Calculated = True
    end
    object QMPedidosDetMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldKind = fkCalculated
      FieldName = 'MARGEN'
      Calculated = True
    end
    object QMPedidosDetESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMPedidosDetID_A_DET: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_DET'
    end
    object QMPedidosDetUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMPedidosDetMEDIDA: TFIBStringField
      DisplayLabel = 'Medida'
      FieldName = 'MEDIDA'
      Size = 60
    end
    object QMPedidosDetSUBTIPO_ARTICULO_TYC: TStringField
      DisplayLabel = 'Subtipo'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'SUBTIPO_ARTICULO_TYC'
      Size = 3
      Calculated = True
    end
    object QMPedidosDetCorte: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Corte'
      Calculated = True
    end
  end
  object xDatosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_PRECIOS_TOLDO_DET(:EMPRESA, :ARTICULO, :LON' +
        'A, :TARIFA, :DETALLE, :ID_DETALLES_S)')
    UniDirectional = False
    BeforeOpen = xDatosDetalleBeforeOpen
    Left = 48
    Top = 208
    object xDatosDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosDetalleP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosDetalleMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xDatosDetalleTITULO_DET: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_DET'
      Size = 256
    end
    object xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object xDatosDetalleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xDatosDetalleSUBTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Subtipo'
      DisplayWidth = 3
      FieldName = 'SUBTIPO_ARTICULO_TYC'
      Size = 3
    end
    object xDatosDetalleCOM_CORTE: TIntegerField
      DisplayLabel = 'Corte'
      FieldName = 'COM_CORTE'
    end
  end
  object DSQMPedidosDet: TDataSource
    DataSet = QMPedidosDet
    Left = 144
    Top = 112
  end
  object DSxDatosDetalle: TDataSource
    DataSet = xDatosDetalle
    Left = 144
    Top = 208
  end
  object xDatosTotal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from z_dame_precios_pedido_det(?empresa, ?articulo, ?ta' +
        'rifa, ?id_detalles_s)')
    UniDirectional = False
    BeforeOpen = xDatosTotalBeforeOpen
    Left = 48
    Top = 160
    object xDatosTotalP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosTotalP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosTotalMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSxDatosTotal: TDataSource
    DataSet = xDatosTotal
    Left = 144
    Top = 160
  end
  object QMPedidosCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_DETALLES_S_PED_CAB'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_DETALLES_S_PED_CAB'
      
        '  (ID_DETALLES_S,MOTOR,LACADO,INCR_LACADO_PVP,P_INCR_LACADO_PVP,' +
        'MODELO,LINEAL,SALIDA,UNIDADES_LONA,LINEA_PEDIDO_ASOCIADA)'
      'VALUES'
      
        '  (?ID_DETALLES_S,?MOTOR,?LACADO,?INCR_LACADO_PVP,?P_INCR_LACADO' +
        '_PVP,?MODELO,?LINEAL,?SALIDA,?UNIDADES_LONA,?LINEA_PEDIDO_ASOCIA' +
        'DA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_DETALLES_S_PED_CAB'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_GES_DETALLES_S_PED_CAB'
      'where id_detalles_s=?id_detalles_s')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_DETALLES_S_PED_CAB'
      'SET'
      '  MOTOR=?MOTOR '
      '  ,LACADO=?LACADO '
      '  ,INCR_LACADO_PVP=?INCR_LACADO_PVP '
      '  ,P_INCR_LACADO_PVP=?P_INCR_LACADO_PVP '
      '  ,MODELO=?MODELO'
      '  ,LINEAL=?LINEAL'
      '  ,SALIDA=?SALIDA'
      '  ,UNIDADES_LONA=?UNIDADES_LONA'
      '  ,LINEA_PEDIDO_ASOCIADA=?LINEA_PEDIDO_ASOCIADA'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    AfterOpen = QMPedidosCabAfterOpen
    AfterPost = Graba
    BeforeClose = QMPedidosCabBeforeClose
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_DETALLES_S_PED_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 64
    object QMPedidosCabID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMPedidosCabLACADO: TFIBStringField
      DisplayLabel = 'Lacado'
      FieldName = 'LACADO'
      OnChange = QMPedidosCabLACADOChange
      Size = 2
    end
    object QMPedidosCabMOTOR: TIntegerField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
    end
    object QMPedidosCabINCR_LACADO_PVP: TIntegerField
      DisplayLabel = 'Incr. Lacado PVP'
      FieldName = 'INCR_LACADO_PVP'
    end
    object QMPedidosCabP_INCR_LACADO_PVP: TFloatField
      DisplayLabel = '% Incr. Lacado PVP'
      FieldName = 'P_INCR_LACADO_PVP'
    end
    object QMPedidosCabMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 5
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPedidosCabLINEAL: TFloatField
      DisplayLabel = 'Lineal'
      FieldName = 'LINEAL'
      OnChange = QMPedidosCabLINEALChange
    end
    object QMPedidosCabSALIDA: TFloatField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
      OnChange = QMPedidosCabSALIDAChange
    end
    object QMPedidosCabUNIDADES_LONA: TFloatField
      DisplayLabel = 'Uds. Lona'
      FieldName = 'UNIDADES_LONA'
      OnChange = QMPedidosCabUNIDADES_LONAChange
    end
    object QMPedidosCabLINEA_PEDIDO_ASOCIADA: TIntegerField
      DisplayLabel = 'Asociar a linea n'#250'm.'
      FieldName = 'LINEA_PEDIDO_ASOCIADA'
    end
  end
  object DSQMPedidosCab: TDataSource
    DataSet = QMPedidosCab
    Left = 144
    Top = 64
  end
  object xLacado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion, incremento_pvp '
      'from z_sys_colores '
      'where codigo=?lacado')
    UniDirectional = False
    DataSource = DSQMPedidosCab
    Left = 256
    Top = 112
    object xLacadoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
    end
    object xLacadoINCREMENTO_PVP: TFloatField
      DisplayLabel = '% Incr. PVP'
      FieldName = 'INCREMENTO_PVP'
    end
  end
  object xLonaDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select first(1) art.articulo, art.titulo_largo as titulo, art.id' +
        '_a, lon.z_lon_tipo'
      'from z_ges_detalles_s_ped_det det'
      
        'join ges_detalles_s det2 on (det2.id_detalles_s = det.id_detalle' +
        's_s)'
      
        'join art_articulos art on (art.empresa=det2.empresa and art.arti' +
        'culo=det.detalle)'
      'join art_articulos lon on (art.id_a=lon.id_a)'
      
        'where det.id_detalles_s=?id_detalles_s and art.TIPO_ARTICULO_TYC' +
        '='#39'L'#39)
    UniDirectional = False
    DataSource = DSQMPedidosCab
    Left = 256
    Top = 64
    object xLonaDetARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLonaDetTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xLonaDetID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xLonaDetZ_LON_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Z_LON_TIPO'
      Size = 3
    end
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select det.articulo, det.titulo as titulo_det, art.titulo as tit' +
        'ulo_art, '
      '          art.TIPO_ARTICULO_TYC'
      'from ges_detalles_s det'
      'join art_articulos art on (art.id_a = det.id_a)'
      'where det.id_detalles_s=?id_detalles_s')
    UniDirectional = False
    DataSource = DSQMPedidosCab
    Left = 256
    Top = 16
    object xArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticuloTITULO_DET: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_DET'
      Size = 60
    end
    object xArticuloTITULO_ART: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xArticuloTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 1
    end
  end
  object xLonaM2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select total_m2_lona '
      
        'from z_dame_calculo_lona_simple (?modelo, ?linea, ?salida, ?id_l' +
        'ona)'
      
        '/*from z_dame_calculo_lona (?modelo, ?linea, ?salida, ?tipo_lona' +
        ', 0)*/')
    UniDirectional = False
    Left = 48
    Top = 256
    object xLonaM2TOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
  end
  object xLineaCalc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST(1) LINEA FROM Z_SYS_MODELOS_DET'
      'WHERE'
      'CODIGO = ?MODELO AND'
      'LINEA >= ?LINEA'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 352
    Top = 16
    object xLineaCalcLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object xSalidaCalc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST(1) SALIDA FROM Z_SYS_MODELOS_DET'
      'WHERE'
      'CODIGO = ?MODELO AND'
      'LINEA = ?LINEA AND'
      'SALIDA >= ?SALIDA'
      'ORDER BY SALIDA')
    UniDirectional = False
    Left = 352
    Top = 64
    object xSalidaCalcSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
  end
  object DSxLonaM2: TDataSource
    DataSet = xLonaM2
    Left = 144
    Top = 256
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST(1) ESCANDALLO FROM PRO_ESCANDALLO'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'COMPUESTO = ?DETALLE AND'
      'TIPO = '#39'EPR'#39' AND'
      'ESTADO = 1'
      'ORDER BY DEFECTO DESC, ESCANDALLO DESC')
    UniDirectional = False
    Left = 352
    Top = 112
    object xEscandalloESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 144
    Top = 16
  end
end
