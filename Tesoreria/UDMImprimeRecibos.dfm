object DMImprimeRecibos: TDMImprimeRecibos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 177
  Width = 207
  object DSQMRecibos: TDataSource
    DataSet = QMRecibos
    Left = 112
    Top = 24
  end
  object QMRecibos: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_RECIBOS_CARTERA'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_RECIBOS_CARTERA'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SIGNO=?SIGNO'
      'ORDER BY VENCIMIENTO, LIQUIDO')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_RECIBOS_CARTERA'
    Left = 32
    Top = 24
    object QMRecibosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRecibosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRecibosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRecibosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMRecibosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMRecibosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMRecibosCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Pro'
      FieldName = 'COD_CLI_PRO'
    end
    object QMRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMRecibosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMRecibosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMRecibosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMRecibosIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object QMRecibosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMRecibosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMRecibosACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object QMRecibosREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMRecibosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMRecibosREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMRecibosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMRecibosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMRecibosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMRecibosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMRecibosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMRecibosRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object QMRecibosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMRecibosESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMRecibosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMRecibosFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object QMRecibosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMRecibosFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMRecibosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMRecibosID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMRecibosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMRecibosID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMRecibosID_REMESAS: TIntegerField
      DisplayLabel = 'Id Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMRecibosLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMRecibosTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Trib.'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMRecibosFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMRecibosNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Num Factura Prov'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMRecibosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Canal'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMRecibosFP_TITULO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FP_TITULO'
      Size = 40
    end
    object QMRecibosMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Moneda Canal'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMRecibosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 60
    end
    object QMRecibosOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
    object QMRecibosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
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
    Top = 76
  end
end
