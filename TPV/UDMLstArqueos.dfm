object DMLstArqueos: TDMLstArqueos
  OldCreateOrder = False
  OnCreate = DMLstArqueosCreate
  OnDestroy = DMLstArqueosDestroy
  Left = 218
  Top = 157
  Height = 653
  Width = 1053
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 312
    Top = 8
  end
  object frArqueos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frArqueosGetValue
    OnBeforePrint = frArqueosEnterRect
    OnEnterRect = frArqueosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 24
    Top = 8
    ReportForm = {19000000}
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 610
    ValorGrupo = 99
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 22
    Opciones.Pagina.Ancho = 40
    Opciones.Pagina.Tamanyo = 22
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Listado de Arqueos por Turno Matricial'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    Left = 104
    Top = 8
  end
  object xCabSesion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 24
    Top = 56
    object xCabSesionEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xCabSesionEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xCabSesionCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xCabSesionSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xCabSesionSESION: TIntegerField
      FieldName = 'SESION'
    end
    object xCabSesionABIERTA: TIntegerField
      FieldName = 'ABIERTA'
    end
    object xCabSesionI_IVA: TFloatField
      FieldName = 'I_IVA'
    end
    object xCabSesionB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object xCabSesionTOTAL_SESION: TFloatField
      FieldName = 'TOTAL_SESION'
    end
    object xCabSesionFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
    end
    object xCabSesionFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object xCabSesionUSUARIO_ABRE: TIntegerField
      FieldName = 'USUARIO_ABRE'
    end
    object xCabSesionUSUARIO_CIERRA: TIntegerField
      FieldName = 'USUARIO_CIERRA'
    end
  end
  object QFormaPago: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND'
      '  FORMA_PAGO=?FORMA_PAGO')
    Transaction = TLocal
    AutoTrans = True
    Left = 552
    Top = 344
  end
  object QSaldoInicial: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 632
    Top = 344
  end
  object xCabCaja: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_SESIONES_CAJAS '
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND SERIE =?SERIE AND SESION=?SESION AND '
      '  CAJA=?CAJA')
    UniDirectional = False
    Left = 24
    Top = 104
    object xCabCajaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xCabCajaEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xCabCajaCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xCabCajaSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xCabCajaSESION: TIntegerField
      FieldName = 'SESION'
    end
    object xCabCajaCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xCabCajaABIERTA: TIntegerField
      FieldName = 'ABIERTA'
    end
    object xCabCajaI_IVA: TFloatField
      FieldName = 'I_IVA'
    end
    object xCabCajaB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object xCabCajaTOTAL_SESION: TFloatField
      FieldName = 'TOTAL_SESION'
    end
    object xCabCajaFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
    end
    object xCabCajaFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object xCabCajaUSUARIO_ABRE: TIntegerField
      FieldName = 'USUARIO_ABRE'
    end
    object xCabCajaUSUARIO_CIERRA: TIntegerField
      FieldName = 'USUARIO_CIERRA'
    end
  end
  object xCabTurno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_SESIONES_CAJAS_TURNO '
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND SERIE =?SERIE AND SESION=?SESION AND '
      '  CAJA=?CAJA AND TURNO=?TURNO')
    UniDirectional = False
    Left = 24
    Top = 152
    object xCabTurnoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xCabTurnoEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xCabTurnoCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xCabTurnoSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xCabTurnoSESION: TIntegerField
      FieldName = 'SESION'
    end
    object xCabTurnoCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xCabTurnoTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object xCabTurnoABIERTO: TIntegerField
      FieldName = 'ABIERTO'
    end
    object xCabTurnoI_IVA: TFloatField
      FieldName = 'I_IVA'
    end
    object xCabTurnoB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object xCabTurnoTOTAL_TURNO: TFloatField
      FieldName = 'TOTAL_TURNO'
    end
    object xCabTurnoFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
    end
    object xCabTurnoFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object xCabTurnoUSUARIO_ABRE: TIntegerField
      FieldName = 'USUARIO_ABRE'
    end
    object xCabTurnoUSUARIO_CIERRA: TIntegerField
      FieldName = 'USUARIO_CIERRA'
    end
    object xCabTurnoCAMBIO_ENTREGADO: TFloatField
      FieldName = 'CAMBIO_ENTREGADO'
    end
    object xCabTurnoDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
    object xCabTurnoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object DSxCabecera: TDataSource
    DataSet = xCabTurno
    Left = 104
    Top = 152
  end
  object xDetalleSesion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    DataSource = DSxCabSesion
    Left = 552
    Top = 56
    object xDetalleSesionEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xDetalleSesionEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xDetalleSesionCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xDetalleSesionSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetalleSesionFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDetalleSesionTOTAL_COBRADO: TFloatField
      FieldName = 'TOTAL_COBRADO'
    end
  end
  object xDetalleCaja: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_SESIONES_CAJAS_FP '
      '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND SERIE=?SERIE AND SESION=?SESION AND '
      '  CAJA=?CAJA')
    UniDirectional = False
    Left = 552
    Top = 104
    object xDetalleCajaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xDetalleCajaEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xDetalleCajaCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xDetalleCajaSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetalleCajaCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xDetalleCajaFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDetalleCajaTOTAL_COBRADO: TFloatField
      FieldName = 'TOTAL_COBRADO'
    end
  end
  object xDetalleTurno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_SESIONES_CAJAS_TURNO_FP '
      '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND SERIE=?SERIE AND SESION=?SESION AND '
      '  CAJA=?CAJA AND TURNO=?TURNO')
    UniDirectional = False
    Left = 552
    Top = 152
    object xDetalleTurnoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xDetalleTurnoEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xDetalleTurnoCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xDetalleTurnoSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetalleTurnoCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xDetalleTurnoTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object xDetalleTurnoFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDetalleTurnoTOTAL_COBRADO: TFloatField
      FieldName = 'TOTAL_COBRADO'
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalleTurno
    Left = 648
    Top = 152
  end
  object HYRSxCabSesion: THYReportSource
    DataSet = xCabSesion
    CloseDataset = True
    Left = 312
    Top = 56
  end
  object HYRSxCabCaja: THYReportSource
    DataSet = xCabCaja
    CloseDataset = True
    Left = 312
    Top = 104
  end
  object frDBxCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCabecera
    Left = 200
    Top = 152
  end
  object HYRSxCabecera: THYReportSource
    DataSet = xCabTurno
    CloseDataset = True
    Left = 312
    Top = 152
  end
  object HYRSxDetSesion: THYReportSource
    DataSet = xDetalleSesion
    CloseDataset = True
    Left = 848
    Top = 56
  end
  object HYRSxDetCaja: THYReportSource
    DataSet = xDetalleCaja
    CloseDataset = True
    Left = 848
    Top = 104
  end
  object frDBxDetalle: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDetalle
    Left = 744
    Top = 152
  end
  object HYRSDetalle: THYReportSource
    DataSet = xDetalleTurno
    CloseDataset = True
    Left = 848
    Top = 152
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select moneda,sum(liquido) as liquido, sum(liquido_canal) as liq' +
        'uido_canal'
      
        'from tpv_ticket_turnos_monedas(?empresa,?ejercicio,?canal,?serie' +
        ','
      '        ?sesion,?caja,?turno)'
      'group by moneda')
    UniDirectional = False
    Left = 24
    Top = 200
    object xMonedasMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedasLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xMonedasLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
  end
  object xCreditos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * '
      
        'from tpv_ticket_creditos_clientes(?empresa,?ejercicio,?canal,?se' +
        'rie,'
      '        ?sesion,?caja,?turno)')
    UniDirectional = False
    Left = 24
    Top = 248
    object xCreditosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xCreditosNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xCreditosLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
  end
  object DSxCreditos: TDataSource
    DataSet = xCreditos
    Left = 104
    Top = 248
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 104
    Top = 200
  end
  object frDBxMonedas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxMonedas
    Left = 200
    Top = 200
  end
  object HYRSxCreditos: THYReportSource
    DataSet = xCreditos
    CloseDataset = True
    Left = 312
    Top = 248
  end
  object HYRSxMonedas: THYReportSource
    DataSet = xMonedas
    CloseDataset = True
    Left = 312
    Top = 200
  end
  object frDBDSxCreditos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCreditos
    Left = 200
    Top = 248
  end
  object xCobros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * '
      
        'from tpv_ticket_cobros_clientes(?empresa,?ejercicio,?canal,?seri' +
        'e,'
      '        ?sesion,?caja,?turno)')
    UniDirectional = False
    Left = 24
    Top = 296
    object xCobrosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xCobrosNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xCobrosLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
  end
  object DSxCobros: TDataSource
    DataSet = xCobros
    Left = 104
    Top = 296
  end
  object frDBDSxCobros: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCobros
    Left = 200
    Top = 296
  end
  object HYRSxCobros: THYReportSource
    DataSet = xCobros
    CloseDataset = True
    Left = 312
    Top = 296
  end
  object xGastos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select *'
      'from ges_ticket_cabecera'
      'where tipo='#39'TAC'#39' and'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE ')
    UniDirectional = False
    DataSource = DSxCabecera
    Left = 24
    Top = 344
    object xGastosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xGastosEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xGastosCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xGastosSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xGastosTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xGastosRIT: TIntegerField
      FieldName = 'RIT'
    end
    object xGastosRVT: TIntegerField
      FieldName = 'RVT'
    end
    object xGastosSESION: TIntegerField
      FieldName = 'SESION'
    end
    object xGastosCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xGastosTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object xGastosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object xGastosALMACEN: TFIBStringField
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xGastosMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object xGastosFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object xGastosDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xGastosFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xGastosNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object xGastosTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xGastosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xGastosESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xGastosMODO_IVA: TIntegerField
      FieldName = 'MODO_IVA'
    end
    object xGastosENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xGastosBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object xGastosI_DTO_LINEAS: TFloatField
      FieldName = 'I_DTO_LINEAS'
    end
    object xGastosS_CUOTA_IVA: TFloatField
      FieldName = 'S_CUOTA_IVA'
    end
    object xGastosS_CUOTA_RE: TFloatField
      FieldName = 'S_CUOTA_RE'
    end
    object xGastosDTO_CIAL: TFloatField
      FieldName = 'DTO_CIAL'
    end
    object xGastosI_DTO_CIAL: TFloatField
      FieldName = 'I_DTO_CIAL'
    end
    object xGastosDTO_PP: TFloatField
      FieldName = 'DTO_PP'
    end
    object xGastosI_DTO_PP: TFloatField
      FieldName = 'I_DTO_PP'
    end
    object xGastosS_BASES: TFloatField
      FieldName = 'S_BASES'
    end
    object xGastosLINEAS: TIntegerField
      FieldName = 'LINEAS'
    end
    object xGastosLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xGastosB_DTO_LINEAS: TFloatField
      FieldName = 'B_DTO_LINEAS'
    end
    object xGastosCONTROL_STOCK: TIntegerField
      FieldName = 'CONTROL_STOCK'
    end
    object xGastosA_DEVOLVER: TFloatField
      FieldName = 'A_DEVOLVER'
    end
    object xGastosENTRADA_FAC: TIntegerField
      FieldName = 'ENTRADA_FAC'
    end
    object xGastosDEVOLUCION: TIntegerField
      FieldName = 'DEVOLUCION'
    end
    object xGastosTARIFA: TFIBStringField
      FieldName = 'TARIFA'
      Size = 3
    end
    object xGastosS_CUOTA_IVA_CANAL: TFloatField
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object xGastosS_CUOTA_RE_CANAL: TFloatField
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object xGastosS_BASES_CANAL: TFloatField
      FieldName = 'S_BASES_CANAL'
    end
    object xGastosCHG_MONEDA: TIntegerField
      FieldName = 'CHG_MONEDA'
    end
    object xGastosA_DEVOLVER_CANAL: TFloatField
      FieldName = 'A_DEVOLVER_CANAL'
    end
    object xGastosLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
    object xGastosACREEDOR: TIntegerField
      FieldName = 'ACREEDOR'
    end
    object xGastosTIPO_GASTO: TIntegerField
      FieldName = 'TIPO_GASTO'
    end
    object xGastosTIPO_RELACION: TFIBStringField
      FieldName = 'TIPO_RELACION'
      Size = 3
    end
    object xGastosCANAL_A_FACTURAR: TIntegerField
      FieldName = 'CANAL_A_FACTURAR'
    end
    object xGastosAGENTE: TIntegerField
      FieldName = 'AGENTE'
    end
    object xGastosFACTURACION: TIntegerField
      FieldName = 'FACTURACION'
    end
    object xGastosID_TICKET: TIntegerField
      FieldName = 'ID_TICKET'
    end
    object xGastosID_TICKET_DEVOLUCION: TIntegerField
      FieldName = 'ID_TICKET_DEVOLUCION'
    end
  end
  object HYRSxGastos: THYReportSource
    DataSet = xGastos
    CloseDataset = True
    Left = 312
    Top = 344
  end
  object frDBDSxGastos: TfrDBDataSet
    DataSource = DSxGastos
    Left = 200
    Top = 344
  end
  object DSxGastos: TDataSource
    DataSet = xGastos
    Left = 104
    Top = 344
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from tpv_ticket_fp_bancos(?empresa,?ejercicio,?canal,?serie,'
      '        ?sesion,?caja,?turno)')
    UniDirectional = False
    Left = 24
    Top = 392
    object xBancosFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xBancosTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
    object xBancosLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 104
    Top = 392
  end
  object frDBDSxBancos: TfrDBDataSet
    DataSource = DSxBancos
    Left = 200
    Top = 392
  end
  object HYRSxBancos: THYReportSource
    DataSet = xBancos
    CloseDataset = True
    Left = 312
    Top = 392
  end
  object QTotalVenta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from tpv_ticket_total_venta(?empresa,?ejercicio,?canal,?serie,'
      '        ?sesion,?caja,?turno)')
    Transaction = TLocal
    AutoTrans = True
    Left = 552
    Top = 296
  end
  object xContado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from tpv_ticket_fp_contado(?empresa,?ejercicio,?canal,?serie,'
      '        ?sesion,?caja,?turno)')
    UniDirectional = False
    Left = 24
    Top = 440
    object xContadoFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xContadoTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
    object xContadoLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
  end
  object DSxContado: TDataSource
    DataSet = xContado
    Left = 104
    Top = 440
  end
  object frDBDSxContado: TfrDBDataSet
    DataSource = DSxContado
    Left = 200
    Top = 440
  end
  object HYRSxContado: THYReportSource
    DataSet = xContado
    CloseDataset = True
    Left = 312
    Top = 440
  end
  object DSxCabSesion: TDataSource
    DataSet = xCabSesion
    Left = 104
    Top = 56
  end
  object frDBDSxCabSesion: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCabSesion
    Left = 200
    Top = 56
  end
  object DSxCabCaja: TDataSource
    DataSet = xCabCaja
    Left = 104
    Top = 104
  end
  object frDBDSxCabCaja: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCabCaja
    Left = 200
    Top = 104
  end
  object DSxDetalleSesion: TDataSource
    DataSet = xDetalleSesion
    Left = 648
    Top = 56
  end
  object frDSxDetalleSesion: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDetalleSesion
    Left = 744
    Top = 56
  end
  object DSxDetalleCaja: TDataSource
    DataSet = xDetalleCaja
    Left = 648
    Top = 104
  end
  object frDSxDetalleCaja: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDetalleCaja
    Left = 744
    Top = 104
  end
  object QEntregas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from tpv_ticket_total_venta(?empresa,?ejercicio,?canal,?serie,'
      '        ?sesion,?caja,?turno)')
    Transaction = TLocal
    AutoTrans = True
    Left = 632
    Top = 392
  end
  object QVales: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from tpv_ticket_total_venta(?empresa,?ejercicio,?canal,?serie,'
      '        ?sesion,?caja,?turno)')
    Transaction = TLocal
    AutoTrans = True
    Left = 552
    Top = 392
  end
  object frxArqueos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38832.6717250694
    ReportOptions.LastChange = 38832.6751224306
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure DatosSubdetalle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with DatosSubdetalle1, Engine do'
      '  begin'
      
        '  if ([QMDetalle."DESCUENTO"]>0) then visible:=True else visible' +
        ':=False;'
      '  end'
      'end;'
      ''
      'procedure Hija1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Hija1, Engine do'
      '  begin'
      '  visible:=([xAbonos."ID_DOCUMENTO_DEVOLUCION"]>0);'
      '  end'
      'end;'
      ''
      'procedure Memo31OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo31, Engine do'
      '  begin'
      
        'if ([QMDetalle."DESCUENTO"]>0) then visible:=True else visible:=' +
        'false;'
      '  end'
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo21, Engine do'
      '  begin'
      
        '  if ([xEnVales."EN_VALES"]<>0) then visible:=true else visible:' +
        '=false;'
      '  end'
      'end;'
      ''
      'procedure Memo22OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo22, Engine do'
      '  begin'
      
        '  if ([xEnEntregas."EN_ENTREGAS"]<>0) then visible:=true else vi' +
        'sible:=false;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxArqueosBeforePrint
    OnGetValue = frArqueosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 200
    Top = 8
    Datasets = <
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Variables = <
      item
        Name = ' Cabecera'
        Value = ''
      end
      item
        Name = 'Empresa'
        Value = 'xCli."TITULO"'
      end
      item
        Name = 'CIF'
        Value = ''
      end
      item
        Name = 'FechaYHora'
        Value = 'frxDBCabecera."FECHA"'
      end
      item
        Name = 'Cliente'
        Value = 'frxDBCabecera."CLIENTE"'
      end
      item
        Name = 'NombreCli '
        Value = 'frxDBxCli."TITULO"'
      end
      item
        Name = 'Serie'
        Value = 'frxDBCabecera."SERIE"'
      end
      item
        Name = 'RIT'
        Value = 'frxDBCabecera."RIT"'
      end
      item
        Name = 'Sesion'
        Value = 'frxDBCabecera."SESION"'
      end
      item
        Name = 'Caja '
        Value = 'frxDBCabecera."CAJA"'
      end
      item
        Name = 'Turno'
        Value = 'frxDBCabecera."TURNO"'
      end
      item
        Name = ' Detalle'
        Value = ''
      end
      item
        Name = 'Articulo'
        Value = 'frDBDetalle."ARTICULO"'
      end
      item
        Name = 'Titulo'
        Value = 'frDBDetalle."TITULO"'
      end
      item
        Name = 'Unidades'
        Value = 'frDBDetalle."UNIDADES"'
      end
      item
        Name = 'Precio'
        Value = 'frDBDetalle."PRECIO"'
      end
      item
        Name = 'Total_Linea'
        Value = 'frDBDetalle."B_DTO_LINEA"'
      end
      item
        Name = ' Desglose IVA'
        Value = ''
      end
      item
        Name = 'P_IVA'
        Value = 'frxDBxDesgloseIVA."P_IVA"'
      end
      item
        Name = 'I_IVA'
        Value = 'frxDBxDesgloseIVA."I_IVA"'
      end
      item
        Name = 'BaseIVA'
        Value = 'frxDBxDesgloseIVA."S_BASES_DTO"'
      end
      item
        Name = ' Formas Pago'
        Value = ''
      end
      item
        Name = 'Forma_Pago'
        Value = ''
      end
      item
        Name = 'Total_Cobrado'
        Value = 'frxDBxFormaPagos."TOTAL_COBRADO"'
      end
      item
        Name = 'Total_Entregado'
        Value = 'frxDBxFormaPagos."TOTAL_ENTREGADO"'
      end
      item
        Name = ' Pie'
        Value = ''
      end
      item
        Name = 'Total'
        Value = 'frxDBCabecera."LIQUIDO"'
      end
      item
        Name = 'TotalE'
        Value = ''
      end
      item
        Name = 'A_Devolver'
        Value = 'frxDBCabecera."A_DEVOLVER"'
      end
      item
        Name = 'Usuario'
        Value = 'frDBxUsuarios."NOMBRE"'
      end
      item
        Name = ' Varios'
        Value = ''
      end
      item
        Name = 'MascaraN'
        Value = '0'
      end
      item
        Name = 'MascaraL'
        Value = '0'
      end
      item
        Name = 'MascaraI'
        Value = '0'
      end
      item
        Name = 'MascaraP'
        Value = '0'
      end
      item
        Name = 'MascaraE'
        Value = '0'
      end
      item
        Name = 'L'
        Value = ''
      end>
    Style = <>
  end
  object frxDSxDetalleSesion: TfrxDBDataset
    UserName = 'frxDSxDetalleSesion'
    CloseDataSource = False
    DataSource = DSxDetalleSesion
    Left = 968
    Top = 56
  end
  object frxDSxDetalleCaja: TfrxDBDataset
    UserName = 'frxDSxDetalleCaja'
    CloseDataSource = False
    DataSource = DSxDetalleCaja
    Left = 968
    Top = 104
  end
  object frxDBxDetalle: TfrxDBDataset
    UserName = 'frxDBxDetalle'
    CloseDataSource = False
    DataSource = DSxDetalle
    Left = 968
    Top = 152
  end
  object frxDBDSxCabSesion: TfrxDBDataset
    UserName = 'frxDBDSxCabSesion'
    CloseDataSource = False
    DataSource = DSxCabSesion
    Left = 440
    Top = 56
  end
  object frxDBDSxCabCaja: TfrxDBDataset
    UserName = 'frxDBDSxCabCaja'
    CloseDataSource = False
    DataSource = DSxCabCaja
    Left = 440
    Top = 104
  end
  object frxDBxCabecera: TfrxDBDataset
    UserName = 'frxDBxCabecera'
    CloseDataSource = False
    DataSource = DSxCabecera
    Left = 440
    Top = 152
  end
  object frxDBxMonedas: TfrxDBDataset
    UserName = 'frxDBxMonedas'
    CloseDataSource = False
    DataSource = DSxMonedas
    Left = 440
    Top = 200
  end
  object frxDBDSxCreditos: TfrxDBDataset
    UserName = 'frxDBDSxCreditos'
    CloseDataSource = False
    DataSource = DSxCreditos
    Left = 440
    Top = 248
  end
  object frxDBDSxCobros: TfrxDBDataset
    UserName = 'frxDBDSxCobros'
    CloseDataSource = False
    DataSource = DSxCobros
    Left = 440
    Top = 296
  end
  object frxDBDSxGastos: TfrxDBDataset
    UserName = 'frxDBDSxGastos'
    CloseDataSource = False
    DataSource = DSxGastos
    Left = 440
    Top = 344
  end
  object frxDBDSxBancos: TfrxDBDataset
    UserName = 'frxDBDSxBancos'
    CloseDataSource = False
    DataSource = DSxBancos
    Left = 440
    Top = 392
  end
  object frxDBDSxContado: TfrxDBDataset
    UserName = 'frxDBDSxContado'
    CloseDataSource = False
    DataSource = DSxContado
    Left = 440
    Top = 440
  end
  object xArqueoTurno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_ARQUEO_TURNO(?EMPRESA,?EJERCICIO,'
      '  ?CANAL,?SERIE,?SESION,?CAJA,?TURNO)'
      'ORDER BY TIPO,ORDEN')
    UniDirectional = False
    AfterOpen = xArqueoTurnoAfterOpen
    Left = 552
    Top = 200
    object xArqueoTurnoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xArqueoTurnoEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xArqueoTurnoCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xArqueoTurnoSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xArqueoTurnoSESION: TIntegerField
      FieldName = 'SESION'
    end
    object xArqueoTurnoCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xArqueoTurnoTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object xArqueoTurnoTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object xArqueoTurnoORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object xArqueoTurnoTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
    object xArqueoTurnoIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object xArqueoTurnoUNIDADES: TIntegerField
      FieldName = 'UNIDADES'
    end
  end
  object DSxArqueoTurno: TDataSource
    DataSet = xArqueoTurno
    Left = 648
    Top = 200
  end
  object frDBxArqueoTurno: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxArqueoTurno
    Left = 744
    Top = 200
  end
  object HYRxArqueoTurno: THYReportSource
    DataSet = xArqueoTurno
    CloseDataset = True
    Left = 848
    Top = 200
  end
  object frxDBxArqueoTurno: TfrxDBDataset
    UserName = 'frxDBxCabecera'
    CloseDataSource = False
    DataSource = DSxArqueoTurno
    Left = 968
    Top = 200
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select serie,titulo from sys_series'
      'where'
      '  serie=?serie')
    UniDirectional = False
    DataSource = DSxArqueoTurno
    Left = 552
    Top = 248
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 648
    Top = 248
  end
  object frDSxSeries: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxSeries
    Left = 744
    Top = 248
  end
  object QTotalIngresos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 552
    Top = 440
  end
  object QTotalEgresos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 632
    Top = 440
  end
end
