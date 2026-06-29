object DMExtraeArticulos: TDMExtraeArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 857
  Top = 124
  Height = 430
  Width = 395
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 72
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
    Left = 72
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
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 255
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
      'WHERE ENTRADA = ?ENTRADA AND'
      '              ID_D_UBICACION = ?ID_D_UBICACION')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_GES_DETALLES_UBICACIONES'
      'WHERE ENTRADA = ?ENTRADA AND ID_DETALLES=?ID_DETALLES')
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
      '       ,id_a_ubicacion = ?id_a_ubicacion'
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
    Left = 72
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
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDistribucionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDistribucionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMDistribucionLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDistribucionUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      OnChange = QMDistribucionUBICACIONChange
    end
    object QMDistribucionUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
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
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDistribucionID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDistribucionGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMDistribucionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDistribucionCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDistribucionESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDistribucionREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDistribucionPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDistribucionENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDistribucionID_DETALLES: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES'
    end
    object QMDistribucionID_D_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_UBICACION'
    end
    object QMDistribucionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDistribucionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMDistribucion: TDataSource
    DataSet = QMDistribucion
    Left = 255
    Top = 122
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 254
    Top = 9
  end
  object QMLotesDisponibles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  CADUCIDAD=?old_CADUCIDAD AND '
      '  ID_UBICACION=?old_ID_UBICACION AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA AND '
      '  CANTIDAD=?old_CANTIDAD AND '
      '  CANT_SELECCIONAR=?old_CANT_SELECCIONAR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LOTES_UBICACION_EXT_TMP'
      
        '  (CANTIDAD,EMPRESA,ARTICULO,LOTE,CADUCIDAD,ID_UBICACION,ALMACEN' +
        ',CALLE,ESTANTERIA,REPISA,POSICION,TITULO,EJERCICIO,CANAL,SERIE,R' +
        'IG,LINEA,ENTRADA,CANT_SELECCIONAR)'
      'VALUES'
      
        '  (?CANTIDAD,?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?ID_UBICACION,?' +
        'ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITULO,?EJERCICIO,' +
        '?CANAL,?SERIE,?RIG,?LINEA,?ENTRADA,?CANT_SELECCIONAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND'
      '  EJERCICIO=0 AND '
      '  CANAL=0 AND '
      '  SERIE='#39#39' AND '
      '  RIG=0 AND '
      '  LINEA=0')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EJERCICIO=0 AND '
      '  CANAL=0 AND '
      '  SERIE='#39#39' AND '
      '  RIG=0 AND '
      '  LINEA=0 AND '
      '  ENTRADA=?ENTRADA'
      'ORDER BY LOTE,CADUCIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LOTES_UBICACION_EXT_TMP'
      'SET'
      '  EJERCICIO=?new_EJERCICIO,'
      '  CANAL=?new_CANAL,'
      '  SERIE=?new_SERIE,'
      '  RIG=?new_RIG,'
      '  LINEA=?new_LINEA,'
      '  CANT_SELECCIONAR=?new_CANT_SELECCIONAR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?ENTRADA AND '
      '  CANTIDAD=?CANTIDAD AND '
      '  CANT_SELECCIONAR=?old_CANT_SELECCIONAR ')
    AfterPost = QMLotesDisponiblesAfterPost
    BeforePost = QMLotesBeforePost
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'ARTICULO '
      'LOTE '
      'CADUCIDAD '
      'ID_UBICACION ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LOTES_UBICACION_EXT_TMP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 168
    object QMLotesDisponiblesCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLotesDisponiblesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLotesDisponiblesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLotesDisponiblesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMLotesDisponiblesCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QMLotesDisponiblesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMLotesDisponiblesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLotesDisponiblesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMLotesDisponiblesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMLotesDisponiblesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMLotesDisponiblesPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMLotesDisponiblesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLotesDisponiblesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLotesDisponiblesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLotesDisponiblesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLotesDisponiblesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMLotesDisponiblesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLotesDisponiblesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMLotesDisponiblesCANT_SELECCIONAR: TIntegerField
      DisplayLabel = 'Uds. Sel.'
      FieldName = 'CANT_SELECCIONAR'
    end
  end
  object DSQMLotesDisponibles: TDataSource
    DataSet = QMLotesDisponibles
    Left = 255
    Top = 170
  end
  object QMLotesSeleccionados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  CADUCIDAD=?old_CADUCIDAD AND '
      '  ID_UBICACION=?old_ID_UBICACION AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA AND '
      '  CANTIDAD=?old_CANTIDAD AND '
      '  CANT_SELECCIONAR=?old_CANT_SELECCIONAR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LOTES_UBICACION_EXT_TMP'
      
        '  (CANTIDAD,EMPRESA,ARTICULO,LOTE,CADUCIDAD,ID_UBICACION,ALMACEN' +
        ',CALLE,ESTANTERIA,REPISA,POSICION,TITULO,EJERCICIO,CANAL,SERIE,R' +
        'IG,LINEA,ENTRADA,CANT_SELECCIONAR)'
      'VALUES'
      
        '  (?CANTIDAD,?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?ID_UBICACION,?' +
        'ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITULO,?EJERCICIO,' +
        '?CANAL,?SERIE,?RIG,?LINEA,?ENTRADA,?CANT_SELECCIONAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA'
      'ORDER BY LOTE,CADUCIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LOTES_UBICACION_EXT_TMP'
      'SET'
      '  ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA AND '
      '  CANTIDAD=?CANTIDAD AND '
      '  CANT_SELECCIONAR=?CANT_SELECCIONAR ')
    AfterDelete = QMLotesSeleccionadosAfterDelete
    AfterPost = RefrescaDataSetLotes
    BeforePost = QMLotesBeforePost
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'ARTICULO '
      'LOTE '
      'CADUCIDAD '
      'ID_UBICACION '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LOTES_UBICACION_EXT_TMP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 216
    object QMLotesSeleccionadosCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLotesSeleccionadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLotesSeleccionadosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLotesSeleccionadosLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMLotesSeleccionadosCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QMLotesSeleccionadosID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMLotesSeleccionadosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLotesSeleccionadosCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMLotesSeleccionadosESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMLotesSeleccionadosREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMLotesSeleccionadosPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMLotesSeleccionadosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLotesSeleccionadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLotesSeleccionadosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLotesSeleccionadosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLotesSeleccionadosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMLotesSeleccionadosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLotesSeleccionadosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMLotesSeleccionadosCANT_SELECCIONAR: TIntegerField
      DisplayLabel = 'Uds. Sel.'
      FieldName = 'CANT_SELECCIONAR'
    end
  end
  object DSQMLotesSeleccionados: TDataSource
    DataSet = QMLotesSeleccionados
    Left = 255
    Top = 218
  end
  object QMLotesUbicacionDisponibles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  CADUCIDAD=?old_CADUCIDAD AND '
      '  ID_UBICACION=?old_ID_UBICACION AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA AND '
      '  CANTIDAD=?old_CANTIDAD AND '
      '  CANT_SELECCIONAR=?old_CANT_SELECCIONAR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LOTES_UBICACION_EXT_TMP'
      
        '  (CANTIDAD,EMPRESA,ARTICULO,LOTE,CADUCIDAD,ID_UBICACION,ALMACEN' +
        ',CALLE,ESTANTERIA,REPISA,POSICION,TITULO,EJERCICIO,CANAL,SERIE,R' +
        'IG,LINEA,ENTRADA,CANT_SELECCIONAR)'
      'VALUES'
      
        '  (?CANTIDAD,?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?ID_UBICACION,?' +
        'ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITULO,?EJERCICIO,' +
        '?CANAL,?SERIE,?RIG,?LINEA,?ENTRADA,?CANT_SELECCIONAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND'
      '  EJERCICIO=0 AND '
      '  CANAL=0 AND '
      '  SERIE='#39#39' AND '
      '  RIG=0 AND '
      '  LINEA=0')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EJERCICIO=0 AND '
      '  CANAL=0 AND '
      '  SERIE='#39#39' AND '
      '  RIG=0 AND '
      '  LINEA=0 AND '
      '  ENTRADA=?ENTRADA'
      'ORDER BY LOTE,CADUCIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LOTES_UBICACION_EXT_TMP'
      'SET'
      '  EJERCICIO=?new_EJERCICIO,'
      '  CANAL=?new_CANAL,'
      '  SERIE=?new_SERIE,'
      '  RIG=?new_RIG,'
      '  LINEA=?new_LINEA,'
      '  CANT_SELECCIONAR=?new_CANT_SELECCIONAR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?ENTRADA AND '
      '  CANTIDAD=?CANTIDAD AND '
      '  CANT_SELECCIONAR=?old_CANT_SELECCIONAR '
      '')
    AfterPost = QMLotesUbicacionDisponiblesAfterPost
    BeforePost = QMLotesBeforePost
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'ARTICULO '
      'LOTE '
      'CADUCIDAD '
      'ID_UBICACION ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LOTES_UBICACION_EXT_TMP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 264
    object QMLotesUbicacionDisponiblesCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLotesUbicacionDisponiblesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLotesUbicacionDisponiblesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLotesUbicacionDisponiblesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMLotesUbicacionDisponiblesCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QMLotesUbicacionDisponiblesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMLotesUbicacionDisponiblesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLotesUbicacionDisponiblesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMLotesUbicacionDisponiblesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMLotesUbicacionDisponiblesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMLotesUbicacionDisponiblesPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMLotesUbicacionDisponiblesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLotesUbicacionDisponiblesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLotesUbicacionDisponiblesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLotesUbicacionDisponiblesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLotesUbicacionDisponiblesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMLotesUbicacionDisponiblesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLotesUbicacionDisponiblesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMLotesUbicacionDisponiblesCANT_SELECCIONAR: TIntegerField
      DisplayLabel = 'Uds. Sel.'
      FieldName = 'CANT_SELECCIONAR'
    end
  end
  object DSQMLotesUbicacionDisponibles: TDataSource
    DataSet = QMLotesUbicacionDisponibles
    Left = 255
    Top = 266
  end
  object QMLotesUbicacionSeleccionados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LOTE=?old_LOTE AND '
      '  CADUCIDAD=?old_CADUCIDAD AND '
      '  ID_UBICACION=?old_ID_UBICACION AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA AND '
      '  CANTIDAD=?old_CANTIDAD AND '
      '  CANT_SELECCIONAR=?old_CANT_SELECCIONAR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LOTES_UBICACION_EXT_TMP'
      
        '  (CANTIDAD,EMPRESA,ARTICULO,LOTE,CADUCIDAD,ID_UBICACION,ALMACEN' +
        ',CALLE,ESTANTERIA,REPISA,POSICION,TITULO,EJERCICIO,CANAL,SERIE,R' +
        'IG,LINEA,ENTRADA,CANT_SELECCIONAR)'
      'VALUES'
      
        '  (?CANTIDAD,?EMPRESA,?ARTICULO,?LOTE,?CADUCIDAD,?ID_UBICACION,?' +
        'ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITULO,?EJERCICIO,' +
        '?CANAL,?SERIE,?RIG,?LINEA,?ENTRADA,?CANT_SELECCIONAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOTES_UBICACION_EXT_TMP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA'
      'ORDER BY LOTE,CADUCIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LOTES_UBICACION_EXT_TMP'
      'SET'
      '  ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LOTE=?LOTE AND '
      '  CADUCIDAD=?CADUCIDAD AND '
      '  ID_UBICACION=?ID_UBICACION AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA AND '
      '  CANTIDAD=?CANTIDAD AND '
      '  CANT_SELECCIONAR=?CANT_SELECCIONAR ')
    AfterDelete = QMLotesUbicacionSeleccionadosAfterDelete
    AfterPost = RefrescaDataSetLotes
    BeforePost = QMLotesBeforePost
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'ARTICULO '
      'LOTE '
      'CADUCIDAD '
      'ID_UBICACION '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LOTES_UBICACION_EXT_TMP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 312
    object QMLotesUbicacionSeleccionadosCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMLotesUbicacionSeleccionadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLotesUbicacionSeleccionadosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLotesUbicacionSeleccionadosLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMLotesUbicacionSeleccionadosCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object QMLotesUbicacionSeleccionadosID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMLotesUbicacionSeleccionadosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMLotesUbicacionSeleccionadosCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMLotesUbicacionSeleccionadosESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMLotesUbicacionSeleccionadosREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMLotesUbicacionSeleccionadosPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMLotesUbicacionSeleccionadosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLotesUbicacionSeleccionadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLotesUbicacionSeleccionadosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLotesUbicacionSeleccionadosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMLotesUbicacionSeleccionadosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMLotesUbicacionSeleccionadosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLotesUbicacionSeleccionadosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMLotesUbicacionSeleccionadosCANT_SELECCIONAR: TIntegerField
      DisplayLabel = 'Uds. Sel.'
      FieldName = 'CANT_SELECCIONAR'
    end
  end
  object DSQMLotesUbicacionSeleccionados: TDataSource
    DataSet = QMLotesUbicacionSeleccionados
    Left = 255
    Top = 314
  end
end
