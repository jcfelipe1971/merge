object DMLSTAgente: TDMLSTAgente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 777
  Top = 221
  Height = 543
  Width = 706
  object frAgente: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de albaranes por Agente'
    RebuildPrinter = False
    OnGetValue = frAgenteGetValue
    OnBeforePrint = frAgenteEnterRect
    OnEnterRect = frAgenteEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object frDSQMAcreedor: TfrDBDataSet
    DataSource = DSQMAcreedor
    Left = 260
    Top = 64
  end
  object QMAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGENTES_CUENTAS'
      '  WHERE EMPRESA = ?EMPRESA AND'
      '                 EJERCICIO = ?EJERCICIO AND'
      '                 CANAL = ?CANAL AND'
      '                 AGENTE <= ?MAXIMO AND'
      '                 AGENTE>= ?MINIMO')
    UniDirectional = False
    AfterOpen = QMAgenteAfterOpen
    BeforeClose = QMAgenteBeforeClose
    Left = 40
    Top = 64
    object QMAgenteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgenteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgenteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgenteAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAgenteP_COMISION: TFloatField
      DisplayLabel = 'P. Comision'
      FieldName = 'P_COMISION'
    end
    object QMAgenteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMAgenteNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAgenteCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMAgenteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMAcreedor: TDataSource
    DataSet = QMAgente
    Left = 144
    Top = 65
  end
  object QMTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      '  WHERE TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 122
    object QMTercerosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMTercerosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMTercerosTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object QMTercerosNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object QMTercerosDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object QMTercerosDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMTercerosDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMTercerosDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object QMTercerosDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object QMTercerosDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object QMTercerosDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object QMTercerosDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object QMTercerosFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMTercerosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMTercerosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object QMTercerosTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object QMTercerosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object QMTercerosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMTercerosWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
  end
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 144
    Top = 120
  end
  object frDSQMTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 260
    Top = 120
  end
  object frDSQMJustifica: TfrDBDataSet
    DataSource = DSQMJustifica
    Left = 260
    Top = 452
  end
  object DSQMJustifica: TDataSource
    DataSet = QMJustifica
    Left = 144
    Top = 452
  end
  object QMJustifica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 450
    object QMJustificaDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 172
    end
    object QMJustificaCODPOB: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'CODPOB'
      Size = 50
    end
    object QMJustificaPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMJustificaPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object QMJustificaNUM: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'NUM'
    end
    object QMJustificaCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMJustificaDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMJustificaDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object QMJustificaDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object QMJustificaDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
    object QMJustificaEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMJustificaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object QMFormasdePago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FP'
      '  WHERE EMPRESA=?EMPRESA AND'
      '                EJERCICIO=?EJERCICIO AND '
      '                CANAL=?CANAL AND'
      '                FORMA_PAGO = ?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 234
    object QMFormasdePagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFormasdePagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFormasdePagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFormasdePagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFormasdePagoCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMFormasdePagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMFormasdePagoPLAZOS: TIntegerField
      DisplayLabel = 'Plazos'
      FieldName = 'PLAZOS'
    end
    object QMFormasdePagoDIAS_1_PLAZO: TIntegerField
      DisplayLabel = 'Dia Plazo'
      FieldName = 'DIAS_1_PLAZO'
    end
    object QMFormasdePagoDIAS_E_PLAZOS: TIntegerField
      DisplayLabel = 'Dia e/Plazo'
      FieldName = 'DIAS_E_PLAZOS'
    end
    object QMFormasdePagoTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMFormasdePagoREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMFormasdePagoPRONTO_PAGO: TIntegerField
      DisplayLabel = 'Pronto Pago'
      FieldName = 'PRONTO_PAGO'
    end
    object QMFormasdePagoPAGO_AUTOMATICO: TIntegerField
      DisplayLabel = 'Pago Autom.'
      FieldName = 'PAGO_AUTOMATICO'
    end
  end
  object DSFormasdePago: TDataSource
    DataSet = QMFormasdePago
    Left = 144
    Top = 238
  end
  object frDSQMFormasdePago: TfrDBDataSet
    DataSource = DSFormasdePago
    Left = 260
    Top = 234
  end
  object frDSQMIvaModos: TfrDBDataSet
    DataSource = DSIvaModos
    Left = 260
    Top = 286
  end
  object DSIvaModos: TDataSource
    DataSet = QMIvaModos
    Left = 144
    Top = 290
  end
  object QMIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      '  WHERE MODO = ?MODO_IVA')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 292
    object QMIvaModosMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMIvaModosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMIvaModosIVA: TIntegerField
      DisplayLabel = '% IVA'
      FieldName = 'IVA'
    end
    object QMIvaModosRECARGO: TIntegerField
      DisplayLabel = '% Rec.'
      FieldName = 'RECARGO'
    end
    object QMIvaModosDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object QMIvaModosTIPO_TRANSACCION: TIntegerField
      DisplayLabel = 'Tipo Transac.'
      FieldName = 'TIPO_TRANSACCION'
    end
  end
  object QMIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IRPF'
      '  WHERE TIPO = ?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 338
    object QMIRPFPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMIRPFTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMIRPFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMIRPFP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object QMIRPFBASE: TIntegerField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
  end
  object DSIRPF: TDataSource
    DataSet = QMIRPF
    Left = 144
    Top = 342
  end
  object frDSQMIRPF: TfrDBDataSet
    DataSource = DSIRPF
    Left = 260
    Top = 338
  end
  object frDSQMTipoTerceros: TfrDBDataSet
    DataSource = DSTipoTerceros
    Left = 260
    Top = 390
  end
  object DSTipoTerceros: TDataSource
    DataSet = QMTipoTercero
    Left = 144
    Top = 394
  end
  object QMTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_TERCERO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 390
    object QMTipoTerceroTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipoTerceroTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object QMTipodeProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ACREEDOR'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_ACREEDOR'
      'WHERE TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMAcreedor
    Left = 40
    Top = 182
    object QMTipodeProvTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipodeProvTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMlstTipodeProv: TDataSource
    DataSet = QMTipodeProv
    Left = 144
    Top = 184
  end
  object frQMDSQMlstTipodeProv: TfrDBDataSet
    DataSource = DSQMlstTipodeProv
    Left = 260
    Top = 184
  end
  object QSeleccion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 400
    Top = 10
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 260
    Top = 8
  end
  object xCarga: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM lst_agente_alb(?Empresa,?Ejercicio,?Canal,?Serie,?' +
        'agenteD,?agenteH,?FechaD,?FechaH,?ClienteD,?ClienteH,?Facturados' +
        ')'
      'ORDER BY AGENTE, ARTICULO, CLIENTE')
    UniDirectional = False
    Left = 400
    Top = 66
    object xCargaAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xCargaTITULO_AGENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGENTE'
      Size = 60
    end
    object xCargaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCargaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xCargaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCargaTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xCargaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xCargaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCargaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCargaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCargaUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xCargaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xCargaBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xCargaPIEZAS: TIntegerField
      DisplayLabel = 'Piezas'
      FieldName = 'PIEZAS'
    end
    object xCargaTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xCargaDESC1: TFloatField
      DisplayLabel = 'Descripcion 1'
      FieldName = 'DESC1'
    end
    object xCargaDESC2: TFloatField
      DisplayLabel = 'Descripcion 2'
      FieldName = 'DESC2'
    end
    object xCargaDESC3: TFloatField
      DisplayLabel = 'Descripcion 3'
      FieldName = 'DESC3'
    end
    object xCargaTOTAL_LINEA: TFloatField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object xCargaCANALD: TIntegerField
      DisplayLabel = 'Canal D.'
      FieldName = 'CANALD'
    end
    object xCargaSERIED: TFIBStringField
      DisplayLabel = 'Serie Dest.'
      FieldName = 'SERIED'
      Size = 10
    end
  end
  object DSxCarga: TDataSource
    DataSet = xCarga
    Left = 468
    Top = 67
  end
  object frDBxCarga: TfrDBDataSet
    DataSource = DSxCarga
    Left = 538
    Top = 66
  end
  object xAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO '
      'FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND '
      '              AGENTE=?AGENTE')
    UniDirectional = False
    Left = 402
    Top = 126
    object xAgenteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xAgenteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO '
      'FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND '
      '              AGENTE=?AGENTE')
    UniDirectional = False
    Left = 540
    Top = 125
    object xAgenteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 540
    Top = 176
    object xClienteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxClienteH: TDataSource
    DataSet = xClienteH
    Left = 611
    Top = 176
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 401
    Top = 176
    object xClienteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 467
    Top = 176
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 466
    Top = 126
  end
  object DSxAgenteH: TDataSource
    DataSet = xAgenteH
    Left = 612
    Top = 124
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 408
    Top = 242
  end
  object xSeries: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select distinct serie,titulo from ver_series'
      '  where((empresa=?empresa)and(ejercicio=?ejercicio)) '
      '  order by serie')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 468
    Top = 294
  end
  object xCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select canal,titulo from ver_canales_activos'
      '  where((empresa=?empresa)and(ejercicio=?ejercicio)) '
      '  order by canal')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 402
    Top = 294
  end
  object frxAgente: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxAgenteBeforePrint
    OnGetValue = frxAgenteGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
