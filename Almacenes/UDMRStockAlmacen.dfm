object DMRStockAlmacen: TDMRStockAlmacen
  OldCreateOrder = False
  OnCreate = DMRStockAlmacenCreate
  OnDestroy = DMRCabeceraDestroy
  Left = 667
  Top = 251
  Height = 516
  Width = 658
  object frStockAlmacen: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frStockAlmacenGetValue
    OnBeforePrint = frStockAlmacenEnterRect
    OnEnterRect = frStockAlmacenEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object DSSPStockAlmacen: TDataSource
    DataSet = SPStockAlmacen
    Left = 136
    Top = 64
  end
  object frDSSPStockAlmacen: TfrDBDataSet
    DataSource = DSSPStockAlmacen
    Left = 240
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 528
    Top = 16
  end
  object SPStockAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT X.*'
      '       --'
      
        '       , M.REF_PROVEEDOR, M.COD_MOD, M.CLIENTE, M.REF_CLIENTE, A' +
        '.FAMILIA FAMILIA_ART, F.TITULO AS TITULO_FAMILIA,'
      
        '       A.SUBFAMILIA, S.TITULO AS TITULO_SUBFAMILIA, M.PROVEEDOR,' +
        ' M.COD_ESTRUCTURA, M.CODIGO_TEMPORADA,'
      
        '       TT.TITULO AS TITULO_TEMPORADA, M.CODIGO_GENERO, G.TITULO ' +
        'AS TITULO_GENERO, M.P_COMPRA, M.P_COSTE, M.P_VENTA,'
      '       M.PACK, MM.MARCA, MM.TITULO TITULO_MARCA'
      '       --'
      
        '       , A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALF' +
        'A_6, A.ALFA_7, A.ALFA_8'
      
        'FROM A_ART_STOCK_POR_ALMACEN(:ENTRADA, :EMPRESA, :EJERCICIO, :CA' +
        'NAL, :ALMACEN, :ART_INI,'
      
        '                             :ART_FIN, :FAM_INI, :FAM_FIN, :SUBF' +
        'AM_INI, :SUBFAM_FIN,'
      
        '                             :FECHA, :TIPO_VALOR, :MONEDA, :TARI' +
        'FA, :BAJA, :TIPO_ARTICULO,'
      
        '                             :CODIGO_GENERO_DESDE, :CODIGO_GENER' +
        'O_HASTA,'
      
        '                             :CODIGO_TEMPORADA_DESDE, :CODIGO_TE' +
        'MPORADA_HASTA,'
      '                             :MARCA_DESDE, :MARCA_HASTA) X'
      '--'
      
        'JOIN ART_ARTICULOS A ON X.EMPRESA = A.EMPRESA AND X.ARTICULO = A' +
        '.ARTICULO'
      'JOIN ART_ARTICULOS_M_C_TALLAS T ON (A.ID_A_M_C_T = T.ID_A_M_C_T)'
      'JOIN ART_ARTICULOS_MOD_COLOR C ON (T.ID_A_M_C = C.ID_A_M_C)'
      'JOIN ART_ARTICULOS_MODELOS M ON (C.ID_A_M = M.ID_A_M)'
      'JOIN ART_ARTICULOS_MOD_MARCAS MM ON A.ID_MARCA = MM.ID_MARCA'
      
        'JOIN ART_FAMILIAS F ON (A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.' +
        'FAMILIA)'
      
        'LEFT JOIN ART_SUBFAMILIAS S ON (A.EMPRESA = S.EMPRESA AND F.ID_F' +
        'AMILIA = S.ID_FAMILIA AND A.SUBFAMILIA = S.SUBFAMILIA)'
      
        'LEFT JOIN ART_ARTICULOS_MOD_GENERO G ON (M.CODIGO_GENERO = G.COD' +
        'IGO)'
      
        'LEFT JOIN ART_ARTICULOS_MOD_TEMPORADA TT ON (M.CODIGO_TEMPORADA ' +
        '= TT.CODIGO)'
      'WHERE'
      'X.EMPRESA = :EMPRESA')
    UniDirectional = False
    BeforeClose = SPStockAlmacenBeforeClose
    BeforeOpen = SPStockAlmacenBeforeOpen
    Left = 40
    Top = 64
  end
  object QMCodProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT FIRST 1 C.PROVEEDOR, C.CODIGO_PROVEEDOR, P.PRIORIDAD, P.D' +
        'IAS_ENTREGA'
      'FROM ART_ARTICULOS_CODPROV C'
      'JOIN ART_ARTICULOS_PROVEEDORES P'
      
        'ON C.EMPRESA = P.EMPRESA AND C.ARTICULO = P.ARTICULO AND C.PROVE' +
        'EDOR = P.PROVEEDOR'
      'WHERE'
      'C.EMPRESA=?EMPRESA AND'
      'C.ARTICULO=?ARTICULO'
      'ORDER BY P.PRIORIDAD, C.PROVEEDOR')
    UniDirectional = True
    DataSource = DSSPStockAlmacen
    Left = 40
    Top = 112
  end
  object DSQMCodProv: TDataSource
    DataSet = QMCodProv
    Left = 136
    Top = 112
  end
  object frxStockAlmacen: TfrxHYReport
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
    OnBeforePrint = frxStockAlmacenBeforePrint
    OnGetValue = frxStockAlmacenGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
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
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 592
    Top = 16
  end
  object QMArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      '/* Todo menos los campos BLOB */'
      
        'SELECT EMPRESA, EJERCICIO, CANAL, ARTICULO, TITULO, FAMILIA, SUB' +
        'FAMILIA, P_COSTE, ABIERTO, VIRTUAL, CONTROL_STOCK, PAIS,'
      
        '       TIPO_IVA, CTA_COMPRAS, CTA_VENTAS, CTA_DEVOLUCION_COMPRAS' +
        ', CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS,'
      
        '       CTA_ABONO_VENTAS, ENTRADA, UNIDADES, TITULO_CORTO, DISPON' +
        'IBILIDAD, ACTUALIZA_VENTA, PTO_VERDE, CONTROLA_MEDIDAS,'
      
        '       SERIALIZADO, GARANTIA, PRODUCCION, DESCUENTO, DESCUENTO_2' +
        ', DESCUENTO_3, IVA_ESCANDALLO, PVP_POR_UD_SECUNDARIA,'
      
        '       ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, A' +
        'LFA_8, SERIALIZADO_KRI, LOTES_KRI, LOTES, MULTIPLO_1,'
      
        '       MULTIPLO_2, MULTIPLO_3, MULTIPLO_4, FACTOR_ESCALA, UD_MIN' +
        'IMO_COMPRA, UD_MINIMO_VENTA, ID_A_M_C_T, ID_A, ID_C_A,'
      
        '       IMAGEN, ID_GALERIA, CODIGO_INTRA, PESO, UBICABLE, VOLUMEN' +
        '_UNIT, DIAMETRO_UNIT, DEFECTO_UD_SECUNDARIA,'
      
        '       NO_CALCULA_STOCKMINMAX, ANTICIPO, ANTICIPO_CONTADO, ANTIC' +
        'IPO_PREG_DATOS, WEB, FABRICANTE, BAJA, FECHA_BAJA,'
      
        '       MOTIVO_BAJA, TIPO_CLAVE_ADR, CANTIDAD_LIMITADA, TIPO_ARTI' +
        'CULO_TYC, Z_MODELO, Z_LINEA, Z_SALIDA, Z_ARMAZON, Z_LONA,'
      
        '       Z_LONA_TIPO, Z_LONA_FORMA, Z_LONA_MODELO, Z_LONA_CONFECCI' +
        'ON, Z_LACADO, Z_TIPO_LACADO, Z_CORTE,'
      
        '       Z_QUITAR_SI_HAY_MOTOR, Z_SUSTITUTO, Z_KIT_TIPO, Z_PREPARA' +
        'BLE, Z_MERMA, Z_FORZAR_LACADO_SN, Z_TIPO_LACADO_FORZADO,'
      
        '       COMPONENTE_MOTOR, ULT_MODIFICACION, Z_LAM_ANCHO, Z_LAM_LA' +
        'RGO, Z_LAM_COLOR, SUBTIPO_ARTICULO_TYC, EXPORTAR,'
      
        '       COSTE_ADICIONAL, Z_QUITAR_SI_ES_MANUAL, ID_MARCA, MARCA, ' +
        'TITULO_MARCA, PMP, PRECIO_MERCADO, COD_COLOR_HILO,'
      
        '       ID_A_M, BLOQUEO_COMPRAS, MOTIVO_BLOQUEO_COMPRAS, BLOQUEO_' +
        'VENTAS, MOTIVO_BLOQUEO_VENTAS, ADR_PACKAGE,'
      
        '       TIPO_ARTICULO, TIPO_REGISTRO_FITOSANITARIO, PREPARABLE, T' +
        'IPO_IBAE, LITROS_POR_UNIDAD, Z_RIBETE_DEFECTO,'
      
        '       Z_LON_COLOR_1, Z_LON_COLOR_2, Z_LON_COLOR_3, FORMULA_DEFE' +
        'CTO, TIPO_IMPUESTO_ADICIONAL,'
      '       GENERAR_PEDIDO_COMPRA_SIEMPRE'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ARTICULO=?ARTICULO')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, ARTICULO, TITULO, TITULO_LARGO' +
        ', ID_FAMILIA, FAMILIA, ID_SUBFAMILIA, SUBFAMILIA,'
      
        '       P_COSTE, ABIERTO, VIRTUAL, CONTROL_STOCK, PAIS, TIPO_IVA,' +
        ' CTA_COMPRAS, CTA_VENTAS, CTA_DEVOLUCION_COMPRAS,'
      
        '       CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, CTA_ABONO_VENTA' +
        'S, ENTRADA, UNIDADES, TITULO_CORTO, DISPONIBILIDAD,'
      
        '       ACTUALIZA_VENTA, PTO_VERDE, CONTROLA_MEDIDAS, SERIALIZADO' +
        ', GARANTIA, PRODUCCION, DESCUENTO, DESCUENTO_2,'
      
        '       DESCUENTO_3, IVA_ESCANDALLO, PVP_POR_UD_SECUNDARIA, ALFA_' +
        '1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7,'
      
        '       ALFA_8, SERIALIZADO_KRI, LOTES_KRI, LOTES, MULTIPLO_1, MU' +
        'LTIPLO_2, MULTIPLO_3, MULTIPLO_4, FACTOR_ESCALA,'
      
        '       UD_MINIMO_COMPRA, UD_MINIMO_VENTA, ID_A_M_C_T, ID_A, ID_C' +
        '_A, IMAGEN, ID_GALERIA, CODIGO_INTRA, PESO, UBICABLE,'
      
        '       VOLUMEN_UNIT, DIAMETRO_UNIT, DEFECTO_UD_SECUNDARIA, NO_CA' +
        'LCULA_STOCKMINMAX, CRC_NOTAS, CRC_NOTAS_COMPRAS,'
      
        '       CRC_NOTAS_VENTAS, ANTICIPO, ANTICIPO_CONTADO, ANTICIPO_PR' +
        'EG_DATOS, WEB, FABRICANTE, BAJA, FECHA_BAJA,'
      
        '       MOTIVO_BAJA, TIPO_CLAVE_ADR, CANTIDAD_LIMITADA, TIPO_ARTI' +
        'CULO_TYC, Z_MODELO, Z_LINEA, Z_SALIDA, Z_ARMAZON, Z_LONA,'
      
        '       Z_LONA_TIPO, Z_LONA_FORMA, Z_LONA_MODELO, Z_LONA_CONFECCI' +
        'ON, Z_LACADO, Z_TIPO_LACADO, Z_CORTE,'
      
        '       Z_QUITAR_SI_HAY_MOTOR, Z_SUSTITUTO, Z_KIT_TIPO, Z_PREPARA' +
        'BLE, Z_MERMA, Z_FORZAR_LACADO_SN, Z_TIPO_LACADO_FORZADO,'
      
        '       COMPONENTE_MOTOR, ULT_MODIFICACION, Z_LAM_ANCHO, Z_LAM_LA' +
        'RGO, Z_LAM_COLOR, SUBTIPO_ARTICULO_TYC, EXPORTAR,'
      
        '       COSTE_ADICIONAL, Z_QUITAR_SI_ES_MANUAL, ID_MARCA, MARCA, ' +
        'TITULO_MARCA, PMP, PRECIO_MERCADO, COD_COLOR_HILO,'
      
        '       ID_A_M, BLOQUEO_COMPRAS, MOTIVO_BLOQUEO_COMPRAS, BLOQUEO_' +
        'VENTAS, MOTIVO_BLOQUEO_VENTAS, ADR_PACKAGE,'
      
        '       TIPO_ARTICULO, TIPO_REGISTRO_FITOSANITARIO, PREPARABLE, T' +
        'IPO_IBAE, LITROS_POR_UNIDAD, Z_RIBETE_DEFECTO,'
      
        '       Z_LON_COLOR_1, Z_LON_COLOR_2, Z_LON_COLOR_3, FORMULA_DEFE' +
        'CTO, TIPO_IMPUESTO_ADICIONAL,'
      
        '       GENERAR_PEDIDO_COMPRA_SIEMPRE, SECCION, FACTOR_UNIDAD, NO' +
        '_APLICA_DESC_LINEA_CLIENTE, ALTO, ANCHO, FONDO,'
      
        '       FECHA_ALTA, KG_PLASTICO_VIRGEN, IMPORTE_IEPNR, TASA_DE_DE' +
        'STRUCCION, PASTADAS, PASTADA_CANT_ETIQUETAS'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO')
    UniDirectional = True
    DataSource = DSSPStockAlmacen
    Left = 40
    Top = 160
  end
  object DSQMArticulo: TDataSource
    DataSet = QMArticulo
    Left = 136
    Top = 160
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT L.ID_LOTE, L.LOTE, L.CLASIFICACION, L.F_ENVASADO, L.F_CAD' +
        'UCIDAD, L.F_FABRICACION, L.PROVEEDOR,'
      '       (SELECT STOCK'
      
        '        FROM A_ART_DAME_STOCK_LOTE_UBIC_FEC(:EMPRESA, :CANAL, :A' +
        'LMACEN, L.ID_LOTE, -1, :FECHA)) STOCK'
      'FROM ART_ARTICULOS_LOTES L'
      'WHERE'
      'L.EMPRESA = :EMPRESA AND'
      'L.ARTICULO = :ARTICULO'
      'ORDER BY L.F_FABRICACION')
    UniDirectional = True
    DataSource = DSSPStockAlmacen
    Left = 40
    Top = 208
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 136
    Top = 208
  end
  object frDBDxLotes: TfrDBDataSet
    DataSource = DSxLotes
    OpenDataSource = False
    Left = 240
    Top = 208
  end
  object xNrosSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT LIST(S.NSERIE, '#39', '#39') LISTA, COUNT(*) CANTIDAD'
      'FROM ART_ARTICULOS_SERIALIZACION S'
      'WHERE'
      'S.EMPRESA = :EMPRESA AND'
      'S.ARTICULO = :ARTICULO AND'
      'S.CANAL = :CANAL AND'
      'S.ALMACEN = :ALMACEN AND'
      '((SELECT DISPONIBLE'
      
        '  FROM A_ART_NSERIE_DISP_FECHA(S.EMPRESA, S.CANAL, S.CODIGO, S.A' +
        'LMACEN, :FECHA)) = 1)')
    UniDirectional = True
    DataSource = DSSPStockAlmacen
    Left = 40
    Top = 256
  end
  object DSxNrosSerie: TDataSource
    DataSet = xNrosSerie
    Left = 136
    Top = 256
  end
  object frDBxNrosSerie: TfrDBDataSet
    DataSource = DSxNrosSerie
    OpenDataSource = False
    Left = 240
    Top = 256
  end
  object DSModelo: TDataSource
    DataSet = xModelo
    Left = 136
    Top = 312
  end
  object frDBModelo: TfrDBDataSet
    DataSet = xModelo
    Left = 240
    Top = 312
  end
  object xModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TStocks
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      
        'SELECT M.*, F.TITULO AS TITULO_FAMILIA, S.TITULO AS TITULO_SUBFA' +
        'MILIA, TT.TITULO AS TITULO_TEMPORADA,'
      '       G.TITULO AS TITULO_GENERO, MM.TITULO TITULO_MARCA'
      'FROM ART_ARTICULOS_MODELOS M'
      'JOIN ART_ARTICULOS_MOD_MARCAS MM ON M.ID_MARCA = MM.ID_MARCA'
      
        'JOIN ART_FAMILIAS F ON (M.EMPRESA = F.EMPRESA AND M.FAMILIA = F.' +
        'FAMILIA)'
      
        'LEFT JOIN ART_SUBFAMILIAS S ON (F.EMPRESA = S.EMPRESA AND F.ID_F' +
        'AMILIA = S.ID_FAMILIA AND M.SUBFAMILIA = S.SUBFAMILIA)'
      
        'LEFT JOIN ART_ARTICULOS_MOD_GENERO G ON (M.CODIGO_GENERO = G.COD' +
        'IGO)'
      
        'LEFT JOIN ART_ARTICULOS_MOD_TEMPORADA TT ON (M.CODIGO_TEMPORADA ' +
        '= TT.CODIGO)'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY REF_PROVEEDOR')
    UniDirectional = False
    AfterOpen = xModeloAfterOpen
    BeforeClose = xModeloBeforeClose
    Left = 40
    Top = 312
  end
  object xModeloColorStock: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TStocks
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      'select *'
      
        'from xget_stock_am(:empresa, :canal, :almacen, :id_a_m, :fecha, ' +
        '0 /*modo*/, 0, '#39#39' )')
    UniDirectional = False
    DataSource = DSModelo
    Left = 40
    Top = 360
  end
  object DSxModeloColor: TDataSource
    DataSet = xModeloColorStock
    Left = 136
    Top = 360
  end
  object frDBModeloColor: TfrDBDataSet
    DataSet = xModeloColorStock
    Left = 240
    Top = 360
  end
  object TStocks: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 592
    Top = 64
  end
  object QMTituloTalla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM XGET_TALLAS'
      'WHERE'
      'ID_G_T = :ID_G_T')
    UniDirectional = False
    DataSource = DSModelo
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    Left = 344
    Top = 312
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 416
    Top = 312
  end
  object QMColor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_COLORES'
      'WHERE'
      'ID_A_C = :ID_A_C')
    UniDirectional = False
    DataSource = DSxModeloColor
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    Left = 344
    Top = 360
  end
  object DSColor: TDataSource
    DataSet = QMColor
    Left = 416
    Top = 360
  end
  object xUnidLogistica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT U.*, T.TITULO, T.UNIDADES, T.RELACIONAR_CON_UNIDADES'
      'FROM ART_ARTICULOS_UNIDAD_LOGISTICA U'
      'JOIN SYS_TIPO_UNIDAD_LOGISTICA T ON U.TIPO = T.TIPO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'U.DEFECTO = 1')
    UniDirectional = True
    DataSource = DSSPStockAlmacen
    Left = 40
    Top = 408
  end
  object DSxUnidLogistica: TDataSource
    DataSet = xUnidLogistica
    Left = 136
    Top = 408
  end
end
