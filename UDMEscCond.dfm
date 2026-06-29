object DMEscCond: TDMEscCond
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 340
  Top = 111
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
      'DELETE FROM ART_CONDICIONES_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_CONDICIONES_D'
      
        '  (PRECIO,RIG,UNID_MINIMAS,UNID_MAXIMAS,EMPRESA,EJERCICIO,CANAL,' +
        'LINEA,DESCUENTO,DESCUENTO_2,DESCUENTO_3,TIPO)'
      'VALUES'
      
        '  (?PRECIO,?RIG,?UNID_MINIMAS,?UNID_MAXIMAS,?EMPRESA,?EJERCICIO,' +
        '?CANAL,?LINEA,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_CONDICIONES_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_CONDICIONES_D'
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
      'UPDATE ART_CONDICIONES_D'
      'SET'
      '  PRECIO=?PRECIO '
      '  ,UNID_MINIMAS=?UNID_MINIMAS '
      '  ,UNID_MAXIMAS=?UNID_MAXIMAS '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
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
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_CONDICIONES_D'
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
  object xCondCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT CLIENTE,TITULO_CLIENTE,ARTICULO, FAMILIA, '
      '               TITULO_ARTICULO, TITULO_FAMILIA, '
      
        '               PERFIL, TITULO_PERFIL,AGRUPACION,TITULO_AGRUPACIO' +
        'N'
      'FROM VER_CONDICIONES_C'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG')
    UniDirectional = False
    Left = 32
    Top = 152
    object xCondCliARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCondCliFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCondCliTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object xCondCliTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xCondCliPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object xCondCliTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PERFIL'
      Size = 60
    end
    object xCondCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCondCliTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xCondCliAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCondCliTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
  end
  object DSxCondCli: TDataSource
    DataSet = xCondCli
    Left = 112
    Top = 152
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_condiciones_d_linea(?empresa,?ejercicio,' +
        '?canal,?tipo,?rig)')
    Transaction = TLocal
    AutoTrans = True
    Left = 236
    Top = 78
  end
end
