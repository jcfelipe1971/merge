object DMNumerosDeSerieKriCompra: TDMNumerosDeSerieKriCompra
  OldCreateOrder = False
  OnCreate = DMNumerosDeSerieKriCompraCreate
  OnDestroy = DMNumerosDeSerieKriCompraDestroy
  Left = 514
  Top = 145
  Height = 410
  Width = 296
  object InsertarNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      '  (RIG_ENT,'
      '  EMPRESA,'
      '  ARTICULO,'
      '  NRO_SERIE,'
      '  DEVOLUCION,'
      '  EJERCICIO_ENT,'
      '  CANAL_ENT,'
      '  SERIE_ENT,'
      '  LINEA_ENT,'
      '  ALMACEN_ENT,'
      '  FECHA_ENT,'
      '  PROVEEDOR)'
      'VALUES'
      '  (?RIG_ENT,'
      '  ?EMPRESA,'
      '  ?ARTICULO,'
      '  ?NRO_SERIE,'
      '  ?DEVOLUCION,'
      '  ?EJERCICIO_ENT,'
      '  ?CANAL_ENT,'
      '  ?SERIE_ENT,'
      '  ?LINEA_ENT,'
      '  ?ALMACEN_ENT,'
      '  ?FECHA_ENT,'
      '  ?PROVEEDOR)'
      ' ')
    Transaction = Local
    Left = 32
    Top = 232
  end
  object xCuantosAsignados: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(NRO_SERIE) AS CANTIDAD FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   EJERCICIO_ENT = ?EJERCICIO_ENT AND'
      '   CANAL_ENT = ?CANAL_ENT AND'
      '   SERIE_ENT = ?SERIE_ENT AND'
      '   RIG_ENT = ?RIG_ENt AND'
      '   LINEA_ENT = ?LINEA_ENT'
      '   ')
    Transaction = Local
    Left = 136
    Top = 232
  end
  object SacarNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  DEVOLUCION=0 AND '
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    Transaction = Local
    Left = 32
    Top = 280
  end
  object xTieneMovimiento: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT RIG_SAL, RIG_MOV,DEVOLUCION FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   NRO_SERIE = ?NRO_SERIE'
      '  ')
    Transaction = Local
    Left = 136
    Top = 280
  end
  object xArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Local
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS'
      
        '  (P_COSTE,NOTAS,CONTROLA_MEDIDAS,ENTRADA,UNIDADES,PRODUCCION,GA' +
        'RANTIA,SERIALIZADO,REPLICADO,DISPONIBILIDAD,VIRTUAL,EMPRESA,TITU' +
        'LO,ABIERTO,CONTROL_STOCK,TITULO_CORTO,ARTICULO,FAMILIA,DESCUENTO' +
        ',DESCUENTO_2,DESCUENTO_3,SERIALIZADO_KRI)'
      'VALUES'
      
        '  (?P_COSTE,?NOTAS,?CONTROLA_MEDIDAS,?ENTRADA,?UNIDADES,?PRODUCC' +
        'ION,?GARANTIA,?SERIALIZADO,?REPLICADO,?DISPONIBILIDAD,?VIRTUAL,?' +
        'EMPRESA,?TITULO,?ABIERTO,?CONTROL_STOCK,?TITULO_CORTO,?ARTICULO,' +
        '?FAMILIA,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?SERIALIZADO_KRI)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,NOTAS=?NOTAS '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,GARANTIA=?GARANTIA '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,REPLICADO=?REPLICADO '
      '  ,DISPONIBILIDAD=?DISPONIBILIDAD '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,TITULO=?TITULO '
      '  ,ABIERTO=?ABIERTO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,FAMILIA=?FAMILIA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,SERIALIZADO_KRI=?SERIALIZADO_KRI '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS'
    Left = 32
    Top = 8
    object xArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
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
  end
  object NumerosDeSerieEntrados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Local
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  DEVOLUCION=?old_DEVOLUCION AND '
      '  NRO_SERIE=?old_NRO_SERIE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '  (RIG_ENT,RIG_SAL,RIG_MOV,EMPRESA,ARTICULO,NRO_SERIE,DEVOLUCION' +
        ',EJERCICIO_ENT,CANAL_ENT,SERIE_ENT,LINEA_ENT,ALMACEN_ENT,FECHA_E' +
        'NT,PROVEEDOR,EJERCICIO_SAL,CANAL_SAL,SERIE_SAL,LINEA_SAL,ALMACEN' +
        '_SAL,FECHA_SAL,CLIENTE,EJERCICIO_MOV,CANAL_MOV,SERIE_MOV,LINEA_M' +
        'OV,ALMACEN_ORI_MOV,FECHA_MOV,ALMACEN_DEST_MOV,TITULO_PROVEEDOR,T' +
        'ITULO_CLIENTE,TITULO_ALMACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMAC' +
        'EN_ORI_MOV,TITULO_ALMACEN_DEST_MOV)'
      'VALUES'
      
        '  (?RIG_ENT,?RIG_SAL,?RIG_MOV,?EMPRESA,?ARTICULO,?NRO_SERIE,?DEV' +
        'OLUCION,?EJERCICIO_ENT,?CANAL_ENT,?SERIE_ENT,?LINEA_ENT,?ALMACEN' +
        '_ENT,?FECHA_ENT,?PROVEEDOR,?EJERCICIO_SAL,?CANAL_SAL,?SERIE_SAL,' +
        '?LINEA_SAL,?ALMACEN_SAL,?FECHA_SAL,?CLIENTE,?EJERCICIO_MOV,?CANA' +
        'L_MOV,?SERIE_MOV,?LINEA_MOV,?ALMACEN_ORI_MOV,?FECHA_MOV,?ALMACEN' +
        '_DEST_MOV,?TITULO_PROVEEDOR,?TITULO_CLIENTE,?TITULO_ALMACEN_ENT,' +
        '?TITULO_ALMACEN_SAL,?TITULO_ALMACEN_ORI_MOV,?TITULO_ALMACEN_DEST' +
        '_MOV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  DEVOLUCION=?DEVOLUCION AND '
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  DEVOLUCION=0 AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA AND '
      '  RIG_ENT=?RIG_ENT AND '
      '  EJERCICIO_ENT=?EJERCICIO_ENT AND '
      '  CANAL_ENT=?CANAL_ENT AND '
      '  SERIE_ENT=?SERIE_ENT AND '
      '  LINEA_ENT=?LINEA_ENT AND'
      '  DEVOLUCION_VENTA = 0'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  RIG_ENT=?RIG_ENT '
      '  ,RIG_SAL=?RIG_SAL '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,EJERCICIO_ENT=?EJERCICIO_ENT '
      '  ,CANAL_ENT=?CANAL_ENT '
      '  ,SERIE_ENT=?SERIE_ENT '
      '  ,LINEA_ENT=?LINEA_ENT '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,FECHA_ENT=?FECHA_ENT '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,EJERCICIO_SAL=?EJERCICIO_SAL '
      '  ,CANAL_SAL=?CANAL_SAL '
      '  ,SERIE_SAL=?SERIE_SAL '
      '  ,LINEA_SAL=?LINEA_SAL '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,FECHA_SAL=?FECHA_SAL '
      '  ,CLIENTE=?CLIENTE '
      '  ,EJERCICIO_MOV=?EJERCICIO_MOV '
      '  ,CANAL_MOV=?CANAL_MOV '
      '  ,SERIE_MOV=?SERIE_MOV '
      '  ,LINEA_MOV=?LINEA_MOV '
      '  ,ALMACEN_ORI_MOV=?ALMACEN_ORI_MOV '
      '  ,FECHA_MOV=?FECHA_MOV '
      '  ,ALMACEN_DEST_MOV=?ALMACEN_DEST_MOV '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,TITULO_ALMACEN_ENT=?TITULO_ALMACEN_ENT '
      '  ,TITULO_ALMACEN_SAL=?TITULO_ALMACEN_SAL '
      '  ,TITULO_ALMACEN_ORI_MOV=?TITULO_ALMACEN_ORI_MOV '
      '  ,TITULO_ALMACEN_DEST_MOV=?TITULO_ALMACEN_DEST_MOV '
      'WHERE'
      '  DEVOLUCION=?DEVOLUCION AND '
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxArticulos
    ClavesPrimarias.Strings = (
      'DEVOLUCION '
      'NRO_SERIE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    Left = 32
    Top = 104
    object NumerosDeSerieEntradosNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
  end
  object FIBTableSet3: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Local
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  DEVOLUCION=?old_DEVOLUCION AND '
      '  NRO_SERIE=?old_NRO_SERIE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '  (RIG_ENT,RIG_SAL,RIG_MOV,EMPRESA,ARTICULO,NRO_SERIE,DEVOLUCION' +
        ',EJERCICIO_ENT,CANAL_ENT,SERIE_ENT,LINEA_ENT,ALMACEN_ENT,FECHA_E' +
        'NT,PROVEEDOR,EJERCICIO_SAL,CANAL_SAL,SERIE_SAL,LINEA_SAL,ALMACEN' +
        '_SAL,FECHA_SAL,CLIENTE,EJERCICIO_MOV,CANAL_MOV,SERIE_MOV,LINEA_M' +
        'OV,ALMACEN_ORI_MOV,FECHA_MOV,ALMACEN_DEST_MOV,TITULO_PROVEEDOR,T' +
        'ITULO_CLIENTE,TITULO_ALMACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMAC' +
        'EN_ORI_MOV,TITULO_ALMACEN_DEST_MOV)'
      'VALUES'
      
        '  (?RIG_ENT,?RIG_SAL,?RIG_MOV,?EMPRESA,?ARTICULO,?NRO_SERIE,?DEV' +
        'OLUCION,?EJERCICIO_ENT,?CANAL_ENT,?SERIE_ENT,?LINEA_ENT,?ALMACEN' +
        '_ENT,?FECHA_ENT,?PROVEEDOR,?EJERCICIO_SAL,?CANAL_SAL,?SERIE_SAL,' +
        '?LINEA_SAL,?ALMACEN_SAL,?FECHA_SAL,?CLIENTE,?EJERCICIO_MOV,?CANA' +
        'L_MOV,?SERIE_MOV,?LINEA_MOV,?ALMACEN_ORI_MOV,?FECHA_MOV,?ALMACEN' +
        '_DEST_MOV,?TITULO_PROVEEDOR,?TITULO_CLIENTE,?TITULO_ALMACEN_ENT,' +
        '?TITULO_ALMACEN_SAL,?TITULO_ALMACEN_ORI_MOV,?TITULO_ALMACEN_DEST' +
        '_MOV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  DEVOLUCION=?DEVOLUCION AND '
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM NRO_SERIE_KRI')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  RIG_ENT=?RIG_ENT '
      '  ,RIG_SAL=?RIG_SAL '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,EJERCICIO_ENT=?EJERCICIO_ENT '
      '  ,CANAL_ENT=?CANAL_ENT '
      '  ,SERIE_ENT=?SERIE_ENT '
      '  ,LINEA_ENT=?LINEA_ENT '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,FECHA_ENT=?FECHA_ENT '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,EJERCICIO_SAL=?EJERCICIO_SAL '
      '  ,CANAL_SAL=?CANAL_SAL '
      '  ,SERIE_SAL=?SERIE_SAL '
      '  ,LINEA_SAL=?LINEA_SAL '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,FECHA_SAL=?FECHA_SAL '
      '  ,CLIENTE=?CLIENTE '
      '  ,EJERCICIO_MOV=?EJERCICIO_MOV '
      '  ,CANAL_MOV=?CANAL_MOV '
      '  ,SERIE_MOV=?SERIE_MOV '
      '  ,LINEA_MOV=?LINEA_MOV '
      '  ,ALMACEN_ORI_MOV=?ALMACEN_ORI_MOV '
      '  ,FECHA_MOV=?FECHA_MOV '
      '  ,ALMACEN_DEST_MOV=?ALMACEN_DEST_MOV '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,TITULO_ALMACEN_ENT=?TITULO_ALMACEN_ENT '
      '  ,TITULO_ALMACEN_SAL=?TITULO_ALMACEN_SAL '
      '  ,TITULO_ALMACEN_ORI_MOV=?TITULO_ALMACEN_ORI_MOV '
      '  ,TITULO_ALMACEN_DEST_MOV=?TITULO_ALMACEN_DEST_MOV '
      'WHERE'
      '  DEVOLUCION=?DEVOLUCION AND '
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'DEVOLUCION '
      'NRO_SERIE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    Left = 32
    Top = 152
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 136
    Top = 8
  end
  object DSNumerosDeSerie: TDataSource
    DataSet = NumerosDeSerieEntrados
    Left = 136
    Top = 104
  end
  object DataSource3: TDataSource
    Left = 136
    Top = 152
  end
  object DSxEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 136
    Top = 56
  end
  object xEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Local
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  DETALLE=?old_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_ESCANDALLO'
      '  (CANTIDAD,EMPRESA,ARTICULO,DETALLE,REPLICADO)'
      'VALUES'
      '  (?CANTIDAD,?EMPRESA,?ARTICULO,?DETALLE,?REPLICADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESCANDALLO'
      'SET'
      '  CANTIDAD=?CANTIDAD '
      '  ,REPLICADO=?REPLICADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    DataSource = DSxArticulos
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'DETALLE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_ESCANDALLO'
    Left = 32
    Top = 56
    object xEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEscandalloDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object xEscandalloCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object xOldArticulo: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT DISTINCT ARTICULO FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   DEVOLUCION = 0 AND'
      '   EJERCICIO_ENT = ?EJERCICIO_ENT AND'
      '   CANAL_ENT = ?CANAL_ENT AND'
      '   SERIE_ENT = ?SERIE_ENT AND'
      '   RIG_ENT = ?RIG_ENT AND'
      '   LINEA_ENT = ?LINEA_ENT')
    Transaction = Local
    Left = 32
    Top = 328
  end
  object BorraNroDeSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   DEVOLUCION = 0 AND'
      '   EJERCICIO_ENT = ?EJERCICIO_ENT AND'
      '   CANAL_ENT = ?CANAL_ENT AND'
      '   SERIE_ENT = ?SERIE_ENT AND'
      '   RIG_ENT = ?RIG_ENT AND'
      '   LINEA_ENT = ?LINEA_ENT')
    Transaction = Local
    Left = 136
    Top = 328
  end
  object Local: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 8
  end
end
