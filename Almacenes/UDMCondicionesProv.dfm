object DMCondicionesProv: TDMCondicionesProv
  OldCreateOrder = False
  OnCreate = DMCondicionescliCreate
  Left = 438
  Top = 208
  Height = 346
  Width = 522
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 8
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 136
    Top = 8
  end
  object QMCondArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROV_ART'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROV_ART'
      
        '  (EMPRESA,EJERCICIO,CANAL,PROVEEDOR,ARTICULO,PRECIO,DESCUENTO_1' +
        ',DESCUENTO_2,DESCUENTO_3,ALTA,BAJA,ACTIVO,BLOQUEADO,TITULO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PROVEEDOR,?ARTICULO,?PRECIO,?DESC' +
        'UENTO_1,?DESCUENTO_2,?DESCUENTO_3,?ALTA,?BAJA,?ACTIVO,?BLOQUEADO' +
        ',?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROV_ART'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROV_ART'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR '
      'ORDER BY ARTICULO, ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROV_ART'
      'SET'
      '  PRECIO=?PRECIO '
      '  ,DESCUENTO_1=?DESCUENTO_1 '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,BLOQUEADO=?BLOQUEADO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    DataSource = DSxProveedores
    AfterCancel = QMCondArticulosAfterCancel
    AfterDelete = Graba
    AfterOpen = QMCondArticulosAfterOpen
    AfterPost = Graba
    BeforePost = QMCondArticulosBeforePost
    OnNewRecord = QMCondArticulosNewRecord
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_PROV_ART'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMCondArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondArticulosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCondArticulosARTICULOChange
      Size = 15
    end
    object QMCondArticulosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondArticulosDESCUENTO_1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO_1'
    end
    object QMCondArticulosDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMCondArticulosDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMCondArticulosALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondArticulosBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondArticulosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondArticulosBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueado'
      FieldName = 'BLOQUEADO'
    end
    object QMCondArticulosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSQMCondArticulos: TDataSource
    DataSet = QMCondArticulos
    Left = 136
    Top = 56
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,EJERCICIO,CANAL,PROVEEDOR,NOMBRE_R_SOCIAL'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 32
    Top = 8
    object xProveedoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProveedoresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProveedoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProveedoresPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedoresNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,ARTICULO,TITULO_LARGO AS TITULO'
      'FROM ART_ARTICULOS'
      'where empresa= ?empresa and articulo=?articulo')
    UniDirectional = False
    DataSource = DSQMCondArticulos
    Left = 32
    Top = 152
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
      Size = 256
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 136
    Top = 152
  end
  object QMCondFamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_PROV_FAM'
      'WHERE'
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  FAMILIA=?old_FAMILIA AND '
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_PROV_FAM'
      
        '  (EMPRESA,EJERCICIO,CANAL,PROVEEDOR,FAMILIA,DESCUENTO_1,DESCUEN' +
        'TO_2,DESCUENTO_3,ALTA,BAJA,ACTIVO,BLOQUEADO,TITULO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PROVEEDOR,?FAMILIA,?DESCUENTO_1,?' +
        'DESCUENTO_2,?DESCUENTO_3,?ALTA,?BAJA,?ACTIVO,?BLOQUEADO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_PROV_FAM'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_PROV_FAM'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'and proveedor=?proveedor'
      'order by familia, alta')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_PROV_FAM'
      'SET'
      '  DESCUENTO_1=?DESCUENTO_1 '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,BLOQUEADO=?BLOQUEADO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    DataSource = DSxProveedores
    AfterCancel = QMCondFamiliasAfterCancel
    AfterDelete = Graba
    AfterOpen = QMCondFamiliasAfterOpen
    AfterPost = Graba
    BeforePost = QMCondFamiliasBeforePost
    OnNewRecord = QMCondFamiliasNewRecord
    ClavesPrimarias.Strings = (
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'FAMILIA '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_PROV_FAM'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 104
    object QMCondFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondFamiliasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondFamiliasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondFamiliasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondFamiliasFAMILIAChange
      Size = 5
    end
    object QMCondFamiliasDESCUENTO_1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO_1'
    end
    object QMCondFamiliasDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMCondFamiliasDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMCondFamiliasALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMCondFamiliasBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMCondFamiliasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondFamiliasBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueado'
      FieldName = 'BLOQUEADO'
    end
    object QMCondFamiliasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMCondFamilias: TDataSource
    DataSet = QMCondFamilias
    Left = 136
    Top = 104
  end
  object xFamilias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,FAMILIA,TITULO'
      'FROM ART_FAMILIAS'
      'where empresa=?empresa and familia=?familia')
    UniDirectional = False
    DataSource = DSQMCondFamilias
    Left = 32
    Top = 200
    object xFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamilias: TDataSource
    DataSet = xFamilias
    Left = 136
    Top = 200
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 320
    Top = 8
  end
end
