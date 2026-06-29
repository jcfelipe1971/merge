object DMRegInventarioUbicaciones: TDMRegInventarioUbicaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 479
  Top = 98
  Height = 274
  Width = 395
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 320
    Top = 8
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos'
      'where id_a = ?id_a')
    UniDirectional = False
    Left = 40
    Top = 8
    object xArticulosID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xArticulosPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xArticulosUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object xArticulosVOLUMEN_UNIT: TFloatField
      DisplayLabel = 'Volumen Unit.'
      FieldName = 'VOLUMEN_UNIT'
    end
    object xArticulosDIAMETRO_UNIT: TFloatField
      DisplayLabel = 'Diametro Unit.'
      FieldName = 'DIAMETRO_UNIT'
    end
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      Size = 2
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 144
    Top = 8
  end
  object QMRegInventario: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_REG_INVENTARIO_DET_UBI'
      'WHERE'
      '  LINEA_UBICACION=?old_LINEA_UBICACION AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_REG_INVENTARIO_DET_UBI'
      
        '  (EMPRESA,CANAL,RIG,LINEA,ARTICULO,ID_A,ID_UBICACION,LINEA_UBIC' +
        'ACION,UBICACION,UNIDADES,VOLUMEN,PESO,DIAMETRO,ID_A_UBICACION,GE' +
        'NERAL,ALMACEN,CALLE,ESTANTERIA,REPISA,POSICION,ID_D_REG_UBICACIO' +
        'N,ID_REG,ID_REG_DETALLE)'
      'VALUES'
      
        '  (?EMPRESA,?CANAL,?RIG,?LINEA,?ARTICULO,?ID_A,?ID_UBICACION,?LI' +
        'NEA_UBICACION,?UBICACION,?UNIDADES,?VOLUMEN,?PESO,?DIAMETRO,?ID_' +
        'A_UBICACION,?GENERAL,?ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICI' +
        'ON,?ID_D_REG_UBICACION,?ID_REG,?ID_REG_DETALLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_REG_INVENTARIO_DET_UBI'
      'WHERE'
      '  LINEA_UBICACION=?LINEA_UBICACION AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_REG_INVENTARIO_DET_UBI'
      'WHERE ID_REG_DETALLE=?ID_REG_DETALLE'
      'ORDER BY LINEA_UBICACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_REG_INVENTARIO_DET_UBI'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,UBICACION=?UBICACION '
      '  ,UNIDADES=?UNIDADES '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,PESO=?PESO '
      '  ,DIAMETRO=?DIAMETRO '
      '  ,ID_A_UBICACION=?ID_A_UBICACION '
      '  ,GENERAL=?GENERAL '
      '  ,ALMACEN=?ALMACEN '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,ID_D_REG_UBICACION=?ID_D_REG_UBICACION '
      '  ,ID_REG=?ID_REG '
      '  ,ID_REG_DETALLE=?ID_REG_DETALLE '
      'WHERE'
      '  LINEA_UBICACION=?LINEA_UBICACION AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxArticulos
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMRegInventarioBeforePost
    OnNewRecord = QMRegInventarioNewRecord
    ClavesPrimarias.Strings = (
      'LINEA_UBICACION '
      'LINEA '
      'RIG '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_REG_INVENTARIO_DET_UBI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMRegInventarioEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMRegInventarioCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMRegInventarioRIG: TIntegerField
      FieldName = 'RIG'
    end
    object QMRegInventarioLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object QMRegInventarioARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMRegInventarioID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMRegInventarioID_UBICACION: TIntegerField
      DisplayLabel = 'Id Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMRegInventarioLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMRegInventarioUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      OnChange = QMRegInventarioUBICACIONChange
    end
    object QMRegInventarioUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnGetText = QMRegInventarioUNIDADESGetText
    end
    object QMRegInventarioVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMRegInventarioPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMRegInventarioDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMRegInventarioID_A_UBICACION: TIntegerField
      DisplayLabel = 'Id Art. Ubic.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMRegInventarioGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMRegInventarioALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMRegInventarioCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMRegInventarioESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMRegInventarioREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMRegInventarioPOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMRegInventarioID_D_REG_UBICACION: TIntegerField
      DisplayLabel = 'Id Det. Reg. Ubic.'
      FieldName = 'ID_D_REG_UBICACION'
    end
    object QMRegInventarioID_REG: TIntegerField
      DisplayLabel = 'Id Reg.'
      FieldName = 'ID_REG'
    end
    object QMRegInventarioID_REG_DETALLE: TIntegerField
      DisplayLabel = 'Id Reg. Det.'
      FieldName = 'ID_REG_DETALLE'
    end
    object QMRegInventarioDescUbicacion: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldKind = fkCalculated
      FieldName = 'DescUbicacion'
      OnGetText = QMRegInventarioDescUbicacionGetText
      Size = 60
      Calculated = True
    end
  end
  object DSQMRegInventario: TDataSource
    DataSet = QMRegInventario
    Left = 144
    Top = 56
  end
  object QMStockUbi: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_stocks_ubicaciones'
      'where id_a = ?id_a')
    UniDirectional = False
    Left = 40
    Top = 104
    object QMStockUbiCOMPOSICION: TFIBStringField
      DisplayLabel = 'Ubicaci'#243'n'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object QMStockUbiENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMStockUbiSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMStockUbiEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
  end
  object DSQMStockUbi: TDataSource
    DataSet = QMStockUbi
    Left = 144
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 56
  end
end
