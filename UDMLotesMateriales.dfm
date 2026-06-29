object DMLotesMateriales: TDMLotesMateriales
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 613
  Top = 213
  Height = 343
  Width = 479
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 408
    Top = 24
  end
  object xLotesUtilizadosMI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select m.lote,m.serie,m.articulo,l.f_caducidad,m.cantidad,l.id_l' +
        'ote,m.linea_materia,'
      'm.almacen'
      'from tmp_art_ordenes_prod_lotes_mat m'
      'join art_articulos_lotes l'
      
        'on (m.empresa=l.empresa and m.canal=l.canal and m.almacen=l.alma' +
        'cen and m.id_lote = l.id_lote)'
      'where (( m.empresa    = ?empresa   ) and '
      '       ( m.ejercicio  = ?ejercicio ) and '
      '       ( m.canal      = ?canal     ) and'
      '       ( m.norden     = ?orden     ) and'
      '       ( m.articulo   = ?articulo  ) and '
      '       ( m.linea      = ?linea     ))')
    UniDirectional = False
    Left = 304
    Top = 24
    object xLotesUtilizadosMILOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLotesUtilizadosMISERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLotesUtilizadosMIARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesUtilizadosMIF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xLotesUtilizadosMICANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xLotesUtilizadosMIID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xLotesUtilizadosMILINEA_MATERIA: TIntegerField
      DisplayLabel = 'Linea Mat.'
      FieldName = 'LINEA_MATERIA'
    end
    object xLotesUtilizadosMIALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object DSxLotesUtilizados: TDataSource
    DataSet = xLotesUtilizados
    Left = 168
    Top = 24
  end
  object xLotesEnEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select'
      '    l.lote,'
      '    l.serie as n_serie,'
      '    l.articulo,'
      '    l.f_caducidad,'
      '    (select'
      '        sum(stock)'
      '    from'
      '        a_art_stock_lote(l.empresa,'
      '        l.articulo,'
      '        :canal,'
      '        '#39'000'#39','
      '        -1 /* todas las ubiaciones */ )'
      '    where'
      '        id_lote = l.id_lote) stock,'
      '    l.id_lote,'
      '    l.almacen,'
      '    l.proveedor '
      'from'
      '    art_articulos_lotes l '
      'where'
      '    ('
      '        ('
      '            l.empresa = :empresa '
      '        )'
      '        and ('
      '            l.canal   = :canal '
      '        )'
      '        and ('
      '            l.articulo  = :articulo '
      '        )/*'
      '        and ('
      '            l.stock > 0 '
      '        )*/'
      '        and ('
      '            ('
      '                select'
      '                    sum(stock)'
      '                from'
      '                    a_art_stock_lote(l.empresa,'
      '                    l.articulo,'
      '                    :canal,'
      '                    '#39'000'#39','
      '                    -1 /* todas las ubiaciones */ )'
      '                where'
      '                    id_lote = l.id_lote '
      '            ) > 0 '
      '        )'
      '        and ('
      '            l.id_lote not in ('
      '                select'
      '                    mat.id_lote '
      '                from'
      '                    tmp_art_ordenes_prod_lotes_mat mat '
      '                where'
      '                    mat.empresa   = :empresa '
      '                    and mat.ejercicio = :ejercicio '
      '                    and mat.canal     = :canal '
      '                    and mat.norden    = :norden '
      '                    and mat.linea     = :linea '
      '            )'
      '        )'
      '    )'
      'order by l.f_caducidad')
    UniDirectional = False
    Left = 48
    Top = 72
    object xLotesEnEscandalloLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLotesEnEscandalloN_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object xLotesEnEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesEnEscandalloF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xLotesEnEscandalloSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object xLotesEnEscandalloID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xLotesEnEscandalloALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLotesEnEscandalloPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
  end
  object DSxLotesEnEscandallo: TDataSource
    DataSet = xLotesEnEscandallo
    Left = 168
    Top = 72
  end
  object QInsertarEnUtil: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into tmp_art_ordenes_prod_lotes_mat'
      
        '  (empresa,ejercicio,canal,norden,linea,almacen,articulo,lote,se' +
        'rie,proveedor,id_lote)'
      'values'
      
        '  (?empresa,?ejercicio,?canal,?norden,?linea,?almacen,?articulo,' +
        '?lote,?serie,?proveedor,?id_lote)'
      '  ')
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 72
  end
  object QEliminaDeUtil: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from tmp_art_ordenes_prod_lotes_mat'
      'where empresa=?empresa and'
      '           ejercicio=?ejercicio and'
      '           canal=?canal and'
      '           norden=?norden and'
      '           linea=?linea and'
      '           linea_materia=?linea_materia'
      '        ')
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 120
  end
  object xOrdenLineaLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_art_ordenes_prod_lotes'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'norden=?norden and linea=?linea')
    UniDirectional = False
    Left = 48
    Top = 168
    object xOrdenLineaLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xOrdenLineaLoteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xOrdenLineaLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xOrdenLineaLoteTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xOrdenLineaLoteNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object xOrdenLineaLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xOrdenLineaLoteN_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object xOrdenLineaLoteCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xOrdenLineaLoteF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object xOrdenLineaLoteF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object xOrdenLineaLoteF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xOrdenLineaLoteCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xOrdenLineaLoteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xOrdenLineaLoteALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xOrdenLineaLoteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xOrdenLineaLoteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xOrdenLineaLotePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xOrdenLineaLoteID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xOrdenLineaLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object DSxOrdenLineaLote: TDataSource
    DataSet = xOrdenLineaLote
    Left = 168
    Top = 168
  end
  object xArticulosConLoteEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select det.detalle,det.titulo, det.linea'
      'from art_articulos_esc_orden_detalle det'
      'join art_articulos art'
      'on ( art.empresa = det.empresa and art.articulo=det.detalle)'
      'where (( det.empresa = ?empresa ) and'
      '            ( det.ejercicio = ?ejercicio ) and'
      '            ( det.canal      = ?canal     ) and'
      '            ( det.orden      = ?orden    )  and'
      '            ( art.lotes        =  1             ))')
    UniDirectional = False
    Left = 48
    Top = 120
    object xArticulosConLoteEscDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object xArticulosConLoteEscTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xArticulosConLoteEscLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSxArticulosConLoteEsc: TDataSource
    DataSet = xArticulosConLoteEsc
    Left = 168
    Top = 120
  end
  object xLotesUtilizados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'select m.empresa,m.ejercicio,m.canal,m.norden,m.linea,'
      
        'm.lote,m.serie,m.articulo,l.f_caducidad,m.cantidad,l.id_lote,m.l' +
        'inea_materia,'
      'm.almacen'
      'from tmp_art_ordenes_prod_lotes_mat m'
      'join art_articulos_lotes l'
      
        'on (m.empresa=l.empresa and m.canal=l.canal and m.almacen=l.alma' +
        'cen and m.id_lote = l.id_lote)'
      'where (( m.empresa    = ?old_empresa   ) and '
      '       ( m.ejercicio  = ?old_ejercicio ) and '
      '       ( m.canal      = ?old_canal     ) and'
      '       ( m.norden     = ?old_norden     ) and'
      '       ( m.articulo   = ?old_articulo  ) and '
      '       ( m.linea      = ?old_linea     ) and'
      '       (linea_materia=?old_linea_materia))')
    SelectSQL.Strings = (
      'select m.empresa,m.ejercicio,m.canal,m.norden,m.linea,'
      
        'm.lote,m.serie,m.articulo,l.f_caducidad,m.cantidad,l.id_lote,m.l' +
        'inea_materia,'
      'm.almacen'
      'from tmp_art_ordenes_prod_lotes_mat m'
      'join art_articulos_lotes l'
      
        'on (m.empresa=l.empresa and m.canal=l.canal and m.almacen=l.alma' +
        'cen and m.id_lote = l.id_lote)'
      'where (( m.empresa    = ?empresa   ) and '
      '       ( m.ejercicio  = ?ejercicio ) and '
      '       ( m.canal      = ?canal     ) and'
      '       ( m.norden     = ?norden     ) and'
      '       ( m.articulo   = ?articulo  ) and '
      '       ( m.linea      = ?linea     ))')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update tmp_art_ordenes_prod_lotes_mat m'
      'set cantidad=?cantidad'
      'where empresa=?empresa and'
      '           ejercicio=?ejercicio and'
      '           canal=?canal and'
      '           norden=?norden and'
      '           linea=?linea and'
      '           linea_materia=?linea_materia and'
      '           articulo=?articulo and'
      '           id_lote=?id_lote')
    AfterPost = xLotesUtilizadosAfterPost
    ClavesPrimarias.Strings = (
      'empresa '
      'ejercicio '
      'canal '
      'norden '
      'articulo '
      'linea '
      'linea_materia))'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 48
    Top = 24
    object xLotesUtilizadosLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLotesUtilizadosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLotesUtilizadosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesUtilizadosF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xLotesUtilizadosCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xLotesUtilizadosID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xLotesUtilizadosLINEA_MATERIA: TIntegerField
      DisplayLabel = 'Linea Mat.'
      FieldName = 'LINEA_MATERIA'
    end
    object xLotesUtilizadosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLotesUtilizadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesUtilizadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xLotesUtilizadosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLotesUtilizadosNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object xLotesUtilizadosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
end
