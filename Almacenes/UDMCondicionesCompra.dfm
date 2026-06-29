object DMCondicionesCompra: TDMCondicionesCompra
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 438
  Top = 199
  Height = 401
  Width = 721
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object QMCondProvArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,L' +
        'INEA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?PREC' +
        'IO,?DTO1,?DTO2,?DTO3,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      'EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL '
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRA'#39
      'ORDER BY ARTICULO, ALTA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvArtNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMCondProvArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvArtPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvArtTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMCondProvArtARTICULOChange
      Size = 15
    end
    object QMCondProvArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvArtFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondProvArtTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvArtAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondProvArtTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvArtALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvArtBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvArtACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvArtDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvArtHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondProvArtDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvArtDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvArtDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvArtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMCondProvArt: TDataSource
    DataSet = QMCondProvArt
    Left = 152
    Top = 56
  end
  object DSQMCondProvFam: TDataSource
    DataSet = QMCondProvFam
    Left = 152
    Top = 104
  end
  object QMCondProvAgrArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,L' +
        'INEA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?PREC' +
        'IO,?DTO1,?DTO2,?DTO3,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL'
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRG'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
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
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvAgrArtNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMCondProvAgrArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvAgrArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvAgrArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvAgrArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvAgrArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvAgrArtPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvAgrArtTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvAgrArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondProvAgrArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvAgrArtFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondProvAgrArtTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvAgrArtAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      OnChange = QMCondProvAgrArtAGRUPACIONChange
      Size = 3
    end
    object QMCondProvAgrArtTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvAgrArtALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvAgrArtBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvAgrArtACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvAgrArtDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvAgrArtHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvAgrArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondProvAgrArtDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvAgrArtDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvAgrArtDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvAgrArtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSCondProvAgrArt: TDataSource
    DataSet = QMCondProvAgrArt
    Left = 152
    Top = 152
  end
  object QMCondProvFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,L' +
        'INEA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?PREC' +
        'IO,?DTO1,?DTO2,?DTO3,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL'
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRF'#39
      'ORDER BY FAMILIA, ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
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
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvFamNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMCondProvFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvFamPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvFamTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvFamARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondProvFamTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondProvFamFAMILIAChange
      Size = 5
    end
    object QMCondProvFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvFamAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondProvFamTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvFamALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvFamBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvFamACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvFamDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvFamHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondProvFamDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvFamDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvFamDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvFamLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object QMCondProvAgr: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,PRECIO,DTO1,DTO2,DTO3,L' +
        'INEA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?PREC' +
        'IO,?DTO1,?DTO2,?DTO3,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL'
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRU'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
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
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvAgrNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
    object QMCondProvAgrEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvAgrEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvAgrCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvAgrTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvAgrRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvAgrPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvAgrTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvAgrARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondProvAgrTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvAgrFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondProvAgrTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvAgrAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      OnChange = QMCondProvAgrAGRUPACIONChange
      Size = 3
    end
    object QMCondProvAgrTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvAgrALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvAgrBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvAgrACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvAgrDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvAgrHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvAgrPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondProvAgrDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvAgrDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvAgrDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvAgrLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSCondProvAgr: TDataSource
    DataSet = QMCondProvAgr
    Left = 152
    Top = 200
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 8
  end
  object QMCondProvArtPorPrecio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR_PREC'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,DTO1,DTO2,DTO3,LINEA,UN' +
        'IDADES)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?DTO1' +
        ',?DTO2,?DTO3,?LINEA,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL '
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRA'#39
      'ORDER BY ARTICULO, ALTA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR_PREC'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvArtPorPrecioNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR_PREC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 384
    Top = 56
    object QMCondProvArtPorPrecioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvArtPorPrecioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvArtPorPrecioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvArtPorPrecioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvArtPorPrecioRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvArtPorPrecioPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvArtPorPrecioTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvArtPorPrecioARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMCondProvArtPorPrecioARTICULOChange
      Size = 15
    end
    object QMCondProvArtPorPrecioTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvArtPorPrecioFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondProvArtPorPrecioTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvArtPorPrecioAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondProvArtPorPrecioTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvArtPorPrecioALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvArtPorPrecioBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvArtPorPrecioACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvArtPorPrecioDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvArtPorPrecioHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvArtPorPrecioDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvArtPorPrecioDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvArtPorPrecioDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvArtPorPrecioLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCondProvArtPorPrecioUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSQMCondProvArtPorPrecio: TDataSource
    DataSet = QMCondProvArtPorPrecio
    Left = 528
    Top = 56
  end
  object DSQMCondProvFamPorPrecio: TDataSource
    DataSet = QMCondProvFamPorPrecio
    Left = 528
    Top = 104
  end
  object QMCondProvAgrArtPorPrecio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR_PREC'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,DTO1,DTO2,DTO3,LINEA,UN' +
        'IDADES)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?DTO1' +
        ',?DTO2,?DTO3,?LINEA,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL'
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRG'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR_PREC'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvAgrArtPorPrecioNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR_PREC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 384
    Top = 152
    object QMCondProvAgrArtPorPrecioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvAgrArtPorPrecioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvAgrArtPorPrecioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvAgrArtPorPrecioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvAgrArtPorPrecioRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvAgrArtPorPrecioPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvAgrArtPorPrecioTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvAgrArtPorPrecioARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondProvAgrArtPorPrecioTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvAgrArtPorPrecioFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondProvAgrArtPorPrecioTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvAgrArtPorPrecioAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      OnChange = QMCondProvAgrArtPorPrecioAGRUPACIONChange
      Size = 3
    end
    object QMCondProvAgrArtPorPrecioTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvAgrArtPorPrecioALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvAgrArtPorPrecioBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvAgrArtPorPrecioACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvAgrArtPorPrecioDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvAgrArtPorPrecioHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvAgrArtPorPrecioDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvAgrArtPorPrecioDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvAgrArtPorPrecioDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvAgrArtPorPrecioLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCondProvAgrArtPorPrecioUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSCondProvAgrArtPorPrecio: TDataSource
    DataSet = QMCondProvAgrArtPorPrecio
    Left = 528
    Top = 152
  end
  object QMCondProvFamPorPrecio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR_PREC'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,DTO1,DTO2,DTO3,LINEA,UN' +
        'IDADES)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?DTO1' +
        ',?DTO2,?DTO3,?LINEA,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL'
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRF'#39
      'ORDER BY FAMILIA, ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR_PREC'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvFamPorPrecioNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR_PREC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 384
    Top = 104
    object QMCondProvFamPorPrecioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvFamPorPrecioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvFamPorPrecioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvFamPorPrecioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvFamPorPrecioRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvFamPorPrecioPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvFamPorPrecioTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvFamPorPrecioARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondProvFamPorPrecioTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvFamPorPrecioFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondProvFamPorPrecioFAMILIAChange
      Size = 5
    end
    object QMCondProvFamPorPrecioTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvFamPorPrecioAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondProvFamPorPrecioTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvFamPorPrecioALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvFamPorPrecioBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvFamPorPrecioACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvFamPorPrecioDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvFamPorPrecioHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvFamPorPrecioDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvFamPorPrecioDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvFamPorPrecioDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvFamPorPrecioLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCondProvFamPorPrecioUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object QMCondProvAgrPorPrecio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROVEEDOR_PREC'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,PROVEEDOR,TITULO_PROVEEDOR,A' +
        'RTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,AGRUPACION,TITULO' +
        '_AGRUPACION,ALTA,BAJA,ACTIVO,DESDE,HASTA,DTO1,DTO2,DTO3,LINEA,UN' +
        'IDADES)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?PROVEEDOR,?TITULO_PROV' +
        'EEDOR,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?AGRUP' +
        'ACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,?DESDE,?HASTA,?DTO1' +
        ',?DTO2,?DTO3,?LINEA,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROVEEDOR_PREC'
      'WHERE EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL'
      'AND PROVEEDOR=?PROVEEDOR'
      'AND TIPO='#39'PRU'#39
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROVEEDOR_PREC'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,LINEA=?LINEA '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCondProvAgrPorPrecioNewRecord
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
    TableName = 'VER_CONDICIONES_PROVEEDOR_PREC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 384
    Top = 200
    object QMCondProvAgrPorPrecioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondProvAgrPorPrecioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondProvAgrPorPrecioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondProvAgrPorPrecioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondProvAgrPorPrecioRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondProvAgrPorPrecioPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondProvAgrPorPrecioTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMCondProvAgrPorPrecioARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondProvAgrPorPrecioTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondProvAgrPorPrecioFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondProvAgrPorPrecioTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondProvAgrPorPrecioAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      OnChange = QMCondProvAgrPorPrecioAGRUPACIONChange
      Size = 3
    end
    object QMCondProvAgrPorPrecioTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondProvAgrPorPrecioALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondProvAgrPorPrecioBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondProvAgrPorPrecioACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondProvAgrPorPrecioDESDE: TFloatField
      DisplayLabel = 'Unid. Desde'
      FieldName = 'DESDE'
    end
    object QMCondProvAgrPorPrecioHASTA: TFloatField
      DisplayLabel = 'Unid. Hasta'
      FieldName = 'HASTA'
    end
    object QMCondProvAgrPorPrecioDTO1: TFloatField
      DisplayLabel = '% Dto.'
      FieldName = 'DTO1'
    end
    object QMCondProvAgrPorPrecioDTO2: TFloatField
      DisplayLabel = '% Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCondProvAgrPorPrecioDTO3: TFloatField
      DisplayLabel = '% Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCondProvAgrPorPrecioLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCondProvAgrPorPrecioUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSCondProvAgrPorPrecio: TDataSource
    DataSet = QMCondProvAgrPorPrecio
    Left = 528
    Top = 200
  end
end
