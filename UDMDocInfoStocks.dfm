object DMDocInfoStocks: TDMDocInfoStocks
  OldCreateOrder = False
  OnCreate = DMDocInfoStocksCreate
  OnDestroy = DataModuleDestroy
  Left = 803
  Top = 329
  Height = 551
  Width = 357
  object xArtStocks: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, CANAL, ALMACEN, TITULO_ALM, ARTICULO, TITULO_ART' +
        ', EXISTENCIAS, EXISTENCIAS_EXT, ENTRADAS,'
      
        '       VALOR_ENTRADAS, SALIDAS, VALOR_SALIDAS, VALOR_EXISTENCIAS' +
        ', P_COSTE, PMP, STOCK_MINIMO, STOCK_MAXIMO,'
      
        '       PEDIDOS_A_PRO, PEDIDOS_D_CLI, PEDIDOS_A_TMP, STOCK_VIRTUA' +
        'L, RESERVADAS, DISPONIBLES, EN_PROCESO_PROD, ID_A,'
      '       EXISTENCIAS_REALES, PREPARADAS,'
      '       (EXISTENCIAS - PEDIDOS_D_CLI) STOCK_REAL'
      
        'FROM A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMA' +
        'CEN, 0, 1, 1, 1, 1, 1, 1, NULL)'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND '
      'ALMACEN = :ALMACEN')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, CANAL, ALMACEN, TITULO_ALM, ARTICULO, TITULO_ART' +
        ', EXISTENCIAS, EXISTENCIAS_EXT, ENTRADAS,'
      
        '       VALOR_ENTRADAS, SALIDAS, VALOR_SALIDAS, VALOR_EXISTENCIAS' +
        ', P_COSTE, PMP, STOCK_MINIMO, STOCK_MAXIMO,'
      
        '       PEDIDOS_A_PRO, PEDIDOS_D_CLI, PEDIDOS_A_TMP, STOCK_VIRTUA' +
        'L, RESERVADAS, DISPONIBLES, EN_PROCESO_PROD, ID_A,'
      '       EXISTENCIAS_REALES, PREPARADAS,'
      '       (EXISTENCIAS - PEDIDOS_D_CLI) STOCK_REAL'
      
        'FROM A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMA' +
        'CEN, 0, 1, 1, 1, 1, 1, 1, NULL)'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ALMACEN, CANAL')
    UniDirectional = False
    Left = 48
    Top = 16
    object xArtStocksEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArtStocksCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArtStocksALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArtStocksTITULO_ALM: TFIBStringField
      DisplayLabel = 'Titulo Alm.'
      FieldName = 'TITULO_ALM'
      Size = 60
    end
    object xArtStocksARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArtStocksTITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xArtStocksEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object xArtStocksENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArtStocksVALOR_ENTRADAS: TFloatField
      DisplayLabel = 'Valor Entradas'
      FieldName = 'VALOR_ENTRADAS'
    end
    object xArtStocksSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object xArtStocksVALOR_SALIDAS: TFloatField
      DisplayLabel = 'Valor Salidas'
      FieldName = 'VALOR_SALIDAS'
    end
    object xArtStocksVALOR_EXISTENCIAS: TFloatField
      DisplayLabel = 'Valor Existencias'
      FieldName = 'VALOR_EXISTENCIAS'
    end
    object xArtStocksP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xArtStocksPMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object xArtStocksSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object xArtStocksSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object xArtStocksPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object xArtStocksPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object xArtStocksPEDIDOS_A_TMP: TFloatField
      DisplayLabel = 'Ped. a Tmp.'
      FieldName = 'PEDIDOS_A_TMP'
    end
    object xArtStocksSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock Virtual'
      FieldName = 'STOCK_VIRTUAL'
    end
    object xArtStocksRESERVADAS: TFloatField
      DisplayLabel = 'Reservadas'
      FieldName = 'RESERVADAS'
    end
    object xArtStocksDISPONIBLES: TFloatField
      DisplayLabel = 'Disponibles'
      FieldName = 'DISPONIBLES'
    end
    object xArtStocksFABRICABLES: TFloatField
      DisplayLabel = 'Fabricables'
      FieldKind = fkCalculated
      FieldName = 'FABRICABLES'
      Calculated = True
    end
    object xArtStocksEXISTENCIAS_FABRICABLES: TFloatField
      DisplayLabel = 'Exist. Fab.'
      FieldKind = fkCalculated
      FieldName = 'EXISTENCIAS_FABRICABLES'
      Calculated = True
    end
    object xArtStocksEN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En Procesa Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object xArtStocksID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArtStocksEXISTENCIAS_EXT: TFloatField
      DisplayLabel = 'Existencias Ext.'
      FieldName = 'EXISTENCIAS_EXT'
    end
    object xArtStocksTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      OnGetText = xArtStocksTOTALGetText
      Calculated = True
    end
    object xArtStocksPREPARADAS: TFloatField
      DisplayLabel = 'Unid. Preparadas'
      FieldName = 'PREPARADAS'
    end
    object xArtStocksSTOCK_REAL: TFloatField
      DisplayLabel = 'Stock Real'
      FieldName = 'STOCK_REAL'
    end
  end
  object DSxArtStocks: TDataSource
    DataSet = xArtStocks
    Left = 168
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 288
    Top = 16
  end
  object DSxArtStocks2: TDataSource
    DataSet = xArtStocks2
    Left = 168
    Top = 64
  end
  object xArtStocks2: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM'
      
        'A_ART_DAME_STOCK_ART_ED (?EMPRESA, ?CANAL, ?ARTICULO, '#39#39', 1, 0, ' +
        '0, 0, 0, 0, 0, NULL)'
      'WHERE '
      'EMPRESA = ?EMPRESA '
      'ORDER BY ALMACEN, CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 48
    Top = 64
    object xArtStocks2EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArtStocks2CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArtStocks2ALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArtStocks2TITULO_ALM: TFIBStringField
      DisplayLabel = 'Titulo Alm.'
      FieldName = 'TITULO_ALM'
      Size = 60
    end
    object xArtStocks2ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArtStocks2TITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xArtStocks2EXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object xArtStocks2EXISTENCIAS_EXT: TFloatField
      DisplayLabel = 'Existencias Ext.'
      FieldName = 'EXISTENCIAS_EXT'
    end
    object xArtStocks2ENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArtStocks2VALOR_ENTRADAS: TFloatField
      DisplayLabel = 'Valor Entradas'
      FieldName = 'VALOR_ENTRADAS'
    end
    object xArtStocks2SALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object xArtStocks2VALOR_SALIDAS: TFloatField
      DisplayLabel = 'Valor Salidas'
      FieldName = 'VALOR_SALIDAS'
    end
    object xArtStocks2VALOR_EXISTENCIAS: TFloatField
      DisplayLabel = 'Valor Existencias'
      FieldName = 'VALOR_EXISTENCIAS'
    end
    object xArtStocks2P_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xArtStocks2PMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object xArtStocks2STOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object xArtStocks2STOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object xArtStocks2PEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object xArtStocks2PEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object xArtStocks2PEDIDOS_A_TMP: TFloatField
      DisplayLabel = 'Ped. a Tmp.'
      FieldName = 'PEDIDOS_A_TMP'
    end
    object xArtStocks2STOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock Virtual'
      FieldName = 'STOCK_VIRTUAL'
    end
    object xArtStocks2RESERVADAS: TFloatField
      DisplayLabel = 'Reservadas'
      FieldName = 'RESERVADAS'
    end
    object xArtStocks2DISPONIBLES: TFloatField
      DisplayLabel = 'Disponibles'
      FieldName = 'DISPONIBLES'
    end
    object xArtStocks2EN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En Proc. Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object xArtStocks2ID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArtStocks2EXISTENCIAS_REALES: TFloatField
      DisplayLabel = 'Existencias Reales'
      FieldName = 'EXISTENCIAS_REALES'
    end
    object xArtStocks2TIPO_U_LOGISTICA: TFIBStringField
      DisplayLabel = 'T. U. Logistica'
      FieldName = 'TIPO_U_LOGISTICA'
      Size = 6
    end
    object xArtStocks2UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'U. Logistica'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object xArtStocks2EXISTENCIAS_U_LOGISTICAS: TFloatField
      DisplayLabel = 'Existencias U. L.'
      FieldName = 'EXISTENCIAS_U_LOGISTICAS'
    end
  end
  object QMStockUbicaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT '
      '* '
      'FROM VER_ART_STOCKS_UBICACIONES '
      'WHERE'
      ' EMPRESA=?EMPRESA AND '
      ' ARTICULO=?ARTICULO AND '
      ' CANAL=?CANAL  AND '
      ' ALMACEN=?ALMACEN')
    SelectSQL.Strings = (
      'SELECT '
      '* '
      'FROM VER_ART_STOCKS_UBICACIONES '
      'WHERE'
      ' EMPRESA=?EMPRESA AND '
      ' ARTICULO=?ARTICULO AND '
      ' CANAL=?CANAL  AND '
      ' ALMACEN=?ALMACEN')
    UniDirectional = False
    Left = 48
    Top = 112
    object QMStockUbicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMStockUbicacionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMStockUbicacionesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMStockUbicacionesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMStockUbicacionesESTANTERIA: TFIBStringField
      DisplayLabel = 'Est.'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMStockUbicacionesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMStockUbicacionesPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMStockUbicacionesARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMStockUbicacionesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMStockUbicacionesCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composici'#243'n'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object QMStockUbicacionesTITULO_COMP: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_COMP'
      Size = 60
    end
    object QMStockUbicacionesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMStockUbicacionesENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMStockUbicacionesSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMStockUbicacionesEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object QMStockUbicacionesID_STOCKS_UB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_STOCKS_UB'
    end
    object QMStockUbicacionesID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMStockUbicacionesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMStockUbicacionesGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
  end
  object DSQMStockUbicaciones: TDataSource
    DataSet = QMStockUbicaciones
    Left = 168
    Top = 112
  end
  object QMNroSerieLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'select l.EMPRESA, l.ARTICULO,l.LOTE,l.CADUCIDAD, COUNT(ARTICULO)' +
        ',l.id_ubicacion,'
      'u.calle,u.estanteria,u.repisa,u.posicion,u.titulo,u.composicion'
      'FROM NRO_SERIE_KRI l'
      'left join art_almacenes_ubicaciones u'
      'on l.id_ubicacion = u.id_ubicacion'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO AND '
      '(CANAL_ENT=?CANAL OR CANAL_MOE=?CANAL) AND'
      'l.RIG_MOS=0 AND'
      'l.RIG_SAL=0 AND'
      'l.NRO_SERIE='#39#39
      
        'GROUP BY l.EMPRESA, l.ARTICULO,l.LOTE,l.CADUCIDAD,l.id_ubicacion' +
        ','
      'u.calle,u.estanteria,u.repisa,u.posicion,u.titulo,u.composicion')
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_STOCK_LOTE('
      '?EMPRESA,'
      '?ARTICULO,'
      '?CANAL,'
      '?ALMACEN,'
      '-1 /* todas las ubiaciones */) l'
      'left join art_almacenes_ubicaciones u'
      'on l.id_ubicacion = u.id_ubicacion'
      'where l.stock <> 0')
    UniDirectional = False
    Left = 48
    Top = 160
    object QMNroSerieLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNroSerieLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNroSerieLoteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNroSerieLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMNroSerieLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNroSerieLoteCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMNroSerieLoteF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMNroSerieLoteF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMNroSerieLoteF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Feb.'
      FieldName = 'F_FABRICACION'
    end
    object QMNroSerieLoteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMNroSerieLoteAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object QMNroSerieLoteCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMNroSerieLotePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMNroSerieLoteID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMNroSerieLoteALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMNroSerieLoteSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMNroSerieLoteID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMNroSerieLoteID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art. Ubic.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMNroSerieLoteCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMNroSerieLoteESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMNroSerieLoteREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMNroSerieLotePOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMNroSerieLoteTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMNroSerieLoteVOLUMEN_MAX: TFloatField
      DisplayLabel = 'Vol. Max.'
      FieldName = 'VOLUMEN_MAX'
    end
    object QMNroSerieLoteDIAMETRO_MAX: TFloatField
      DisplayLabel = 'Diam. Max.'
      FieldName = 'DIAMETRO_MAX'
    end
    object QMNroSerieLotePESO_MAX: TFloatField
      DisplayLabel = 'Peso Max.'
      FieldName = 'PESO_MAX'
    end
    object QMNroSerieLoteVOLUMEN_ACC: TFloatField
      DisplayLabel = 'Vol Acc.'
      FieldName = 'VOLUMEN_ACC'
    end
    object QMNroSerieLotePESO_ACC: TFloatField
      DisplayLabel = 'Peso Acc.'
      FieldName = 'PESO_ACC'
    end
    object QMNroSerieLoteDIAMETRO_ACC: TFloatField
      DisplayLabel = 'Diam Acc.'
      FieldName = 'DIAMETRO_ACC'
    end
    object QMNroSerieLoteCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object QMNroSerieLoteGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMNroSerieLoteUNIDADES_ACC: TFloatField
      DisplayLabel = 'Uds. Acc.'
      FieldName = 'UNIDADES_ACC'
    end
    object QMNroSerieLoteTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMNroSerieLoteSECTOR: TFIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 5
    end
    object QMNroSerieLoteDISPONIBLE: TIntegerField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
  object DSQMNroSerieLote: TDataSource
    DataSet = QMNroSerieLote
    Left = 168
    Top = 160
  end
  object QMNroSerieKRI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select  ARTICULO,EMPRESA,NRO_SERIE,ALMACEN_ENT'
      'FROM NRO_SERIE_KRI'
      'where '
      'empresa=?Empresa and '
      'articulo=?Articulo AND'
      '(CANAL_ENT=?CANAL OR CANAL_MOE=?CANAL) AND'
      'MOVIMIENTO=0 and '
      'rig_sal=0 AND'
      'rig_mos=0 AND'
      'RIG_DEC=0 and '
      'RIG_DEV=0 and '
      'LOTE='#39#39
      'ORDER BY NRO_SERIE')
    SelectSQL.Strings = (
      'select  ARTICULO,EMPRESA,NRO_SERIE,ALMACEN_ENT'
      'FROM NRO_SERIE_KRI'
      'where '
      'empresa=?Empresa and '
      'articulo=?Articulo AND'
      '(CANAL_ENT=?CANAL OR CANAL_MOE=?CANAL) AND'
      'MOVIMIENTO=0 and '
      'rig_sal=0 AND'
      'rig_mos=0 AND'
      'RIG_DEC=0 and '
      'RIG_DEV=0 and '
      'LOTE='#39#39
      'ORDER BY NRO_SERIE')
    UniDirectional = False
    Left = 48
    Top = 256
    object QMNroSerieKRIARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNroSerieKRIEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNroSerieKRINRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object QMNroSerieKRIALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Entrada'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
  end
  object DSQMNroSerieKRI: TDataSource
    DataSet = QMNroSerieKRI
    Left = 168
    Top = 256
  end
  object QMStockFuturo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TRW
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT F.*, CS.FECHA_ENTREGA_PREV, DS.FECHA_ENTREGA_PREV FECHA_E' +
        'NTREGA_PREV_DET, CE.FECHA_CONFIRMADA_KRI FECHA_CONF,'
      '       DE.FECHA_CONF_KRI FECHA_CONF_DET'
      'FROM A_ART_STOCK_FUTURO(:ID_A, :CANAL, :ALMACEN) F'
      
        'LEFT JOIN GES_CABECERAS_S_PED CS ON F.ID_DOC = CS.ID_S AND F.TIP' +
        'O = CS.TIPO'
      
        'LEFT JOIN GES_CABECERAS_E_PED CE ON F.ID_DOC = CE.ID_E AND F.TIP' +
        'O = CE.TIPO'
      
        'LEFT JOIN GES_DETALLES_S_PED DS ON F.ID_DETALLE_DOC = DS.ID_DETA' +
        'LLES_S AND F.TIPO = DS.TIPO'
      
        'LEFT JOIN GES_DETALLES_E_PED DE ON F.ID_DETALLE_DOC = DE.ID_DETA' +
        'LLES_E AND F.TIPO = DE.TIPO'
      'WHERE'
      'F.CANTIDAD <> 0')
    UniDirectional = False
    Left = 48
    Top = 304
    object QMStockFuturoARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMStockFuturoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMStockFuturoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMStockFuturoCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMStockFuturoNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMStockFuturoDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object QMStockFuturoCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMStockFuturoSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMStockFuturoID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMStockFuturoALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMStockFuturoSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMStockFuturoID_DETALLE_DOC: TIntegerField
      DisplayLabel = 'Id Doc. Detalle'
      FieldName = 'ID_DETALLE_DOC'
    end
    object QMStockFuturoFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entr. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMStockFuturoFECHA_ENTREGA_PREV_DET: TDateTimeField
      DisplayLabel = 'Fec. Entr. Prev. Det.'
      FieldName = 'FECHA_ENTREGA_PREV_DET'
    end
    object QMStockFuturoFECHA_CONF: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONF'
    end
    object QMStockFuturoFECHA_CONF_DET: TDateTimeField
      DisplayLabel = 'Fec. Conf. Det.'
      FieldName = 'FECHA_CONF_DET'
    end
  end
  object DSQMStockFuturo: TDataSource
    DataSet = QMStockFuturo
    Left = 168
    Top = 304
  end
  object QMNroSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN '
      '')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  /*ALMACEN=?ALMACEN AND */'
      '  ARTICULO=?ARTICULO AND'
      '  ESTADO = 1'
      'ORDER BY ALMACEN, NSERIE')
    UniDirectional = False
    Left = 48
    Top = 208
    object QMNroSerieEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNroSerieCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNroSerieCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMNroSerieNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMNroSerieARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNroSerieALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMNroSerieFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object QMNroSerieFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Garantia Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object QMNroSerieFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Garantia Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object QMNroSerieCLIENTE_REPARACION: TIntegerField
      DisplayLabel = 'Cli. Reparacion'
      FieldName = 'CLIENTE_REPARACION'
    end
  end
  object DSQMNroSerie: TDataSource
    DataSet = QMNroSerie
    Left = 168
    Top = 208
  end
  object QMMovStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TRW
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT * FROM A_ART_DAME_MOV_STOCK(:EMPRESA, :CANAL, :ALMACEN, :' +
        'ARTICULO, :CALCULAR_PMP)')
    UniDirectional = False
    Left = 48
    Top = 352
    object QMMovStockEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMovStockCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMovStockALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMMovStockARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMMovStockLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMMovStockENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMMovStockSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMMovStockSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMMovStockFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMMovStockDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMMovStockDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMMovStockDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMMovStockTIPO_OPER: TFIBStringField
      DisplayLabel = 'Tipo Operacon'
      FieldName = 'TIPO_OPER'
      OnGetText = QMMovStockTIPO_OPERGetText
      Size = 1
    end
    object QMMovStockID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMMovStockID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMMovStockID_MOV_STOCK: TIntegerField
      DisplayLabel = 'Id Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMMovStockCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMMovStockTITULO_CLI_PRO: TFIBStringField
      DisplayLabel = 'Titulo Cli./Prov.'
      FieldName = 'TITULO_CLI_PRO'
      Size = 60
    end
    object QMMovStockREF_PEDIDO: TFIBStringField
      DisplayLabel = 'Ref. Pedido'
      FieldName = 'REF_PEDIDO'
      Size = 40
    end
    object QMMovStockID_DOC_PEDIDO: TIntegerField
      DisplayLabel = 'Id. Doc. Pedido'
      FieldName = 'ID_DOC_PEDIDO'
    end
    object QMMovStockPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMMovStockPRECIO_SIN_DTO: TFloatField
      DisplayLabel = 'Precio sin Dto.'
      FieldName = 'PRECIO_SIN_DTO'
    end
    object QMMovStockCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMMovStockPMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object QMMovStockDTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'DTE'
      OnGetText = QMMovStockDTEGetText
      Calculated = True
    end
  end
  object DSQMMovStock: TDataSource
    DataSet = QMMovStock
    Left = 168
    Top = 352
  end
  object xTarifa: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT P.*, T.TITULO, T.ACTIVA, T.MONEDA'
      'FROM ART_TARIFAS_PRECIOS P'
      
        'JOIN ART_TARIFAS_C T ON P.EMPRESA = T.EMPRESA AND P.TARIFA = T.T' +
        'ARIFA'
      'WHERE'
      'P.EMPRESA = :EMPRESA AND'
      'P.ARTICULO = :ARTICULO'
      'ORDER BY P.TARIFA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 48
    Top = 400
    object xTarifaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTarifaTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xTarifaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTarifaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xTarifaCALCULO: TIntegerField
      DisplayLabel = 'Calculo'
      FieldName = 'CALCULO'
    end
    object xTarifaUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object xTarifaUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object xTarifaPRECIO_BASE: TFloatField
      DisplayLabel = 'Precio Base'
      FieldName = 'PRECIO_BASE'
    end
    object xTarifaPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object xTarifaMARGEN_PC: TFloatField
      DisplayLabel = 'Margen P.C.'
      FieldName = 'MARGEN_PC'
    end
    object xTarifaMARGEN_PV: TFloatField
      DisplayLabel = 'Margen P.V.'
      FieldName = 'MARGEN_PV'
    end
    object xTarifaCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xTarifaBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloq.'
      FieldName = 'BLOQUEADO'
    end
    object xTarifaMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xTarifaID_A: TIntegerField
      DisplayLabel = 'Id. Art.'
      FieldName = 'ID_A'
    end
    object xTarifaULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'ULT_MODIFICACION'
    end
    object xTarifaDESCUENTO_COMPRA: TFloatField
      DisplayLabel = 'Desc. Compra'
      FieldName = 'DESCUENTO_COMPRA'
    end
    object xTarifaPRECIO_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'PRECIO_COMPRA'
    end
    object xTarifaPRECIO_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'PRECIO_COSTE'
    end
    object xTarifaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xTarifaACTIVA: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVA'
    end
    object xTarifaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object DSxTarifa: TDataSource
    DataSet = xTarifa
    Left = 168
    Top = 400
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
    Top = 64
  end
  object TRW: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 288
    Top = 112
  end
end
