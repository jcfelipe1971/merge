object ProDMLstEtiOrden: TProDMLstEtiOrden
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 865
  Top = 223
  Height = 472
  Width = 332
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 120
    Top = 16
  end
  object frDBxEtiquetasCab: TfrDBDataSet
    DataSource = DSxEtiquetasCab
    Left = 224
    Top = 64
  end
  object xEtiquetasCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM C_CREA_ETIQUETAS_ORDENES(:EMPRESA, :ID_ORDEN, :VACIAS, :COP' +
        'IAS)')
    UniDirectional = False
    AfterOpen = xEtiquetasCabAfterOpen
    BeforeClose = xEtiquetasCabBeforeClose
    Left = 32
    Top = 64
  end
  object DSxEtiquetasCab: TDataSource
    DataSet = xEtiquetasCab
    Left = 120
    Top = 64
  end
  object xEtiquetasDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_MAT'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN_RET'
      'ORDER BY LINEA_MAT')
    UniDirectional = False
    DataSource = DSxEtiquetasCab
    Left = 32
    Top = 112
  end
  object DSxEtiquetasDet: TDataSource
    DataSet = xEtiquetasDet
    Left = 128
    Top = 112
  end
  object frEtiOrdenes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Hojas de Montaje'
    RebuildPrinter = False
    OnGetValue = frEtiOrdenesGetValue
    OnBeforePrint = frEtiOrdenesEnterRect
    OnEnterRect = frEtiOrdenesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object frDBxEtiquetasDet: TfrDBDataSet
    DataSource = DSxEtiquetasDet
    Left = 224
    Top = 112
  end
  object xOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT ORD.*, ALSAL.TITULO AS TITULOSAL, ALENT.TITULO AS TITULOE' +
        'NT, ALLANZ.TITULO AS TITULOLANZ,'
      
        '       ART.TITULO AS TITULO_ART, TER.NOMBRE_R_SOCIAL AS NOMBRECL' +
        'IENTE, ESC.DESCRIPCION AS NOMBRECOMPUESTO, ART.IMAGEN,'
      '       ART.NOTAS NOTAS_ART'
      'FROM PRO_ORD ORD'
      
        'JOIN ART_ARTICULOS ART ON (ORD.COMPUESTO = ART.ARTICULO AND ORD.' +
        'EMPRESA = ART.EMPRESA)'
      
        'JOIN ART_ALMACENES ALSAL ON (ORD.EMPRESA = ALSAL.EMPRESA AND ORD' +
        '.ALMACEN_SAL = ALSAL.ALMACEN)'
      
        'JOIN ART_ALMACENES ALENT ON (ORD.EMPRESA = ALENT.EMPRESA AND ORD' +
        '.ALMACEN_ENT = ALENT.ALMACEN)'
      
        'JOIN ART_ALMACENES ALLANZ ON (ORD.EMPRESA = ALLANZ.EMPRESA AND O' +
        'RD.ALMACEN_LAN = ALLANZ.ALMACEN)'
      
        'JOIN EMP_CLIENTES CLI ON (ORD.EMPRESA = CLI.EMPRESA AND ORD.CLIE' +
        'NTE = CLI.CLIENTE)'
      'JOIN SYS_TERCEROS TER ON (CLI.TERCERO = TER.TERCERO)'
      
        'JOIN PRO_ESCANDALLO ESC ON ORD.EMPRESA = ESC.EMPRESA AND ORD.ESC' +
        'ANDALLO = ESC.ESCANDALLO AND ESC.TIPO = '#39'EPR'#39
      '/*'
      
        'LEFT JOIN PRO_ORD_MAT_LOTES LOT ON (LOT.EMPRESA = ORD.EMPRESA AN' +
        'D LOT.EJERCICIO = ORD.EJERCICIO AND LOT.CANAL = ORD.CANAL AND LO' +
        'T.SERIE = ORD.SERIES AND LOT.NORDEN = ORD.RIG_OF)'
      '*/'
      'WHERE'
      'ORD.ID_ORDEN = :ID_ORDEN')
    SelectSQL.Strings = (
      
        'SELECT ORD.*, ALSAL.TITULO AS TITULOSAL, ALENT.TITULO AS TITULOE' +
        'NT, ALLANZ.TITULO AS TITULOLANZ,'
      
        '       ART.TITULO AS TITULO_ART, TER.NOMBRE_R_SOCIAL AS NOMBRECL' +
        'IENTE, ESC.DESCRIPCION AS NOMBRECOMPUESTO, ART.IMAGEN,'
      
        '       ART.NOTAS NOTAS_ART, ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ' +
        'ART.ALFA_4, ART.ALFA_5, ART.ALFA_6, ART.ALFA_7,'
      '       ART.ALFA_8, AAC.CODIGO_CLIENTE'
      'FROM VER_PRO_ORD ORD'
      
        'JOIN ART_ARTICULOS ART ON (ORD.COMPUESTO = ART.ARTICULO AND ORD.' +
        'EMPRESA = ART.EMPRESA)'
      
        'JOIN ART_ALMACENES ALSAL ON (ORD.EMPRESA = ALSAL.EMPRESA AND ORD' +
        '.ALMACEN_SAL = ALSAL.ALMACEN)'
      
        'JOIN ART_ALMACENES ALENT ON (ORD.EMPRESA = ALENT.EMPRESA AND ORD' +
        '.ALMACEN_ENT = ALENT.ALMACEN)'
      
        'JOIN ART_ALMACENES ALLANZ ON (ORD.EMPRESA = ALLANZ.EMPRESA AND O' +
        'RD.ALMACEN_LAN = ALLANZ.ALMACEN)'
      
        'JOIN EMP_CLIENTES CLI ON (ORD.EMPRESA = CLI.EMPRESA AND ORD.CLIE' +
        'NTE = CLI.CLIENTE)'
      'JOIN SYS_TERCEROS TER ON (CLI.TERCERO = TER.TERCERO)'
      
        'JOIN PRO_ESCANDALLO ESC ON ORD.EMPRESA = ESC.EMPRESA AND ORD.ESC' +
        'ANDALLO = ESC.ESCANDALLO AND ESC.TIPO = '#39'EPR'#39
      
        'JOIN ART_ARTICULOS_CODCLI AAC ON (ORD.COMPUESTO = AAC.ARTICULO A' +
        'ND ORD.EMPRESA = AAC.EMPRESA AND AAC.CLIENTE = ORD.CLIENTE)'
      '/*'
      
        'LEFT JOIN PRO_ORD_MAT_LOTES LOT ON (LOT.EMPRESA = ORD.EMPRESA AN' +
        'D LOT.EJERCICIO = ORD.EJERCICIO AND LOT.CANAL = ORD.CANAL AND LO' +
        'T.SERIE = ORD.SERIES AND LOT.NORDEN = ORD.RIG_OF)'
      '*/'
      'WHERE'
      'ORD.ID_ORDEN = :ID_ORDEN_RET')
    UniDirectional = False
    DataSource = DSxEtiquetasCab
    AfterOpen = xOrdenAfterOpen
    BeforeClose = xOrdenBeforeClose
    Left = 32
    Top = 160
  end
  object DSxOrden: TDataSource
    DataSet = xOrden
    Left = 128
    Top = 160
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_VER_ESCANDALLO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ESCANDALLO = :ESCANDALLO AND'
      'TIPO = '#39'EPR'#39)
    UniDirectional = False
    DataSource = DSxOrden
    Left = 32
    Top = 208
  end
  object DSxEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 128
    Top = 208
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSxOrden
    Left = 32
    Top = 256
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 128
    Top = 256
  end
  object xEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'EMPLEADO = :RESPONSABLE')
    UniDirectional = False
    DataSource = DSxOrden
    Left = 32
    Top = 304
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 128
    Top = 304
  end
end
