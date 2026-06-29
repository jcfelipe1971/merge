object DMRFichasArticulos: TDMRFichasArticulos
  OldCreateOrder = False
  OnCreate = DMRFichasArticulosCreate
  OnDestroy = DMRArticulosDestroy
  Left = 316
  Top = 148
  Height = 670
  Width = 807
  object frArticulos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frArticulosGetValue
    OnBeforePrint = frArticulosEnterRect
    OnEnterRect = frArticulosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 72
    ReportForm = {19000000}
  end
  object xArt_Mov_Stock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TArtMovStock
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT EMPRESA,EJERCICIO,CANAL,N_MOV_STOCK,PERIODO,ALMACEN,ARTIC' +
        'ULO,TIPO_OPER,'
      
        '              FECHA,COMENTARIO,UNIDADES,PRECIO,ORIGEN,IMPORTE,DO' +
        'C_NUMERO,DOC_SERIE,ENTRADA,ACTIVO,UNIDADES_EXT, '
      
        '              PRECIO_SIN_DTO,EMP.CLIENTE AS CLIENTE,TER.NOMBRE_R' +
        '_SOCIAL AS TITULO_CLIENTE,'
      
        '              DIR.DIR_COMPLETA_N AS DIRECCION,LOC.TITULO AS LOCA' +
        'LIDAD,MOV_VIRTUAL, gd.B_IMPONIBLE , gd.P_COSTE, gd.t_coste,gd.lo' +
        'te_simple /*dji lrk kri*/'
      '       FROM ART_MOV_STOCKS ART '
      '       LEFT JOIN GES_CABECERAS_S G ON ((ART.DOC_NUMERO=G.RIG) '
      
        '              AND(ART.EMPRESA=G.EMPRESA)AND(ART.EJERCICIO=G.EJER' +
        'CICIO)AND(ART.CANAL=G.CANAL) '
      '              AND(ART.DOC_SERIE=G.SERIE)AND(ART.ORIGEN=G.TIPO)) '
      'left join ges_detalles_s gd'
      'on'
      'art.empresa = gd.empresa and'
      'art.ejercicio = gd.ejercicio and'
      'art.canal = gd.canal and'
      'art.origen = gd.tipo and'
      'art.doc_serie = gd.serie and'
      'art.doc_numero = gd.rig and'
      'art.n_mov_stock = gd.M_MOV_STOCK'
      
        '       LEFT JOIN VER_CLIENTES_EMPRESA EMP ON ((EMP.EMPRESA=ART.E' +
        'MPRESA)AND(EMP.CLIENTE=G.CLIENTE)) '
      
        '       LEFT JOIN SYS_TERCEROS_DIRECCIONES DIR ON(DIR.TERCERO=EMP' +
        '.TERCERO) '
      '       LEFT JOIN SYS_TERCEROS TER ON (EMP.TERCERO=TER.TERCERO)'
      
        '       LEFT JOIN SYS_LOCALIDADES LOC ON (LOC.LOCALIDAD=DIR.DIR_L' +
        'OCALIDAD) '
      '        WHERE'
      
        '             (ART.EMPRESA=?EMPRESA AND ART.CANAL>=?CANALD AND AR' +
        'T.CANAL<=?CANALH'
      
        '              AND ART.EJERCICIO=?EJERCICIO AND ART.PERIODO >= ?D' +
        'ESDE_PERIODO AND ART.PERIODO <= ?HASTA_PERIODO '
      
        '              AND ART.ALMACEN >= ?DESDE_ALMACEN AND ART.ALMACEN ' +
        '<= ?HASTA_ALMACEN '
      
        '              AND ART.ARTICULO >= ?DESDE_ARTICULO AND ART.ARTICU' +
        'LO <= ?HASTA_ARTICULO '
      
        '              AND G.CLIENTE >= ?CLIENTED AND G.CLIENTE <= ?CLIEN' +
        'TEH)'
      'ORDER BY ALMACEN,ARTICULO,CLIENTE,FECHA,N_MOV_STOCK ')
    UniDirectional = False
    Left = 40
    Top = 120
  end
  object xArt_Articulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO   ')
    UniDirectional = False
    DataSource = DSxArt_Mov_Stock
    Left = 40
    Top = 168
  end
  object DSxArt_Mov_Stock: TDataSource
    DataSet = xArt_Mov_Stock
    Left = 128
    Top = 120
  end
  object SPRSaldos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE A_ART_SALDO_INI(:EMPRESA, :EJERCICIO, :CANAL, ' +
        ':ALMACEN, :ARTICULO, :PER_INI)')
    Transaction = TLocal
    AutoTrans = False
    Left = 240
    Top = 312
  end
  object xArt_Almacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ALMACENES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ALMACEN = :ALMACEN')
    UniDirectional = False
    DataSource = DSxArt_Mov_Stock
    Left = 40
    Top = 216
  end
  object frDSxArt_Mov_Stock: TfrDBDataSet
    DataSource = DSxArt_Mov_Stock
    Left = 240
    Top = 72
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 360
    Top = 24
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 360
    Top = 72
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 464
    Top = 24
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 464
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 24
  end
  object xPeriodo_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_PERIODOS'
      'WHERE periodo=?periodo')
    UniDirectional = False
    Left = 576
    Top = 24
  end
  object DSxPeriodo_Desde: TDataSource
    DataSet = xPeriodo_Desde
    Left = 680
    Top = 24
  end
  object xPeriodo_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_PERIODOS'
      'WHERE periodo=?periodo'
      ''
      '')
    UniDirectional = False
    Left = 576
    Top = 72
  end
  object DSxPeriodo_Hasta: TDataSource
    DataSet = xPeriodo_Hasta
    Left = 680
    Top = 72
  end
  object xAlmacen_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    Left = 360
    Top = 168
  end
  object DSxAlmacen_Desde: TDataSource
    DataSet = xAlmacen_Desde
    Left = 464
    Top = 120
  end
  object DSxAlmacen_Hasta: TDataSource
    DataSet = xAlmacen_Hasta
    Left = 464
    Top = 168
  end
  object frUserDSCodBarras: TfrUserDataset
    OnCheckEOF = frUserDSCodBarrasCheckEOF
    OnFirst = frUserDSCodBarrasFirst
    OnNext = frUserDSCodBarrasNext
    Left = 240
    Top = 120
  end
  object xArtBarras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS'
      'WHERE ARTICULO=?ARTICULO and empresa=?empresa')
    UniDirectional = False
    Left = 576
    Top = 120
  end
  object DsxArtBarras: TDataSource
    DataSet = xArtBarras
    Left = 680
    Top = 120
  end
  object SPMovResumido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM A_ART_MOV_RESUMIDO(?EMPRESA,?EJERCICIO,?CANALD,?CA' +
        'NALH,'
      '  ?DESDE_PERIODO,?HASTA_PERIODO,?DESDE_ALMACEN,?HASTA_ALMACEN,'
      '  ?DESDE_ARTICULO,?HASTA_ARTICULO,?FAMILIAD,?FAMILIAH )')
    UniDirectional = False
    Left = 360
    Top = 312
  end
  object frDBSPMovResumido: TfrDBDataSet
    DataSource = DSSPMovResumido
    Left = 576
    Top = 312
  end
  object xAlmacen_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    Left = 360
    Top = 120
  end
  object DSSPMovResumido: TDataSource
    DataSet = SPMovResumido
    Left = 464
    Top = 312
  end
  object xCanalDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM gen_canales'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 360
    Top = 360
  end
  object DSxCanalDesde: TDataSource
    DataSet = xCanalDesde
    Left = 464
    Top = 360
  end
  object DSxCanalHasta: TDataSource
    DataSet = xCanalHasta
    Left = 680
    Top = 360
  end
  object xCanalHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM gen_canales'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 576
    Top = 360
  end
  object xClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA'
      '   AND CLIENTE=?CLIENTE ')
    UniDirectional = True
    Left = 360
    Top = 216
  end
  object DSxClienteD: TDataSource
    DataSet = xClienteD
    Left = 464
    Top = 216
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA '
      '  AND CLIENTE=?CLIENTE ')
    UniDirectional = True
    Left = 360
    Top = 264
  end
  object DSxClienteH: TDataSource
    DataSet = xClienteH
    Left = 464
    Top = 264
  end
  object xNombre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT C.TERCERO, T.NOMBRE_R_SOCIAL'
      'FROM GES_CABECERAS_S C'
      'LEFT JOIN SYS_TERCEROS T ON T.TERCERO = C.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :DOC_SERIE AND'
      'C.TIPO = :ORIGEN AND'
      'C.RIG = :DOC_NUMERO')
    UniDirectional = False
    DataSource = DSxArt_Mov_Stock
    Left = 240
    Top = 168
  end
  object QPorcEscandallo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT * FROM A_ART_PORC_COMP_ESCANDALLO(:EMPRESA, :CANAL, :ALMA' +
        'CEN, :FECHA, :ARTICULO, :DETALLE)')
    Transaction = TLocal
    AutoTrans = False
    Left = 240
    Top = 216
  end
  object QMovOrigen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT A.ARTICULO, G.B_IMPONIBLE'
      'FROM ART_MOV_STOCKS A'
      
        'LEFT JOIN GES_DETALLES_S G ON A.EMPRESA = G.EMPRESA AND A.EJERCI' +
        'CIO = G.EJERCICIO AND A.CANAL = G.CANAL AND A.ORIGEN = G.TIPO AN' +
        'D A.DOC_SERIE = G.SERIE AND A.DOC_NUMERO = G.RIG AND A.N_MOV_STO' +
        'CK = G.M_MOV_STOCK'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.EJERCICIO = :EJERCICIO AND'
      'A.CANAL = :CANAL AND'
      'A.N_MOV_STOCK = :N_MOV_STOCK')
    Transaction = TLocal
    AutoTrans = False
    Left = 240
    Top = 264
  end
  object xStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from a_art_dame_stock_almacenes (?EMPRESA, ?CANAL_D, ?C' +
        'ANAL_H,'
      '?ARTICULO, ?ALMACEN_D, ?ALMACEN_H, ?FECHA)')
    UniDirectional = False
    DataSource = DSxArt_Mov_Stock
    Left = 576
    Top = 216
  end
  object DSxStock: TDataSource
    DataSet = xStock
    Left = 680
    Top = 216
  end
  object xMovD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_MOVIMIENTO'
      'WHERE TIPO = ?TIPO')
    UniDirectional = False
    Left = 360
    Top = 408
  end
  object DSxMovD: TDataSource
    DataSet = xMovD
    Left = 464
    Top = 408
  end
  object xMovH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_MOVIMIENTO'
      'WHERE TIPO = ?TIPO')
    UniDirectional = False
    Left = 576
    Top = 408
  end
  object DSxMovH: TDataSource
    DataSet = xMovH
    Left = 680
    Top = 408
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo'
      'from art_familias'
      'where empresa = ?empresa and familia=?familia')
    UniDirectional = False
    Left = 360
    Top = 456
    object xFamiliaDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_familias'
      'where empresa = ?empresa and familia=?familia')
    UniDirectional = False
    Left = 576
    Top = 456
    object xFamiliaHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 464
    Top = 456
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 680
    Top = 456
  end
  object SaldoUdsAnt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE A_ART_OBTENER_HISTINFO(:EMPRESA, :CANAL, :ALMA' +
        'CEN, :ARTICULO, :FECHA, 1, :ID_A)')
    Transaction = TLocal
    AutoTrans = False
    Left = 240
    Top = 360
  end
  object frxArticulos: TfrxHYReport
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
    OnBeforePrint = frxArticulosBeforePrint
    OnGetValue = frxArticulosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 128
    Top = 72
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TArtMovStock: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 24
  end
end
