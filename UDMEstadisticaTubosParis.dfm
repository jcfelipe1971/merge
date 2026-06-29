object DMEstadisticaTubosParis: TDMEstadisticaTubosParis
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 326
  Top = 251
  Height = 499
  Width = 551
  object xEstFamAgeCliArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- AGE.CLI.ART.FAM'
      
        'SELECT C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, D.ARTICULO, A.FAM' +
        'ILIA, SUM(DF.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN,'
      '       --'
      '       AA.STOCK_MINIMO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      
        'LEFT JOIN ART_ARTICULOS_ALMACENES_ART AA ON (D.EMPRESA = AA.EMPR' +
        'ESA AND D.CANAL = AA.CANAL AND D.ARTICULO = AA.ARTICULO AND AA.A' +
        'LMACEN = '#39'000'#39')'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      
        'GROUP BY C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, D.ARTICULO, A.F' +
        'AMILIA, AA.STOCK_MINIMO'
      
        'ORDER BY A.FAMILIA, PESO DESC, C.AGENTE, C.CLIENTE, T.NOMBRE_R_S' +
        'OCIAL, D.ARTICULO')
    UniDirectional = False
    AfterOpen = xEstFamAgeCliArtAfterOpen
    AfterScroll = xEstFamAgeCliArtAfterScroll
    BeforeClose = xEstFamAgeCliArtBeforeClose
    Left = 40
    Top = 56
  end
  object DSxEstFamAgeCliArt: TDataSource
    DataSet = xEstFamAgeCliArt
    Left = 144
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 144
    Top = 8
  end
  object xEstAgeCliFam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- AGE.CLI.FAM'
      
        'SELECT C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, A.FAMILIA, SUM(DF' +
        '.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, A.FAMILIA'
      
        'ORDER BY C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, PESO DESC, A.FA' +
        'MILIA')
    UniDirectional = False
    AfterOpen = xEstAgeCliFamAfterOpen
    AfterScroll = xEstAgeCliFamAfterScroll
    BeforeClose = xEstAgeCliFamBeforeClose
    Left = 40
    Top = 104
  end
  object DSxEstAgeCliFam: TDataSource
    DataSet = xEstAgeCliFam
    Left = 144
    Top = 104
  end
  object xEstAgeCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, TA.NOMBRE_R_SOCIA' +
        'L NOMBRE_AGENTE, SUM(DF.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS' +
        ','
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      
        'JOIN EMP_AGENTES AG ON (C.EMPRESA = AG.EMPRESA AND C.AGENTE=AG.A' +
        'GENTE)'
      'JOIN SYS_TERCEROS TA ON (AG.TERCERO = TA.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      
        'GROUP BY C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, TA.NOMBRE_R_SOC' +
        'IAL'
      'ORDER BY C.AGENTE, PESO DESC, C.CLIENTE, T.NOMBRE_R_SOCIAL')
    UniDirectional = False
    AfterOpen = xEstAgeCliAfterOpen
    AfterScroll = xEstAgeCliAfterScroll
    BeforeClose = xEstAgeCliBeforeClose
    Left = 40
    Top = 200
  end
  object DSxEstAgeCli: TDataSource
    DataSet = xEstAgeCli
    Left = 144
    Top = 200
  end
  object xEstAgeFamCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- AGE.FAM.CLI'
      
        'SELECT C.AGENTE, A.FAMILIA, C.CLIENTE, T.NOMBRE_R_SOCIAL, SUM(DF' +
        '.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY C.AGENTE, A.FAMILIA, C.CLIENTE, T.NOMBRE_R_SOCIAL'
      
        'ORDER BY C.AGENTE, A.FAMILIA, PESO DESC, C.CLIENTE, T.NOMBRE_R_S' +
        'OCIAL')
    UniDirectional = False
    Left = 40
    Top = 152
  end
  object DSxEstAgeFamCli: TDataSource
    DataSet = xEstAgeFamCli
    Left = 144
    Top = 152
  end
  object xEstCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT C.CLIENTE, C.AGENTE, T.NOMBRE_R_SOCIAL, SUM(DF.UNIDADES_L' +
        'OGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY C.CLIENTE, C.AGENTE, T.NOMBRE_R_SOCIAL'
      'ORDER BY PESO DESC, C.CLIENTE, C.AGENTE, T.NOMBRE_R_SOCIAL')
    UniDirectional = False
    AfterOpen = xEstCliAfterOpen
    BeforeClose = xEstCliBeforeClose
    Left = 40
    Top = 248
  end
  object DSxEstCli: TDataSource
    DataSet = xEstCli
    Left = 144
    Top = 248
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    OnBeforePrint = frListadoEnterRect
    OnEnterRect = frListadoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 296
    Top = 8
    ReportForm = {19000000}
  end
  object frDBxEstAgeCliArtFam: TfrDBDataSet
    DataSet = xEstFamAgeCliArt
    Left = 296
    Top = 56
  end
  object frxListado: TfrxHYReport
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
    OnBeforePrint = frxListadoBeforePrint
    OnGetValue = frxListadoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 376
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBxEstAgeCliFam: TfrDBDataSet
    DataSet = xEstAgeCliFam
    Left = 296
    Top = 104
  end
  object frDBxEstAgeFamCli: TfrDBDataSet
    DataSet = xEstAgeFamCli
    Left = 296
    Top = 152
  end
  object frDBxEstAgeCli: TfrDBDataSet
    DataSet = xEstAgeCli
    Left = 296
    Top = 200
  end
  object frDBxEstCli: TfrDBDataSet
    DataSet = xEstCli
    Left = 296
    Top = 248
  end
  object xTotEstAgeCliArtFam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '-- TOTAL AGE.CLI.ART.*FAM*'
      
        'SELECT A.FAMILIA, MIN(F.TITULO) TITULO, SUM(DF.UNIDADES_LOGISTIC' +
        'AS) UNIDADES_LOGISTICAS, SUM(D.UNIDADES) UNIDADES,'
      '       SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      
        'JOIN ART_FAMILIAS F ON (A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.' +
        'FAMILIA)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA AND'
      'A.FAMILIA = :FAMILIA'
      'GROUP BY A.FAMILIA')
    UniDirectional = False
    Left = 448
    Top = 56
  end
  object xTotEstAgeCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT C.AGENTE, MIN(TA.NOMBRE_R_SOCIAL) TITULO, SUM(DF.UNIDADES' +
        '_LOGISTICAS) UNIDADES_LOGISTICAS, SUM(D.UNIDADES) UNIDADES,'
      '       SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      
        'JOIN EMP_AGENTES AG ON C.EMPRESA = AG.EMPRESA AND C.AGENTE = AG.' +
        'AGENTE'
      'JOIN SYS_TERCEROS TA ON AG.TERCERO = TA.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      'C.AGENTE = :AGENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY C.AGENTE')
    UniDirectional = False
    Left = 448
    Top = 200
  end
  object xTotEstCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SUM(DF.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA')
    UniDirectional = False
    Left = 448
    Top = 248
  end
  object xEstFam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- FAM'
      
        'SELECT A.FAMILIA, SUM(DF.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICA' +
        'S,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY A.FAMILIA'
      'ORDER BY PESO DESC, A.FAMILIA')
    UniDirectional = False
    AfterOpen = xEstCliAfterOpen
    BeforeClose = xEstCliBeforeClose
    Left = 40
    Top = 296
  end
  object DSxEstFam: TDataSource
    DataSet = xEstFam
    Left = 144
    Top = 296
  end
  object xEstFamArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- FAM-ART'
      
        'SELECT A.FAMILIA, A.ARTICULO, A.TITULO_LARGO DESCRIPCION, SUM(DF' +
        '.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN,'
      '       --'
      '       AA.STOCK_MINIMO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      
        'LEFT JOIN ART_ARTICULOS_ALMACENES_ART AA ON (D.EMPRESA = AA.EMPR' +
        'ESA AND D.CANAL = AA.CANAL AND D.ARTICULO = AA.ARTICULO AND AA.A' +
        'LMACEN = '#39'000'#39')'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY A.FAMILIA, A.ARTICULO, A.TITULO_LARGO, AA.STOCK_MINIMO'
      'ORDER BY A.FAMILIA, PESO DESC, A.ARTICULO')
    UniDirectional = False
    AfterOpen = xEstCliAfterOpen
    BeforeClose = xEstCliBeforeClose
    Left = 40
    Top = 344
  end
  object DSxEstFamArt: TDataSource
    DataSet = xEstFamArt
    Left = 144
    Top = 344
  end
  object xTotEstAgeCliFam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '-- AGE.CLI.FAM'
      'SELECT SUM(DF.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS,'
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      'C.AGENTE = :AGENTE AND'
      'C.CLIENTE = :CLIENTE AND'
      '-- A.FAMILIA = _FAMILIA AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA')
    UniDirectional = False
    Left = 448
    Top = 296
  end
  object xEstAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, TA.NOMBRE_R_SOCIA' +
        'L NOMBRE_AGENTE, SUM(DF.UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS' +
        ','
      '       SUM(D.UNIDADES) UNIDADES, SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      
        'JOIN EMP_AGENTES AG ON (C.EMPRESA = AG.EMPRESA AND C.AGENTE=AG.A' +
        'GENTE)'
      'JOIN SYS_TERCEROS TA ON (AG.TERCERO = TA.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      '-- C.CLIENTE = _CLIENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      
        'GROUP BY C.AGENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL, TA.NOMBRE_R_SOC' +
        'IAL'
      'ORDER BY C.AGENTE, PESO DESC, C.CLIENTE, T.NOMBRE_R_SOCIAL')
    UniDirectional = False
    AfterOpen = xEstAgenteAfterOpen
    AfterScroll = xEstAgenteAfterScroll
    BeforeClose = xEstAgenteBeforeClose
    Left = 40
    Top = 392
  end
  object DSxEstAgente: TDataSource
    DataSet = xEstAgente
    Left = 144
    Top = 392
  end
  object frDBDxEstAgente: TfrDBDataSet
    DataSet = xEstAgente
    Left = 296
    Top = 392
  end
  object xTotEstAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT C.AGENTE, MIN(TA.NOMBRE_R_SOCIAL) TITULO, SUM(DF.UNIDADES' +
        '_LOGISTICAS) UNIDADES_LOGISTICAS, SUM(D.UNIDADES) UNIDADES,'
      '       SUM(PESO_REAL) PESO,'
      '       CASE SUM(D.UNIDADES)'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (SUM(D.B_DTO_LINEA) / SUM(D.UNIDADES))'
      '       END PRE_MEDIO,'
      '       SUM(D.B_DTO_LINEA) IMPORTE, SUM(D.T_COSTE) COSTE,'
      '       CASE SUM(D.B_DTO_LINEA)'
      '         WHEN 0 THEN'
      '             0'
      
        '         ELSE ((SUM(D.B_DTO_LINEA) - SUM(D.T_COSTE)) * 100) / (S' +
        'UM(D.B_DTO_LINEA))'
      '       END MARGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON (C.ID_S = D.ID_S)'
      
        'JOIN GES_DETALLES_S_ALB DF ON (D.ID_DETALLES_S = DF.ID_DETALLES_' +
        'S)'
      
        'JOIN ART_ARTICULOS A ON (D.EMPRESA = A.EMPRESA AND D.ARTICULO = ' +
        'A.ARTICULO)'
      'JOIN SYS_TERCEROS T ON (C.TERCERO = T.TERCERO)'
      
        'JOIN EMP_AGENTES AG ON C.EMPRESA = AG.EMPRESA AND C.AGENTE = AG.' +
        'AGENTE'
      'JOIN SYS_TERCEROS TA ON AG.TERCERO = TA.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'ALB'#39' AND'
      'C.AGENTE = :AGENTE AND'
      'C.FECHA >= :FECHA_DESDE AND'
      'C.FECHA <= :FECHA_HASTA'
      'GROUP BY C.AGENTE')
    UniDirectional = False
    Left = 448
    Top = 392
  end
end
