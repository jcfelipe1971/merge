object ZDMPedidosAAlbaran: TZDMPedidosAAlbaran
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 694
  Top = 132
  Height = 227
  Width = 341
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 232
    Top = 16
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 112
    Top = 16
  end
  object xCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Z_PEDIDOS_A_ALBARAN_C where id=?id')
    InsertSQL.Strings = (
      'insert into Z_PEDIDOS_A_ALBARAN_C(FECHA_SERVIR,BULTOS,PESO,'
      '            EMPRESA , EJERCICIO,CANAL,SERIE,id,cliente)'
      'values(?FECHA_SERVIR,?BULTOS,?PESO,?EMPRESA,?EJERCICIO,'
      '       ?CANAL,?SERIE,?id,?cliente)')
    RefreshSQL.Strings = (
      'SELECT * FROM Z_PEDIDOS_A_ALBARAN_C'
      'where id=?id')
    SelectSQL.Strings = (
      'SELECT * FROM Z_PEDIDOS_A_ALBARAN_C'
      'where empresa=?empresa and canal=?canal ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update  Z_PEDIDOS_A_ALBARAN_C'
      'set FECHA_SERVIR =?Fecha_servir,'
      '     BULTOS=?bultos,'
      '     PESO=?peso'
      'where id=?id')
    AfterDelete = xCabeceraAfterDelete
    AfterPost = Graba
    AfterScroll = xCabeceraAfterScroll
    BeforeOpen = xCabeceraBeforeOpen
    OnNewRecord = xCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'id'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_PEDIDOS_A_ALBARAN_C'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object xCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xCabeceraFECHA_SERVIR: TDateTimeField
      DisplayLabel = 'Fecha Servir'
      FieldName = 'FECHA_SERVIR'
    end
    object xCabeceraBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xCabeceraPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xCabeceraRIG_ALBARAN: TIntegerField
      DisplayLabel = 'Alb.'
      FieldName = 'RIG_ALBARAN'
    end
    object xCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCabeceraDESC_CLIENTE: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'DESC_CLIENTE'
      Calculated = True
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 112
    Top = 64
  end
  object xDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM Z_PEDIDOS_A_ALBARAN_D '
      'where id_c=?id')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSxCabecera
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_PEDIDOS_A_ALBARAN_D'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object xDetalleID_D: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D'
    end
    object xDetalleID_C: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_C'
    end
    object xDetallePEDIDO: TIntegerField
      DisplayLabel = 'Rig Pedido'
      FieldName = 'PEDIDO'
    end
    object xDetalleBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xDetalleCOD_BARRAS: TIntegerField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'COD_BARRAS'
    end
    object xDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xDetalleID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
  end
  object xProcesar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_FACTURA_PEDIDOS'
      'WHERE ENTRADA = ?ENTRADA')
    UniDirectional = False
    Left = 112
    Top = 112
    object xProcesarENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xProcesarID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xProcesarID_S_D: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_S_D'
    end
    object xProcesarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProcesarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProcesarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProcesarSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xProcesarRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xProcesarSERIED: TFIBStringField
      DisplayLabel = 'Serie Dest.'
      FieldName = 'SERIED'
      Size = 10
    end
    object xProcesarRIGD: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIGD'
    end
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from g_traspaso_ped_cli_recorre(?EMPRESA,?EJERCICIO,?CA' +
        'NAL,?SERIE,?ENTRADA)')
    UniDirectional = False
    Left = 32
    Top = 112
    object xRecorreEJERCICIODEV: TIntegerField
      DisplayLabel = 'Ejercicio Dev.'
      FieldName = 'EJERCICIODEV'
    end
    object xRecorreCANALDEV: TIntegerField
      DisplayLabel = 'Canal Dev.'
      FieldName = 'CANALDEV'
    end
    object xRecorreSERIEDEV: TFIBStringField
      DisplayLabel = 'Serie Dev.'
      FieldName = 'SERIEDEV'
      Size = 10
    end
    object xRecorreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xRecorreID_S: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 64
  end
end
