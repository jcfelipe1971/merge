object DMEscCondCom: TDMEscCondCom
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 340
  Top = 111
  Height = 283
  Width = 405
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_COND_COM_D'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_COND_COM_D'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,LINEA,UNID_MINIMAS,UNID_MAXI' +
        'MAS,PRECIO,DESCUENTO,DESCUENTO_2,DESCUENTO_3)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?LINEA,?UNID_MINIMAS,?U' +
        'NID_MAXIMAS,?PRECIO,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_COND_COM_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_COND_COM_D'
      'WHERE '
      '(EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'TIPO=?TIPO AND '
      'RIG=?RIG)'
      'ORDER BY UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_COND_COM_D'
      'SET'
      '  UNID_MINIMAS=?UNID_MINIMAS '
      '  ,UNID_MAXIMAS=?UNID_MAXIMAS '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_COND_COM_D'
    UpdateTransaction = TLocal
    Left = 32
    Top = 74
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
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMDetalleUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 72
  end
  object xCondProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT PROVEEDOR,TITULO_PROVEEDOR,ARTICULO, FAMILIA, '
      '               TITULO_ARTICULO, TITULO_FAMILIA, '
      '               AGRUPACION,TITULO_AGRUPACION'
      'FROM VER_COND_COM_C'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG ')
    UniDirectional = False
    Left = 32
    Top = 152
    object xCondProvPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xCondProvTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xCondProvARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCondProvFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCondProvTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object xCondProvTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xCondProvAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCondProvTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
  end
  object DSxCondProv: TDataSource
    DataSet = xCondProv
    Left = 112
    Top = 152
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_cond_com_d_linea(?empresa,?ejercicio,?ca' +
        'nal,?tipo,?rig)')
    Transaction = TLocal
    AutoTrans = True
    Left = 238
    Top = 14
  end
  object QMDetallePorPrecio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_COND_COM_PRECIO_D'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_COND_COM_PRECIO_D'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,LINEA,PRECIO_MIN,PRECIO_MAX,' +
        'DESCUENTO,DESCUENTO_2,DESCUENTO_3,UNIDADES)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?LINEA,?PRECIO_MIN,?PRE' +
        'CIO_MAX,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_COND_COM_PRECIO_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_COND_COM_PRECIO_D'
      'WHERE '
      '(EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'TIPO=?TIPO AND '
      'RIG=?RIG)'
      'ORDER BY PRECIO_MIN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_COND_COM_PRECIO_D'
      'SET'
      '  PRECIO_MIN=?PRECIO_MIN '
      '  ,PRECIO_MAX=?PRECIO_MAX '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetallePorPrecioNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_COND_COM_PRECIO_D'
    UpdateTransaction = TLocal
    Left = 200
    Top = 74
    object QMDetallePorPrecioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallePorPrecioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetallePorPrecioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePorPrecioTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallePorPrecioRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallePorPrecioLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetallePorPrecioPRECIO_MIN: TFloatField
      DisplayLabel = 'Precio Inicial'
      FieldName = 'PRECIO_MIN'
    end
    object QMDetallePorPrecioPRECIO_MAX: TFloatField
      DisplayLabel = 'Precio Final'
      FieldName = 'PRECIO_MAX'
    end
    object QMDetallePorPrecioDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMDetallePorPrecioDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetallePorPrecioDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetallePorPrecioUNIDADES: TFloatField
      DisplayLabel = '% Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSQMDetallePorPrecio: TDataSource
    DataSet = QMDetallePorPrecio
    Left = 312
    Top = 72
  end
  object xCondProvPorPrecio: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT PROVEEDOR,TITULO_PROVEEDOR,ARTICULO, FAMILIA, '
      '               TITULO_ARTICULO, TITULO_FAMILIA, '
      '               AGRUPACION,TITULO_AGRUPACION'
      'FROM VER_COND_COM_PRECIO_C'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG ')
    UniDirectional = False
    Left = 200
    Top = 152
    object xCondProvPorPrecioPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xCondProvPorPrecioTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xCondProvPorPrecioARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCondProvPorPrecioFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCondProvPorPrecioTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object xCondProvPorPrecioTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xCondProvPorPrecioAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCondProvPorPrecioTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
  end
  object DSxCondProvPorPrecio: TDataSource
    DataSet = xCondProvPorPrecio
    Left = 312
    Top = 152
  end
end
