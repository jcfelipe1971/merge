object DMNumerosDeSerieKri: TDMNumerosDeSerieKri
  OldCreateOrder = False
  OnCreate = DMNumerosDeSerieKriCreate
  OnDestroy = DMNumerosDeSerieKriDestroy
  Left = 354
  Top = 147
  Height = 337
  Width = 442
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
    UpdateTransaction = Local
    Left = 32
    Top = 56
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
    object xArticulosABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
  end
  object NroSerieDisponible: TFIBTableSet
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
      
        '  (EMPRESA,ARTICULO,NRO_SERIE,DEVOLUCION,EJERCICIO_ENT,CANAL_ENT' +
        ',SERIE_ENT,LINEA_ENT,ALMACEN_ENT,FECHA_ENT,PROVEEDOR,EJERCICIO_S' +
        'AL,CANAL_SAL,SERIE_SAL,LINEA_SAL,ALMACEN_SAL,FECHA_SAL,CLIENTE,E' +
        'JERCICIO_MOV,CANAL_MOV,SERIE_MOV,LINEA_MOV,ALMACEN_ORI_MOV,FECHA' +
        '_MOV,ALMACEN_DEST_MOV,TITULO_PROVEEDOR,TITULO_CLIENTE,TITULO_ALM' +
        'ACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMACEN_ORI_MOV,TITULO_ALMACE' +
        'N_DEST_MOV)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?NRO_SERIE,?DEVOLUCION,?EJERCICIO_ENT,?CAN' +
        'AL_ENT,?SERIE_ENT,?LINEA_ENT,?ALMACEN_ENT,?FECHA_ENT,?PROVEEDOR,' +
        '?EJERCICIO_SAL,?CANAL_SAL,?SERIE_SAL,?LINEA_SAL,?ALMACEN_SAL,?FE' +
        'CHA_SAL,?CLIENTE,?EJERCICIO_MOV,?CANAL_MOV,?SERIE_MOV,?LINEA_MOV' +
        ',?ALMACEN_ORI_MOV,?FECHA_MOV,?ALMACEN_DEST_MOV,?TITULO_PROVEEDOR' +
        ',?TITULO_CLIENTE,?TITULO_ALMACEN_ENT,?TITULO_ALMACEN_SAL,?TITULO' +
        '_ALMACEN_ORI_MOV,?TITULO_ALMACEN_DEST_MOV)')
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
      'SELECT ID,NRO_SERIE,ALMACEN_ENT FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   ALMACEN_ENT = ?ALMACEN AND '
      '   MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   ((RIG_MOE is null) or (RIG_MOE = 0)) AND'
      '   ((RIG_SAL is null) or (RIG_SAL = 0)) AND'
      '   ((RIG_MOV is null) or (RIG_MOV = 0)) AND '
      '   ((RIG_MOS = 0 or RIG_MOS is null))'
      'UNION'
      'SELECT ID,NRO_SERIE,ALMACEN_MOE FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   ALMACEN_MOE = ?ALMACEN AND '
      '   MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   ((RIG_ENT is null) or (RIG_ENT = 0)) AND'
      '   ((RIG_SAL is null) or (RIG_SAL = 0)) AND'
      '   ((RIG_MOV is null) or (RIG_MOV = 0)) AND '
      '   ((RIG_MOS = 0 or RIG_MOS is null))'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  EJERCICIO_ENT=?EJERCICIO_ENT '
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
    UpdateTransaction = Local
    Left = 32
    Top = 104
    object NroSerieDisponibleNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. de Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object NroSerieDisponibleALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object NroSerieDisponibleID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
  object NroSerieAsignado: TFIBTableSet
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
      
        '  (EMPRESA,ARTICULO,NRO_SERIE,DEVOLUCION,EJERCICIO_ENT,CANAL_ENT' +
        ',SERIE_ENT,LINEA_ENT,ALMACEN_ENT,FECHA_ENT,PROVEEDOR,EJERCICIO_S' +
        'AL,CANAL_SAL,SERIE_SAL,LINEA_SAL,ALMACEN_SAL,FECHA_SAL,CLIENTE,E' +
        'JERCICIO_MOV,CANAL_MOV,SERIE_MOV,LINEA_MOV,ALMACEN_ORI_MOV,FECHA' +
        '_MOV,ALMACEN_DEST_MOV,TITULO_PROVEEDOR,TITULO_CLIENTE,TITULO_ALM' +
        'ACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMACEN_ORI_MOV,TITULO_ALMACE' +
        'N_DEST_MOV)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?NRO_SERIE,?DEVOLUCION,?EJERCICIO_ENT,?CAN' +
        'AL_ENT,?SERIE_ENT,?LINEA_ENT,?ALMACEN_ENT,?FECHA_ENT,?PROVEEDOR,' +
        '?EJERCICIO_SAL,?CANAL_SAL,?SERIE_SAL,?LINEA_SAL,?ALMACEN_SAL,?FE' +
        'CHA_SAL,?CLIENTE,?EJERCICIO_MOV,?CANAL_MOV,?SERIE_MOV,?LINEA_MOV' +
        ',?ALMACEN_ORI_MOV,?FECHA_MOV,?ALMACEN_DEST_MOV,?TITULO_PROVEEDOR' +
        ',?TITULO_CLIENTE,?TITULO_ALMACEN_ENT,?TITULO_ALMACEN_SAL,?TITULO' +
        '_ALMACEN_ORI_MOV,?TITULO_ALMACEN_DEST_MOV)')
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
      'SELECT NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   EJERCICIO_SAL = ?EJERCICIO_SAL AND'
      '   CANAL_SAL = ?CANAL_SAL AND'
      '   SERIE_SAL = ?SERIE_SAL AND'
      '   RIG_SAL = ?RIG_SAL AND'
      '   LINEA_SAL = ?LINEA_SAL'
      '   ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  EJERCICIO_ENT=?EJERCICIO_ENT '
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
    UpdateTransaction = Local
    Left = 32
    Top = 152
    object NroSerieAsignadoNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. de Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 136
    Top = 56
  end
  object DSNroSerieDisponible: TDataSource
    DataSet = NroSerieDisponible
    Left = 136
    Top = 104
  end
  object DSNroSerieAsignado: TDataSource
    DataSet = NroSerieAsignado
    Left = 136
    Top = 152
  end
  object InsertarNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '    EJERCICIO_SAL = ?EJERCICIO_SAL'
      '   ,CANAL_SAL = ?CANAL_SAL'
      '   ,SERIE_SAL = ?SERIE_SAL'
      '   ,RIG_SAL = ?RIG_SAL'
      '   ,LINEA_SAL = ?LINEA_SAL'
      '   ,ALMACEN_SAL = ?ALMACEN_SAL'
      '   ,FECHA_SAL = ?FECHA_SAL'
      '   ,CLIENTE = ?CLIENTE'
      'WHERE'
      '  ID=?ID')
    Transaction = Local
    Left = 352
    Top = 104
  end
  object SacarNroSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '   EJERCICIO_SAL=0'
      '  ,CANAL_SAL=0'
      '  ,SERIE_SAL=0'
      '  ,RIG_SAL=0'
      '  ,LINEA_SAL=0'
      '  ,ALMACEN_SAL='#39#39
      '  ,FECHA_SAL=null'
      '  ,CLIENTE=0'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   EJERCICIO_SAL = ?EJERCICIO_SAL AND'
      '   CANAL_SAL = ?CANAL_SAL AND'
      '   SERIE_SAL = ?SERIE_SAL AND'
      '   RIG_SAL = ?RIG_SAL AND'
      '   LINEA_SAL = ?LINEA_SAL AND'
      '   NRO_SERIE=?NRO_SERIE AND'
      '   MOVIMIENTO = 0 AND'
      '  DEVOLUCION=0 AND'
      '   DEVOLUCION_VENTA = 0'
      '')
    Transaction = Local
    Left = 248
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
    UpdateTransaction = Local
    Left = 32
    Top = 8
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
  object DSxEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 136
    Top = 8
  end
  object xCuantosAsignados: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(NRO_SERIE) AS CANTIDAD FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   EJERCICIO_SAL = ?EJERCICIO_SAL AND'
      '   CANAL_SAL = ?CANAL_SAL AND'
      '   SERIE_SAL = ?SERIE_SAL AND'
      '   RIG_SAL = ?RIG_SAL AND'
      '   LINEA_SAL = ?LINEA_SAL'
      '   ')
    Transaction = Local
    Left = 352
    Top = 8
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
      '   DEVOLUCION_VENTA = 0 AND'
      '   EJERCICIO_SAL = ?EJERCICIO_SAL AND'
      '   CANAL_SAL = ?CANAL_SAL AND'
      '   SERIE_SAL = ?SERIE_SAL AND'
      '   RIG_SAL = ?RIG_SAL AND'
      '   LINEA_SAL = ?LINEA_SAL')
    Transaction = Local
    Left = 248
    Top = 8
  end
  object BorraNrosDeSerie: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '   EJERCICIO_SAL=0'
      '  ,CANAL_SAL=0'
      '  ,SERIE_SAL=0'
      '  ,RIG_SAL=0'
      '  ,LINEA_SAL=0'
      '  ,ALMACEN_SAL='#39#39
      '  ,FECHA_SAL=null'
      '  ,CLIENTE=0'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   MOVIMIENTO = 0 AND '
      '   EJERCICIO_SAL = ?EJERCICIO_SAL AND'
      '   CANAL_SAL = ?CANAL_SAL AND'
      '   SERIE_SAL = ?SERIE_SAL AND'
      '   RIG_SAL = ?RIG_SAL AND'
      '   LINEA_SAL = ?LINEA_SAL')
    Transaction = Local
    Left = 248
    Top = 152
  end
  object Local: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 208
  end
  object NroSerieDisponibleGar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Local
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  NRO_SERIE=?old_NRO_SERIE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '  (RIG_ENT,RIG_SAL,RIG_MOV,PROVEEDOR,CLIENTE,EMPRESA,ARTICULO,NR' +
        'O_SERIE,DEVOLUCION,EJERCICIO_ENT,CANAL_ENT,SERIE_ENT,LINEA_ENT,A' +
        'LMACEN_ENT,FECHA_ENT,EJERCICIO_SAL,CANAL_SAL,SERIE_SAL,LINEA_SAL' +
        ',ALMACEN_SAL,FECHA_SAL,EJERCICIO_MOV,CANAL_MOV,SERIE_MOV,LINEA_M' +
        'OV,ALMACEN_ORI_MOV,FECHA_MOV,ALMACEN_DEST_MOV,TITULO_PROVEEDOR,T' +
        'ITULO_CLIENTE,TITULO_ALMACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMAC' +
        'EN_ORI_MOV,TITULO_ALMACEN_DEST_MOV,EJERCICIO_GAR,CANAL_GAR,SERIE' +
        '_GAR,RIG_GAR,LINEA_GAR,ALMACEN_GAR,FECHA_GAR,TITULO_ALMACEN_GAR)'
      'VALUES'
      
        '  (?RIG_ENT,?RIG_SAL,?RIG_MOV,?PROVEEDOR,?CLIENTE,?EMPRESA,?ARTI' +
        'CULO,?NRO_SERIE,?DEVOLUCION,?EJERCICIO_ENT,?CANAL_ENT,?SERIE_ENT' +
        ',?LINEA_ENT,?ALMACEN_ENT,?FECHA_ENT,?EJERCICIO_SAL,?CANAL_SAL,?S' +
        'ERIE_SAL,?LINEA_SAL,?ALMACEN_SAL,?FECHA_SAL,?EJERCICIO_MOV,?CANA' +
        'L_MOV,?SERIE_MOV,?LINEA_MOV,?ALMACEN_ORI_MOV,?FECHA_MOV,?ALMACEN' +
        '_DEST_MOV,?TITULO_PROVEEDOR,?TITULO_CLIENTE,?TITULO_ALMACEN_ENT,' +
        '?TITULO_ALMACEN_SAL,?TITULO_ALMACEN_ORI_MOV,?TITULO_ALMACEN_DEST' +
        '_MOV,?EJERCICIO_GAR,?CANAL_GAR,?SERIE_GAR,?RIG_GAR,?LINEA_GAR,?A' +
        'LMACEN_GAR,?FECHA_GAR,?TITULO_ALMACEN_GAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT ID,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   RIG_SAL <> 0 AND'
      '   CLIENTE = ?CLIENTE AND'
      '   RIG_GAR <= 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  RIG_ENT=?RIG_ENT '
      '  ,RIG_SAL=?RIG_SAL '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,CLIENTE=?CLIENTE '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,EJERCICIO_ENT=?EJERCICIO_ENT '
      '  ,CANAL_ENT=?CANAL_ENT '
      '  ,SERIE_ENT=?SERIE_ENT '
      '  ,LINEA_ENT=?LINEA_ENT '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,FECHA_ENT=?FECHA_ENT '
      '  ,EJERCICIO_SAL=?EJERCICIO_SAL '
      '  ,CANAL_SAL=?CANAL_SAL '
      '  ,SERIE_SAL=?SERIE_SAL '
      '  ,LINEA_SAL=?LINEA_SAL '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,FECHA_SAL=?FECHA_SAL '
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
      '  ,EJERCICIO_GAR=?EJERCICIO_GAR '
      '  ,CANAL_GAR=?CANAL_GAR '
      '  ,SERIE_GAR=?SERIE_GAR '
      '  ,RIG_GAR=?RIG_GAR '
      '  ,LINEA_GAR=?LINEA_GAR '
      '  ,ALMACEN_GAR=?ALMACEN_GAR '
      '  ,FECHA_GAR=?FECHA_GAR '
      '  ,TITULO_ALMACEN_GAR=?TITULO_ALMACEN_GAR '
      'WHERE'
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxArticulos
    ClavesPrimarias.Strings = (
      'NRO_SERIE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    UpdateTransaction = Local
    Left = 48
    Top = 208
    object NroSerieDisponibleGarNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object NroSerieDisponibleGarID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
  end
  object NroSerieAsignadoGar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Local
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  NRO_SERIE=?old_NRO_SERIE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '  (RIG_ENT,RIG_SAL,RIG_MOV,PROVEEDOR,CLIENTE,EMPRESA,ARTICULO,NR' +
        'O_SERIE,DEVOLUCION,EJERCICIO_ENT,CANAL_ENT,SERIE_ENT,LINEA_ENT,A' +
        'LMACEN_ENT,FECHA_ENT,EJERCICIO_SAL,CANAL_SAL,SERIE_SAL,LINEA_SAL' +
        ',ALMACEN_SAL,FECHA_SAL,EJERCICIO_MOV,CANAL_MOV,SERIE_MOV,LINEA_M' +
        'OV,ALMACEN_ORI_MOV,FECHA_MOV,ALMACEN_DEST_MOV,TITULO_PROVEEDOR,T' +
        'ITULO_CLIENTE,TITULO_ALMACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMAC' +
        'EN_ORI_MOV,TITULO_ALMACEN_DEST_MOV,EJERCICIO_GAR,CANAL_GAR,SERIE' +
        '_GAR,RIG_GAR,LINEA_GAR,ALMACEN_GAR,FECHA_GAR,TITULO_ALMACEN_GAR)'
      'VALUES'
      
        '  (?RIG_ENT,?RIG_SAL,?RIG_MOV,?PROVEEDOR,?CLIENTE,?EMPRESA,?ARTI' +
        'CULO,?NRO_SERIE,?DEVOLUCION,?EJERCICIO_ENT,?CANAL_ENT,?SERIE_ENT' +
        ',?LINEA_ENT,?ALMACEN_ENT,?FECHA_ENT,?EJERCICIO_SAL,?CANAL_SAL,?S' +
        'ERIE_SAL,?LINEA_SAL,?ALMACEN_SAL,?FECHA_SAL,?EJERCICIO_MOV,?CANA' +
        'L_MOV,?SERIE_MOV,?LINEA_MOV,?ALMACEN_ORI_MOV,?FECHA_MOV,?ALMACEN' +
        '_DEST_MOV,?TITULO_PROVEEDOR,?TITULO_CLIENTE,?TITULO_ALMACEN_ENT,' +
        '?TITULO_ALMACEN_SAL,?TITULO_ALMACEN_ORI_MOV,?TITULO_ALMACEN_DEST' +
        '_MOV,?EJERCICIO_GAR,?CANAL_GAR,?SERIE_GAR,?RIG_GAR,?LINEA_GAR,?A' +
        'LMACEN_GAR,?FECHA_GAR,?TITULO_ALMACEN_GAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '    MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   EJERCICIO_GAR = ?EJERCICIO_GAR AND'
      '   CANAL_GAR = ?CANAL_GAR AND'
      '   SERIE_GAR = ?SERIE_GAR AND'
      '   RIG_GAR = ?RIG_GAR AND'
      '   LINEA_GAR = ?LINEA_GAR'
      '   ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  RIG_ENT=?RIG_ENT '
      '  ,RIG_SAL=?RIG_SAL '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,CLIENTE=?CLIENTE '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,EJERCICIO_ENT=?EJERCICIO_ENT '
      '  ,CANAL_ENT=?CANAL_ENT '
      '  ,SERIE_ENT=?SERIE_ENT '
      '  ,LINEA_ENT=?LINEA_ENT '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,FECHA_ENT=?FECHA_ENT '
      '  ,EJERCICIO_SAL=?EJERCICIO_SAL '
      '  ,CANAL_SAL=?CANAL_SAL '
      '  ,SERIE_SAL=?SERIE_SAL '
      '  ,LINEA_SAL=?LINEA_SAL '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,FECHA_SAL=?FECHA_SAL '
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
      '  ,EJERCICIO_GAR=?EJERCICIO_GAR '
      '  ,CANAL_GAR=?CANAL_GAR '
      '  ,SERIE_GAR=?SERIE_GAR '
      '  ,RIG_GAR=?RIG_GAR '
      '  ,LINEA_GAR=?LINEA_GAR '
      '  ,ALMACEN_GAR=?ALMACEN_GAR '
      '  ,FECHA_GAR=?FECHA_GAR '
      '  ,TITULO_ALMACEN_GAR=?TITULO_ALMACEN_GAR '
      'WHERE'
      '  NRO_SERIE=?NRO_SERIE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxArticulos
    ClavesPrimarias.Strings = (
      'NRO_SERIE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    UpdateTransaction = Local
    Left = 48
    Top = 256
    object NroSerieAsignadoGarNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
  end
  object DSNroSerieDisponibleGar: TDataSource
    DataSet = NroSerieDisponibleGar
    Left = 176
    Top = 208
  end
  object DSNroSerieAsignadoGar: TDataSource
    DataSet = NroSerieAsignadoGar
    Left = 176
    Top = 256
  end
  object xCuantosAsignadosGar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT COUNT(NRO_SERIE) AS CANTIDAD FROM NRO_SERIE_KRI'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO AND'
      '   MOVIMIENTO = 0 AND '
      '   DEVOLUCION = 0 AND'
      '   DEVOLUCION_VENTA = 0 AND'
      '   EJERCICIO_GAR = ?EJERCICIO_GAR AND'
      '   CANAL_GAR = ?CANAL_GAR AND'
      '   SERIE_GAR = ?SERIE_GAR AND'
      '   RIG_GAR = ?RIG_GAR AND'
      '   LINEA_GAR = ?LINEA_GAR'
      '   ')
    Transaction = Local
    Left = 352
    Top = 56
  end
  object InsertarNroSerieGar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '    EJERCICIO_GAR = ?EJERCICIO_GAR'
      '   ,CANAL_GAR = ?CANAL_GAR'
      '   ,SERIE_GAR = ?SERIE_GAR'
      '   ,RIG_GAR = ?RIG_GAR'
      '   ,LINEA_GAR = ?LINEA_GAR'
      '   ,ALMACEN_GAR = ?ALMACEN_GAR'
      '   ,FECHA_GAR = ?FECHA_GAR'
      'WHERE'
      '  ID=?ID')
    Transaction = Local
    Left = 352
    Top = 152
  end
  object SacarNroSerieGar: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '   EJERCICIO_GAR=0'
      '  ,CANAL_GAR=0'
      '  ,SERIE_GAR=0'
      '  ,RIG_GAR=0'
      '  ,LINEA_GAR=0'
      '  ,ALMACEN_GAR='#39#39
      '  ,FECHA_GAR=null'
      'WHERE'
      '  DEVOLUCION=0 AND'
      '  DEVOLUCION_VENTA = 0 AND'
      '  MOVIMIENTO = 0 AND '
      '  NRO_SERIE=?NRO_SERIE AND'
      '  ARTICULO=?ARTICULO AND'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO_GAR = ?EJERCICIO_GAR AND'
      '  CANAL_GAR = ?CANAL_GAR AND'
      '  SERIE_GAR = ?SERIE_GAR AND'
      '  RIG_GAR = ?RIG_GAR AND'
      '  LINEA_GAR = ?LINEA_GAR')
    Transaction = Local
    Left = 248
    Top = 104
  end
end
