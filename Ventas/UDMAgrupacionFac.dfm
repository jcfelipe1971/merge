object DMAgrupacionFac: TDMAgrupacionFac
  OldCreateOrder = False
  OnCreate = DMAgrupacionFacCreate
  Left = 521
  Top = 161
  Height = 457
  Width = 424
  object QMAgrupacionFac: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_AGRUPACION_FAC'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_AGRUPACION_FAC'
      '  (REFERENCIA,FECHA,CERRAR,CODIGO,TITULO)'
      'VALUES'
      '  (?REFERENCIA,?FECHA,?CERRAR,?CODIGO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_AGRUPACION_FAC'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_AGRUPACION_FAC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_AGRUPACION_FAC'
      'SET'
      '  REFERENCIA=?REFERENCIA '
      '  ,FECHA=?FECHA '
      '  ,CERRAR=?CERRAR '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterOpen = QMAgrupacionFacAfterOpen
    AfterPost = QMAgrupacionFacAfterPost
    OnNewRecord = QMAgrupacionFacNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_AGRUPACION_FAC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMAgrupacionFacCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMAgrupacionFacTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgrupacionFacREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMAgrupacionFacFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAgrupacionFacCERRAR: TIntegerField
      DisplayLabel = 'Cerrar'
      FieldName = 'CERRAR'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 80
  end
  object DSQMAgrupacionFac: TDataSource
    DataSet = QMAgrupacionFac
    Left = 144
    Top = 24
  end
  object QMAgrupacionFacDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_AGRUPACION_FAC'
      'WHERE'
      '  CODIGO=?OLD_CODIGO AND'
      '  EMPRESA= ?OLD_EMPRESA AND'
      '  EJERCICIO = ?OLD_EJERCICIO AND'
      '  CANAL = ?OLD_CANAL AND'
      '  SERIE =?OLD_SERIE AND'
      '  TIPO = ?OLD_TIPO AND'
      '  RIG = ?OLD_RIG')
    InsertSQL.Strings = (
      'INSERT INTO VER_AGRUPACION_FAC'
      
        '  (CODIGO,EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,MONEDA,FORMA_PA' +
        'GO,CLIENTE,TERCERO,TITULO,FECHA,TOTAL,REFERENCIA)'
      'VALUES'
      
        '  (?CODIGO,?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?MONEDA,' +
        '?FORMA_PAGO,?CLIENTE,?TERCERO,?TITULO,?FECHA,?TOTAL,?REFERENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGRUPACION_FAC'
      'WHERE'
      '  CODIGO=?CODIGO AND'
      '  EMPRESA= ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SERIE =?SERIE AND'
      '  TIPO = ?TIPO AND'
      '  RIG = ?RIG')
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACION_FAC'
      'WHERE CODIGO = ?CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGRUPACION_FAC'
      'SET'
      '  PROCESAR = ?PROCESAR'
      'WHERE'
      '  CODIGO=?CODIGO AND'
      '  EMPRESA= ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SERIE =?SERIE AND'
      '  TIPO = ?TIPO AND'
      '  RIG = ?RIG')
    DataSource = DSQMAgrupacionFac
    AfterDelete = QMAgrupacionFacDetAfterDelete
    AfterPost = QMAgrupacionFacDetAfterPost
    BeforeEdit = QMAgrupacionFacDetBeforeEdit
    OnNewRecord = QMAgrupacionFacDetNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AGRUPACION_FAC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object QMAgrupacionFacDetCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMAgrupacionFacDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgrupacionFacDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgrupacionFacDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgrupacionFacDetSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMAgrupacionFacDetTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAgrupacionFacDetRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAgrupacionFacDetMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMAgrupacionFacDetFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMAgrupacionFacDetCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAgrupacionFacDetTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMAgrupacionFacDetTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgrupacionFacDetFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAgrupacionFacDetTOTAL: TFloatField
      DisplayLabel = 'total'
      FieldName = 'TOTAL'
    end
    object QMAgrupacionFacDetREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMAgrupacionFacDetPROCESAR: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'PROCESAR'
    end
    object QMAgrupacionFacDetLIQUIDO_MONEDA: TFloatField
      DisplayLabel = 'Importe'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_MONEDA'
      OnGetText = QMAgrupacionFacDetLIQUIDO_MONEDAGetText
      Calculated = True
    end
  end
  object DSQMAgrupacionFacDet: TDataSource
    DataSet = QMAgrupacionFacDet
    Left = 168
    Top = 152
  end
  object DSxSeleccionCabeceras: TDataSource
    DataSet = xSeleccionCabeceras
    Left = 192
    Top = 232
  end
  object QInsertaCabecera: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into sys_agrupacion_fac_detalle'
      '  (codigo,empresa,ejercicio,canal,serie,tipo,rig,procesar)'
      '  values'
      '    (?CODIGO,?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,0) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 312
    Top = 112
  end
  object QProcesar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_agrupacion_fac_procesa (?CODIGO,?REFERENCIA,' +
        '?FECHA,?ENTRADA,?CERRAR)')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 216
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA = ?EMPRESA AND'
      'AGRUPACION = ?AGRUPACION')
    UniDirectional = False
    Left = 56
    Top = 296
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 152
    Top = 296
  end
  object QRangos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 328
    Top = 304
  end
  object xSeleccionCabeceras: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'select * from ges_cabeceras_s cab'
      'where cab.rig not in'
      '(select rig from sys_agrupacion_fac_detalle det'
      ' where ((det.empresa   = cab.empresa  ) and'
      ' (det.ejercicio = cab.ejercicio) and'
      ' (det.canal     = cab.canal    ) and'
      ' (det.serie     = cab.serie    ) and'
      ' (det.tipo      = cab.tipo     ) and'
      ' (det.rig       = cab.rig      ) and'
      ' (det.codigo = ?CODIGO)))'
      ' and cab.empresa   = ?EMPRESA   and'
      ' cab.ejercicio = ?EJERCICIO and'
      ' cab.canal     = ?CANAL     and'
      ' cab.tipo      = '#39'FAC'#39
      ' ')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'GES_CABECERAS_S'
    Left = 64
    Top = 232
    object xSeleccionCabecerasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeleccionCabecerasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSeleccionCabecerasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSeleccionCabecerasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSeleccionCabecerasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xSeleccionCabecerasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xSeleccionCabecerasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xSeleccionCabecerasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xSeleccionCabecerasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xSeleccionCabecerasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xSeleccionCabecerasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xSeleccionCabecerasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xSeleccionCabecerasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xSeleccionCabecerasLIQUIDO_MONEDA: TFloatField
      DisplayLabel = 'Liquido Mon.'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_MONEDA'
      OnGetText = xSeleccionCabecerasLIQUIDO_MONEDAGetText
      Calculated = True
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
    Left = 128
    Top = 80
  end
end
