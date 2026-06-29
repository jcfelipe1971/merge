object DMRecibosFactura: TDMRecibosFactura
  OldCreateOrder = False
  OnCreate = DMRecibosFacturaCreate
  Left = 692
  Top = 287
  Height = 281
  Width = 258
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 16
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 128
    Top = 16
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_SERIES'
      
        '  where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?c' +
        'anal)and'
      '              (serie=?serie))')
    UniDirectional = False
    Left = 32
    Top = 64
    object xSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSeriesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 128
    Top = 64
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from e_cartera_busca_factura_lista(?entrada)')
    UniDirectional = False
    Left = 32
    Top = 16
    object xRecibosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRecibosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosLIQUIDO: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'LIQUIDO'
    end
    object xRecibosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xRecibosIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object xRecibosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xRecibosMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosEJERCICIO_C: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_C'
    end
    object xRecibosID_CARTERA_DET: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DET'
    end
    object xRecibosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xRecibosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 60
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
    Left = 200
    Top = 64
  end
  object xTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT SUM(LIQUIDO) AS TOTAL FROM E_CARTERA_BUSCA_FACTURA_LISTA(' +
        ':ENTRADA)')
    SelectSQL.Strings = (
      
        'SELECT SUM(LIQUIDO) AS TOTAL FROM E_CARTERA_BUSCA_FACTURA_LISTA(' +
        ':ENTRADA)')
    UniDirectional = False
    Left = 32
    Top = 112
    object xTotalesTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object DSxTotales: TDataSource
    DataSet = xTotales
    Left = 128
    Top = 112
  end
end
