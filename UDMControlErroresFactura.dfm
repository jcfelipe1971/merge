object DMControlErroresFactura: TDMControlErroresFactura
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 409
  Top = 302
  Height = 222
  Width = 276
  object DSQMErrores: TDataSource
    DataSet = QMErrores
    Left = 120
    Top = 56
  end
  object QMErrores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ERRORES_FACTURACION'
      'WHERE (ENTRADA = ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_ERRORES_FACTURACION'
    UpdateTransaction = TLocal
    Left = 32
    Top = 56
    object QMErroresENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMErroresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMErroresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMErroresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMErroresSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMErroresTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMErroresRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMErroresTEXTO_ERROR: TFIBStringField
      DisplayLabel = 'Error'
      FieldName = 'TEXTO_ERROR'
      Size = 78
    end
    object QMErroresAGRUPACION: TIntegerField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 8
  end
end
