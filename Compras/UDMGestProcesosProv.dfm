object DMGestProcesosProv: TDMGestProcesosProv
  OldCreateOrder = False
  OnCreate = DMGestProcesosCreate
  Left = 530
  Top = 250
  Height = 356
  Width = 381
  object DSxVerGesPrc: TDataSource
    DataSet = xVerGesPrc
    Left = 120
    Top = 124
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CANALES_SERIES'
      'WHERE EMPRESA = ?OLD_EMPRESA AND'
      'EJERCICIO = ?OLD_EJERCICIO AND'
      'CANAL = ?OLD_CANAL'
      '')
    SelectSQL.Strings = (
      'SELECT EMPRESA,EJERCICIO,CANAL,SERIE,TITULO'
      ' FROM VER_CANALES_SERIES'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL'
      '')
    UniDirectional = False
    AfterOpen = xSeriesAfterOpen
    Left = 36
    Top = 16
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 116
    Top = 16
  end
  object xProcesos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO'
      'FROM VER_MOVIMIENTOS_PROCESOS_E'
      'order by tipo')
    UniDirectional = False
    AfterScroll = xProcesosAfterScroll
    Left = 34
    Top = 68
  end
  object DSxProcesos: TDataSource
    DataSet = xProcesos
    Left = 114
    Top = 66
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 120
  end
  object xVerGesPrc: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_GES_PROCESOS_AUTO'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)'
      'and(serie=?serie)and(tipo=?tipo)) order by contador desc ')
    UniDirectional = False
    DataSource = DSxSeries
    Opciones = []
    AutoSQLdeVistas = False
    Left = 34
    Top = 125
    object xVerGesPrcEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerGesPrcEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerGesPrcCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerGesPrcSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerGesPrcPROCESO: TFIBStringField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
      Size = 40
    end
    object xVerGesPrcTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVerGesPrcCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xVerGesPrcANTERIOR: TIntegerField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerGesPrcENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVerGesPrcUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xVerGesPrcNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object xVerGesPrcFECHA_E: TDateTimeField
      DisplayLabel = 'Fec. Entrada'
      FieldName = 'FECHA_E'
    end
    object xVerGesPrcFECHA_S: TDateTimeField
      DisplayLabel = 'Fec. Salida'
      FieldName = 'FECHA_S'
    end
    object xVerGesPrcUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 31
    end
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_deshacer_facturacion'
      'where empresa=?empresa and ejercicio=?ejercicio '
      'and serie=?serie and entrada=?entrada and PROC_AUTO = ?PROC_AUTO')
    UniDirectional = False
    Left = 32
    Top = 192
    object xRecorreENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xRecorreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecorreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecorreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecorreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xRecorreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xRecorreID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xRecorreESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xRecorreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
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
    Top = 176
  end
end
