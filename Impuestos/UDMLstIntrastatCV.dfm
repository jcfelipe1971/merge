object DMLstIntrastatCV: TDMLstIntrastatCV
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 343
  Top = 309
  Height = 337
  Width = 551
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 376
    Top = 8
  end
  object frIntrastatCV: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Riesgo de Bancos'
    RebuildPrinter = False
    OnGetValue = frIntrastatCVGetValue
    OnBeforePrint = frIntrastatCVBeforePrint
    OnEnterRect = frIntrastatCVBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 376
    Top = 56
    ReportForm = {19000000}
  end
  object DSIntrastatCV: TDataSource
    DataSet = xIntrastatCV
    Left = 112
    Top = 8
  end
  object frDBDSIntrastatCV: TfrDBDataSet
    DataSource = DSIntrastatCV
    Left = 208
    Top = 8
  end
  object xIntrastatCV: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_GENERA_INTRASTAT_VENTAS'
      '(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PERIODO)')
    UniDirectional = False
    AfterOpen = xIntrastatCVAfterOpen
    Left = 24
    Top = 8
  end
  object xPeriodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, DESDE, HASTA,PERIODO FROM EMP_PERIODOS'
      'WHERE '
      '  ((EMPRESA=?EMPRESA) AND'
      '   (EJERCICIO=?EJERCICIO) AND'
      '   (PERIODO=?PERIODO))')
    UniDirectional = False
    Left = 24
    Top = 56
    object xPeriodoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 50
    end
    object xPeriodoDESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object xPeriodoHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
  end
  object DSxPeriodo: TDataSource
    DataSet = xPeriodo
    Left = 112
    Top = 56
  end
  object frxIntrastatCV: TfrxHYReport
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
    OnBeforePrint = frxIntrastatCVBeforePrint
    OnGetValue = frxIntrastatCVGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 376
    Top = 104
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
      'nowait')
    Left = 472
    Top = 8
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* SQL Dinamica */'
      
        'SELECT CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SERIE, CAB.TIP' +
        'O, CAB.RIG, DET.LINEA, CAB.FECHA, FAC.PROVEEDOR CODCLI,'
      
        '       ART.ARTICULO, DET.UNIDADES, DET.P_COSTE PRECIO, CAB.MONED' +
        'A, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.NIF,'
      
        '       D.DIR_COMPLETA_N, 0 AS TRANSPORTISTA, PRO.CODIGO_INCOTERM' +
        ', I.TITULO DESCRIPCION_INCOTERM,'
      
        '       PRO.INTRA_TRANS TIPO_TRANSPORTE, TRA.TITULO DESCRIPCION_T' +
        'IPO_TRANSPORTE'
      'FROM GES_DETALLES_E DET'
      'JOIN GES_CABECERAS_E_FAC FAC ON (DET.ID_E = FAC.ID_E)'
      'JOIN GES_CABECERAS_E CAB ON (FAC.ID_E = CAB.ID_E)'
      
        'JOIN EMP_PROVEEDORES PRO ON ((FAC.EMPRESA = PRO.EMPRESA) AND (FA' +
        'C.PROVEEDOR = PRO.PROVEEDOR))'
      'JOIN SYS_TERCEROS T ON PRO.TERCERO = T.TERCERO'
      
        'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AND 1 =' +
        ' D.DIR_DEFECTO'
      'JOIN SYS_CODIGO_INCOTERM I ON PRO.CODIGO_INCOTERM = I.CODIGO'
      'JOIN SYS_TIPOS_TRANSPORTE TRA ON PRO.INTRA_TRANS = TRA.TIPO'
      'JOIN SYS_MODO_IVA M ON FAC.MODO_IVA = M.MODO'
      'LEFT JOIN SYS_PAISES P ON (P.PAIS_C2 = PRO.PAIS_C2)'
      'LEFT JOIN ART_ARTICULOS ART ON (DET.ID_A = ART.ID_A)'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA AND'
      'CAB.EJERCICIO = :EJERCICIO AND'
      'CAB.CANAL = :CANAL AND'
      'CAB.SERIE = :SERIE AND'
      'CAB.FECHA >= :DESDE AND'
      'CAB.FECHA <= :HASTA AND'
      'CAB.TIPO = '#39'FAP'#39' AND'
      '((CAB.ESTADO = 5) OR (CAB.ESTADO = 6)) AND'
      'PRO.INTRA = 1 AND'
      'P.PERTENECE_CEE = 1 AND'
      'PRO.PAIS_C2 <> '#39'ES'#39' AND'
      'PRO.PAIS_C2 = :COD_PAIS AND'
      'ART.CODIGO_INTRA = :COD_INTRASTAT AND'
      'M.TIPO_TRANSACCION = 1'
      'ORDER BY CAB.RIG, DET.LINEA')
    UniDirectional = False
    DataSource = DSIntrastatCV
    Left = 24
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = xDetalle
    Left = 112
    Top = 104
  end
  object frDBDDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 208
    Top = 104
  end
end
