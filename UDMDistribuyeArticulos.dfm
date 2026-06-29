object DMDistribuyeArticulos: TDMDistribuyeArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 642
  Top = 210
  Height = 346
  Width = 395
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 32
    Top = 8
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos'
      'where id_a = ?id_a')
    UniDirectional = False
    Left = 32
    Top = 64
    object xArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticulosPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xArticulosUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object xArticulosVOLUMEN_UNIT: TFloatField
      DisplayLabel = 'Vol. Unit.'
      FieldName = 'VOLUMEN_UNIT'
    end
    object xArticulosDIAMETRO_UNIT: TFloatField
      DisplayLabel = 'Diam. Unit.'
      FieldName = 'DIAMETRO_UNIT'
    end
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xArticulosSERIALIZADO_KRI: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO_KRI'
    end
    object xArticulosLOTES_KRI: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES_KRI'
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 135
    Top = 66
  end
  object QMDistribucion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_GES_DETALLES_UBICACIONES'
      'WHERE ID_D_UBICACION = ?ID_D_UBICACION')
    InsertSQL.Strings = (
      
        'insert into tmp_ges_detalles_ubicaciones(entrada,empresa,ejercic' +
        'io,canal,serie,tipo,rig,linea,id_a,id_detalles,id_ubicacion,line' +
        'a_ubicacion,'
      
        '                                                   ubicacion,uni' +
        'dades,volumen,peso,diametro,id_d_ubicacion,id_a_ubicacion,'
      
        '                                                   general,almac' +
        'en,calle,estanteria,repisa,posicion,articulo,titulo)'
      
        '          values(?entrada,?empresa,?ejercicio,?canal,?serie,?tip' +
        'o,?rig,?linea,?id_a,?id_detalles,?id_ubicacion,?linea_ubicacion,'
      
        '                 ?ubicacion,?unidades,?volumen,?peso,?diametro,?' +
        'id_d_ubicacion,?id_a_ubicacion,'
      
        '                 ?general,?almacen,?calle,?estanteria,?repisa,?p' +
        'osicion,?articulo,?titulo)')
    RefreshSQL.Strings = (
      'SELECT * FROM TMP_GES_DETALLES_UBICACIONES'
      'WHERE '
      'ENTRADA = ?ENTRADA AND'
      'ID_D_UBICACION = ?ID_D_UBICACION')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_GES_DETALLES_UBICACIONES'
      'WHERE'
      'ENTRADA = ?ENTRADA AND '
      'ID_DETALLES=?ID_DETALLES'
      'ORDER BY LINEA_UBICACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update tmp_ges_detalles_ubicaciones'
      ' set id_ubicacion = ?id_ubicacion'
      '      ,ubicacion   =  ?ubicacion'
      '      ,unidades    = ?unidades'
      '      ,volumen     = ?volumen'
      '      ,peso           = ?peso'
      '      ,diametro      = ?diametro'
      '       ,general      =  ?general'
      '       ,almacen    = ?almacen'
      '       ,calle          = ?calle'
      '       ,estanteria  = ?estanteria'
      '       ,repisa        = ?repisa'
      '       ,posicion     = ?posicion'
      '       ,id_a_ubicacion=?id_a_ubicacion'
      '       ,titulo =?titulo'
      'where ENTRADA = ?ENTRADA  AND'
      '           ID_D_UBICACION = ?ID_D_UBICACION')
    DataSource = DSxArticulos
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMDistribucionBeforePost
    OnNewRecord = QMDistribucionNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'ID_D_UBICACION'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_GES_DETALLES_UBICACIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 120
    object QMDistribucionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDistribucionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDistribucionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDistribucionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDistribucionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDistribucionRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDistribucionLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDistribucionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDistribucionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMDistribucionLINEA_UBICACION: TIntegerField
      DisplayLabel = 'L'#237'nea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDistribucionUBICACION: TFIBStringField
      DisplayLabel = 'Ubicaci'#243'n'
      FieldName = 'UBICACION'
      OnChange = QMDistribucionUBICACIONChange
    end
    object QMDistribucionUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMDistribucionUNIDADESChange
    end
    object QMDistribucionVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDistribucionPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDistribucionDIAMETRO: TFloatField
      DisplayLabel = 'Di'#225'metro'
      FieldName = 'DIAMETRO'
    end
    object QMDistribucionID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art. Ubic.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDistribucionGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMDistribucionALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDistribucionCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDistribucionESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanter'#237'a'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDistribucionREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDistribucionPOSICION: TFIBStringField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDistribucionENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDistribucionID_DETALLES: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES'
    end
    object QMDistribucionID_D_UBICACION: TIntegerField
      DisplayLabel = 'ID Det. Ubic.'
      FieldName = 'ID_D_UBICACION'
    end
    object QMDistribucionARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDistribucionTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMDistribucion: TDataSource
    DataSet = QMDistribucion
    Left = 135
    Top = 122
  end
  object QMLoteUbicacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LOTES_UBICACION_TMP'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LOTES_UBICACION_TMP'
      
        '  (CANTIDAD,EMPRESA,ARTICULO,LOTE,CADUCIDAD,ID_UBICACION,ALMACEN' +
        ',CALLE,ESTANTERIA,REPISA,POSICION,TITULO,EJERCICIO,CANAL,SERIE,R' +
        'IG,LINEA,ENTRADA)'
      'VALUES'
      
        '  (?CANTIDAD,?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?ID_UBICACION,?' +
        'ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITULO,?EJERCICIO,' +
        '?CANAL,?SERIE,?RIG,?LINEA,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LOTES_UBICACION_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND'
      '  CANTIDAD=?old_CANTIDAD AND'
      '  ID_UBICACION=?old_ID_UBICACION'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOTES_UBICACION_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA '
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LOTES_UBICACION_TMP'
      'SET'
      '  CANTIDAD=?CANTIDAD '
      '  ,LOTE=?LOTE'
      '  ,CADUCIDAD=?CADUCIDAD '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND'
      '  CANTIDAD=?old_CANTIDAD  AND'
      '  ID_UBICACION=?old_ID_UBICACION')
    DataSource = DSxArticulos
    AfterDelete = QMLoteUbicacionAfterPost
    AfterPost = QMLoteUbicacionAfterPost
    OnNewRecord = QMLoteUbicacionNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'ARTICULO '
      'LOTE '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG '
      'LINEA '
      'CANTIDAD '
      'ID_UBICACION'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LOTES_UBICACION_TMP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 176
    object QMLoteUbicacionCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLoteUbicacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLoteUbicacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLoteUbicacionLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMLoteUbicacionCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QMLoteUbicacionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMLoteUbicacionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLoteUbicacionCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMLoteUbicacionESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMLoteUbicacionREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMLoteUbicacionPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMLoteUbicacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLoteUbicacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLoteUbicacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLoteUbicacionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLoteUbicacionRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMLoteUbicacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLoteUbicacionENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object DSQMLoteUbicacion: TDataSource
    DataSet = QMLoteUbicacion
    Left = 135
    Top = 178
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 136
    Top = 8
  end
  object QMLotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LOTES_UBICACION_TMP'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LOTES_UBICACION_TMP'
      
        '  (CANTIDAD,EMPRESA,ARTICULO,LOTE,CADUCIDAD,ID_UBICACION,ALMACEN' +
        ',CALLE,ESTANTERIA,REPISA,POSICION,TITULO,EJERCICIO,CANAL,SERIE,R' +
        'IG,LINEA,ENTRADA)'
      'VALUES'
      
        '  (?CANTIDAD,?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?ID_UBICACION,?' +
        'ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITULO,?EJERCICIO,' +
        '?CANAL,?SERIE,?RIG,?LINEA,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LOTES_UBICACION_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND'
      '  CANTIDAD=?old_CANTIDAD ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOTES_UBICACION_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LOTES_UBICACION_TMP'
      'SET'
      '  CANTIDAD=?CANTIDAD '
      '  ,LOTE=?LOTE'
      '  ,CADUCIDAD=?CADUCIDAD '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND'
      '  CANTIDAD=?old_CANTIDAD  AND'
      '  ID_UBICACION=?old_ID_UBICACION')
    DataSource = DSxArticulos
    AfterDelete = QMLotesAfterPost
    AfterPost = QMLotesAfterPost
    OnNewRecord = QMLotesNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'ARTICULO '
      'LOTE '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG '
      'LINEA '
      'CANTIDAD ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LOTES_UBICACION_TMP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 224
    object QMLotesCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMLotesCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QMLotesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMLotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLotesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMLotesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMLotesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMLotesPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMLotesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLotesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLotesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMLotesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLotesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object DSQMLotes: TDataSource
    DataSet = QMLotes
    Left = 135
    Top = 226
  end
end
