object DMInformacionComercial: TDMInformacionComercial
  OldCreateOrder = False
  OnDestroy = DMInformacionComercialDestroy
  Left = 434
  Top = 107
  Height = 469
  Width = 425
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 8
  end
  object xEmpClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      
        ' EMPRESA,CLIENTE,RIESGO_AUT,DIA_PAGO_1,DIA_PAGO_2, AGENTE,NOTAS,' +
        'TIPO,'
      ' NRO_EMPLEADOS,FACTURACION_TOTAL,CONSUMO_MATERIAL,'
      ' PROVEEDORES_HABITUALES,RUTA,TIPO_CLIENTE,CLIENTE_POTENCIAL '
      'FROM EMP_CLIENTES'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' CLIENTE = ?CLIENTE')
    UniDirectional = False
    DataSource = DSxConCuentasGesCli
    AfterOpen = xEmpClientesAfterOpen
    BeforeClose = xEmpClientesBeforeClose
    Left = 56
    Top = 56
    object xEmpClientesRIESGO_AUT: TFloatField
      DisplayLabel = 'Riesgo Autorizado'
      FieldName = 'RIESGO_AUT'
    end
    object xEmpClientesDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object xEmpClientesDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object xEmpClientesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xEmpClientesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xEmpClientesTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xEmpClientesNRO_EMPLEADOS: TIntegerField
      DisplayLabel = 'Nro. Empleados'
      FieldName = 'NRO_EMPLEADOS'
    end
    object xEmpClientesFACTURACION_TOTAL: TFloatField
      DisplayLabel = 'Fact. Total'
      FieldName = 'FACTURACION_TOTAL'
    end
    object xEmpClientesCONSUMO_MATERIAL: TFloatField
      DisplayLabel = 'Consumo Mat.'
      FieldName = 'CONSUMO_MATERIAL'
    end
    object xEmpClientesPROVEEDORES_HABITUALES: TFIBStringField
      DisplayLabel = 'Proveedores Habituales'
      FieldName = 'PROVEEDORES_HABITUALES'
      Size = 100
    end
    object xEmpClientesRUTA: TIntegerField
      DisplayLabel = 'Carpeta'
      FieldName = 'RUTA'
    end
    object xEmpClientesTIPO_CLIENTE: TFIBStringField
      DisplayLabel = 'Tipo Cli.'
      FieldName = 'TIPO_CLIENTE'
      Size = 25
    end
    object xEmpClientesCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
    object xEmpClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEmpClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
  end
  object xConCuentasGesCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EMPRESA,EJERCICIO,CANAL,CLIENTE,TERCERO,CUENTA,FORMA_PAGO' +
        ' '
      'FROM CON_CUENTAS_GES_CLI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'CLIENTE = ?CLIENTE')
    UniDirectional = False
    AfterOpen = xConCuentasGesCliAfterOpen
    BeforeClose = xConCuentasGesCliBeforeClose
    Left = 56
    Top = 8
    object xConCuentasGesCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xConCuentasGesCliEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xConCuentasGesCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xConCuentasGesCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xConCuentasGesCliTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xConCuentasGesCliCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xConCuentasGesCliFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
  end
  object xEmpAgrupacionesCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO '
      'FROM VER_AGRUPACIONES_CLI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' CLIENTE = ?CLIENTE'
      'ORDER BY AGRUPACION')
    UniDirectional = False
    DataSource = DSxConCuentasGesCli
    Left = 56
    Top = 104
    object xEmpAgrupacionesCliAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xEmpAgrupacionesCliTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxConCuentasGesCli: TDataSource
    DataSet = xConCuentasGesCli
    Left = 160
    Top = 8
  end
  object DSxEmpClientes: TDataSource
    DataSet = xEmpClientes
    Left = 160
    Top = 56
  end
  object DSxEmpAgrupacionesCli: TDataSource
    DataSet = xEmpAgrupacionesCli
    Left = 160
    Top = 104
  end
  object xVerAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES '
      'WHERE'
      ' EMPRESA = ?EMPRESA AND '
      ' AGENTE = ?AGENTE')
    UniDirectional = False
    DataSource = DSxEmpClientes
    Left = 56
    Top = 152
    object xVerAgenteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxVerAgente: TDataSource
    DataSet = xVerAgente
    Left = 160
    Top = 152
  end
  object DSxSysTerceros: TDataSource
    DataSet = xSysTerceros
    Left = 160
    Top = 200
  end
  object xSysTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_TERCEROS'
      'WHERE'
      ' TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSxConCuentasGesCli
    AfterOpen = xSysTercerosAfterOpen
    BeforeClose = xSysTercerosBeforeClose
    Left = 56
    Top = 200
    object xSysTercerosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xSysTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xSysTercerosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xSysTercerosTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xSysTercerosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xSysTercerosFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xSysTercerosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xSysTercerosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xSysTercerosTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xSysTercerosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xSysTercerosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xSysTercerosWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xSysTercerosCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
  end
  object xSysTercerosContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      ' TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSxSysTerceros
    Left = 56
    Top = 248
    object xSysTercerosContactoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xSysTercerosContactoCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xSysTercerosContactoNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object xSysTercerosContactoAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
    object xSysTercerosContactoMOVIL: TFIBStringField
      DisplayLabel = 'Movil'
      FieldName = 'MOVIL'
    end
    object xSysTercerosContactoTELEFONO: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object xSysTercerosContactoFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object xSysTercerosContactoEXTENSION: TFIBStringField
      DisplayLabel = 'Ext.'
      FieldName = 'EXTENSION'
      Size = 5
    end
    object xSysTercerosContactoCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 100
    end
    object xSysTercerosContactoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxSysTercerosContacto: TDataSource
    DataSet = xSysTercerosContacto
    Left = 160
    Top = 248
  end
  object xSysTercerosBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      ' TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSxSysTerceros
    AfterOpen = xSysTercerosBancoAfterOpen
    BeforeClose = xSysTercerosBancoBeforeClose
    Left = 56
    Top = 296
    object xSysTercerosBancoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xSysTercerosBancoBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xSysTercerosBancoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xSysTercerosBancoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xSysTercerosBancoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xSysTercerosBancoCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xSysTercerosBancoCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      DisplayWidth = 20
      FieldName = 'CUENTA'
    end
    object xSysTercerosBancoACTIVA: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVA'
    end
    object xSysTercerosBancoMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object xSysTercerosBancoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xSysTercerosBancoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xSysTercerosBancoIBAN: TFIBStringField
      FieldName = 'IBAN'
      Size = 34
    end
    object xSysTercerosBancoBIC: TFIBStringField
      FieldName = 'BIC'
      Size = 30
    end
    object xSysTercerosBancoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object xSysTercerosDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_TERCEROS_DIRECCIONES'
      'WHERE'
      ' TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSxSysTerceros
    AfterOpen = xSysTercerosDireccionAfterOpen
    BeforeClose = xSysTercerosDireccionBeforeClose
    Left = 56
    Top = 344
    object xSysTercerosDireccionTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xSysTercerosDireccionDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xSysTercerosDireccionDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xSysTercerosDireccionDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xSysTercerosDireccionDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xSysTercerosDireccionDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xSysTercerosDireccionDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xSysTercerosDireccionDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xSysTercerosDireccionDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xSysTercerosDireccionDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xSysTercerosDireccionDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xSysTercerosDireccionDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
  end
  object DSxSysTerceronsBancos: TDataSource
    DataSet = xSysTercerosBanco
    Left = 160
    Top = 296
  end
  object DSxSysTercerosDireccion: TDataSource
    DataSet = xSysTercerosDireccion
    Left = 160
    Top = 344
  end
  object DSxSysLocalidades: TDataSource
    DataSet = xSysLocalidades
    Left = 160
    Top = 392
  end
  object xSysLocalidades: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_LOCALIDADES'
      'WHERE'
      ' LOCALIDAD = ?DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxSysTercerosDireccion
    Left = 56
    Top = 392
    object xSysLocalidadesLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xSysLocalidadesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xSysLocalidadesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xSysLocalidadesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xSysLocalidadesPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
  end
  object DSxSysBancos: TDataSource
    DataSet = xSysBancos
    Left = 352
    Top = 392
  end
  object xSysBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * '
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    UniDirectional = False
    DataSource = DSxSysTerceronsBancos
    Left = 280
    Top = 392
    object xSysBancosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xSysBancosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
end
