object DMImprimeFacturas: TDMImprimeFacturas
  OldCreateOrder = False
  OnCreate = DMImprimeFacturasCreate
  Left = 607
  Top = 371
  Height = 242
  Width = 350
  object DSQMFacturas: TDataSource
    DataSet = QMFacturas
    Left = 112
    Top = 24
  end
  object QMFacturas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?ID_S ')
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
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    OnCalcFields = QMFacturasCalcFields
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_FACTURA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
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
    object QMFacturasEMAIL: TStringField
      DisplayLabel = 'Correo Electr'#243'nico'
      FieldKind = fkCalculated
      FieldName = 'EMAIL'
      Size = 100
      Calculated = True
    end
    object QMFacturasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMFacturasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMFacturasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMFacturasFECHA_ENTREGA_REPARTO: TDateTimeField
      DisplayLabel = 'Fec. Entrega Reparto'
      FieldName = 'FECHA_ENTREGA_REPARTO'
    end
    object QMFacturasZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMFacturasTITULO_ESTADO: TStringField
      DisplayLabel = 'Desc. Estado'
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = QMFacturasTITULO_ESTADOGetText
      Size = 40
      Calculated = True
    end
    object QMFacturasFECHA_CON: TDateTimeField
      DisplayLabel = 'Fec. Contabilizacion'
      FieldName = 'FECHA_CON'
    end
    object QMFacturasPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMFacturasFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMFacturasTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Trib.'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMFacturasID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMFacturasNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
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
    Left = 208
    Top = 24
  end
end
