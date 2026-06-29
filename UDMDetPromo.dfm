object DMDetPromo: TDMDetPromo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 345
  Top = 127
  Height = 283
  Width = 368
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
      'DELETE FROM VER_PROMOCIONES_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROMOCIONES_D'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,TIPO,RIG,LINEA,PROMOCION,TITULO_PRO' +
        'MOCION,UDS_PROMOCION,PRECIO_PROMO,DTO1_PROMO,'#13#10'DTO2_PROMO,DTO3_P' +
        'ROMO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?TIPO,?RIG,?LINEA,?PROMOCION,?TI' +
        'TULO_PROMOCION,?UDS_PROMOCION,?PRECIO_PROMO,?DTO1_PROMO,'#13#10'?DTO2_' +
        'PROMO,?DTO3_PROMO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROMOCIONES_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROMOCIONES_D'
      'WHERE EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROMOCIONES_D'
      'SET'
      '  PROMOCION=?PROMOCION '
      '  ,TITULO_PROMOCION=?TITULO_PROMOCION '
      '  ,UDS_PROMOCION=?UDS_PROMOCION '
      '  ,PRECIO_PROMO=?PRECIO_PROMO '
      '  ,DTO1_PROMO=?DTO1_PROMO '
      '  ,DTO2_PROMO=?DTO2_PROMO '
      '  ,DTO3_PROMO=?DTO3_PROMO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'TIPO'
      'RIG'
      'LINEA')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PROMOCIONES_D'
    UpdateTransaction = TLocal
    Left = 32
    Top = 72
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
    object QMDetallePROMOCION: TFIBStringField
      DisplayLabel = 'Promoci'#243'n'
      FieldName = 'PROMOCION'
      OnChange = QMDetallePROMOCIONChange
      Size = 15
    end
    object QMDetalleTITULO_PROMOCION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PROMOCION'
      Size = 60
    end
    object QMDetalleUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMDetallePRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO_PROMO'
    end
    object QMDetalleDTO1_PROMO: TFloatField
      DisplayLabel = 'Dto. Promo 1'
      FieldName = 'DTO1_PROMO'
    end
    object QMDetalleDTO2_PROMO: TFloatField
      DisplayLabel = 'Dto. Promo 2'
      FieldName = 'DTO2_PROMO'
    end
    object QMDetalleDTO3_PROMO: TFloatField
      DisplayLabel = 'Dto. Promo 3'
      FieldName = 'DTO3_PROMO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 72
  end
  object xCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT CLIENTE,TITULO_CLIENTE,ARTICULO, FAMILIA, '
      '               TITULO_ARTICULO, TITULO_FAMILIA, '
      '               AGRUPACION,TITULO_AGRUPACION,'
      
        '               TARIFA,TITULO_TARIFA,UNIDADES,PRECIO,DTO1,DTO2,DT' +
        'O3'
      'FROM VER_PROMOCIONES_C'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG')
    UniDirectional = False
    Left = 32
    Top = 152
    object xCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCabeceraTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xCabeceraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCabeceraFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCabeceraTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object xCabeceraTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xCabeceraAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCabeceraTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object xCabeceraTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xCabeceraTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object xCabeceraUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xCabeceraPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xCabeceraDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object xCabeceraDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object xCabeceraDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 112
    Top = 152
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_promociones_nueva_linea(?empresa,?ejerci' +
        'cio,?canal,?tipo,?rig)')
    Transaction = TLocal
    AutoTrans = True
    Left = 204
    Top = 70
  end
  object QArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT ARTICULO,TITULO_LARGO AS TITULO,ID_A'
      'FROM ART_ARTICULOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO')
    Transaction = TLocal
    AutoTrans = True
    Left = 208
    Top = 152
  end
end
