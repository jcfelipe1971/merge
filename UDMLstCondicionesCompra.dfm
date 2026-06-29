object DMLstCondicionesCompra: TDMLstCondicionesCompra
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 412
  Top = 232
  Height = 329
  Width = 524
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 16
  end
  object QMCondicionesCompra: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROVEEDORES_EMPRESA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND '
      'PROVEEDOR BETWEEN ?DESDE AND ?HASTA')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROVEEDOR ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_PROVEEDORES_EMPRESA'
    Left = 48
    Top = 72
    object QMCondicionesCompraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondicionesCompraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondicionesCompraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCondicionesCompraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCondicionesCompraNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object QMCondicionesCompraDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMCondicionesCompraDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMCondicionesCompraDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMCondicionesCompraDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMCondicionesCompraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object frDSQMCondicionesCompra: TfrDBDataSet
    DataSource = DSCondicionesCompra
    Left = 304
    Top = 72
  end
  object frCondicionesCompras: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Condiciones de Compra'
    RebuildPrinter = False
    OnGetValue = frCondicionesComprasGetValue
    OnBeforePrint = frCondicionesComprasEnterRect
    OnEnterRect = frCondicionesComprasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object DSCondicionesCompra: TDataSource
    DataSet = QMCondicionesCompra
    Left = 176
    Top = 72
  end
  object DSxCabecera: TDataSource
    DataSet = QMxCabecera
    Left = 172
    Top = 126
  end
  object QMxCabecera: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_COND_COM_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_COND_COM_C'
      'WHERE EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      '((TIPO LIKE '#39'PR_'#39' AND '
      'PROVEEDOR BETWEEN ?DESDE AND ?HASTA) AND '
      '((TIPO LIKE '#39'%A'#39') AND (ARTICULO BETWEEN ?ART_I AND ?ART_F)) OR'
      '((TIPO LIKE '#39'%F'#39') AND (FAMILIA BETWEEN ?FAM_I AND ?FAM_F)) OR'
      '((TIPO LIKE '#39'%G'#39') AND (FAMILIA BETWEEN ?AGR_I AND ?AGR_F)))'
      'ORDER BY PROVEEDOR,TIPO,ARTICULO,FAMILIA,AGRUPACION')
    UniDirectional = False
    AfterScroll = QMxCabeceraAfterScroll
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_COND_COM_C'
    Left = 44
    Top = 126
    object QMxCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMxCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMxCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMxCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMxCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMxCabeceraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMxCabeceraTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMxCabeceraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMxCabeceraTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 60
    end
    object QMxCabeceraFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMxCabeceraTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMxCabeceraAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMxCabeceraTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMxCabeceraALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'ALTA'
    end
    object QMxCabeceraBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMxCabeceraACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object frDSxCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCabecera
    Left = 300
    Top = 118
  end
  object QMxLinea: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_COND_COM_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_COND_COM_D'
      'WHERE (EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'TIPO=?TIPO AND'
      'RIG=?RIG)'
      '')
    UniDirectional = False
    DataSource = DSxCabecera
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'ART_COND_COM_D'
    Left = 44
    Top = 174
    object QMxLineaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMxLineaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMxLineaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMxLineaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMxLineaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMxLineaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMxLineaUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMxLineaUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMxLineaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMxLineaDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMxLineaDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMxLineaDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
  end
  object DSxLinea: TDataSource
    DataSet = QMxLinea
    Left = 172
    Top = 182
  end
  object frDSxLinea: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxLinea
    Left = 300
    Top = 174
  end
  object QMxMax: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(PROVEEDOR) AS MAXIMO FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 72
  end
  object QMxMin: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(PROVEEDOR) AS MINIMO FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 120
  end
  object QMTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS'
      '  WHERE TERCERO = ?TERCERO'
      '')
    UniDirectional = False
    Left = 46
    Top = 232
    object QMTerceroTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMTerceroNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMTerceroNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object QMTerceroDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
  end
  object DSTercero: TDataSource
    DataSet = QMTercero
    Left = 172
    Top = 230
  end
  object frDSQMTercero: TfrDBDataSet
    DataSource = DSTercero
    Left = 300
    Top = 230
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1994
    ValorGrupo = 34
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Condiciones Compra'
    ControlaLongitud = True
    Left = 397
    Top = 6
  end
  object frxCondicionesCompras: TfrxHYReport
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
    OnBeforePrint = frxCondicionesComprasBeforePrint
    OnGetValue = frxCondicionesComprasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 177
    Top = 17
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDSQMCondicionesCompra: TfrxDBDataset
    UserName = 'frxDSQMCondicionesCompra'
    CloseDataSource = False
    DataSource = DSCondicionesCompra
    Left = 400
    Top = 72
  end
  object frxDSxCabecera: TfrxDBDataset
    UserName = 'frxDSxCabecera'
    CloseDataSource = False
    DataSource = DSxCabecera
    Left = 400
    Top = 118
  end
  object frxDSxLinea: TfrxDBDataset
    UserName = 'frxDSxLinea'
    CloseDataSource = False
    DataSource = DSxLinea
    Left = 400
    Top = 174
  end
  object frxDSQMTercero: TfrxDBDataset
    UserName = 'frxDSQMTercero'
    CloseDataSource = False
    DataSource = DSTercero
    Left = 400
    Top = 230
  end
end
