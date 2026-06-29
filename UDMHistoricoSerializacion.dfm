object DMHistoricoSerializacion: TDMHistoricoSerializacion
  OldCreateOrder = False
  OnCreate = DMHistoricoSerializacionCreate
  Left = 443
  Top = 337
  Height = 177
  Width = 362
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
  object DSxHistorico: TDataSource
    DataSet = xHistorico
    Left = 116
    Top = 16
  end
  object xHistorico: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE, TIPO, RIG, LINEA, FECHA, ARTICULO, SIGNO, CANAL, '
      '               ALMACEN, EJERCICIO '
      'FROM  a_art_serializacion_hist(?EMPRESA, ?NSERIE)')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 42
    Top = 16
    object xHistoricoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xHistoricoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xHistoricoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xHistoricoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xHistoricoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xHistoricoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xHistoricoSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object xHistoricoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xHistoricoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xHistoricoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
  end
end
