object DMPromocionesVenta: TDMPromocionesVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 324
  Top = 201
  Height = 446
  Width = 618
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 24
    Top = 8
  end
  object QMFamilia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_VENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,FECHA_ALTA,FECHA_BAJA,CLIE' +
        'NTE,AGRUPACION,ARTICULO,TITULO_ARTICULO,'#13#10'ID_A,UNIDADES,TARIFA,T' +
        'ITULO_TARIFA,PRECIO,DTO1,DTO2,DTO3,FAMILIA,TITULO_FAMILIA,'#13#10'ID_P' +
        ',PROMOCION,TITULO_PROMOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROM' +
        'O,DTO2_PROMO,DTO3_PROMO,LINEA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?FECHA_ALTA,?FECHA_BA' +
        'JA,?CLIENTE,?AGRUPACION,?ARTICULO,?TITULO_ARTICULO,'#13#10'?ID_A,?UNID' +
        'ADES,?TARIFA,?TITULO_TARIFA,?PRECIO,?DTO1,?DTO2,?DTO3,?FAMILIA,?' +
        'TITULO_FAMILIA,'#13#10'?ID_P,?PROMOCION,?TITULO_PROMOCION,?UDS_PROMOCI' +
        'ON,?PRECIO_PROMO,?DTO1_PROMO,?DTO2_PROMO,?DTO3_PROMO,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  TIPO = '#39'PFA'#39
      'ORDER BY FAMILIA, FECHA_ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_VENTAS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,TARIFA=?TARIFA '
      '  ,TITULO_TARIFA=?TITULO_TARIFA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_P=?ID_P '
      '  ,PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      '  ,LINEA=?LINEA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    OnNewRecord = QMFamiliaNewRecord
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
    TableName = 'VER_PROMOCIONES_VENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 56
    object QMFamiliaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFamiliaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFamiliaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFamiliaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMFamiliaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMFamiliaFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMFamiliaFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMFamiliaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMFamiliaAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMFamiliaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMFamiliaTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMFamiliaID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMFamiliaUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMCliFamUNIDADESChange
    end
    object QMFamiliaTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMFamiliaTARIFAChange
      Size = 3
    end
    object QMFamiliaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMFamiliaDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMFamiliaDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMFamiliaDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMFamiliaPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      OnChange = QMCliFamPROMOCIONChange
      Size = 15
    end
    object QMFamiliaTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'Desc. Promocion'
      FieldName = 'TITULO_PROMOCION'
      Size = 256
    end
    object QMFamiliaUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMFamiliaPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMFamiliaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMFamiliaFAMILIAChange
      Size = 5
    end
    object QMFamiliaTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMFamiliaTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object QMFamiliaID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object QMFamiliaDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMFamiliaDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMFamiliaDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 3'
      FieldName = 'DTO3_PROMO'
    end
    object QMFamiliaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMFamilia: TDataSource
    DataSet = QMFamilia
    Left = 96
    Top = 56
  end
  object QMCliFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_VENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,FECHA_ALTA,FECHA_BAJA,CLIE' +
        'NTE,AGRUPACION,ARTICULO,TITULO_ARTICULO,'#13#10'ID_A,UNIDADES,TARIFA,T' +
        'ITULO_TARIFA,PRECIO,DTO1,DTO2,DTO3,FAMILIA,TITULO_FAMILIA,'#13#10'ID_P' +
        ',PROMOCION,TITULO_PROMOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROM' +
        'O,DTO2_PROMO,DTO3_PROMO,LINEA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?FECHA_ALTA,?FECHA_BA' +
        'JA,?CLIENTE,?AGRUPACION,?ARTICULO,?TITULO_ARTICULO,'#13#10'?ID_A,?UNID' +
        'ADES,?TARIFA,?TITULO_TARIFA,?PRECIO,?DTO1,?DTO2,?DTO3,?FAMILIA,?' +
        'TITULO_FAMILIA,'#13#10'?ID_P,?PROMOCION,?TITULO_PROMOCION,?UDS_PROMOCI' +
        'ON,?PRECIO_PROMO,?DTO1_PROMO,?DTO2_PROMO,?DTO3_PROMO,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  TIPO = '#39'PCF'#39' AND'
      '  CLIENTE = ?CLIENTE'
      'ORDER BY CLIENTE, FAMILIA, FECHA_ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_VENTAS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,TARIFA=?TARIFA '
      '  ,TITULO_TARIFA=?TITULO_TARIFA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_P=?ID_P '
      '  ,PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      '  ,LINEA=?LINEA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    OnNewRecord = QMCliFamNewRecord
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
    TableName = 'VER_PROMOCIONES_VENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 104
    object QMCliFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCliFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCliFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCliFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCliFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCliFamFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMCliFamFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMCliFamCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCliFamAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCliFamARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCliFamTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCliFamID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMCliFamUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMCliFamUNIDADESChange
    end
    object QMCliFamTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMCliFamTARIFAChange
      Size = 3
    end
    object QMCliFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCliFamDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMCliFamDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCliFamDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCliFamPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      OnChange = QMCliFamPROMOCIONChange
      Size = 15
    end
    object QMCliFamTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'Desc. Promocion'
      FieldName = 'TITULO_PROMOCION'
      Size = 256
    end
    object QMCliFamUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMCliFamPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMCliFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCliFamFAMILIAChange
      Size = 5
    end
    object QMCliFamID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object QMCliFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCliFamTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object QMCliFamDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMCliFamDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMCliFamDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 3'
      FieldName = 'DTO3_PROMO'
    end
    object QMCliFamLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMCliFam: TDataSource
    DataSet = QMCliFam
    Left = 96
    Top = 104
  end
  object QMCliArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_VENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,FECHA_ALTA,FECHA_BAJA,CLIE' +
        'NTE,AGRUPACION,ARTICULO,TITULO_ARTICULO,'#13#10'ID_A,UNIDADES,TARIFA,T' +
        'ITULO_TARIFA,PRECIO,DTO1,DTO2,DTO3,FAMILIA,TITULO_FAMILIA,'#13#10'ID_P' +
        ',PROMOCION,TITULO_PROMOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROM' +
        'O,DTO2_PROMO,DTO3_PROMO,LINEA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?FECHA_ALTA,?FECHA_BA' +
        'JA,?CLIENTE,?AGRUPACION,?ARTICULO,?TITULO_ARTICULO,'#13#10'?ID_A,?UNID' +
        'ADES,?TARIFA,?TITULO_TARIFA,?PRECIO,?DTO1,?DTO2,?DTO3,?FAMILIA,?' +
        'TITULO_FAMILIA,'#13#10'?ID_P,?PROMOCION,?TITULO_PROMOCION,?UDS_PROMOCI' +
        'ON,?PRECIO_PROMO,?DTO1_PROMO,?DTO2_PROMO,?DTO3_PROMO,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  TIPO = '#39'PCA'#39' AND'
      '  CLIENTE = ?CLIENTE'
      'ORDER BY CLIENTE, ARTICULO, FECHA_ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_VENTAS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,TARIFA=?TARIFA '
      '  ,TITULO_TARIFA=?TITULO_TARIFA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_P=?ID_P '
      '  ,PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      '  ,LINEA=?LINEA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    OnNewRecord = QMCliArtNewRecord
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
    TableName = 'VER_PROMOCIONES_VENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 152
    object QMCliArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCliArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCliArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCliArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCliArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCliArtFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMCliArtFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMCliArtCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCliArtAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCliArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMCliArtARTICULOChange
      Size = 15
    end
    object QMCliArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCliArtID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMCliArtUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMCliArtUNIDADESChange
    end
    object QMCliArtTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMCliArtTARIFAChange
      Size = 3
    end
    object QMCliArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCliArtDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMCliArtDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMCliArtDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMCliArtPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      OnChange = QMCliArtPROMOCIONChange
      Size = 15
    end
    object QMCliArtTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'Desc. Promocion'
      FieldName = 'TITULO_PROMOCION'
      Size = 256
    end
    object QMCliArtUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMCliArtPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMCliArtFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCliArtID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object QMCliArtTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCliArtTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object QMCliArtDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMCliArtDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMCliArtDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 3'
      FieldName = 'DTO3_PROMO'
    end
    object QMCliArtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMCliArt: TDataSource
    DataSet = QMCliArt
    Left = 96
    Top = 152
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CLIENTE, TITULO FROM VER_CLIENTES'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 376
    Top = 56
    object xClienteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 448
    Top = 56
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION, TITULO FROM SYS_AGRUPACIONES'
      'WHERE '
      'AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 376
    Top = 104
    object xAgrupacionAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xAgrupacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 448
    Top = 104
  end
  object QMAgrFam: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_VENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,FECHA_ALTA,FECHA_BAJA,CLIE' +
        'NTE,AGRUPACION,ARTICULO,TITULO_ARTICULO,'#13#10'ID_A,UNIDADES,TARIFA,T' +
        'ITULO_TARIFA,PRECIO,DTO1,DTO2,DTO3,FAMILIA,TITULO_FAMILIA,'#13#10'ID_P' +
        ',PROMOCION,TITULO_PROMOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROM' +
        'O,DTO2_PROMO,DTO3_PROMO,LINEA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?FECHA_ALTA,?FECHA_BA' +
        'JA,?CLIENTE,?AGRUPACION,?ARTICULO,?TITULO_ARTICULO,'#13#10'?ID_A,?UNID' +
        'ADES,?TARIFA,?TITULO_TARIFA,?PRECIO,?DTO1,?DTO2,?DTO3,?FAMILIA,?' +
        'TITULO_FAMILIA,'#13#10'?ID_P,?PROMOCION,?TITULO_PROMOCION,?UDS_PROMOCI' +
        'ON,?PRECIO_PROMO,?DTO1_PROMO,?DTO2_PROMO,?DTO3_PROMO,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  TIPO = '#39'PAF'#39' AND'
      '  AGRUPACION = ?AGRUPACION'
      'ORDER BY AGRUPACION, FAMILIA, FECHA_ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_VENTAS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,TARIFA=?TARIFA '
      '  ,TITULO_TARIFA=?TITULO_TARIFA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_P=?ID_P '
      '  ,PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      '  ,LINEA=?LINEA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    OnNewRecord = QMAgrFamNewRecord
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
    TableName = 'VER_PROMOCIONES_VENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 200
    Top = 56
    object QMAgrFamEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgrFamEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgrFamCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgrFamTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAgrFamRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAgrFamFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMAgrFamFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMAgrFamCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAgrFamAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMAgrFamARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMAgrFamTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMAgrFamID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMAgrFamUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMAgrFamUNIDADESChange
    end
    object QMAgrFamTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMAgrFamTARIFAChange
      Size = 3
    end
    object QMAgrFamPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMAgrFamDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMAgrFamDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMAgrFamDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMAgrFamPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      OnChange = QMAgrFamPROMOCIONChange
      Size = 15
    end
    object QMAgrFamTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'Desc. Promocion'
      FieldName = 'TITULO_PROMOCION'
      Size = 256
    end
    object QMAgrFamUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMAgrFamPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMAgrFamFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMAgrFamFAMILIAChange
      Size = 5
    end
    object QMAgrFamTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMAgrFamTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object QMAgrFamID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object QMAgrFamDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMAgrFamDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMAgrFamDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 3'
      FieldName = 'DTO3_PROMO'
    end
    object QMAgrFamLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMAgrFam: TDataSource
    DataSet = QMAgrFam
    Left = 272
    Top = 56
  end
  object QMAgrArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_VENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,FECHA_ALTA,FECHA_BAJA,CLIE' +
        'NTE,AGRUPACION,ARTICULO,TITULO_ARTICULO,'#13#10'ID_A,UNIDADES,TARIFA,T' +
        'ITULO_TARIFA,PRECIO,DTO1,DTO2,DTO3,FAMILIA,TITULO_FAMILIA,'#13#10'ID_P' +
        ',PROMOCION,TITULO_PROMOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROM' +
        'O,DTO2_PROMO,DTO3_PROMO,LINEA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?FECHA_ALTA,?FECHA_BA' +
        'JA,?CLIENTE,?AGRUPACION,?ARTICULO,?TITULO_ARTICULO,'#13#10'?ID_A,?UNID' +
        'ADES,?TARIFA,?TITULO_TARIFA,?PRECIO,?DTO1,?DTO2,?DTO3,?FAMILIA,?' +
        'TITULO_FAMILIA,'#13#10'?ID_P,?PROMOCION,?TITULO_PROMOCION,?UDS_PROMOCI' +
        'ON,?PRECIO_PROMO,?DTO1_PROMO,?DTO2_PROMO,?DTO3_PROMO,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  TIPO = '#39'PAA'#39' AND'
      '  AGRUPACION = ?AGRUPACION'
      'ORDER BY AGRUPACION, ARTICULO, FECHA_ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_VENTAS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,TARIFA=?TARIFA '
      '  ,TITULO_TARIFA=?TITULO_TARIFA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_P=?ID_P '
      '  ,PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      '  ,LINEA=?LINEA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    OnNewRecord = QMAgrArtNewRecord
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
    TableName = 'VER_PROMOCIONES_VENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 200
    Top = 104
    object QMAgrArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgrArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgrArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgrArtTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAgrArtRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAgrArtFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMAgrArtFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMAgrArtCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAgrArtAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMAgrArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMAgrArtARTICULOChange
      Size = 15
    end
    object QMAgrArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMAgrArtID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMAgrArtUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMAgrArtUNIDADESChange
    end
    object QMAgrArtTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMAgrArtTARIFAChange
      Size = 3
    end
    object QMAgrArtPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMAgrArtDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMAgrArtDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMAgrArtDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMAgrArtPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      OnChange = QMAgrArtPROMOCIONChange
      Size = 15
    end
    object QMAgrArtTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'Desc. Promocion'
      FieldName = 'TITULO_PROMOCION'
      Size = 256
    end
    object QMAgrArtUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMAgrArtPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMAgrArtFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMAgrArtTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMAgrArtTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object QMAgrArtID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object QMAgrArtDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMAgrArtDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMAgrArtDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 3'
      FieldName = 'DTO3_PROMO'
    end
    object QMAgrArtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMAgrArt: TDataSource
    DataSet = QMAgrArt
    Left = 272
    Top = 104
  end
  object QMArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_VENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,FECHA_ALTA,FECHA_BAJA,CLIE' +
        'NTE,AGRUPACION,ARTICULO,TITULO_ARTICULO,'#13#10'ID_A,UNIDADES,TARIFA,T' +
        'ITULO_TARIFA,PRECIO,DTO1,DTO2,DTO3,FAMILIA,TITULO_FAMILIA,'#13#10'ID_P' +
        ',PROMOCION,TITULO_PROMOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROM' +
        'O,DTO2_PROMO,DTO3_PROMO,LINEA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?FECHA_ALTA,?FECHA_BA' +
        'JA,?CLIENTE,?AGRUPACION,?ARTICULO,?TITULO_ARTICULO,'#13#10'?ID_A,?UNID' +
        'ADES,?TARIFA,?TITULO_TARIFA,?PRECIO,?DTO1,?DTO2,?DTO3,?FAMILIA,?' +
        'TITULO_FAMILIA,'#13#10'?ID_P,?PROMOCION,?TITULO_PROMOCION,?UDS_PROMOCI' +
        'ON,?PRECIO_PROMO,?DTO1_PROMO,?DTO2_PROMO,?DTO3_PROMO,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_VENTAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  TIPO = '#39'PAR'#39
      'ORDER BY ARTICULO, FECHA_ALTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_VENTAS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,TARIFA=?TARIFA '
      '  ,TITULO_TARIFA=?TITULO_TARIFA '
      '  ,PRECIO=?PRECIO '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_P=?ID_P '
      '  ,PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      '  ,LINEA=?LINEA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    OnNewRecord = QMArticuloNewRecord
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
    TableName = 'VER_PROMOCIONES_VENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 200
    Top = 152
    object QMArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticuloEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMArticuloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticuloTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMArticuloRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMArticuloFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMArticuloFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMArticuloCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMArticuloAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMArticuloARTICULOChange
      Size = 15
    end
    object QMArticuloTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMArticuloID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticuloUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMArticuloUNIDADESChange
    end
    object QMArticuloTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMArticuloTARIFAChange
      Size = 3
    end
    object QMArticuloPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMArticuloDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMArticuloDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMArticuloDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMArticuloPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      OnChange = QMArticuloPROMOCIONChange
      Size = 15
    end
    object QMArticuloTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'Desc. Promocion'
      FieldName = 'TITULO_PROMOCION'
      Size = 256
    end
    object QMArticuloUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMArticuloPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMArticuloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArticuloTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMArticuloTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Desc. Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object QMArticuloID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object QMArticuloDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMArticuloDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMArticuloDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Prom. 3'
      FieldName = 'DTO3_PROMO'
    end
    object QMArticuloLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMArticulo: TDataSource
    DataSet = QMArticulo
    Left = 272
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 96
    Top = 8
  end
end
