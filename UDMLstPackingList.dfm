object DMLstPackingList: TDMLstPackingList
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 442
  Top = 240
  Height = 534
  Width = 548
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 56
    Top = 16
  end
  object frPackingList: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Packing List'
    RebuildPrinter = False
    OnGetValue = frPackingListGetValue
    OnBeforePrint = frPackingListEnterRect
    OnEnterRect = frPackingListEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 280
    Top = 16
    ReportForm = {19000000}
  end
  object DSBultos: TDataSource
    DataSet = QMBultos
    Left = 168
    Top = 64
  end
  object frDBBultos: TfrDBDataSet
    DataSource = DSBultos
    Left = 288
    Top = 64
  end
  object QMBultos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT P.*, B.EMPRESA, B.EJERCICIO, B.CANAL, B.SERIE, B.TIPO, B.' +
        'RIG, B.NIVEL, B.ORDEN, B.PESO PESO_BULTO, B.PESO_NETO,'
      
        '       B.PESO_BRUTO, B.VOLUMEN, B.UBICACION, B.GRUPO, B.BULTO, B' +
        '.ALTO, B.ANCHO, B.FONDO, B.DIAMETRO, B.SSCC'
      'FROM G_PACKING_LIST_BULTOS_LST(:ID_S) P'
      'JOIN GES_CABECERAS_S_BULTOS B ON P.ID_B = B.ID_B')
    UniDirectional = False
    AfterOpen = QMBultosAfterOpen
    BeforeClose = QMBultosBeforeClose
    Left = 56
    Top = 64
  end
  object QMBultosDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT B.EMPRESA, B.EJERCICIO, B.CANAL, B.SERIE, B.TIPO, B.RIG, ' +
        'A.LINEA, B.ID_B, B.NIVEL, B.ORDEN, B.PESO_NETO,'
      
        '       B.PESO_BRUTO, B.NUMERO_BULTO, B.VOLUMEN, B.UBICACION, B.G' +
        'RUPO, B.BULTO, B.TITULO_BULTO, B.ALTURA, B.ALTO,'
      
        '       B.ANCHO, B.FONDO, B.DIAMETRO, B.SSCC, G.ARTICULO, G.TITUL' +
        'O, A.UNIDADES, G.LINEA, A.PESO_UNITARIO,'
      '       A.CANTIDAD_ETIQUETAS, B.ID_S, A.ID_DETALLES_S'
      'FROM GES_CABECERAS_S_BULTOS B'
      'JOIN GES_DETALLES_S_BULTOS A ON (A.ID_B = B.ID_B)'
      'JOIN GES_DETALLES_S G ON (G.ID_DETALLES_S = A.ID_DETALLES_S)'
      'WHERE'
      'B.ID_B = :ID_B'
      'ORDER BY G.LINEA')
    UniDirectional = False
    DataSource = DSBultos
    AfterOpen = QMBultosDetAfterOpen
    BeforeClose = QMBultosDetBeforeClose
    Left = 56
    Top = 160
  end
  object DSBultosDet: TDataSource
    DataSet = QMBultosDet
    Left = 168
    Top = 160
  end
  object frDBBultosDet: TfrDBDataSet
    DataSource = DSBultosDet
    OnFirst = frDBBultosDetFirst
    OnNext = frDBBultosDetNext
    Left = 288
    Top = 160
  end
  object QMBultosHijos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT SUM(UNIDADES * PESO_UNITARIO)'
      '        FROM GES_DETALLES_S_BULTOS'
      '        WHERE'
      '        ID_S = C.ID_S AND'
      '        ID_B = C.ID_B) SUM_PESO,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_DETALLES_S_BULTOS'
      '        WHERE'
      '        ID_S = C.ID_S AND'
      '        ID_B = C.ID_B) SUM_UNIDADES'
      'FROM GES_CABECERAS_S_BULTOS C'
      'WHERE'
      'C.ID_B_PADRE = :ID_B'
      'ORDER BY C.ORDEN')
    UniDirectional = False
    DataSource = DSBultos
    AfterOpen = QMBultosHijosAfterOpen
    BeforeClose = QMBultosHijosBeforeClose
    Left = 56
    Top = 112
  end
  object DSBultosHijos: TDataSource
    DataSet = QMBultosHijos
    Left = 168
    Top = 112
  end
  object frDBBultosHijos: TfrDBDataSet
    DataSource = DSBultosHijos
    Left = 288
    Top = 112
  end
  object QMBultosHijosDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT B.EMPRESA, B.EJERCICIO, B.CANAL, B.SERIE, B.TIPO, B.RIG, ' +
        'A.LINEA, B.ID_B, B.NIVEL, B.ORDEN, B.PESO, B.PESO_NETO,'
      
        '       B.PESO_BRUTO, B.NUMERO_BULTO, B.VOLUMEN, B.UBICACION, B.G' +
        'RUPO, B.BULTO, B.TITULO_BULTO, B.ALTURA, B.ALTO,'
      
        '       B.ANCHO, B.FONDO, B.DIAMETRO, B.SSCC, G.ARTICULO, G.TITUL' +
        'O, A.UNIDADES, G.LINEA, A.PESO_UNITARIO,'
      '       A.CANTIDAD_ETIQUETAS, B.ID_S, A.ID_DETALLES_S'
      'FROM GES_CABECERAS_S_BULTOS B'
      'JOIN GES_DETALLES_S_BULTOS A ON A.ID_B = B.ID_B'
      'JOIN GES_DETALLES_S G ON G.ID_DETALLES_S = A.ID_DETALLES_S'
      'WHERE'
      'B.ID_B = :ID_B'
      'ORDER BY G.LINEA')
    UniDirectional = False
    DataSource = DSBultosHijos
    AfterOpen = QMBultosHijosDetAfterOpen
    BeforeClose = QMBultosHijosDetBeforeClose
    Left = 56
    Top = 208
  end
  object DSBultosHijosDet: TDataSource
    DataSet = QMBultosHijosDet
    Left = 168
    Top = 208
  end
  object frDBBultosHijosDet: TfrDBDataSet
    DataSource = DSBultosHijosDet
    Left = 288
    Top = 208
  end
  object frUserBultosDet: TfrUserDataset
    RangeEnd = reCount
    Left = 408
    Top = 160
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSBultosDet
    Left = 56
    Top = 256
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 168
    Top = 256
  end
  object xArticuloHijo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSBultosHijosDet
    Left = 56
    Top = 304
  end
  object DSxArticuloHijo: TDataSource
    DataSet = xArticuloHijo
    Left = 168
    Top = 304
  end
  object QMDocumento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S'
      'WHERE '
      'ID_S = :ID_S')
    UniDirectional = False
    AfterOpen = QMDocumentoAfterOpen
    BeforeOpen = QMDocumentoBeforeOpen
    Left = 56
    Top = 352
  end
  object DSDocumento: TDataSource
    DataSet = QMDocumento
    Left = 168
    Top = 352
  end
  object QMDatosEmbarque: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      '/*Se modifica dinamicamente*/'
      
        'SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKI' +
        'NG_LIST FROM GES_CABECERAS_S_FAC'
      'WHERE '
      'ID_S = :ID_S')
    UniDirectional = False
    Left = 56
    Top = 400
  end
  object DSQMDatosEmbarque: TDataSource
    DataSet = QMDatosEmbarque
    Left = 168
    Top = 400
  end
  object QMCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSDocumento
    Left = 288
    Top = 352
  end
  object DSQMCliente: TDataSource
    DataSet = QMCliente
    Left = 400
    Top = 352
  end
  object QMTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE '
      'TERCERO = :TERCERO')
    UniDirectional = False
    DataSource = DSDocumento
    Left = 288
    Top = 400
  end
  object DSQMTercero: TDataSource
    DataSet = QMTercero
    Left = 400
    Top = 400
  end
  object QMDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIENTE, :ID_S, 0)'
      'WHERE'
      '((NUM = :DIRECCION) OR (NUM = 0))')
    UniDirectional = False
    DataSource = DSDocumento
    Left = 288
    Top = 448
  end
  object DSQMDireccion: TDataSource
    DataSet = QMDireccion
    Left = 400
    Top = 448
  end
  object frxPackingList: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9723134954
    ReportOptions.LastChange = 38691.9723134954
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxPackingListBeforePrint
    OnGetValue = frxPackingListGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 408
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMBultosResumen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT MIN(B.ORDEN), B.BULTO, T.TITULO, COUNT(*),'
      '       B.ALTO, B.ANCHO, B.FONDO, B.PESO_BRUTO,'
      '       (B.ALTO * B.ANCHO * B.FONDO) VOLUMEN_UNIT,'
      '       SUM(B.PESO_BRUTO) PESO_BRUTO_T,'
      '       SUM(B.VOLUMEN) VOLUMEN_TOTAL'
      'FROM GES_CABECERAS_S_BULTOS B'
      'JOIN ART_BULTOS T ON B.EMPRESA = T.EMPRESA AND '
      'B.BULTO = T.BULTO'
      'WHERE'
      'B.ID_S = :ID_S AND'
      'B.ID_B_PADRE = 0'
      'GROUP BY B.BULTO, T.TITULO, B.ALTO, B.ANCHO, '
      'B.FONDO,'
      '         B.PESO_BRUTO, (B.ALTO * B.ANCHO * B.FONDO)'
      'ORDER BY MIN(B.ORDEN)')
    UniDirectional = False
    Left = 56
    Top = 448
  end
  object DSQMBultosResumen: TDataSource
    DataSet = QMBultosResumen
    Left = 168
    Top = 448
  end
  object QMTransportista: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ACREEDOR = :TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSDocumento
    Left = 288
    Top = 304
  end
  object DSQMTransportista: TDataSource
    DataSet = QMTransportista
    Left = 400
    Top = 304
  end
end
