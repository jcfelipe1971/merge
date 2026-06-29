object DMLSTProveedor: TDMLSTProveedor
  OldCreateOrder = False
  OnCreate = DMLSTProveedorCreate
  OnDestroy = DMLSTProveedorDestroy
  Left = 582
  Top = 169
  Height = 697
  Width = 765
  object frProveedor: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Prov. C.Postal (Cuentas)'
    RebuildPrinter = False
    OnGetValue = frProveedorGetValue
    OnBeforePrint = frProveedorEnterRect
    OnEnterRect = frProveedorEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 47
    Top = 16
    ReportForm = {19000000}
  end
  object frDSQMProveedor: TfrDBDataSet
    DataSource = DSQMProveedor
    Left = 268
    Top = 64
  end
  object QMProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES_CUENTAS'
      ' WHERE EMPRESA = ?EMPRESA AND'
      '                EJERCICIO = ?EJERCICIO AND'
      '                CANAL = ?CANAL AND'
      '                PROVEEDOR <= ?MAXIMO AND'
      '                PROVEEDOR >= ?MINIMO')
    UniDirectional = False
    AfterOpen = QMProveedorAfterOpen
    Left = 48
    Top = 64
    object QMProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProveedorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProveedorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProveedorPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProveedorTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMProveedorDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMProveedorFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMProveedorDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMProveedorDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMProveedorDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMProveedorNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMProveedorMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMProveedorCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMProveedorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProveedorTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object QMProveedorPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMProveedorTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMProveedorPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMProveedorNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProveedorMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMProveedorUSAR_ANTICIPOS: TIntegerField
      DisplayLabel = 'Usar Antic.'
      FieldName = 'USAR_ANTICIPOS'
    end
    object QMProveedorEVAL_FEB: TIntegerField
      DisplayLabel = 'Eval. Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMProveedorEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval. Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMProveedorISO9000: TIntegerField
      DisplayLabel = 'ISO 9000'
      FieldName = 'ISO9000'
    end
    object QMProveedorFECHA_ISO9000: TDateTimeField
      DisplayLabel = 'Fec. ISO9000'
      FieldName = 'FECHA_ISO9000'
    end
  end
  object DSQMProveedor: TDataSource
    DataSet = QMProveedor
    Left = 168
    Top = 64
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
    DataSource = DSQMProveedor
    Left = 48
    Top = 120
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
      DisplayLabel = 'N.I.F.'
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
    Left = 168
    Top = 118
  end
  object frDSQMTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 268
    Top = 118
  end
  object frDSQMJustifica: TfrDBDataSet
    DataSource = DSQMJustifica
    Left = 268
    Top = 182
  end
  object DSQMJustifica: TDataSource
    DataSet = QMJustifica
    Left = 168
    Top = 182
  end
  object QMJustifica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)')
    UniDirectional = False
    DataSource = DSQMProveedor
    Left = 48
    Top = 182
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
      '                 EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL AND'
      '                 FORMA_PAGO = ?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMProveedor
    Left = 48
    Top = 236
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
    Left = 168
    Top = 240
  end
  object frDSQMFormasdePago: TfrDBDataSet
    DataSource = DSFormasdePago
    Left = 268
    Top = 236
  end
  object frDSQMIvaModos: TfrDBDataSet
    DataSource = DSIvaModos
    Left = 268
    Top = 288
  end
  object DSIvaModos: TDataSource
    DataSet = QMIvaModos
    Left = 168
    Top = 292
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
    DataSource = DSQMProveedor
    Left = 48
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
    DataSource = DSQMProveedor
    Left = 48
    Top = 342
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
    Left = 168
    Top = 344
  end
  object frDSQMIRPF: TfrDBDataSet
    DataSource = DSIRPF
    Left = 268
    Top = 340
  end
  object frDSQMTipoTerceros: TfrDBDataSet
    DataSource = DSTipoTerceros
    Left = 268
    Top = 392
  end
  object DSTipoTerceros: TDataSource
    DataSet = QMTipoTercero
    Left = 168
    Top = 396
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
    DataSource = DSQMProveedor
    Left = 48
    Top = 392
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
  object QSeleccion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 386
    Top = 286
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 268
    Top = 14
  end
  object xEtiquetas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM C_CREA_ETIQUETAS_CLI_PROV(?TERCERO,?DIRECCION,?VAC' +
        'IAS,?COPIAS)')
    UniDirectional = False
    Left = 48
    Top = 446
    object xEtiquetasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xEtiquetasDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 172
    end
    object xEtiquetasCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xEtiquetasPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object xEtiquetasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xEtiquetasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object DSxEtiquetas: TDataSource
    DataSet = xEtiquetas
    Left = 168
    Top = 444
  end
  object frDBxEtiquetas: TfrDBDataSet
    DataSource = DSxEtiquetas
    Left = 268
    Top = 444
  end
  object frDBProvCP: TfrDBDataSet
    DataSource = DSQMProvCP
    Left = 268
    Top = 498
  end
  object QMProvCP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES_CPOSTAL'
      'WHERE ((EMPRESA=?EMPRESA) AND'
      '              (EJERCICIO=?EJERCICIO) AND'
      '              (CANAL=?CANAL) AND'
      '              (COD_POSTAL>=?CP_MIN) AND'
      '              (COD_POSTAL<=?CP_MAX))')
    UniDirectional = False
    Left = 50
    Top = 504
    object QMProvCPEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProvCPEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProvCPCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProvCPPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProvCPCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMProvCPNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMProvCPNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMProvCPTELEFONO: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object QMProvCPDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 40
    end
    object QMProvCPCOD_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'COD_POSTAL'
      Size = 10
    end
    object QMProvCPLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMProvCPPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
  end
  object DSQMProvCP: TDataSource
    DataSet = QMProvCP
    Left = 168
    Top = 499
  end
  object QMCPDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_LOCALIDADES'
      'WHERE'
      '  LOCALIDAD=?LOCALIDAD ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_LOCALIDADES'
      'WHERE CODIGO_POSTAL=?CP')
    UniDirectional = False
    Left = 388
    Top = 64
  end
  object DSQMCPDesde: TDataSource
    DataSet = QMCPDesde
    Left = 472
    Top = 67
  end
  object QMCPHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_LOCALIDADES'
      'WHERE'
      '  LOCALIDAD=?LOCALIDAD ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_LOCALIDADES'
      'WHERE CODIGO_POSTAL=?CP')
    UniDirectional = False
    Left = 388
    Top = 136
  end
  object DSQMCPHasta: TDataSource
    DataSet = QMCPHasta
    Left = 468
    Top = 131
  end
  object QMinCPostal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(CODIGO_POSTAL) AS MINIMO'
      'FROM SYS_LOCALIDADES')
    Transaction = TLocal
    AutoTrans = True
    Left = 388
    Top = 227
  end
  object QMaxCPostal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(CODIGO_POSTAL) AS MAXIMO'
      'FROM SYS_LOCALIDADES')
    Transaction = TLocal
    AutoTrans = True
    Left = 468
    Top = 227
  end
  object xFacturasMensual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 565
    Top = 16
  end
  object DSxFacturasMensual: TDataSource
    DataSet = xFacturasMensual
    Left = 653
    Top = 16
  end
  object xFacturasMensualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 74
  end
  object DSxFacturasMensualCompara: TDataSource
    DataSet = xFacturasMensualCompara
    Left = 653
    Top = 73
  end
  object DSxFacturasAnual: TDataSource
    DataSet = xFacturasAnual
    Left = 653
    Top = 133
  end
  object xFacturasAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 132
  end
  object xFacturasAnualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 191
  end
  object DSxFacturasAnualCompara: TDataSource
    DataSet = xFacturasAnualCompara
    Left = 653
    Top = 190
  end
  object DSxPrevisionMensual: TDataSource
    DataSet = xPrevisionMensual
    Left = 653
    Top = 251
  end
  object xPrevisionMensual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_prov'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?PO' +
        'RCENTAJE_VENTAS,  ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 249
  end
  object xPrevisionAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_prov'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?PO' +
        'RCENTAJE_VENTAS,  ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 308
  end
  object DSxPrevisionAnual: TDataSource
    DataSet = xPrevisionAnual
    Left = 653
    Top = 309
  end
  object DSxFacturasAnualC_1: TDataSource
    DataSet = xFacturasAnualC_1
    Left = 653
    Top = 368
  end
  object xFacturasAnualC_1: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 368
  end
  object xFacturasAnualC_2: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 427
  end
  object DSxFacturasAnualC_2: TDataSource
    DataSet = xFacturasAnualC_2
    Left = 653
    Top = 427
  end
  object DSxFacturasAnualC_3: TDataSource
    DataSet = xFacturasAnualC_3
    Left = 653
    Top = 485
  end
  object xFacturasAnualC_3: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 565
    Top = 485
  end
  object xTituloProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select proveedor, titulo from ver_proveedores '
      'where proveedor=?proveedor')
    UniDirectional = False
    Left = 560
    Top = 544
  end
  object frxProveedor: TfrxHYReport
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
    OnBeforePrint = frxProveedorBeforePrint
    OnGetValue = frxProveedorGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 168
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xMinAgrup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(agrupacion) as Agrupacion FROM VER_AGRUPACIONES'
      'where tipo='#39'P'#39)
    UniDirectional = False
    Left = 388
    Top = 349
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACIONES'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    DataSource = DSQMProveedor
    Left = 464
    Top = 285
    object xAgrupacionAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xAgrupacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xAgrupacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 468
    Top = 349
  end
  object QAgrupaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_AGRUPACIONES_CLI'
      'WHERE'
      '  AGRUPACION=?AGRUPACION AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT DISTINCT agrupacion, titulo FROM emp_agrupaciones_prov e'
      'join sys_agrupaciones s'
      'on (e.agrupacion=s.agrupacion)'
      'WHERE'
      '  ((e.empresa=?empresa) and'
      '   (s.tipo=?tipo) and'
      '   (s.Agrupacion=?agrupacion))')
    UniDirectional = False
    AfterOpen = QAgrupacionesAfterOpen
    BeforeClose = QAgrupacionesBeforeClose
    Left = 346
    Top = 421
    object QAgrupacionesAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QAgrupacionesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQAgrupaciones: TDataSource
    DataSet = QAgrupaciones
    Left = 412
    Top = 405
  end
  object DSProvAgrup: TDataSource
    DataSet = QProvAgrup
    Left = 460
    Top = 480
  end
  object QProvAgrup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ver_proveedores v'
      'JOIN emp_agrupaciones_prov e'
      'ON ((v.empresa=e.empresa and v.proveedor=e.proveedor))'
      'WHERE'
      '  ((e.empresa=?empresa) and'
      '   (v.ejercicio=?ejercicio) and '
      '   (v.canal=?canal) and'
      '   (e.agrupacion=?agrupacion))')
    UniDirectional = False
    DataSource = DSQAgrupaciones
    AfterOpen = QProvAgrupAfterOpen
    BeforeClose = QProvAgrupBeforeClose
    Left = 376
    Top = 480
    object QProvAgrupEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QProvAgrupEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QProvAgrupCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QProvAgrupPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QProvAgrupTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QProvAgrupTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QProvAgrupNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QProvAgrupDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QProvAgrupFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QProvAgrupDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QProvAgrupDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QProvAgrupDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QProvAgrupNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QProvAgrupMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QProvAgrupMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QProvAgrupPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QProvAgrupEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object QProvAgrupAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QProvAgrupPROVEEDOR1: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR1'
    end
  end
  object frDSQAgrupaciones: TfrDBDataSet
    DataSource = DSQAgrupaciones
    Left = 476
    Top = 429
  end
  object frDSProvAgrup: TfrDBDataSet
    DataSource = DSProvAgrup
    Left = 460
    Top = 540
  end
  object xTerceroAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      '  WHERE TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSProvAgrup
    Left = 47
    Top = 568
    object xTerceroAgrupacionTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTerceroAgrupacionNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTerceroAgrupacionNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTerceroAgrupacionTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xTerceroAgrupacionNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xTerceroAgrupacionDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xTerceroAgrupacionDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroAgrupacionDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xTerceroAgrupacionDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xTerceroAgrupacionDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xTerceroAgrupacionDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xTerceroAgrupacionDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xTerceroAgrupacionDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xTerceroAgrupacionFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xTerceroAgrupacionNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xTerceroAgrupacionTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xTerceroAgrupacionTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xTerceroAgrupacionTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xTerceroAgrupacionEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xTerceroAgrupacionWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
  end
  object DSxTerceroagrupacon: TDataSource
    DataSet = xTerceroAgrupacion
    Left = 155
    Top = 568
  end
  object frDBxTerceroAgrupacion: TfrDBDataSet
    DataSource = DSxTerceroagrupacon
    Left = 270
    Top = 592
  end
end
