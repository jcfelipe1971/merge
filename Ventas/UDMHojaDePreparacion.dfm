object DMHojaDePreparacion: TDMHojaDePreparacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 556
  Top = 323
  Height = 378
  Width = 379
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_S_PRE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_S_PRE'
      
        '  (ID,EMPRESA,HOJA,CLIENTE,NOMBRE_R_SOCIAL,RESPONSABLE,TITUTLO_R' +
        'ESPONSABLE,FECHA_INICIO,FECHA_FIN,COMENTARIO,TOTAL_UNIDADES,TOTA' +
        'L_UNIDADES_LOGISTICAS,DIRECCION,DIR_COMPLETA_N,ID_EMPLEADO,ESTAD' +
        'O,GENERAR_ALBARAN)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?HOJA,?CLIENTE,?NOMBRE_R_SOCIAL,?RESPONSABLE,?TI' +
        'TUTLO_RESPONSABLE,?FECHA_INICIO,?FECHA_FIN,?COMENTARIO,?TOTAL_UN' +
        'IDADES,?TOTAL_UNIDADES_LOGISTICAS,?DIRECCION,?DIR_COMPLETA_N,?ID' +
        '_EMPLEADO,?ESTADO,?GENERAR_ALBARAN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_S_PRE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_S_PRE'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ESTADO < 4'
      'ORDER BY HOJA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_S_PRE'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,TITUTLO_RESPONSABLE=?TITUTLO_RESPONSABLE '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,TOTAL_UNIDADES=?TOTAL_UNIDADES '
      '  ,TOTAL_UNIDADES_LOGISTICAS=?TOTAL_UNIDADES_LOGISTICAS '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_COMPLETA_N=?DIR_COMPLETA_N '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,ESTADO=?ESTADO '
      '  ,GENERAR_ALBARAN=?GENERAR_ALBARAN '
      'WHERE'
      '  ID=?ID ')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_S_PRE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCabeceraCLIENTEChange
    end
    object QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabeceraFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMCabeceraFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMCabeceraCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMCabeceraTOTAL_UNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'TOTAL_UNIDADES'
    end
    object QMCabeceraTOTAL_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Total Uds. Log.'
      FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMCabeceraRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCabeceraTITUTLO_RESPONSABLE: TFIBStringField
      DisplayLabel = 'Nombre Resp.'
      FieldName = 'TITUTLO_RESPONSABLE'
      Size = 60
    end
    object QMCabeceraID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      DisplayLabel = 'Titulo Estado'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = QMCabeceraTITULO_ESTADOGetText
      Size = 30
      Calculated = True
    end
    object QMCabeceraGENERAR_ALBARAN: TIntegerField
      DisplayLabel = 'Gen. Alb.'
      FieldName = 'GENERAR_ALBARAN'
    end
    object QMCabeceraTOTAL_PUNTOS: TFloatField
      DisplayLabel = 'Total Puntos'
      FieldName = 'TOTAL_PUNTOS'
    end
    object QMCabeceraCP: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CP'
      Size = 10
    end
    object QMCabeceraLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMCabeceraPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMCabeceraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = True
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_PREPARACION'
      'WHERE'
      '  ID=?old_ID AND '
      '  ID_HOJA_UBICACION=?old_ID_HOJA_UBICACION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_PREPARACION'
      
        '  (ID,EMPRESA,HOJA,LINEA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA_PE' +
        'D,ARTICULO,TITULO,UNIDADES_PED,UNIDADES,TIPO_UNIDAD_LOGISTICA,TI' +
        'TULO_UNIDAD_LOGISTICA,UNIDADES_LOGISTICAS,PICO,PUNTOS,PESO,PREPA' +
        'RACION,ID_HOJA,ID_S,ID_DETALLES_S,ID_A,LINEA_UBICACION,UNIDADES_' +
        'UBICACION,ID_UBICACION,ALMACEN,CALLE,ESTANTERIA,REPISA,POSICION,' +
        'TITULO_UBICACION,COMPOSICION,GENERAL,ID_HOJA_UBICACION,LOTE)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?HOJA,?LINEA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG' +
        ',?LINEA_PED,?ARTICULO,?TITULO,?UNIDADES_PED,?UNIDADES,?TIPO_UNID' +
        'AD_LOGISTICA,?TITULO_UNIDAD_LOGISTICA,?UNIDADES_LOGISTICAS,?PICO' +
        ',?PUNTOS,?PESO,?PREPARACION,?ID_HOJA,?ID_S,?ID_DETALLES_S,?ID_A,' +
        '?LINEA_UBICACION,?UNIDADES_UBICACION,?ID_UBICACION,?ALMACEN,?CAL' +
        'LE,?ESTANTERIA,?REPISA,?POSICION,?TITULO_UBICACION,?COMPOSICION,' +
        '?GENERAL,?ID_HOJA_UBICACION,?LOTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_PREPARACION'
      'WHERE'
      '  ID=?ID AND '
      '  ID_HOJA_UBICACION=?ID_HOJA_UBICACION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PREPARACION'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'ID_HOJA=?ID'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_PREPARACION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,LINEA=?LINEA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES_PED=?UNIDADES_PED '
      '  ,UNIDADES=?UNIDADES '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,PICO=?PICO '
      '  ,PUNTOS=?PUNTOS '
      '  ,PESO=?PESO '
      '  ,PREPARACION=?PREPARACION '
      '  ,ID_HOJA=?ID_HOJA '
      '  ,ID_S=?ID_S '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_A=?ID_A '
      '  ,LINEA_UBICACION=?LINEA_UBICACION '
      '  ,UNIDADES_UBICACION=?UNIDADES_UBICACION '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,TITULO_UBICACION=?TITULO_UBICACION '
      '  ,COMPOSICION=?COMPOSICION '
      '  ,GENERAL=?GENERAL '
      '  ,LOTE=?LOTE'
      'WHERE'
      '  ID=?ID AND '
      '  ID_HOJA_UBICACION=?ID_HOJA_UBICACION ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'ID '
      'ID_HOJA_UBICACION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_PREPARACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMDetalleID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
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
    object QMDetalleLINEA_PED: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA_PED'
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
    object QMDetalleUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNIDADES_PED'
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.L.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tit. U.Log.'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetallePICO: TFloatField
      DisplayLabel = 'Pico'
      FieldName = 'PICO'
    end
    object QMDetallePUNTOS: TFloatField
      DisplayLabel = 'Puntos'
      FieldName = 'PUNTOS'
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePREPARACION: TIntegerField
      DisplayLabel = 'Prep.'
      FieldName = 'PREPARACION'
    end
    object QMDetalleID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ub.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDetalleUNIDADES_UBICACION: TFloatField
      DisplayLabel = 'Uds. Ub.'
      FieldName = 'UNIDADES_UBICACION'
    end
    object QMDetalleID_UBICACION: TIntegerField
      DisplayLabel = 'Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleESTANTERIA: TFIBStringField
      DisplayLabel = 'Est.'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetallePOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object QMDetalleGENERAL: TIntegerField
      DisplayLabel = 'General.'
      FieldName = 'GENERAL'
    end
    object QMDetalleID_HOJA_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA_UBICACION'
    end
    object QMDetalleTITULO_UBICACION: TFIBStringField
      DisplayLabel = 'Tit. Ub.'
      FieldName = 'TITULO_UBICACION'
      Size = 60
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 168
    Top = 8
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 168
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 304
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 312
    Top = 56
  end
  object QMDetallePre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_PRE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_PRE'
      
        '  (ID_A,TIPO_UNIDAD_LOGISTICA,UNIDADES_LOGISTICAS,PUNTOS,UNIDADE' +
        'S,EMPRESA,HOJA,LINEA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA_PED,ID' +
        '_S,ID_DETALLES_S,ARTICULO,PICO,UNIDADES_PED,PESO,PREPARACION,ID,' +
        'ID_HOJA,ALMACEN)'
      'VALUES'
      
        '  (?ID_A,?TIPO_UNIDAD_LOGISTICA,?UNIDADES_LOGISTICAS,?PUNTOS,?UN' +
        'IDADES,?EMPRESA,?HOJA,?LINEA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG' +
        ',?LINEA_PED,?ID_S,?ID_DETALLES_S,?ARTICULO,?PICO,?UNIDADES_PED,?' +
        'PESO,?PREPARACION,?ID,?ID_HOJA,?ALMACEN)')
    RefreshSQL.Strings = (
      'SELECT G.*, A.PREPARABLE'
      'FROM GES_DETALLES_S_PRE G'
      'JOIN ART_ARTICULOS A ON A.ID_A = G.ID_A'
      'WHERE G.ID=?ID ')
    SelectSQL.Strings = (
      'SELECT G.*, A.PREPARABLE'
      'FROM GES_DETALLES_S_PRE G'
      'JOIN ART_ARTICULOS A ON A.ID_A = G.ID_A'
      'WHERE G.ID_HOJA=?ID'
      'ORDER BY G.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PRE'
      'SET'
      '  ID_A=?ID_A '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,PUNTOS=?PUNTOS '
      '  ,UNIDADES=?UNIDADES '
      '  ,EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,LINEA=?LINEA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,ID_S=?ID_S '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ARTICULO=?ARTICULO '
      '  ,PICO=?PICO '
      '  ,UNIDADES_PED=?UNIDADES_PED '
      '  ,PESO=?PESO '
      '  ,PREPARACION=?PREPARACION '
      '  ,ID_HOJA=?ID_HOJA '
      '  ,ALMACEN=?ALMACEN '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabecera
    AfterOpen = QMDetallePreAfterOpen
    BeforeClose = QMDetallePreBeforeClose
    OnCalcFields = QMDetallePreCalcFields
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_PRE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QMDetallePreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallePreHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetallePreLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallePreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetallePreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetallePreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallePreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallePreLINEA_PED: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA_PED'
    end
    object QMDetallePreALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetallePreARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetallePreUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Pedido'
      FieldName = 'UNIDADES_PED'
    end
    object QMDetallePreTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.L.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetallePreUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'U. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetallePreUNIDADES: TFloatField
      DisplayLabel = 'Uds. Prep.'
      FieldName = 'UNIDADES'
    end
    object QMDetallePrePICO: TFloatField
      DisplayLabel = 'Pico'
      FieldName = 'PICO'
    end
    object QMDetallePrePUNTOS: TFloatField
      DisplayLabel = 'Puntos'
      FieldName = 'PUNTOS'
    end
    object QMDetallePrePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePrePREPARACION: TIntegerField
      DisplayLabel = 'Prerp.'
      FieldName = 'PREPARACION'
    end
    object QMDetallePreID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetallePreID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetallePreID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetallePreID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetallePreID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetallePreUNIDADES_A_SERVIR: TFloatField
      DisplayLabel = 'Uds. a Servir'
      FieldName = 'UNIDADES_A_SERVIR'
    end
    object QMDetallePreCAJAS: TIntegerField
      DisplayLabel = 'Cajas'
      FieldName = 'CAJAS'
    end
    object QMDetallePreTITULO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      Size = 60
      Calculated = True
    end
    object QMDetallePrePREPARABLE: TIntegerField
      DisplayLabel = 'Prep.'
      FieldName = 'PREPARABLE'
    end
  end
  object DSQMDetallePre: TDataSource
    DataSet = QMDetallePre
    Left = 168
    Top = 104
  end
  object QMDetalleUbicacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_PRE_UBICACIONES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_PRE_UBICACIONES'
      
        '  (LOTE,EMPRESA,HOJA,LINEA,ID_A,ID_DETALLES_S,ID_UBICACION,LINEA' +
        '_UBICACION,UNIDADES,VOLUMEN,PESO,DIAMETRO,ID_D_S_UBICACION,ID_A_' +
        'UBICACION,ALMACEN,CALLE,ESTANTERIA,REPISA,POSICION,ID,ID_HOJA,ID' +
        '_HOJA_DET,ID_LOTE)'
      'VALUES'
      
        '  (?LOTE,?EMPRESA,?HOJA,?LINEA,?ID_A,?ID_DETALLES_S,?ID_UBICACIO' +
        'N,?LINEA_UBICACION,?UNIDADES,?VOLUMEN,?PESO,?DIAMETRO,?ID_D_S_UB' +
        'ICACION,?ID_A_UBICACION,?ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POS' +
        'ICION,?ID,?ID_HOJA,?ID_HOJA_DET,?ID_LOTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S_PRE_UBICACIONES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_PRE_UBICACIONES'
      'WHERE ID_HOJA_DET=?ID'
      'ORDER BY LINEA_UBICACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PRE_UBICACIONES'
      'SET'
      '  LOTE=?LOTE '
      '  ,EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,LINEA=?LINEA '
      '  ,ID_A=?ID_A '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,LINEA_UBICACION=?LINEA_UBICACION '
      '  ,UNIDADES=?UNIDADES '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,PESO=?PESO '
      '  ,DIAMETRO=?DIAMETRO '
      '  ,ID_D_S_UBICACION=?ID_D_S_UBICACION '
      '  ,ID_A_UBICACION=?ID_A_UBICACION '
      '  ,ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,ID_HOJA=?ID_HOJA '
      '  ,ID_HOJA_DET=?ID_HOJA_DET '
      '  ,ID_LOTE=?ID_LOTE'
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMDetallePre
    AfterPost = QMDetalleUbicacionAfterPost
    BeforePost = QMDetalleUbicacionBeforePost
    OnCalcFields = QMDetalleUbicacionCalcFields
    OnNewRecord = QMDetalleUbicacionNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_PRE_UBICACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 152
    object QMDetalleUbicacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleUbicacionHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetalleUbicacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleUbicacionLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDetalleUbicacionUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetalleUbicacionALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleUbicacionCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleUbicacionESTANTERIA: TFIBStringField
      DisplayLabel = 'Est.'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleUbicacionREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetalleUbicacionPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleUbicacionVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDetalleUbicacionPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetalleUbicacionDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDetalleUbicacionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetalleUbicacionID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetalleUbicacionID_HOJA_DET: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA_DET'
    end
    object QMDetalleUbicacionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleUbicacionID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleUbicacionID_UBICACION: TIntegerField
      DisplayLabel = 'Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMDetalleUbicacionID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetalleUbicacionID_D_S_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_UBICACION'
    end
    object QMDetalleUbicacionLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMDetalleUbicacionID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleUbicacionTITULO_UBICACION_SIMPLE: TStringField
      DisplayLabel = 'T'#237'tulo Ubicaci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'TITULO_UBICACION_SIMPLE'
      Size = 60
      Calculated = True
    end
  end
  object DSQMDetalleUbicacion: TDataSource
    DataSet = QMDetalleUbicacion
    Left = 168
    Top = 152
  end
  object xPeso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT PESO, PESO_TOTAL'
      'FROM ART_ARTICULOS_UNIDAD_LOGISTICA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'TIPO = :TIPO_UNIDAD_LOGISTICA')
    UniDirectional = False
    DataSource = DSQMDetallePre
    Left = 56
    Top = 200
    object xPesoPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xPesoPESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
    end
  end
  object DSxPeso: TDataSource
    DataSet = xPeso
    Left = 168
    Top = 200
  end
end
