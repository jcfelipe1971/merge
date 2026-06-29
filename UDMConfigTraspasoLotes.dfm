object DMConfigTraspasoLotes: TDMConfigTraspasoLotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 516
  Top = 158
  Height = 221
  Width = 327
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 248
    Top = 16
  end
  object QMConfigLotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from tmp_traspaso_pedido_lotes'
      'where entrada = ?entrada and id_detalles=?id_detalles and'
      'linea = ?linea and tipo=?tipo')
    InsertSQL.Strings = (
      'INSERT INTO TMP_TRASPASO_PEDIDO_LOTES(ENTRADA,ID_DETALLES,'
      'LINEA,LOTE,UNIDADES,F_ENVASADO,F_CADUCIDAD,F_FABRICACION,'
      
        'ALMACEN,ARTICULO,SERIE,CLASIFICACION,TIPO,ID_A,PROVEEDOR,ID_LOTE' +
        ')'
      'VALUES(?ENTRADA,?ID_DETALLES,?LINEA,?LOTE,?UNIDADES,?F_ENVASADO,'
      
        '?F_CADUCIDAD,?F_FABRICACION,?ALMACEN,?ARTICULO,?SERIE,?CLASIFICA' +
        'CION,'
      '?TIPO,?ID_A,?PROVEEDOR,?ID_LOTE)')
    RefreshSQL.Strings = (
      'SELECT * FROM TMP_TRASPASO_PEDIDO_LOTES'
      'WHERE'
      'ENTRADA = ?ENTRADA AND'
      'ID_DETALLES = ?ID_DETALLES AND'
      'TIPO =?TIPO AND'
      'LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_TRASPASO_PEDIDO_LOTES'
      'WHERE'
      'ENTRADA = ?ENTRADA AND'
      'ID_DETALLES = ?ID_DETALLES AND'
      'TIPO = ?TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_TRASPASO_PEDIDO_LOTES'
      'SET '
      '   LOTE = ?LOTE'
      '  ,UNIDADES=?UNIDADES'
      '  ,F_ENVASADO=?F_ENVASADO'
      '  ,F_CADUCIDAD=?F_CADUCIDAD'
      '  ,F_FABRICACION=?F_FABRICACION'
      '  ,ALMACEN=?ALMACEN'
      '  ,ARTICULO=?ARTICULO'
      '  ,SERIE=?SERIE'
      '  ,CLASIFICACION=?CLASIFICACION'
      '  ,PROVEEDOR=?PROVEEDOR'
      '  ,ID_LOTE=?ID_LOTE'
      'WHERE'
      '   ENTRADA=?ENTRADA AND'
      '   ID_DETALLES=?ID_DETALLES AND'
      '   LINEA=?LINEA AND'
      '   TIPO=?TIPO')
    AfterDelete = Graba
    AfterPost = QMConfigLotesAfterPost
    OnNewRecord = QMConfigLotesNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'ID_DETALLES '
      'TIPO '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_TRASPASO_PEDIDO_LOTES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMConfigLotesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMConfigLotesID_DETALLES: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES'
    end
    object QMConfigLotesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMConfigLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      EditMask = '>ccccccccccccccc;0;_'
    end
    object QMConfigLotesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMConfigLotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object QMConfigLotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMConfigLotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMConfigLotesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfigLotesARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMConfigLotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfigLotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMConfigLotesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMConfigLotesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConfigLotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMConfigLotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
  end
  object DSQMConfigLotes: TDataSource
    DataSet = QMConfigLotes
    Left = 152
    Top = 16
  end
  object xLotesExistentes: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT L.*, U.CALLE, U.ESTANTERIA, U.REPISA, U.POSICION, U.TITUL' +
        'O, U.COMPOSICION, U.GENERAL'
      
        'FROM A_ART_STOCK_LOTE(?EMPRESA, ?ARTICULO, ?CANAL, ?ALMACEN, -1 ' +
        '/* TODAS LAS UBIACIONES */) L'
      'LEFT JOIN ART_ALMACENES_UBICACIONES U'
      'ON L.ID_UBICACION = U.ID_UBICACION'
      'WHERE'
      'L.ID_LOTE = ?ID_LOTE AND ID_UBICACION = ?ID_UBICACION')
    SelectSQL.Strings = (
      
        'SELECT L.*, U.CALLE, U.ESTANTERIA, U.REPISA, U.POSICION, U.TITUL' +
        'O, U.COMPOSICION, U.GENERAL'
      
        'FROM A_ART_STOCK_LOTE(?EMPRESA, ?ARTICULO, ?CANAL, ?ALMACEN, -1 ' +
        '/* TODAS LAS UBIACIONES */) L'
      'LEFT JOIN ART_ALMACENES_UBICACIONES U'
      'ON L.ID_UBICACION = U.ID_UBICACION'
      'WHERE'
      'L.STOCK <> 0'
      'ORDER BY L.F_CADUCIDAD DESC, L.LOTE, U.COMPOSICION'
      '')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'EMPRESA,'
      'ARTICULO,'
      'CANAL,'
      'ALMACEN,'
      'ID_LOTE '
      'ID_UBICACION'#13)
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'ART_ARTICULOS_LOTES'
    Left = 40
    Top = 64
    object xLotesExistentesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesExistentesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLotesExistentesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesExistentesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLotesExistentesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLotesExistentesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xLotesExistentesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envasado'
      FieldName = 'F_ENVASADO'
    end
    object xLotesExistentesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'F_CADUCIDAD'
    end
    object xLotesExistentesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabricacion'
      FieldName = 'F_FABRICACION'
    end
    object xLotesExistentesID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xLotesExistentesAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object xLotesExistentesCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xLotesExistentesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xLotesExistentesID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object xLotesExistentesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLotesExistentesSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object xLotesExistentesID_UBICACION: TIntegerField
      DisplayLabel = 'Id Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object xLotesExistentesID_A_UBICACION: TIntegerField
      DisplayLabel = 'Id Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object xLotesExistentesMEDIDA1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA1'
    end
    object xLotesExistentesMEDIDA2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA2'
    end
    object xLotesExistentesMEDIDA3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA3'
    end
    object xLotesExistentesMEDIDA4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA4'
    end
    object xLotesExistentesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object xLotesExistentesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object xLotesExistentesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object xLotesExistentesPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object xLotesExistentesTITULO: TFIBStringField
      DisplayLabel = 'Titulo Ubic.'
      FieldName = 'TITULO'
      Size = 60
    end
    object xLotesExistentesCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xLotesExistentesGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
  end
  object DSxLotesExistentes: TDataSource
    DataSet = xLotesExistentes
    Left = 152
    Top = 64
  end
  object xUnidadesEtiquetar: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT UNIDADES_RECEPCION - (SELECT SUM(UNIDADES)'
      'FROM TMP_TRASPASO_PEDIDO_LOTES '
      'WHERE'
      'ENTRADA = :ENTRADA AND '
      'ID_DETALLES = :ID_DETALLES AND '
      'TIPO = :TIPO ) AS TOTAL FROM GES_DETALLES_E_PED'
      'WHERE ID_DETALLES_E = :ID_DETALLES')
    SelectSQL.Strings = (
      'SELECT UNIDADES_RECEPCION - (SELECT SUM(UNIDADES)'
      'FROM TMP_TRASPASO_PEDIDO_LOTES '
      'WHERE'
      'ENTRADA = :ENTRADA AND '
      'ID_DETALLES = :ID_DETALLES AND '
      'TIPO = :TIPO ) AS TOTAL FROM GES_DETALLES_E_PED'
      'WHERE ID_DETALLES_E = :ID_DETALLES')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'TMP_TRASPASO_PEDIDO_LOTES '
    Left = 40
    Top = 136
    object xUnidadesEtiquetarTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object DSxUnidadesEtiquetar: TDataSource
    DataSet = xUnidadesEtiquetar
    Left = 152
    Top = 136
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 248
    Top = 64
  end
end
