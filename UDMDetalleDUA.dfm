object DMDetalleDUA: TDMDetalleDUA
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 205
  Top = 103
  Height = 253
  Width = 328
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 264
    Top = 56
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_E_DUA'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_E_DUA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_DETALLES_E,ID' +
        '_E,DUA,PROVEEDOR,FECHA_ADMISION)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_DETAL' +
        'LES_E,?ID_E,?DUA,?PROVEEDOR,?FECHA_ADMISION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_E_DUA'
      'WHERE'
      '  ID_DETALLES_E = ?ID_DETALLES_E')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_E_DUA'
      'WHERE'
      '  ID_DETALLES_E = ?ID_DETALLES_E')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_DUA'
      'SET'
      '  ID_DETALLES_E=?ID_DETALLES_E '
      '  ,ID_E=?ID_E '
      '  ,DUA=?DUA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,FECHA_ADMISION=?FECHA_ADMISION'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    ClavesPrimarias.Strings = (
      'ID_DETALLES_E'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_E_DUA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
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
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Detalle'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object QMDetalleDUA: TFIBStringField
      DisplayLabel = 'D.U.A.'
      FieldName = 'DUA'
      Size = 40
    end
    object QMDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetalleFECHA_ADMISION: TDateTimeField
      DisplayLabel = 'Fecha Admision'
      FieldName = 'FECHA_ADMISION'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 168
    Top = 8
  end
  object QMFacturasProveedor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_E_DUA_FAP'
      'WHERE'
      '  ID_E_FAP=?old_ID_E_FAP AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_E_DUA_FAP'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_DETALLES_E,ID' +
        '_E,ID_E_FAP)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_DETAL' +
        'LES_E,?ID_E,?ID_E_FAP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_E_DUA_FAP'
      'WHERE'
      '  ID_E_FAP=?ID_E_FAP AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_E_DUA_FAP'
      'WHERE'
      '  ID_DETALLES_E = ?ID_DETALLES_E'
      'ORDER BY ID_E_FAP')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_E_DUA_FAP'
      'SET'
      '  ID_DETALLES_E=?ID_DETALLES_E '
      '  ,ID_E=?ID_E '
      'WHERE'
      '  ID_E_FAP=?ID_E_FAP AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDetalle
    OnNewRecord = QMFacturasProveedorNewRecord
    ClavesPrimarias.Strings = (
      'ID_E_FAP '
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_E_DUA_FAP'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMFacturasProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFacturasProveedorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFacturasProveedorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFacturasProveedorSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFacturasProveedorTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMFacturasProveedorRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMFacturasProveedorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFacturasProveedorID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id detalle'
      FieldName = 'ID_DETALLES_E'
    end
    object QMFacturasProveedorID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object QMFacturasProveedorID_E_FAP: TIntegerField
      DisplayLabel = 'Id Fac. Prov.'
      FieldName = 'ID_E_FAP'
    end
    object QMFacturasProveedorDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      OnGetText = QMFacturasProveedorDOCUMENTOGetText
      Size = 100
      Calculated = True
    end
  end
  object DSFacturasProveedor: TDataSource
    DataSet = QMFacturasProveedor
    Left = 168
    Top = 56
  end
end
