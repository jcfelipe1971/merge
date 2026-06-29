object DMProrrateoCostes: TDMProrrateoCostes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 686
  Top = 170
  Height = 415
  Width = 317
  object xProrrateo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_E_PROR'
      'WHERE'
      '  PRORRATEO=?PRORRATEO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_E_PROR'
      
        '  (EMPRESA,EJERCICIO,CANAL,PRORRATEO,IMPORTE_PRORRATEO,RAZON,IMP' +
        'ORTE_PREVISTO,FECHA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PRORRATEO,?IMPORTE_PRORRATEO,?RAZ' +
        'ON,?IMPORTE_PREVISTO,?FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_E_PROR'
      'WHERE'
      '  PRORRATEO=?PRORRATEO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_PROR '
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL  '
      'ORDER BY PRORRATEO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_E_PROR'
      'SET'
      '  IMPORTE_PRORRATEO=?IMPORTE_PRORRATEO '
      '  ,RAZON=?RAZON '
      '  ,IMPORTE_PREVISTO = ?IMPORTE_PREVISTO'
      '  ,FECHA = ?FECHA'
      'WHERE'
      '  PRORRATEO=?PRORRATEO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = xProrrateoAfterOpen
    AfterPost = xProrrateoAfterPost
    BeforeClose = xProrrateoBeforeClose
    BeforePost = xProrrateoBeforePost
    OnNewRecord = xProrrateoNewRecord
    ClavesPrimarias.Strings = (
      'PRORRATEO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_E_PROR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object xProrrateoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProrrateoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProrrateoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProrrateoPRORRATEO: TIntegerField
      DisplayLabel = 'Prorrateo'
      FieldName = 'PRORRATEO'
    end
    object xProrrateoIMPORTE_PRORRATEO: TFloatField
      DisplayLabel = 'Importe Pror.'
      FieldName = 'IMPORTE_PRORRATEO'
    end
    object xProrrateoRAZON: TFIBStringField
      DisplayLabel = 'Razon'
      FieldName = 'RAZON'
      Size = 40
    end
    object xProrrateoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xProrrateoIMPORTE_PREVISTO: TFloatField
      DisplayLabel = 'mp. Previsto'
      FieldName = 'IMPORTE_PREVISTO'
    end
  end
  object DSxProrrateo: TDataSource
    DataSet = xProrrateo
    Left = 168
    Top = 64
  end
  object xProrrateoAlbaranes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_E_PROR_ALB'
      'WHERE'
      '  RIG_ORI=?old_RIG_ORI AND '
      '  TIPO_ORI=?old_TIPO_ORI AND '
      '  SERIE_ORI=?old_SERIE_ORI AND '
      '  CANAL_ORI=?old_CANAL_ORI AND '
      '  EJERCICIO_ORI=?old_EJERCICIO_ORI AND '
      '  EMPRESA_ORI=?old_EMPRESA_ORI AND '
      '  PRORRATEO=?old_PRORRATEO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_E_PROR_ALB'
      
        '  (EMPRESA,EJERCICIO,CANAL,PRORRATEO,FECHA_ORI,EMPRESA_ORI,EJERC' +
        'ICIO_ORI,CANAL_ORI,SERIE_ORI,TIPO_ORI,RIG_ORI)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PRORRATEO,?FECHA_ORI,?EMPRESA_ORI' +
        ',?EJERCICIO_ORI,?CANAL_ORI,?SERIE_ORI,?TIPO_ORI,?RIG_ORI)')
    RefreshSQL.Strings = (
      'SELECT PA.*, C.MONEDA, CA.PROVEEDOR, T.NOMBRE_R_SOCIAL'
      'FROM GES_CABECERAS_E_PROR_ALB PA'
      'JOIN GES_CABECERAS_E C ON (PA.EMPRESA_ORI = C.EMPRESA AND'
      '      PA.EJERCICIO_ORI = C.EJERCICIO AND'
      '      PA.CANAL_ORI = C.CANAL AND'
      '      PA.SERIE_ORI = C.SERIE AND'
      '      PA.TIPO_ORI = C.TIPO AND'
      '      PA.RIG_ORI = C.RIG)'
      'JOIN GES_CABECERAS_E_ALB CA ON (CA.ID_E = C.ID_E)'
      'JOIN SYS_TERCEROS T ON (T.TERCERO=CA.TERCERO)'
      'WHERE'
      '  PA.RIG_ORI=?RIG_ORI AND'
      '  PA.TIPO_ORI=?TIPO_ORI AND '
      '  PA.SERIE_ORI=?SERIE_ORI AND '
      '  PA.CANAL_ORI=?CANAL_ORI AND '
      '  PA.EJERCICIO_ORI=?EJERCICIO_ORI AND '
      '  PA.EMPRESA_ORI=?EMPRESA_ORI AND '
      '  PA.PRORRATEO=?PRORRATEO AND '
      '  PA.CANAL=?CANAL AND '
      '  PA.EJERCICIO=?EJERCICIO AND '
      '  PA.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT PA.*, C.MONEDA, CA.PROVEEDOR, T.NOMBRE_R_SOCIAL'
      'FROM GES_CABECERAS_E_PROR_ALB PA'
      'JOIN GES_CABECERAS_E C ON (PA.EMPRESA_ORI = C.EMPRESA AND'
      '      PA.EJERCICIO_ORI = C.EJERCICIO AND'
      '      PA.CANAL_ORI = C.CANAL AND'
      '      PA.SERIE_ORI = C.SERIE AND'
      '      PA.TIPO_ORI = C.TIPO AND'
      '      PA.RIG_ORI = C.RIG)'
      'JOIN GES_CABECERAS_E_ALB CA ON (CA.ID_E = C.ID_E)'
      'JOIN SYS_TERCEROS T ON (T.TERCERO=CA.TERCERO)'
      'WHERE'
      'PA.EMPRESA = ?EMPRESA AND'
      'PA.EJERCICIO = ?EJERCICIO AND'
      'PA.CANAL = ?CANAL AND'
      'PA.PRORRATEO = ?PRORRATEO'
      'ORDER BY PA.SERIE_ORI, PA.RIG_ORI')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_E_PROR_ALB'
      'SET'
      '  FECHA_ORI=?FECHA_ORI '
      'WHERE'
      '  RIG_ORI=?RIG_ORI AND '
      '  TIPO_ORI=?TIPO_ORI AND '
      '  SERIE_ORI=?SERIE_ORI AND '
      '  CANAL_ORI=?CANAL_ORI AND '
      '  EJERCICIO_ORI=?EJERCICIO_ORI AND '
      '  EMPRESA_ORI=?EMPRESA_ORI AND '
      '  PRORRATEO=?PRORRATEO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxProrrateo
    AfterOpen = xProrrateoAlbaranesAfterOpen
    BeforeClose = xProrrateoAlbaranesBeforeClose
    OnNewRecord = xProrrateoAlbaranesNewRecord
    ClavesPrimarias.Strings = (
      'RIG_ORI '
      'TIPO_ORI '
      'SERIE_ORI '
      'CANAL_ORI '
      'EJERCICIO_ORI '
      'EMPRESA_ORI '
      'PRORRATEO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_E_PROR_ALB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object xProrrateoAlbaranesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProrrateoAlbaranesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProrrateoAlbaranesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProrrateoAlbaranesPRORRATEO: TIntegerField
      DisplayLabel = 'Prorrateo'
      FieldName = 'PRORRATEO'
    end
    object xProrrateoAlbaranesEMPRESA_ORI: TIntegerField
      DisplayLabel = 'Emp. Origen'
      FieldName = 'EMPRESA_ORI'
    end
    object xProrrateoAlbaranesEJERCICIO_ORI: TIntegerField
      DisplayLabel = 'Ejer. Orig.'
      FieldName = 'EJERCICIO_ORI'
    end
    object xProrrateoAlbaranesCANAL_ORI: TIntegerField
      DisplayLabel = 'Canal Orig.'
      FieldName = 'CANAL_ORI'
    end
    object xProrrateoAlbaranesSERIE_ORI: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ORI'
      Size = 10
    end
    object xProrrateoAlbaranesTIPO_ORI: TFIBStringField
      DisplayLabel = 'Tipo Orig.'
      FieldName = 'TIPO_ORI'
      Size = 3
    end
    object xProrrateoAlbaranesRIG_ORI: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_ORI'
    end
    object xProrrateoAlbaranesFECHA_ORI: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ORI'
    end
    object xProrrateoAlbaranesID_E_ORI: TIntegerField
      FieldName = 'ID_E_ORI'
    end
    object xProrrateoAlbaranesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xProrrateoAlbaranesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProrrateoAlbaranesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo Proveedor'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxProrrateoAlbaranes: TDataSource
    DataSet = xProrrateoAlbaranes
    Left = 168
    Top = 112
  end
  object xProrrateoLineas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_E_PROR_ALB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PRORRATEO=?old_PRORRATEO AND '
      '  EMPRESA_ORI=?old_EMPRESA_ORI AND '
      '  EJERCICIO_ORI=?old_EJERCICIO_ORI AND '
      '  CANAL_ORI=?old_CANAL_ORI AND '
      '  SERIE_ORI=?old_SERIE_ORI AND '
      '  TIPO_ORI=?old_TIPO_ORI AND '
      '  RIG_ORI=?old_RIG_ORI AND '
      '  LINEA_ORI=?old_LINEA_ORI ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_E_PROR_ALB'
      
        '  (P_COSTE,P_COSTE_PRORRATEO,SERIE_ORI,FECHA_ORI,PRORRATEO,RIG_O' +
        'RI,EMPRESA,EJERCICIO,CANAL,EMPRESA_ORI,EJERCICIO_ORI,CANAL_ORI,L' +
        'INEA_ORI,ARTICULO,TIPO_ORI,ID_E_ORI,ID_DETALLES_E_ORI,UNIDADES)'
      'VALUES'
      
        '  (?P_COSTE,?P_COSTE_PRORRATEO,?SERIE_ORI,?FECHA_ORI,?PRORRATEO,' +
        '?RIG_ORI,?EMPRESA,?EJERCICIO,?CANAL,?EMPRESA_ORI,?EJERCICIO_ORI,' +
        '?CANAL_ORI,?LINEA_ORI,?ARTICULO,?TIPO_ORI,?ID_E_ORI,?ID_DETALLES' +
        '_E_ORI,?UNIDADES)')
    RefreshSQL.Strings = (
      
        'SELECT P.*, (D.B_IMPONIBLE/P.UNIDADES) P_COSTE_UNIT, M.PRECIO P_' +
        'COSTE_UNIT_PRORRATEO'
      'FROM GES_DETALLES_E_PROR_ALB P'
      'JOIN GES_DETALLES_E D ON P.ID_DETALLES_E_ORI = D.ID_DETALLES_E'
      'JOIN ART_MOV_STOCKS M ON D.ID_MOV_STOCKS = M.ID_MOV_STOCKS'
      'WHERE'
      '  P.EMPRESA=?EMPRESA AND '
      '  P.EJERCICIO=?EJERCICIO AND '
      '  P.CANAL=?CANAL AND '
      '  P.PRORRATEO=?PRORRATEO AND '
      '  P.EMPRESA_ORI=?EMPRESA_ORI AND '
      '  P.EJERCICIO_ORI=?EJERCICIO_ORI AND '
      '  P.CANAL_ORI=?CANAL_ORI AND '
      '  P.SERIE_ORI=?SERIE_ORI AND '
      '  P.TIPO_ORI=?TIPO_ORI AND '
      '  P.RIG_ORI=?RIG_ORI AND '
      '  P.LINEA_ORI=?LINEA_ORI '
      'ORDER BY P.LINEA_ORI'
      '')
    SelectSQL.Strings = (
      
        'SELECT P.*, (D.B_IMPONIBLE/P.UNIDADES) P_COSTE_UNIT, M.PRECIO P_' +
        'COSTE_UNIT_PRORRATEO'
      'FROM GES_DETALLES_E_PROR_ALB P'
      'JOIN GES_DETALLES_E D ON P.ID_DETALLES_E_ORI = D.ID_DETALLES_E'
      'JOIN ART_MOV_STOCKS M ON D.ID_MOV_STOCKS = M.ID_MOV_STOCKS'
      'WHERE'
      '  P.EMPRESA = :EMPRESA AND '
      '  P.EJERCICIO = :EJERCICIO AND '
      '  P.CANAL = :CANAL AND '
      '  P.PRORRATEO = :PRORRATEO AND '
      '  P.EMPRESA_ORI = :EMPRESA_ORI AND '
      '  P.EJERCICIO_ORI = :EJERCICIO_ORI AND '
      '  P.CANAL_ORI = :CANAL_ORI AND '
      '  P.SERIE_ORI = :SERIE_ORI AND '
      '  P.TIPO_ORI = :TIPO_ORI AND '
      '  P.RIG_ORI = :RIG_ORI '
      'ORDER BY P.LINEA_ORI'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_PROR_ALB'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,P_COSTE_PRORRATEO=?P_COSTE_PRORRATEO '
      '  ,FECHA_ORI=?FECHA_ORI '
      '  ,ARTICULO=?ARTICULO '
      '  ,ID_E_ORI=?ID_E_ORI '
      '  ,ID_DETALLES_E_ORI=?ID_DETALLES_E_ORI '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PRORRATEO=?PRORRATEO AND '
      '  EMPRESA_ORI=?EMPRESA_ORI AND '
      '  EJERCICIO_ORI=?EJERCICIO_ORI AND '
      '  CANAL_ORI=?CANAL_ORI AND '
      '  SERIE_ORI=?SERIE_ORI AND '
      '  TIPO_ORI=?TIPO_ORI AND '
      '  RIG_ORI=?RIG_ORI AND '
      '  LINEA_ORI=?LINEA_ORI ')
    DataSource = DSxProrrateoAlbaranes
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PRORRATEO '
      'EMPRESA_ORI '
      'EJERCICIO_ORI '
      'CANAL_ORI '
      'SERIE_ORI '
      'TIPO_ORI '
      'RIG_ORI '
      'LINEA_ORI ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_E_PROR_ALB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 160
    object xProrrateoLineasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProrrateoLineasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProrrateoLineasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProrrateoLineasPRORRATEO: TIntegerField
      DisplayLabel = 'Prorrateo'
      FieldName = 'PRORRATEO'
    end
    object xProrrateoLineasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xProrrateoLineasP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xProrrateoLineasP_COSTE_PRORRATEO: TFloatField
      DisplayLabel = 'Imp. Prorrateo'
      FieldName = 'P_COSTE_PRORRATEO'
    end
    object xProrrateoLineasEMPRESA_ORI: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA_ORI'
    end
    object xProrrateoLineasEJERCICIO_ORI: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ORI'
    end
    object xProrrateoLineasCANAL_ORI: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ORI'
    end
    object xProrrateoLineasSERIE_ORI: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ORI'
      Size = 10
    end
    object xProrrateoLineasTIPO_ORI: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ORI'
      Size = 3
    end
    object xProrrateoLineasRIG_ORI: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_ORI'
    end
    object xProrrateoLineasLINEA_ORI: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_ORI'
    end
    object xProrrateoLineasFECHA_ORI: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'FECHA_ORI'
    end
    object xProrrateoLineasID_E_ORI: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E_ORI'
    end
    object xProrrateoLineasID_DETALLES_E_ORI: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES_E_ORI'
    end
    object xProrrateoLineasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xProrrateoLineasP_COSTE_UNIT_PRORRATEO: TFloatField
      DisplayLabel = 'P Coste Unit Prorrateo'
      FieldName = 'P_COSTE_UNIT_PRORRATEO'
    end
    object xProrrateoLineasP_COSTE_UNIT: TFloatField
      DisplayLabel = 'P. Coste Unitario'
      FieldName = 'P_COSTE_UNIT'
    end
  end
  object DSxProrrateoLineas: TDataSource
    DataSet = xProrrateoLineas
    Left = 168
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 168
    Top = 16
  end
  object xProrrateoLineasAlb: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_E_PROR'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_E_PROR'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,FECHA_ORI,ARTICU' +
        'LO,P_COSTE,P_COSTE_PRORRATEO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?FECHA_OR' +
        'I,?ARTICULO,?P_COSTE,?P_COSTE_PRORRATEO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_E_PROR'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_E_PROR'
      'WHERE'
      '  EMPRESA=?EMPRESA_ORI AND '
      '  EJERCICIO=?EJERCICIO_ORI AND '
      '  CANAL=?CANAL_ORI AND '
      '  SERIE=?SERIE_ORI AND '
      '  TIPO=?TIPO_ORI AND '
      '  RIG=?RIG_ORI '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_PROR'
      'SET'
      '  FECHA_ORI=?FECHA_ORI '
      '  ,ARTICULO=?ARTICULO '
      '  ,P_COSTE=?P_COSTE '
      '  ,P_COSTE_PRORRATEO=?P_COSTE_PRORRATEO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxProrrateoAlbaranes
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_E_PROR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 208
    object xProrrateoLineasAlbEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProrrateoLineasAlbEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProrrateoLineasAlbCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProrrateoLineasAlbSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xProrrateoLineasAlbTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xProrrateoLineasAlbRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xProrrateoLineasAlbPRORRATEO: TIntegerField
      DisplayLabel = 'Prorrateo'
      FieldName = 'PRORRATEO'
    end
    object xProrrateoLineasAlbLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xProrrateoLineasAlbARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xProrrateoLineasAlbP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xProrrateoLineasAlbP_COSTE_PRORRATEO: TFloatField
      DisplayLabel = 'Imp. Prorrateo'
      FieldName = 'P_COSTE_PRORRATEO'
    end
    object xProrrateoLineasAlbFECHA_ORI: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'FECHA_ORI'
    end
    object xProrrateoLineasAlbUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xProrrateoLineasAlbID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xProrrateoLineasAlbID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES_E'
    end
  end
  object DSxProrrateoLineasAlb: TDataSource
    DataSet = xProrrateoLineasAlb
    Left = 168
    Top = 208
  end
  object xProrrateoDocOrigen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_E_PROR_ORI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PRORRATEO = :PRORRATEO AND'
      'EMPRESA_ORI = :EMPRESA_ORI AND'
      'EJERCICIO_ORI = :EJERCICIO_ORI AND'
      'CANAL_ORI = :CANAL_ORI AND'
      'SERIE_ORI = :SERIE_ORI AND'
      'TIPO_ORI = :TIPO_ORI AND'
      'RIG_ORI = :RIG_ORI')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_E_PROR_ORI ('
      
        'EMPRESA, EJERCICIO, CANAL, PRORRATEO, EMPRESA_ORI, EJERCICIO_ORI' +
        ', CANAL_ORI, SERIE_ORI, TIPO_ORI, RIG_ORI, IMPORTE_PRORRATEO)'
      'VALUES ('
      
        ':EMPRESA, :EJERCICIO, :CANAL, :PRORRATEO, :EMPRESA_ORI, :EJERCIC' +
        'IO_ORI, :CANAL_ORI, :SERIE_ORI, :TIPO_ORI, :RIG_ORI, :IMPORTE_PR' +
        'ORRATEO)')
    RefreshSQL.Strings = (
      'SELECT PO.*, C.LIQUIDO, C.LIQUIDO_CANAL, C.MONEDA,'
      '       CASE PO.TIPO_ORI'
      '         WHEN '#39'FAP'#39' THEN'
      '             TFAP.NOMBRE_R_SOCIAL'
      '         WHEN '#39'FCR'#39' THEN'
      '             TFCR.NOMBRE_R_SOCIAL'
      '         ELSE '#39#39
      '       END TITULO,'
      '       CASE PO.TIPO_ORI'
      '         WHEN '#39'FAP'#39' THEN'
      '             CFAP.NUM_FACTURA'
      '         WHEN '#39'FCR'#39' THEN'
      '             CFCR.NUM_FACTURA'
      '         ELSE '#39#39
      '       END NUM_FACTURA'
      'FROM GES_CABECERAS_E_PROR_ORI PO'
      'LEFT JOIN GES_CABECERAS_E C ON PO.ID_E_ORI = C.ID_E'
      'LEFT JOIN GES_CABECERAS_E_FAC CFAP ON PO.ID_E_ORI = CFAP.ID_E'
      'LEFT JOIN SYS_TERCEROS TFAP ON TFAP.TERCERO = CFAP.TERCERO'
      'LEFT JOIN GES_CABECERAS_E_FCR CFCR ON PO.ID_E_ORI = CFCR.ID_E'
      'LEFT JOIN SYS_TERCEROS TFCR ON TFCR.TERCERO = CFCR.TERCERO'
      'WHERE'
      'PO.EMPRESA = :old_EMPRESA AND'
      'PO.EJERCICIO = :old_EJERCICIO AND'
      'PO.CANAL = :old_CANAL AND'
      'PO.PRORRATEO = :old_PRORRATEO AND'
      'PO.EMPRESA_ORI = :old_EMPRESA_ORI AND'
      'PO.EJERCICIO_ORI = :old_EJERCICIO_ORI AND'
      'PO.CANAL_ORI = :old_CANAL_ORI AND'
      'PO.SERIE_ORI = :old_SERIE_ORI AND'
      'PO.TIPO_ORI = :old_TIPO_ORI AND'
      'PO.RIG_ORI = :old_RIG_ORI'
      
        'ORDER BY PO.EJERCICIO_ORI, PO.CANAL_ORI, PO.SERIE_ORI, PO.TIPO_O' +
        'RI, PO.RIG_ORI')
    SelectSQL.Strings = (
      'SELECT PO.*, C.LIQUIDO, C.LIQUIDO_CANAL, C.MONEDA,'
      '       CASE PO.TIPO_ORI'
      '         WHEN '#39'FAP'#39' THEN'
      '             TFAP.NOMBRE_R_SOCIAL'
      '         WHEN '#39'FCR'#39' THEN'
      '             TFCR.NOMBRE_R_SOCIAL'
      '         ELSE '#39#39
      '       END TITULO,'
      '       CASE PO.TIPO_ORI'
      '         WHEN '#39'FAP'#39' THEN'
      '             CFAP.NUM_FACTURA'
      '         WHEN '#39'FCR'#39' THEN'
      '             CFCR.NUM_FACTURA'
      '         ELSE '#39#39
      '       END NUM_FACTURA'
      'FROM GES_CABECERAS_E_PROR_ORI PO'
      'LEFT JOIN GES_CABECERAS_E C ON PO.ID_E_ORI = C.ID_E'
      'LEFT JOIN GES_CABECERAS_E_FAC CFAP ON PO.ID_E_ORI = CFAP.ID_E'
      'LEFT JOIN SYS_TERCEROS TFAP ON TFAP.TERCERO = CFAP.TERCERO'
      'LEFT JOIN GES_CABECERAS_E_FCR CFCR ON PO.ID_E_ORI = CFCR.ID_E'
      'LEFT JOIN SYS_TERCEROS TFCR ON TFCR.TERCERO = CFCR.TERCERO'
      'WHERE'
      'PO.EMPRESA = :EMPRESA AND'
      'PO.EJERCICIO = :EJERCICIO AND'
      'PO.CANAL = :CANAL AND'
      'PO.PRORRATEO = :PRORRATEO'
      
        'ORDER BY PO.EJERCICIO_ORI, PO.CANAL_ORI, PO.SERIE_ORI, PO.TIPO_O' +
        'RI, PO.RIG_ORI')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_E_PROR_ORI'
      'SET'
      'IMPORTE_PRORRATEO = :IMPORTE_PRORRATEO'
      'WHERE'
      'EMPRESA = :old_EMPRESA AND'
      'EJERCICIO = :old_EJERCICIO AND'
      'CANAL = :old_CANAL AND'
      'PRORRATEO = :old_PRORRATEO AND'
      'EMPRESA_ORI = :old_EMPRESA_ORI AND'
      'EJERCICIO_ORI = :old_EJERCICIO_ORI AND'
      'CANAL_ORI = :old_CANAL_ORI AND'
      'SERIE_ORI = :old_SERIE_ORI AND'
      'TIPO_ORI = :old_TIPO_ORI AND'
      'RIG_ORI = :old_RIG_ORI')
    DataSource = DSxProrrateo
    OnNewRecord = xProrrateoDocOrigenNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_E_PROR_ORI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 256
    object xProrrateoDocOrigenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProrrateoDocOrigenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProrrateoDocOrigenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProrrateoDocOrigenPRORRATEO: TIntegerField
      DisplayLabel = 'Prorrateo'
      FieldName = 'PRORRATEO'
    end
    object xProrrateoDocOrigenEMPRESA_ORI: TIntegerField
      DisplayLabel = 'Empresa Ori'
      FieldName = 'EMPRESA_ORI'
    end
    object xProrrateoDocOrigenEJERCICIO_ORI: TIntegerField
      DisplayLabel = 'Ejercicio Ori'
      FieldName = 'EJERCICIO_ORI'
    end
    object xProrrateoDocOrigenCANAL_ORI: TIntegerField
      DisplayLabel = 'Canal Ori'
      FieldName = 'CANAL_ORI'
    end
    object xProrrateoDocOrigenSERIE_ORI: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ORI'
      Size = 10
    end
    object xProrrateoDocOrigenTIPO_ORI: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ORI'
      Size = 3
    end
    object xProrrateoDocOrigenRIG_ORI: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG_ORI'
    end
    object xProrrateoDocOrigenID_E_ORI: TIntegerField
      DisplayLabel = 'ID E Ori'
      FieldName = 'ID_E_ORI'
    end
    object xProrrateoDocOrigenIMPORTE_PRORRATEO: TFloatField
      DisplayLabel = 'Importe Prorrateo'
      FieldName = 'IMPORTE_PRORRATEO'
    end
    object xProrrateoDocOrigenLIQUIDO: TFloatField
      DisplayLabel = 'Importe Doc.'
      FieldName = 'LIQUIDO'
      ReadOnly = True
    end
    object xProrrateoDocOrigenTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xProrrateoDocOrigenNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object xProrrateoDocOrigenLIQUIDO_MONEDA_EMPRESA: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xProrrateoDocOrigenMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object DSxProrrateoDocOrigen: TDataSource
    DataSet = xProrrateoDocOrigen
    Left = 168
    Top = 256
  end
end
