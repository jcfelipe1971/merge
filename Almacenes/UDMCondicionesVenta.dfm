object DMCondicionesVenta: TDMCondicionesVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 515
  Top = 251
  Height = 446
  Width = 618
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 24
    Top = 8
  end
  object DSQMCondCli: TDataSource
    DataSet = QMCli
    Left = 120
    Top = 64
  end
  object QMCondCliArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_CLIENTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,CLIENTE,TITULO_CLIENTE,ARTIC' +
        'ULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESD' +
        'E,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?CLIENTE,?TITULO_CLIENT' +
        'E,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJ' +
        'A,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPA' +
        'SAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_CLIENTE'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'CLIENTE=?CLIENTE AND'
      'TIPO='#39'CCA'#39
      'ORDER BY CLIENTE, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_CLIENTE'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondCliArtAfterPost
    OnNewRecord = QMCondCliArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_CLIENTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 112
    object QMCondCliArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondCliArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondCliArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondCliArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondCliArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondCliArtCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondCliArtTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondCliArtARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCondCliArtARTICULOChange
      Size = 15
    end
    object QMCondCliArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondCliArtALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondCliArtBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondCliArtACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondCliArtDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondCliArtHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondCliArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondCliArtDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondCliArtDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondCliArtDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondCliArtLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondCliArtTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondCliArtALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondCliArtALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondCliArtALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondCliArtALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondCliArtALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondCliArtALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondCliArtALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondCliArtALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSQMCondCliArt: TDataSource
    DataSet = QMCondCliArt
    Left = 120
    Top = 112
  end
  object DSQMCondCliFam: TDataSource
    DataSet = QMCondCliFam
    Left = 120
    Top = 160
  end
  object QMCondArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_CLIENTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,CLIENTE,TITULO_CLIENTE,ARTIC' +
        'ULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESD' +
        'E,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?CLIENTE,?TITULO_CLIENT' +
        'E,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJ' +
        'A,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPA' +
        'SAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_CLIENTE'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'TIPO='#39'CAR'#39
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_CLIENTE'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondArtAfterPost
    OnNewRecord = QMCondArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_CLIENTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 208
    object QMCondArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondArtCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondArtTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondArtARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCondArtARTICULOChange
      Size = 15
    end
    object QMCondArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondArtALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondArtBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondArtACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondArtDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondArtHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondArtDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondArtDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondArtDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondArtLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondArtTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondArtALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondArtALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondArtALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondArtALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondArtALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondArtALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondArtALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondArtALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSQMCondArt: TDataSource
    DataSet = QMCondArt
    Left = 120
    Top = 208
  end
  object QMCondFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_CLIENTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,CLIENTE,TITULO_CLIENTE,ARTIC' +
        'ULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESD' +
        'E,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?CLIENTE,?TITULO_CLIENT' +
        'E,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJ' +
        'A,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPA' +
        'SAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_CLIENTE'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'TIPO='#39'CFA'#39
      'ORDER BY FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_CLIENTE'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondFamAfterPost
    OnNewRecord = QMCondFamNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_CLIENTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 256
    object QMCondFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondFamCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondFamTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondFamFAMILIAChange
      Size = 5
    end
    object QMCondFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondFamALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondFamBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondFamACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondFamDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondFamHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondFamDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondFamDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondFamDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondFamLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondFamTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondFamALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondFamALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondFamALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondFamALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondFamALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondFamALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondFamALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondFamALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSQMCondFam: TDataSource
    DataSet = QMCondFam
    Left = 120
    Top = 256
  end
  object QMCondPer: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PERFIL'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PERFIL'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PERFIL,TITULO_PERFIL,ARTICUL' +
        'O,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESDE,' +
        'HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PERFIL,?TITULO_PERFIL,' +
        '?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJA,' +
        '?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPASA' +
        'R)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PERFIL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PERFIL'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'TIPO='#39'CPE'#39
      'ORDER BY PERFIL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PERFIL'
      'SET'
      '  PERFIL=?PERFIL '
      '  ,TITULO_PERFIL=?TITULO_PERFIL '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondPerAfterPost
    OnNewRecord = QMCondPerNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_PERFIL'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 112
    object QMCondPerEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondPerEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondPerCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondPerTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondPerRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondPerPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      OnChange = QMCondPerPERFILChange
      Size = 4
    end
    object QMCondPerTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PERFIL'
      Size = 60
    end
    object QMCondPerARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondPerTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondPerFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondPerTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondPerALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
      OnChange = QMCondPerALTAChange
    end
    object QMCondPerBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondPerACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondPerDESDE: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'DESDE'
    end
    object QMCondPerHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondPerPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondPerDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondPerDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondPerDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondPerLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondPerTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondPerALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondPerALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondPerALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondPerALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondPerALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondPerALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondPerALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondPerALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSQMCondPer: TDataSource
    DataSet = QMCondPer
    Left = 312
    Top = 112
  end
  object QMCli: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_CLIENTES_EMPRESA'
    Left = 24
    Top = 64
    object QMCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCliEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCliTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCliTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMCliFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCliRIESGO_AUT: TFloatField
      DisplayLabel = 'Riesgo Autorizado'
      FieldName = 'RIESGO_AUT'
    end
    object QMCliRIESGO_ACT: TFloatField
      DisplayLabel = 'Riesgo Actual'
      FieldName = 'RIESGO_ACT'
    end
    object QMCliMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCliDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMCliDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMCliDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMCliDESCUENTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DESCUENTO_CIAL'
    end
    object QMCliAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCliNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCliCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCliTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCliPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMCliTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object QMCliPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMCliTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCliPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCliNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCliUSAR_ANTICIPOS: TIntegerField
      DisplayLabel = 'Usar Antic.'
      FieldName = 'USAR_ANTICIPOS'
    end
    object QMCliSU_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Su Prov.'
      FieldName = 'SU_PROVEEDOR'
      Size = 40
    end
    object QMCliEVAL_FEB: TIntegerField
      DisplayLabel = 'Eval. Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMCliEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval. Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMCliMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCliFINANCIACION: TIntegerField
      DisplayLabel = 'Financ.'
      FieldName = 'FINANCIACION'
    end
    object QMCliFACTURAR_AGENTE: TIntegerField
      DisplayLabel = 'Fact. Agente'
      FieldName = 'FACTURAR_AGENTE'
    end
    object QMCliFACTURAR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Fact. Transp.'
      FieldName = 'FACTURAR_TRANSPORTISTA'
    end
    object QMCliFACTURAR_REFERENCIA: TIntegerField
      DisplayLabel = 'Fact. Ref.'
      FieldName = 'FACTURAR_REFERENCIA'
    end
    object QMCliFACTURAR_DIRECCION: TIntegerField
      DisplayLabel = 'Fact. Dir.'
      FieldName = 'FACTURAR_DIRECCION'
    end
    object QMCliFACTURAR_SERIE: TIntegerField
      DisplayLabel = 'Fact. Serie'
      FieldName = 'FACTURAR_SERIE'
    end
    object QMCliSERIE_A_FACTURAR: TFIBStringField
      DisplayLabel = 'Serie a Fact.'
      FieldName = 'SERIE_A_FACTURAR'
      Size = 10
    end
    object QMCliFACTURAR_ALMACEN: TIntegerField
      DisplayLabel = 'Fact. Alm.'
      FieldName = 'FACTURAR_ALMACEN'
    end
    object QMCliTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMCliFACTURA_DIRECCION_ADMTVA: TIntegerField
      DisplayLabel = 'Fact. Dir. Admtiva.'
      FieldName = 'FACTURA_DIRECCION_ADMTVA'
    end
    object QMCliALBARAN_DIRECCION_ENVIO: TIntegerField
      DisplayLabel = 'Alb. Direccion de Envio'
      FieldName = 'ALBARAN_DIRECCION_ENVIO'
    end
    object QMCliPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCliNO_ALB_FAC: TIntegerField
      DisplayLabel = 'No Alb. Fac.'
      FieldName = 'NO_ALB_FAC'
    end
    object QMCliNO_VENTA_RIESGO: TIntegerField
      DisplayLabel = 'No venta bajo riesgo'
      FieldName = 'NO_VENTA_RIESGO'
    end
    object QMCliSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCliRIESGO_FAC: TFloatField
      DisplayLabel = 'Riesgo Fac.'
      FieldName = 'RIESGO_FAC'
    end
    object QMCliRIESGO_ALB: TFloatField
      DisplayLabel = 'Riesgo Alb.'
      FieldName = 'RIESGO_ALB'
    end
    object QMCliRIESGO_CAR: TFloatField
      DisplayLabel = 'Riesgo Cartera'
      FieldName = 'RIESGO_CAR'
    end
    object QMCliRIESGO_REM: TFloatField
      DisplayLabel = 'Riesgo Rem.'
      FieldName = 'RIESGO_REM'
    end
    object QMCliINTRA: TIntegerField
      DisplayLabel = 'Intra.'
      FieldName = 'INTRA'
    end
    object QMCliINTRA_TRANS: TIntegerField
      DisplayLabel = 'Intra. Trans.'
      FieldName = 'INTRA_TRANS'
    end
    object QMCliFACTURAR_TARIFA: TIntegerField
      DisplayLabel = 'Fact. Tarifa'
      FieldName = 'FACTURAR_TARIFA'
    end
    object QMCliPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
  end
  object QMPer: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERFILES'
      'WHERE'
      '  PERFIL=?PERFIL ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PERFILES'
      'WHERE '
      'PERFIL=?PERFIL')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'PERFIL ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'SYS_PERFILES'
    Left = 216
    Top = 64
    object QMPerPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMPerTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSPer: TDataSource
    DataSet = QMPer
    Left = 312
    Top = 64
  end
  object QMCondPerArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PERFIL'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PERFIL'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PERFIL,TITULO_PERFIL,ARTICUL' +
        'O,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESDE,' +
        'HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PERFIL,?TITULO_PERFIL,' +
        '?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJA,' +
        '?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPASA' +
        'R)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PERFIL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PERFIL'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'PERFIL=?PERFIL  AND'
      'TIPO='#39'CPA'#39
      'ORDER BY PERFIL, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PERFIL'
      'SET'
      '  PERFIL=?PERFIL '
      '  ,TITULO_PERFIL=?TITULO_PERFIL '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondPerArtAfterPost
    OnNewRecord = QMCondPerArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_PERFIL'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 160
    object QMCondPerArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondPerArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondPerArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondPerArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondPerArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondPerArtPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMCondPerArtTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PERFIL'
      Size = 60
    end
    object QMCondPerArtARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCondPerArtARTICULOChange
      Size = 15
    end
    object QMCondPerArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondPerArtALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondPerArtBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondPerArtACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondPerArtDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondPerArtHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondPerArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondPerArtDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondPerArtDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondPerArtDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondPerArtLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondPerArtTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondPerArtALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondPerArtALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondPerArtALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondPerArtALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondPerArtALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondPerArtALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondPerArtALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondPerArtALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSCondPerArt: TDataSource
    DataSet = QMCondPerArt
    Left = 312
    Top = 160
  end
  object QMCondPerFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PERFIL'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PERFIL'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PERFIL,TITULO_PERFIL,ARTICUL' +
        'O,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESDE,' +
        'HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PERFIL,?TITULO_PERFIL,' +
        '?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJA,' +
        '?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPASA' +
        'R)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PERFIL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PERFIL'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'PERFIL=?PERFIL  AND'
      'TIPO='#39'CPF'#39
      'ORDER BY PERFIL, FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PERFIL'
      'SET'
      '  PERFIL=?PERFIL '
      '  ,TITULO_PERFIL=?TITULO_PERFIL '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondPerFamAfterPost
    OnNewRecord = QMCondPerFamNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_PERFIL'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 208
    object QMCondPerFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondPerFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondPerFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondPerFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondPerFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondPerFamPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMCondPerFamTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PERFIL'
      Size = 60
    end
    object QMCondPerFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondPerFamFAMILIAChange
      Size = 5
    end
    object QMCondPerFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondPerFamALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondPerFamBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondPerFamACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondPerFamDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondPerFamHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondPerFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondPerFamDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondPerFamDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondPerFamDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondPerFamLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondPerFamTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondPerFamALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondPerFamALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondPerFamALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondPerFamALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondPerFamALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondPerFamALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondPerFamALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondPerFamALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSCondPerFam: TDataSource
    DataSet = QMCondPerFam
    Left = 312
    Top = 208
  end
  object DSAgr: TDataSource
    DataSet = QMAgr
    Left = 504
    Top = 64
  end
  object QMAgr: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_AGRUPACIONES'
      'WHERE'
      '  AGRUPACION=?AGRUPACION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_AGRUPACIONES'
      'WHERE '
      'AGRUPACION=:AGRUPACION')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'AGRUPACION ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'SYS_AGRUPACIONES'
    Left = 408
    Top = 64
    object QMAgrAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMAgrTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMAgrTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMAgrNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object QMCondAgr: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGRUPACION'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,AGRUPACION,TITULO_AGRUPACION' +
        ',ARTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIV' +
        'O,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?AGRUPACION,?TITULO_AGR' +
        'UPACION,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALT' +
        'A,?BAJA,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?' +
        'TRASPASAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGRUPACION'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'TIPO='#39'CAG'#39
      'ORDER BY AGRUPACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGRUPACION'
      'SET'
      '  AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondAgrAfterPost
    OnNewRecord = QMCondAgrNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGRUPACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 112
    object QMCondAgrEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondAgrEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondAgrCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondAgrTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondAgrRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondAgrAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      OnChange = QMCondAgrAGRUPACIONChange
      Size = 3
    end
    object QMCondAgrTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondAgrALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondAgrBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondAgrACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondAgrDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondAgrHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondAgrPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondAgrDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondAgrDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondAgrDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondAgrLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondAgrTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondAgrALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondAgrALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondAgrALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondAgrALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondAgrALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondAgrALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondAgrALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondAgrALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSCondAgr: TDataSource
    DataSet = QMCondAgr
    Left = 504
    Top = 112
  end
  object QMCondAgrArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGRUPACION'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,AGRUPACION,TITULO_AGRUPACION' +
        ',ARTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIV' +
        'O,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?AGRUPACION,?TITULO_AGR' +
        'UPACION,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALT' +
        'A,?BAJA,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?' +
        'TRASPASAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGRUPACION'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'AGRUPACION=?AGRUPACION AND'
      'TIPO='#39'CAA'#39
      'ORDER BY AGRUPACION, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGRUPACION'
      'SET'
      '  AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondAgrArtAfterPost
    OnNewRecord = QMCondAgrArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGRUPACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 160
    object QMCondAgrArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondAgrArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondAgrArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondAgrArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondAgrArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondAgrArtAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondAgrArtTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondAgrArtARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCondAgrArtARTICULOChange
      Size = 15
    end
    object QMCondAgrArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondAgrArtALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondAgrArtBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondAgrArtACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondAgrArtDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondAgrArtHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondAgrArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondAgrArtDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondAgrArtDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondAgrArtDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondAgrArtLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondAgrArtTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondAgrArtALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondAgrArtALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondAgrArtALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondAgrArtALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondAgrArtALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondAgrArtALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondAgrArtALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondAgrArtALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSCondAgrArt: TDataSource
    DataSet = QMCondAgrArt
    Left = 504
    Top = 160
  end
  object QMCondAgrFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGRUPACION'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,AGRUPACION,TITULO_AGRUPACION' +
        ',ARTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIV' +
        'O,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?AGRUPACION,?TITULO_AGR' +
        'UPACION,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALT' +
        'A,?BAJA,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?' +
        'TRASPASAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGRUPACION'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'AGRUPACION=?AGRUPACION AND'
      'TIPO='#39'CAF'#39
      'ORDER BY AGRUPACION, FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGRUPACION'
      'SET'
      '  AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondAgrFamAfterPost
    OnNewRecord = QMCondAgrFamNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGRUPACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 208
    object QMCondAgrFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondAgrFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondAgrFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondAgrFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondAgrFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondAgrFamAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondAgrFamTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondAgrFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondAgrFamFAMILIAChange
      Size = 5
    end
    object QMCondAgrFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondAgrFamALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondAgrFamBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondAgrFamACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondAgrFamDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondAgrFamHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondAgrFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondAgrFamDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondAgrFamDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondAgrFamDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondAgrFamLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondAgrFamARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondAgrFamTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondAgrFamTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondAgrFamALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondAgrFamALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondAgrFamALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondAgrFamALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondAgrFamALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondAgrFamALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondAgrFamALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondAgrFamALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSCondAgrFam: TDataSource
    DataSet = QMCondAgrFam
    Left = 504
    Top = 208
  end
  object QMCondCliFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_CLIENTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,CLIENTE,TITULO_CLIENTE,ARTIC' +
        'ULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIVO,DESD' +
        'E,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?CLIENTE,?TITULO_CLIENT' +
        'E,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALTA,?BAJ' +
        'A,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?TRASPA' +
        'SAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_CLIENTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_CLIENTE'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'CLIENTE=?CLIENTE AND'
      'TIPO='#39'CCF'#39
      'ORDER BY CLIENTE, FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_CLIENTE'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondCliFamAfterPost
    OnNewRecord = QMCondCliFamNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_CLIENTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 160
    object QMCondCliFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondCliFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondCliFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondCliFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondCliFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondCliFamCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondCliFamTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondCliFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondCliFamFAMILIAChange
      Size = 5
    end
    object QMCondCliFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondCliFamALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondCliFamBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondCliFamACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondCliFamDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondCliFamHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondCliFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondCliFamDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondCliFamDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondCliFamDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondCliFamLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCondCliFamTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondCliFamALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondCliFamALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondCliFamALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondCliFamALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondCliFamALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondCliFamALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondCliFamALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondCliFamALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 120
    Top = 8
  end
  object QMArticulosModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_A'
      'FROM ART_ARTICULOS A'
      'JOIN ART_ARTICULOS_M_C_TALLAS T ON A.ID_A_M_C_T = T.ID_A_M_C_T'
      'JOIN ART_ARTICULOS_MOD_COLOR C ON T.ID_A_M_C = C.ID_A_M_C'
      'WHERE C.ID_A_M = :ID_A_M')
    UniDirectional = False
    Left = 216
    Top = 256
  end
  object DSArticulosModelo: TDataSource
    DataSet = QMArticulosModelo
    Left = 312
    Top = 256
  end
  object QMCondAgrArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGRUPACION'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,AGRUPACION,TITULO_AGRUPACION' +
        ',ARTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ALTA,BAJA,ACTIV' +
        'O,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,LINEA,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?AGRUPACION,?TITULO_AGR' +
        'UPACION,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?ALT' +
        'A,?BAJA,?ACTIVO,?DESDE,?HASTA,?PRECIO,?DTO1,?DTO2,?DTO3,?LINEA,?' +
        'TRASPASAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGRUPACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGRUPACION'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'TIPO='#39'CGA'#39
      'ORDER BY AGRUPACION, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGRUPACION'
      'SET'
      '  AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = QMCondAgrArtAfterPost
    OnNewRecord = QMCondAgrArticulosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGRUPACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 256
    object QMCondAgrArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondAgrArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondAgrArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondAgrArticulosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondAgrArticulosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondAgrArticulosAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondAgrArticulosTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo Agr.'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondAgrArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondAgrArticulosTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondAgrArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondAgrArticulosTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Fam.'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondAgrArticulosALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondAgrArticulosBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondAgrArticulosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondAgrArticulosDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCondAgrArticulosHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCondAgrArticulosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondAgrArticulosDTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DTO1'
    end
    object QMCondAgrArticulosDTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DTO2'
    end
    object QMCondAgrArticulosDTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DTO3'
    end
    object QMCondAgrArticulosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCondAgrArticulosTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMCondAgrArticulosALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMCondAgrArticulosALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMCondAgrArticulosALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMCondAgrArticulosALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMCondAgrArticulosALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMCondAgrArticulosALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMCondAgrArticulosALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMCondAgrArticulosALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSxCondAgrArticulos: TDataSource
    DataSet = QMCondAgrArticulos
    Left = 504
    Top = 256
  end
end
