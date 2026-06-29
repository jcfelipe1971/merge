object DMInfoHistorico: TDMInfoHistorico
  OldCreateOrder = False
  OnCreate = DMInfoHistoricoCreate
  Left = 453
  Top = 388
  Height = 159
  Width = 300
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 212
    Top = 28
  end
  object DSQHist_Precios: TDataSource
    DataSet = xHist_Precios
    Left = 120
    Top = 28
  end
  object xHist_Precios: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DAME_HISTORICO_ART_CLI'
      '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?CLIENTE,?ARTICULO)'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 38
    Top = 27
    object xHist_PreciosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
      OnGetText = xHist_PreciosP_COSTEGetText
    end
    object xHist_PreciosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      OnGetText = xHist_PreciosPRECIOGetText
    end
    object xHist_PreciosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xHist_PreciosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xHist_PreciosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xHist_PreciosNARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'NARTICULO'
      Size = 15
    end
    object xHist_PreciosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xHist_PreciosUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xHist_PreciosDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object xHist_PreciosDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xHist_PreciosDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xHist_PreciosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xHist_PreciosID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xHist_PreciosID_DETALLES_DOC: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES_DOC'
    end
    object xHist_PreciosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xHist_PreciosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xHist_PreciosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xHist_PreciosUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Secundarias'
      FieldName = 'UNIDADES_SEC'
    end
    object xHist_PreciosAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
  end
end
