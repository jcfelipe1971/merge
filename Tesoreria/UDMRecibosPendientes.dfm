object DMRecibosPendientes: TDMRecibosPendientes
  OldCreateOrder = False
  OnCreate = DmRecibosPendientesCreate
  Left = 451
  Top = 198
  Height = 293
  Width = 538
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 320
    Top = 8
  end
  object DSxListarRemesa: TDataSource
    DataSet = xListarRemesa
    Left = 184
    Top = 8
  end
  object xListarRemesa: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_LISTA_CARTERA '
      'WHERE '
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO <= ?EJERCICIO AND /*dji lrk kri*/'
      '  CANAL = ?CANAL AND'
      '  SIGNO = ?SIGNO AND'
      '  CUENTA = ?DCUENTA AND '
      '  PAGADO <= ?PAGADO AND'
      '  (DOC_TIPO = ?DOC_TIPO OR'
      '   DOC_TIPO = ?DOC_TIPO2 OR'
      '   DOC_TIPO = ?DOC_TIPO3)'
      'ORDER BY VENCIMIENTO desc /*dji lrk kri*/ ,DOC_FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LISTA_CARTERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 8
    object xListarRemesaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xListarRemesaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xListarRemesaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xListarRemesaSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xListarRemesaREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xListarRemesaFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xListarRemesaCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xListarRemesaTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
    object xListarRemesaDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xListarRemesaDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xListarRemesaDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fec. Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xListarRemesaDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xListarRemesaVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xListarRemesaLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xListarRemesaRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xListarRemesaPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xListarRemesaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xListarRemesaLIQUIDO_MONEDA: TFloatField
      DisplayLabel = 'L'#237'quido Mon.'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_MONEDA'
      OnGetText = xListarRemesanuevo_liquidoGetText
      Calculated = True
    end
  end
  object xRevImpagados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'select * '
      'from g_cartera_calcula_imp_cuentas'
      '(?EMP,  ?CAN, ?CUENTA)')
    UniDirectional = False
    Left = 64
    Top = 56
    object xRevImpagadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRevImpagadosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRevImpagadosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRevImpagadosFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xRevImpagadosEJERCICIO_ORIGEN: TIntegerField
      DisplayLabel = 'Ejer. Orig.'
      FieldName = 'EJERCICIO_ORIGEN'
    end
    object xRevImpagadosCANAL_ORIGEN: TIntegerField
      DisplayLabel = 'Canal Orig.'
      FieldName = 'CANAL_ORIGEN'
    end
    object xRevImpagadosRECIBO_ORIGEN: TIntegerField
      DisplayLabel = 'Recibo Orig.'
      FieldName = 'RECIBO_ORIGEN'
    end
    object xRevImpagadosFECHA_ULT_IMPAGO: TDateTimeField
      DisplayLabel = 'Fec. Ult. Impagado'
      FieldName = 'FECHA_ULT_IMPAGO'
    end
    object xRevImpagadosNUM_IMPAGOS: TIntegerField
      DisplayLabel = 'N'#250'm. Impag.'
      FieldName = 'NUM_IMPAGOS'
    end
    object xRevImpagadosGASTOS: TFloatField
      DisplayLabel = 'Gastos'
      FieldName = 'GASTOS'
    end
  end
  object DSxRevImpagados: TDataSource
    DataSet = xRevImpagados
    Left = 184
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 440
    Top = 8
  end
  object DSxListarRemesaTotales: TDataSource
    DataSet = xListarRemesaTotales
    Left = 184
    Top = 104
  end
  object xListarRemesaTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT SUM(LIQUIDO) AS LIQUIDO FROM VER_LISTA_CARTERA '
      'WHERE '
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO <= ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SIGNO = ?SIGNO AND'
      '  CUENTA = ?DCUENTA AND '
      '  PAGADO <= ?PAGADO AND'
      '  (DOC_TIPO = ?DOC_TIPO OR'
      '   DOC_TIPO = ?DOC_TIPO2 OR'
      '   DOC_TIPO = ?DOC_TIPO3)')
    SelectSQL.Strings = (
      'SELECT SUM(LIQUIDO) AS LIQUIDO FROM VER_LISTA_CARTERA '
      'WHERE '
      '  EMPRESA = ?EMPRESA AND'
      '  EJERCICIO <= ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SIGNO = ?SIGNO AND'
      '  CUENTA = ?DCUENTA AND '
      '  PAGADO <= ?PAGADO AND'
      '  (DOC_TIPO = ?DOC_TIPO OR'
      '   DOC_TIPO = ?DOC_TIPO2 OR'
      '   DOC_TIPO = ?DOC_TIPO3)')
    UniDirectional = False
    Left = 64
    Top = 104
    object xListarRemesaTotalesLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
  end
end
