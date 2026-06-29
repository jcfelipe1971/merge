object DMLstTalones: TDMLstTalones
  OldCreateOrder = False
  OnCreate = DMLstTalonesCreate
  OnDestroy = DMLstTalonesDestroy
  Left = 347
  Top = 265
  Height = 495
  Width = 774
  object SPDameTalon: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(talon),min(talon)  from ver_talones'
      
        '  where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?c' +
        'anal)and(pagado=0))')
    Transaction = TLocal
    AutoTrans = True
    Left = 616
    Top = 16
  end
  object xTalonDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TALON,DESCRIPCION FROM VER_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    UniDirectional = False
    Left = 32
    Top = 64
    object xTalonDesdeTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xTalonDesdeDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 16
  end
  object xTalonHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TALON,DESCRIPCION FROM VER_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    UniDirectional = False
    Left = 32
    Top = 112
    object xTalonHastaTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xTalonHastaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxTalonDesde: TDataSource
    DataSet = xTalonDesde
    Left = 120
    Top = 64
  end
  object DSxTalonHasta: TDataSource
    DataSet = xTalonHasta
    Left = 120
    Top = 112
  end
  object xTalones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON>=?TALONDESDE AND'
      '  TALON<=?TALONHASTA'
      'order by talon')
    UniDirectional = False
    AfterScroll = xTalonesAfterScroll
    Left = 32
    Top = 160
    object xTalonesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTalonesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTalonesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTalonesTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xTalonesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLI_PRO'
    end
    object xTalonesTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xTalonesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xTalonesLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object xTalonesFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object xTalonesBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xTalonesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xTalonesPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xTalonesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xTalonesASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xTalonesMARCA_CONT: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_CONT'
    end
    object xTalonesTALON_PAPEL: TFIBStringField
      DisplayLabel = 'Talon Papel'
      FieldName = 'TALON_PAPEL'
      Size = 15
    end
    object xTalonesTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO_KRI'
      Size = 3
    end
    object xTalonesZ_CONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'Z_CONTADOR'
    end
    object xTalonesZ_NOTASTALON: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'Z_NOTASTALON'
      Size = 8
    end
  end
  object Letra1: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 61
    LongPrimeraLinea = 51
    Separador = ','
    Relleno = '#'
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 544
    Top = 16
  end
  object HYTalones: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 503
    ValorGrupo = 503
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 18
    Opciones.Pagina.Ancho = 70
    Opciones.Pagina.Tamanyo = 18
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = True
    Opciones.Pagina.ImprimeUltimoPie = True
    Titulo = 'Listado de Talones por Cuenta'
    ControlaLongitud = True
    OnEnterFields = HYTalonesEnterFields
    Left = 352
    Top = 64
  end
  object HYRSxTalones: THYReportSource
    DataSet = xTalones
    CloseDataset = True
    Left = 296
    Top = 160
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT tercero,nombre_r_social as TITULO from ver_proveedores_cu' +
        'entas'
      '  where empresa=?empresa and '
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             proveedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxTalones
    Left = 32
    Top = 256
    object xProveedoresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xProveedoresTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxTalones: TDataSource
    DataSet = xTalones
    Left = 120
    Top = 160
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TERCERO,TITULO from ver_acreedores_cuentas'
      '  where empresa=?empresa and '
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             acreedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxTalones
    Left = 32
    Top = 352
    object xAcreedoresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAcreedoresTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object SPDameTalonCta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(talon),min(talon)  from ver_talones_cta'
      
        '  where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?c' +
        'anal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 616
    Top = 64
  end
  object xTalonesCta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES_CTA'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON>=?TALONDESDE AND'
      '  TALON<=?TALONHASTA'
      'order by talon')
    UniDirectional = False
    AfterScroll = xTalonesCtaAfterScroll
    Left = 392
    Top = 208
    object xTalonesCtaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTalonesCtaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTalonesCtaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTalonesCtaTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xTalonesCtaCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xTalonesCtaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xTalonesCtaLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar Libramiento'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object xTalonesCtaFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Libramiento'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object xTalonesCtaBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xTalonesCtaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xTalonesCtaPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xTalonesCtaRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xTalonesCtaASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xTalonesCtaZ_NOTASTALONCC: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'Z_NOTASTALONCC'
      Size = 8
    end
    object xTalonesCtaZ_CONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'Z_CONTADOR'
    end
  end
  object DSxTalonesCta: TDataSource
    DataSet = xTalonesCta
    Left = 496
    Top = 208
  end
  object HYRSxTalonesCta: THYReportSource
    DataSet = xTalonesCta
    CloseDataset = True
    Left = 608
    Top = 208
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO from con_cuentas'
      '  where empresa=?empresa and '
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             cuenta=?cuenta')
    UniDirectional = False
    DataSource = DSxTalonesCta
    Left = 392
    Top = 256
    object xCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON AND'
      '  TALON_AUTOMATICO=1')
    UniDirectional = False
    DataSource = DSxTalones
    AfterOpen = xDetalleAfterOpen
    BeforeClose = xDetalleBeforeClose
    Left = 32
    Top = 208
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xDetalleCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xDetalleIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object xDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xDetalleACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object xDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xDetalleDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xDetalleRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object xDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xDetalleESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xDetalleCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xDetalleTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xDetalleTALON_AUTOMATICO: TIntegerField
      DisplayLabel = 'Talon Autom.'
      FieldName = 'TALON_AUTOMATICO'
    end
    object xDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 120
    Top = 208
  end
  object HYRxDetalle: THYReportSource
    DataSet = xDetalle
    CloseDataset = True
    Left = 296
    Top = 208
  end
  object frDBxTalones: TfrDBDataSet
    DataSource = DSxTalones
    Left = 208
    Top = 160
  end
  object frDBDBDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 208
    Top = 208
  end
  object frCartaPago: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Carta de Pago a Pro./Acr.'
    RebuildPrinter = False
    OnGetValue = frCartaPagoGetValue
    OnBeforePrint = frCartaPagoEnterRect
    OnEnterRect = frCartaPagoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 208
    Top = 16
    ReportForm = {19000000}
  end
  object xCodigoPostal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CODPOSTAL, INE, PROVINCIA,PAIS FROM VER_LOCALIDADES'
      'where id_local = ?id_local')
    UniDirectional = False
    DataSource = DSxDirPRO_ACR
    Left = 392
    Top = 160
    object xCodigoPostalCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xCodigoPostalPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xCodigoPostalPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object DSxCodPostal: TDataSource
    DataSet = xCodigoPostal
    Left = 496
    Top = 160
  end
  object DSxDirPRO_ACR: TDataSource
    DataSet = xDirPRO_ACR
    Left = 496
    Top = 112
  end
  object xDirPRO_ACR: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) * from ver_terceros_direccion_todas '
      'where tercero=?tercero and (dir_clase=1 or  dir_clase=3)'
      'order by dir_clase desc')
    UniDirectional = False
    AfterOpen = xDirPRO_ACRAfterOpen
    BeforeClose = xDirPRO_ACRBeforeClose
    Left = 392
    Top = 112
    object xDirPRO_ACRTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDirPRO_ACRNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDirPRO_ACRNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xDirPRO_ACRDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDirPRO_ACRDIRECCION_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIRECCION_2'
      Size = 40
    end
    object xDirPRO_ACRLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xDirPRO_ACRTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object xDirPRO_ACRDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object xDirPRO_ACRDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object xDirPRO_ACRDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
    object xDirPRO_ACRID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object xDirPRO_ACRDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
  end
  object xBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM emp_bancos'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSxTalones
    Left = 32
    Top = 400
    object xBancoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBancoBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xBancoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xBancoCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xBancoRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object xBancoRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object xBancoACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xBancoRIESGO_DES: TFloatField
      DisplayLabel = 'Riesgo Descuento'
      FieldName = 'RIESGO_DES'
    end
    object xBancoRIESGO_CFM: TFloatField
      DisplayLabel = 'Riesgo Confirming'
      FieldName = 'RIESGO_CFM'
    end
    object xBancoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xBancoCUENTA_CORRIENTE: TFIBStringField
      DisplayLabel = 'Cta. Corriente'
      FieldName = 'CUENTA_CORRIENTE'
    end
    object xBancoBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object xBancoIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
  end
  object DSxBanco: TDataSource
    DataSet = xBanco
    Left = 120
    Top = 400
  end
  object Letras: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 200
    LongPrimeraLinea = 200
    Separador = ','
    Relleno = #0
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 488
    Top = 16
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 120
    Top = 256
  end
  object DSxAcreedores: TDataSource
    DataSet = xAcreedores
    Left = 120
    Top = 352
  end
  object xNum_Factura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NUM_FACTURA FROM ges_cabeceras_e_fac'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO=?TIPO AND '
      '  RIG=?RIG')
    UniDirectional = False
    Left = 392
    Top = 304
    object xNum_FacturaNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
  end
  object DSxNumFactura: TDataSource
    DataSet = xNum_Factura
    Left = 496
    Top = 304
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 392
    Top = 352
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 496
    Top = 352
  end
  object frxCartaPago: TfrxHYReport
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
    OnBeforePrint = frxCartaPagoBeforePrint
    OnGetValue = frxCartaPagoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 280
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 16
  end
  object xDetalleRecAgrupKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select det.empresa,det.ejercicio,det.canal,det.signo,det.registr' +
        'o,det.linea,det.vencimiento,'
      
        '       det.liquido,car.cuenta,car.cuenta_pgc,car.fecha_registro,' +
        'car.doc_numero,'
      
        '       car.doc_serie,car.doc_tipo,car.doc_fecha,car.forma_pago,c' +
        'ar.cod_cli_pro,car.ric from emp_cartera_documento doc'
      '   join emp_cartera_detalle det'
      '  on(doc.id_cartera_detalle = det.id_cartera_detalle)'
      '   join emp_cartera car'
      '  on(car.id_cartera = det.id_cartera)'
      
        'where((doc.empresa=?empresa)and(doc.ejercicio_rec<=:ejercicio/*_' +
        'rec*/)and'
      
        '(doc.ejercicio=:ejercicio)and(doc.canal=:canal)and(doc.signo=:si' +
        'gno)and(doc.registro=:registro))')
    UniDirectional = False
    DataSource = DSxDetalle
    Left = 32
    Top = 304
    object xDetalleRecAgrupKriEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleRecAgrupKriEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetalleRecAgrupKriCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetalleRecAgrupKriSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xDetalleRecAgrupKriREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xDetalleRecAgrupKriLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetalleRecAgrupKriVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xDetalleRecAgrupKriLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDetalleRecAgrupKriCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xDetalleRecAgrupKriCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_PGC'
    end
    object xDetalleRecAgrupKriFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xDetalleRecAgrupKriDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xDetalleRecAgrupKriDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xDetalleRecAgrupKriDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xDetalleRecAgrupKriDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xDetalleRecAgrupKriFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDetalleRecAgrupKriCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xDetalleRecAgrupKriRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
  end
  object DSxDetalleRecAgrupKri: TDataSource
    DataSet = xDetalleRecAgrupKri
    Left = 120
    Top = 304
  end
  object HYRSxDetalleRecAgrupKri: THYReportSource
    DataSet = xDetalleRecAgrupKri
    CloseDataset = True
    Left = 304
    Top = 304
  end
  object frDBxDetalleRecAgrupKri: TfrDBDataSet
    DataSource = DSxDetalleRecAgrupKri
    Left = 208
    Top = 304
  end
  object xTalonesList: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TALONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TALON=?old_TALON ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TALONES'
      
        '  (EMPRESA,EJERCICIO,CANAL,TALON,COD_CLI_PRO,TIPO_TERCERO,DESCRI' +
        'PCION,LUGAR_LIBRAMIENTO,FECHA_LIBRAMIENTO,BANCO,IMPORTE,PAGADO,R' +
        'IC,ASIENTO,TIPO_ASIENTO_KRI,TALON_PAPEL,MARCA_CONT)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TALON,?COD_CLI_PRO,?TIPO_TERCERO,' +
        '?DESCRIPCION,?LUGAR_LIBRAMIENTO,?FECHA_LIBRAMIENTO,?BANCO,?IMPOR' +
        'TE,?PAGADO,?RIC,?ASIENTO,?TIPO_ASIENTO_KRI,?TALON_PAPEL,?MARCA_C' +
        'ONT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PAGADO=0 AND'
      '  MARCA_CONT=1 AND'
      '  TALON=?TALON ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGADO=0 AND'
      '  MARCA_CONT=1 AND'
      '  TALON>=?TALONDESDE AND'
      '  TALON<=?TALONHASTA'
      'order by talon')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TALONES'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,TIPO_TERCERO=?TIPO_TERCERO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LUGAR_LIBRAMIENTO=?LUGAR_LIBRAMIENTO '
      '  ,FECHA_LIBRAMIENTO=?FECHA_LIBRAMIENTO '
      '  ,BANCO=?BANCO '
      '  ,IMPORTE=?IMPORTE '
      '  ,PAGADO=?PAGADO '
      '  ,RIC=?RIC '
      '  ,ASIENTO=?ASIENTO '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI '
      '  ,TALON_PAPEL=?TALON_PAPEL '
      '  ,MARCA_CONT=?MARCA_CONT '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?TALON ')
    AfterPost = xTalonesListAfterPost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TALON ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TALONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 392
    Top = 400
    object xTalonesListTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xTalonesListTALON_PAPEL: TFIBStringField
      DisplayLabel = 'Talon Papel'
      FieldName = 'TALON_PAPEL'
      Size = 15
    end
    object xTalonesListTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xTalonesListDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xTalonesListIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xTalonesListPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xTalonesListRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xTalonesListASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xTalonesListTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento Kri'
      FieldName = 'TIPO_ASIENTO_KRI'
      Size = 3
    end
    object xTalonesListMARCA_CONT: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_CONT'
    end
    object xTalonesListEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTalonesListEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTalonesListCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTalonesListCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod Cli Pro'
      FieldName = 'COD_CLI_PRO'
    end
    object xTalonesListLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar Libramiento'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object xTalonesListFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Libramiento'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object xTalonesListBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
  end
  object DSxTalonesList: TDataSource
    DataSet = xTalonesList
    Left = 496
    Top = 400
  end
  object frTalon: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Talones'
    RebuildPrinter = False
    OnGetValue = frCartaPagoGetValue
    OnBeforePrint = frCartaPagoEnterRect
    OnEnterRect = frCartaPagoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 208
    Top = 64
    ReportForm = {19000000}
  end
  object frxTalon: TfrxHYReport
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
    OnBeforePrint = frxCartaPagoBeforePrint
    OnGetValue = frxCartaPagoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 280
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xModoImporte: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select importe_letras from sys_empresas'
      '  where (empresa=?empresa)')
    Transaction = TLocal
    AutoTrans = True
    Left = 56
    Top = 462
  end
end
