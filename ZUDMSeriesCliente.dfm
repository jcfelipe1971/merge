object ZDMSeriesCli: TZDMSeriesCli
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 396
  Top = 211
  Height = 319
  Width = 404
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 16
  end
  object QMCabSeriesCli: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_ARTICULOS_SER_CLI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_ARTICULOS_SER_CLI'
      '  (ID,EMPRESA,CLIENTE,FECHA,NOMBRE_R_SOCIAL)'
      'VALUES'
      '  (?ID,?EMPRESA,?CLIENTE,?FECHA,?NOMBRE_R_SOCIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_ARTICULOS_SER_CLI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ART_ARTICULOS_SER_CLI'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_ARTICULOS_SER_CLI'
      'SET'
      '  ID=?ID '
      '  ,FECHA=?FECHA '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    AutoCalcFields = False
    AfterOpen = QMCabSeriesCliAfterOpen
    BeforeClose = QMCabSeriesCliBeforeClose
    BeforePost = QMCabSeriesCliBeforePost
    OnNewRecord = QMCabSeriesCliNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_ARTICULOS_SER_CLI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMCabSeriesCliID: TIntegerField
      DisplayLabel = 'ID Cab.'
      FieldName = 'ID'
    end
    object QMCabSeriesCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabSeriesCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabSeriesCliFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabSeriesCliNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object QMDetSeriesCli: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_SER_CLI_DET'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  LINEA=?old_LINEA AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_SER_CLI_DET'
      
        '  (ID,ID_CAB,EMPRESA,CLIENTE,LINEA,ARTICULO,CANAL,ALMACEN,CODIGO' +
        ')'
      'VALUES'
      
        '  (?ID,?ID_CAB,?EMPRESA,?CLIENTE,?LINEA,?ARTICULO,?CANAL,?ALMACE' +
        'N,?CODIGO)')
    RefreshSQL.Strings = (
      
        'SELECT D.*, A.TITULO_LARGO, S.NSERIE, S.FECHA_CADUCIDAD, S.FECHA' +
        '_GARANTIA_CLIENTE, S.FECHA_GARANTIA_PROVEEDOR,'
      
        '       CAST(SUBSTRING(S.NOTAS FROM 1 FOR 60) AS VARCHAR(60)) NOT' +
        'AS'
      'FROM ART_ARTICULOS_SER_CLI_DET D'
      
        'JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A' +
        '.ARTICULO'
      
        'JOIN ART_ARTICULOS_SERIALIZACION S ON D.EMPRESA = S.EMPRESA AND ' +
        'D.ARTICULO = S.ARTICULO AND D.CANAL = S.CANAL AND D.ALMACEN = S.' +
        'ALMACEN AND S.CODIGO = D.CODIGO'
      'WHERE'
      'D.EMPRESA = ?EMPRESA AND'
      'D.CLIENTE = ?CLIENTE AND '
      'D.CODIGO = ?CODIGO AND '
      'D.ALMACEN = ?ALMACEN AND '
      'D.ARTICULO = ?ARTICULO AND '
      'D.CANAL = ?CANAL AND '
      'D.LINEA = ?LINEA')
    SelectSQL.Strings = (
      
        'SELECT D.*, A.TITULO_LARGO, S.NSERIE, S.FECHA_CADUCIDAD, S.FECHA' +
        '_GARANTIA_CLIENTE, S.FECHA_GARANTIA_PROVEEDOR,'
      
        '       CAST(SUBSTRING(S.NOTAS FROM 1 FOR 60) AS VARCHAR(60)) NOT' +
        'AS'
      'FROM ART_ARTICULOS_SER_CLI_DET D'
      
        'JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A' +
        '.ARTICULO'
      
        'JOIN ART_ARTICULOS_SERIALIZACION S ON D.EMPRESA = S.EMPRESA AND ' +
        'D.ARTICULO = S.ARTICULO AND D.CANAL = S.CANAL AND D.ALMACEN = S.' +
        'ALMACEN AND S.CODIGO = D.CODIGO'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.CANAL = :CANAL AND'
      'D.CLIENTE = :CLIENTE'
      'ORDER BY D.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_SER_CLI_DET'
      'SET'
      '  ID=?ID '
      '  ,ID_CAB=?ID_CAB '
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  LINEA=?LINEA AND '
      '  CLIENTE=?CLIENTE AND '
      '  EMPRESA=?EMPRESA ')
    AutoCalcFields = False
    DataSource = DSCabSeriesCli
    BeforePost = QMDetSeriesCliBeforePost
    OnNewRecord = QMDetSeriesCliNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CLIENTE '
      'CODIGO '
      'ALMACEN '
      'ARTICULO '
      'CANAL '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_SER_CLI_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMDetSeriesCliID: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID'
    end
    object QMDetSeriesCliID_CAB: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_CAB'
    end
    object QMDetSeriesCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetSeriesCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetSeriesCliLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetSeriesCliARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMDetSeriesCliARTICULOChange
      Size = 15
    end
    object QMDetSeriesCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetSeriesCliALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetSeriesCliCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetSeriesCliTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMDetSeriesCliNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      OnChange = QMDetSeriesCliNSERIEChange
      Size = 25
    end
    object QMDetSeriesCliFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object QMDetSeriesCliFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Garantia Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object QMDetSeriesCliFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Garantia Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object QMDetSeriesCliNOTAS: TFIBStringField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 60
    end
  end
  object DSCabSeriesCli: TDataSource
    DataSet = QMCabSeriesCli
    Left = 136
    Top = 16
  end
  object DSDetSeriesCli: TDataSource
    DataSet = QMDetSeriesCli
    Left = 136
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 64
  end
end
