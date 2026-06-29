object DMDivideFacturas: TDMDivideFacturas
  OldCreateOrder = False
  OnCreate = DMDivideFacturasCreate
  Left = 235
  Top = 396
  Height = 151
  Width = 200
  object DSQMFacturas: TDataSource
    DataSet = QMFacturas
    Left = 112
    Top = 16
  end
  object QMFacturas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT   *'
      'FROM  VER_CABECERAS_FACTURA'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'TIPO = '#39'FAC'#39' AND'
      'ESTADO >= ?ESTADOD AND'
      'ESTADO <= ?ESTADOH AND'
      'MODIFICA_DOC = 0'
      'ORDER BY SERIE, RIG')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'VER_CABECERAS_FACTURA'
    Left = 32
    Top = 16
    object QMFacturasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFacturasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFacturasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFacturasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFacturasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMFacturasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMFacturasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMFacturasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMFacturasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMFacturasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFacturasTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
      OnGetText = QMFacturasTOTAL_A_COBRARGetText
    end
    object QMFacturasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMFacturasID_S: TIntegerField
      DisplayLabel = 'ID S'
      FieldName = 'ID_S'
    end
    object QMFacturasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMFacturasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Auto.'
      FieldName = 'PROCESO_AUTO'
    end
    object QMFacturasTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 74
    Top = 68
  end
end
