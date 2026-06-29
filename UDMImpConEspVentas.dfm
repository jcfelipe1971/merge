object DMImpConEspVentas: TDMImpConEspVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 542
  Top = 231
  Height = 436
  Width = 769
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 102
    Top = 94
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
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_CONDICIONES_D'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,LINEA,UNID_MINIMAS,UNID_MAXI' +
        'MAS,PRECIO,DESCUENTO,DESCUENTO_2,DESCUENTO_3)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?LINEA,?UNID_MINIMAS,?U' +
        'NID_MAXIMAS,?PRECIO,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_CONDICIONES_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_CONDICIONES_D'
      'where (empresa=?empresa)'
      '  and (ejercicio=?ejercicio)'
      '  and (canal=?canal)'
      '  and (tipo=?tipo)'
      '  and (rig=?rig)'
      'order by UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_CONDICIONES_D'
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
    DataSource = DSQMCondiciones
    AfterPost = QMDetalleAfterPost
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = QMDetalleBeforeEdit
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_CONDICIONES_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 28
    Top = 94
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
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Ini.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMDetalleUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Fin.'
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
  object QMCondiciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_C'
      
        '  (EMPRESA,EJERCICIO,CANAL,TIPO,RIG,CLIENTE,TITULO_CLIENTE,ARTIC' +
        'ULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,PERFIL,TITULO_PERFIL,' +
        'AGRUPACION,TITULO_AGRUPACION,ALTA,BAJA,ACTIVO,TRASPASAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TIPO,?RIG,?CLIENTE,?TITULO_CLIENT' +
        'E,?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILIA,?PERFIL,?T' +
        'ITULO_PERFIL,?AGRUPACION,?TITULO_AGRUPACION,?ALTA,?BAJA,?ACTIVO,' +
        '?TRASPASAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_C'
      '  where (empresa=?empresa)'
      '  and (ejercicio=?ejercicio)'
      '  and (canal=?canal)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_C'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,PERFIL=?PERFIL '
      '  ,TITULO_PERFIL=?TITULO_PERFIL '
      '  ,AGRUPACION=?AGRUPACION '
      '  ,TITULO_AGRUPACION=?TITULO_AGRUPACION '
      '  ,ALTA=?ALTA '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,TRASPASAR=?TRASPASAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    AfterOpen = QMCondicionesAfterOpen
    OnNewRecord = QMCondicionesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_C'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 28
    Top = 12
    object QMCondicionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondicionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondicionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondicionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondicionesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondicionesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondicionesTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Tit. Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondicionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondicionesTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Tit. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondicionesFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondicionesTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Tit. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondicionesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMCondicionesTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Tit. Perfil'
      FieldName = 'TITULO_PERFIL'
      Size = 60
    end
    object QMCondicionesAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondicionesTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Tit. Agrupacion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondicionesALTA: TDateTimeField
      DisplayLabel = 'F. Alta'
      FieldName = 'ALTA'
    end
    object QMCondicionesBAJA: TDateTimeField
      DisplayLabel = 'F. Baja'
      FieldName = 'BAJA'
    end
    object QMCondicionesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondicionesTRASPASAR: TIntegerField
      DisplayLabel = 'Traspasar'
      FieldName = 'TRASPASAR'
    end
  end
  object DSQMCondiciones: TDataSource
    DataSet = QMCondiciones
    Left = 110
    Top = 28
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 177
    Top = 12
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 12
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_condiciones_d_linea(?empresa,?ejercicio,' +
        '?canal,?tipo,?rig)')
    Transaction = TLocal
    AutoTrans = True
    Left = 177
    Top = 142
  end
end
