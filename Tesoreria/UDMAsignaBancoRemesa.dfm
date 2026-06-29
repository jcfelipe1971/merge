object DMAsignaBancoRemesa: TDMAsignaBancoRemesa
  OldCreateOrder = False
  OnCreate = DMAsignaBancoRemesaCreate
  OnDestroy = DMAsignaBancoRemesaDestroy
  Left = 472
  Top = 317
  Height = 330
  Width = 303
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 8
  end
  object xCarteraDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_REMESA'
      'WHERE'
      '  ID_CARTERA_DETALLE=?old_ID_CARTERA_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_REMESA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,ESTA' +
        'DO_RECIBO,RECIBIDO,FECHA_REGISTRO,EJERCICIO_CARTERA,MONEDA,MONED' +
        'A_CANAL,BANCO_KRI,FP_TITULO,FECHA_VALOR,ABONO,EJERCICIO_ABONO,OR' +
        'IGEN_IMPAGADO,TITULO,PAIS,NOMBRE_COMERCIAL,NOMBRE_R_SOCIAL,TERCE' +
        'RO,ID_CARTERA,ID_CARTERA_DETALLE,ID_DOC,ID_REMESAS,VENCIMIENTO,C' +
        'TA_PAGO,LIQUIDO,LIQUIDO_CANAL,PAGADO,IMPAGADO,FORMA_PAGO,TIPO_EF' +
        'ECTO,ACEPTADO,REMESAR,ESTADO,REMESA,DOC_NUMERO,DOC_SERIE,DOC_FEC' +
        'HA,DOC_TIPO,RIC,RIVA,FECHA_CIERRE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI_P' +
        'RO,?ESTADO_RECIBO,?RECIBIDO,?FECHA_REGISTRO,?EJERCICIO_CARTERA,?' +
        'MONEDA,?MONEDA_CANAL,?BANCO_KRI,?FP_TITULO,?FECHA_VALOR,?ABONO,?' +
        'EJERCICIO_ABONO,?ORIGEN_IMPAGADO,?TITULO,?PAIS,?NOMBRE_COMERCIAL' +
        ',?NOMBRE_R_SOCIAL,?TERCERO,?ID_CARTERA,?ID_CARTERA_DETALLE,?ID_D' +
        'OC,?ID_REMESAS,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,?LIQUIDO_CANAL,?P' +
        'AGADO,?IMPAGADO,?FORMA_PAGO,?TIPO_EFECTO,?ACEPTADO,?REMESAR,?EST' +
        'ADO,?REMESA,?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?DOC_TIPO,?RIC,?RI' +
        'VA,?FECHA_CIERRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_REMESA'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_REMESA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO in (?EJERCICIO,0) AND'
      '  CANAL=?CANAL AND '
      '  SIGNO='#39'C'#39' AND'
      '  PAGADO = 0 AND'
      '  (REMESA = 0 OR REMESA is null) AND'
      '  ORIGEN_IMPAGADO = 0'
      'ORDER BY VENCIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_REMESA'
      'SET'
      '  BANCO_KRI=?BANCO_KRI '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    AfterOpen = xCarteraDetalleAfterOpen
    AfterPost = xCarteraDetalleAfterPost
    BeforeClose = xCarteraDetalleBeforeClose
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_REMESA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 8
    object xCarteraDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLI_PRO'
      ReadOnly = True
    end
    object xCarteraDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
      ReadOnly = True
    end
    object xCarteraDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'LIQUIDO'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object xCarteraDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F.P.'
      FieldName = 'FORMA_PAGO'
      ReadOnly = True
      Size = 3
    end
    object xCarteraDetalleDOC_NUMERO: TIntegerField
      DisplayLabel = 'Fac.'
      FieldName = 'DOC_NUMERO'
      ReadOnly = True
    end
    object xCarteraDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      ReadOnly = True
      Size = 10
    end
    object xCarteraDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fec.Fac.'
      FieldName = 'DOC_FECHA'
      ReadOnly = True
    end
    object xCarteraDetalleBANCO_KRI: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO_KRI'
    end
    object xCarteraDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
      ReadOnly = True
    end
    object xCarteraDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCarteraDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCarteraDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCarteraDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xCarteraDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xCarteraDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCarteraDetalleEJERCICIO_CARTERA: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_CARTERA'
    end
    object xCarteraDetalleORIGEN_IMPAGADO: TIntegerField
      DisplayLabel = 'O. Imp.'
      FieldName = 'ORIGEN_IMPAGADO'
    end
    object xCarteraDetalleCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xCarteraDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xCarteraDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xCarteraDetalleIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object xCarteraDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xCarteraDetalleACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object xCarteraDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xCarteraDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xCarteraDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xCarteraDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xCarteraDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xCarteraDetalleRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object xCarteraDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xCarteraDetalleESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xCarteraDetalleFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xCarteraDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xCarteraDetalleMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object xCarteraDetalleFP_TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'FP_TITULO'
      Size = 40
    end
    object xCarteraDetalleFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object xCarteraDetalleABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object xCarteraDetalleEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object xCarteraDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCarteraDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xCarteraDetalleNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xCarteraDetalleNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xCarteraDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCarteraDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xCarteraDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xCarteraDetalleID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object xCarteraDetalleID_REMESAS: TIntegerField
      DisplayLabel = 'ID Remesa'
      FieldName = 'ID_REMESAS'
    end
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT BANCO,TITULO FROM EMP_BANCOS'
      'WHERE '
      '   EMPRESA = ?EMPRESA AND'
      '   BANCO = ?BANCO'
      '')
    SelectSQL.Strings = (
      'SELECT BANCO,TITULO FROM EMP_BANCOS'
      'WHERE '
      '   EMPRESA = ?EMPRESA'
      'ORDER BY BANCO'
      '')
    UniDirectional = False
    Left = 24
    Top = 56
    object xBancosBANCO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'BANCO'
    end
    object xBancosTITULO: TFIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancosEUROS: TFloatField
      DisplayLabel = 'Importe'
      FieldKind = fkCalculated
      FieldName = 'EUROS'
      OnGetText = xBancosEUROSGetText
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object DSxCarteraDetalle: TDataSource
    DataSet = xCarteraDetalle
    Left = 120
    Top = 8
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 120
    Top = 56
  end
  object xBancoCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST 1 SB.TITULO FROM SYS_TERCEROS_BANCOS STB'
      'JOIN SYS_BANCOS SB'
      'ON STB.PAIS = SB.PAIS AND STB.ENTIDAD = SB.ENTIDAD'
      'WHERE '
      '   STB.TERCERO= ?TERCERO AND'
      '  (STB.MODO=0 OR MODO=2) AND'
      '   STB.ACTIVA=1'
      'ORDER BY ORDEN'
      ''
      '/* ESTO DEVUELVE EL TITULAR'
      'SELECT TITULO FROM SYS_TERCEROS_BANCOS'
      'WHERE '
      '   TERCERO=?TERCERO AND'
      '   (MODO=0 OR MODO=2) AND'
      '    ACTIVA=1'
      'ORDER BY ORDEN'
      '*/')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 24
    Top = 152
    object xBancoClienteTITULO: TFIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL,TERCERO FROM CON_CUENTAS_GES_CLI'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO_CARTERA AND'
      'CANAL = ?CANAL AND'
      'CLIENTE = ?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxCarteraDetalle
    AfterOpen = xClienteAfterOpen
    BeforeClose = xClienteBeforeClose
    Left = 24
    Top = 104
    object xClienteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xClienteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 120
    Top = 104
  end
  object DSxBancoCliente: TDataSource
    DataSet = xBancoCliente
    Left = 120
    Top = 152
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_FORMAS_PAGO'
      'WHERE'
      '   FORMA = ?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSxCarteraDetalle
    Left = 24
    Top = 200
    object xFormaPagoTITULO: TFIBStringField
      DisplayLabel = 'Forma de Pago'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 120
    Top = 200
  end
  object DSxDireccionCliente: TDataSource
    DataSet = xDireccionCliente
    Left = 120
    Top = 248
  end
  object xDireccionCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT FIRST 1 STD.DIR_COMPLETA,SL.TITULO FROM SYS_TERCEROS_DIRE' +
        'CCIONES STD'
      'JOIN SYS_LOCALIDADES SL'
      'ON'
      '   STD.DIR_LOCALIDAD = SL.LOCALIDAD'
      'WHERE'
      '   STD.TERCERO = ?TERCERO'
      'ORDER BY STD.DIRECCION')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 24
    Top = 248
    object xDireccionClienteDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDireccionClienteTITULO: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 8
  end
end
