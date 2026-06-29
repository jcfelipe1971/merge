object ProDMLstOrden: TProDMLstOrden
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 213
  Top = 143
  Height = 781
  Width = 1083
  object xOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_ORDEN, COMPUESTO FROM PRO_ORD'
      'WHERE ID_ORDEN=?ID_ORDEN')
    UniDirectional = False
    AfterOpen = xOrdenAfterOpen
    BeforeClose = xOrdenBeforeClose
    Left = 48
    Top = 16
    object xOrdenID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xOrdenCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
  end
  object xFaseD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_ORDEN, FASE FROM PRO_ORD_FASES'
      'WHERE'
      'ID_ORDEN=?ID_ORDEN AND'
      'LINEA_FASE=?LINEA_FASE')
    UniDirectional = False
    Left = 48
    Top = 112
    object xFaseDID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xFaseDFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
  end
  object xFaseH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_ORDEN, FASE FROM PRO_ORD_FASES'
      'WHERE'
      'ID_ORDEN=?ID_ORDEN AND'
      'LINEA_FASE=?LINEA_FASE')
    UniDirectional = False
    Left = 48
    Top = 160
    object xFaseHFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xFaseHID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 808
    Top = 8
  end
  object DSOrden: TDataSource
    DataSet = xOrden
    Left = 152
    Top = 16
  end
  object DSFaseD: TDataSource
    DataSet = xFaseD
    Left = 152
    Top = 112
  end
  object DSFaseH: TDataSource
    DataSet = xFaseH
    Left = 152
    Top = 160
  end
  object xCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?COMPUESTO')
    UniDirectional = False
    DataSource = DSLstOrden
    Left = 392
    Top = 592
  end
  object DSCompuesto: TDataSource
    DataSet = xCompuesto
    Left = 520
    Top = 592
  end
  object QMLstOrden: TFIBDataSetRO
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
      '       ART.NOTAS NOTAS_ART,'
      
        '       ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ART.ALFA_4, ART.ALFA_' +
        '5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_8'
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
      '/*'
      
        'LEFT JOIN PRO_ORD_MAT_LOTES LOT ON (LOT.EMPRESA = ORD.EMPRESA AN' +
        'D LOT.EJERCICIO = ORD.EJERCICIO AND LOT.CANAL = ORD.CANAL AND LO' +
        'T.SERIE = ORD.SERIES AND LOT.NORDEN = ORD.RIG_OF)'
      '*/'
      'WHERE'
      'ORD.ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    AfterOpen = QMLstOrdenAfterOpen
    BeforeClose = QMLstOrdenBeforeClose
    Left = 392
    Top = 64
  end
  object QMLstFases: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      'ID_ORDEN, EMPRESA, EJERCICIO, CANAL, SERIES, RIG_OF,'
      'SUBORDEN, LINEA_FASE, FASE, ORDEN, TIPOFASE, NOTAS,'
      'ID_IMAGEN, MERMA_FASE_PREV, PIEZAS_HORA_PREV'
      'FROM PRO_ORD_FASES'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_FASE = :LINEA_FASE')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_FASES'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_FASE >= :FASED AND'
      'LINEA_FASE <= :FASEH'
      'ORDER BY ORDEN, LINEA_FASE')
    UniDirectional = False
    DataSource = DSLstOrden
    AfterOpen = QMLstFasesAfterOpen
    BeforeClose = QMLstFasesBeforeClose
    Left = 392
    Top = 112
  end
  object QMLstMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'MAT.*,'
      'ART.TITULO_LARGO AS NOMBREARTICULO,'
      
        'ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ART.ALFA_4, ART.ALFA_5, ART.' +
        'ALFA_6, ART.ALFA_7, ART.ALFA_8,'
      'AL.TITULO AS NOMBREALMACEN'
      'FROM PRO_ORD_MAT MAT'
      
        'LEFT JOIN ART_ARTICULOS ART ON (MAT.EMPRESA = ART.EMPRESA AND MA' +
        'T.COMPONENTE = ART.ARTICULO)'
      
        'LEFT JOIN ART_ALMACENES AL ON (MAT.EMPRESA = AL.EMPRESA AND MAT.' +
        'ALMACEN = AL.ALMACEN)'
      'WHERE'
      'MAT.ID_ORDEN = :ID_ORDEN AND'
      'MAT.LINEA_FASE = :LINEA_FASE'
      'ORDER BY MAT.ORDEN, MAT.LINEA_MAT')
    UniDirectional = False
    DataSource = DSLstFases
    AfterOpen = QMLstMaterialesAfterOpen
    BeforeClose = QMLstMaterialesBeforeClose
    Left = 392
    Top = 160
  end
  object QMLstTareas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TAR.*, REC.TITULO AS NOMBRERECURSO, UTI.CODIGO AS CODIGOU' +
        'TILLAJE, UTI.DESCRIPCION AS NOMBREUTILLAJE,'
      '       REC.RECURSO, U.TITULO TITULO_UNIDAD_RECURSO,'
      '       (SELECT FIRST 1 IMPUTACION'
      '        FROM PRO_ORD_DET_MARCA'
      '        WHERE'
      '        IDTAREA = TAR.IDENTIFICADOR) IMPUTACION,'
      '       (SELECT FIRST 1 I.DESCRIPCION'
      '        FROM PRO_ORD_DET_MARCA M'
      '        JOIN OPE_SYS_IMPUTACION I ON M.IMPUTACION = I.IMPUTACION'
      '        WHERE'
      '        M.IDTAREA = TAR.IDENTIFICADOR) DESCRIPCION_IMP,'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM PRO_ORD_CAB_MARCA C'
      
        '        JOIN PRO_ORD_DET_MARCA D ON C.EMPRESA = D.EMPRESA AND C.' +
        'EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SE' +
        'RIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG'
      '        WHERE'
      '        D.IDTAREA = TAR.IDENTIFICADOR) FECHA_MARCAJE,'
      '       (SELECT FIRST 1 O.EMPLEADO'
      '        FROM PRO_ORD_CAB_MARCA C'
      
        '        JOIN PRO_ORD_DET_MARCA D ON C.EMPRESA = D.EMPRESA AND C.' +
        'EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SE' +
        'RIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG'
      
        '        JOIN OPE_EMPLEADO O ON C.EMPRESA = O.EMPRESA AND O.EMPLE' +
        'ADO = C.OPERARIO'
      '        WHERE'
      '        D.IDTAREA = TAR.IDENTIFICADOR) EMPLEADO,'
      '       (SELECT FIRST 1 T.NOMBRE_R_SOCIAL'
      '        FROM PRO_ORD_CAB_MARCA C'
      
        '        JOIN PRO_ORD_DET_MARCA D ON C.EMPRESA = D.EMPRESA AND C.' +
        'EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SE' +
        'RIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG'
      
        '        JOIN OPE_EMPLEADO O ON C.EMPRESA = O.EMPRESA AND O.EMPLE' +
        'ADO = C.OPERARIO'
      '        JOIN SYS_TERCEROS T ON T.TERCERO = O.TERCERO'
      '        WHERE'
      '        D.IDTAREA = TAR.IDENTIFICADOR) NOMBRE_R_SOCIAL'
      'FROM PRO_ORD_TAREA TAR'
      
        'LEFT JOIN PRO_RECURSOS REC ON (TAR.EMPRESA = REC.EMPRESA AND TAR' +
        '.RECURSO = REC.RECURSO)'
      'LEFT JOIN SYS_UNIDADES_ARTICULOS U ON REC.UNIDAD = U.TIPO'
      
        'LEFT JOIN PRO_SYS_UTILLAJES UTI ON (UTI.EMPRESA = TAR.EMPRESA AN' +
        'D UTI.CODIGO = TAR.ID_UTILLAJE)'
      'WHERE'
      'TAR.ID_ORDEN = :ID_ORDEN AND'
      'TAR.LINEA_FASE = :LINEA_FASE'
      'ORDER BY TAR.ORDEN, TAR.LINEA_TAREA')
    UniDirectional = False
    DataSource = DSLstFases
    AfterOpen = QMLstTareasAfterOpen
    BeforeClose = QMLstTareasBeforeClose
    Left = 392
    Top = 256
  end
  object DSLstOrden: TDataSource
    DataSet = QMLstOrden
    Left = 520
    Top = 64
  end
  object DSLstFases: TDataSource
    DataSet = QMLstFases
    Left = 520
    Top = 112
  end
  object DSLstMateriales: TDataSource
    DataSet = QMLstMateriales
    Left = 520
    Top = 160
  end
  object DSLstTareas: TDataSource
    DataSet = QMLstTareas
    Left = 520
    Top = 256
  end
  object frListadoO: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Hojas de Montaje'
    RebuildPrinter = False
    OnGetValue = frListadoOGetValue
    OnBeforePrint = frListadoOEnterRect
    OnEnterRect = frListadoOEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 392
    Top = 16
    ReportForm = {19000000}
  end
  object frDBListadoO: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstOrden
    Left = 648
    Top = 64
  end
  object frDBListadoFase: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstFases
    Left = 648
    Top = 112
  end
  object frDBListadoMate: TfrDBDataSet
    DataSource = DSLstMateriales
    OpenDataSource = False
    Left = 648
    Top = 160
  end
  object frDBListadoTareas: TfrDBDataSet
    DataSource = DSLstTareas
    OpenDataSource = False
    Left = 648
    Top = 256
  end
  object frDBLstMarcajes: TfrDBDataSet
    CloseDataSource = True
    Left = 648
    Top = 352
  end
  object xMinMaxFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MIN(LINEA_FASE), MAX(LINEA_FASE) '
      'FROM PRO_ORD_FASES'
      'WHERE ID_ORDEN=?ID_ORDEN')
    UniDirectional = False
    DataSource = DSOrden
    Left = 48
    Top = 64
    object xMinMaxFaseMIN: TIntegerField
      DisplayLabel = 'Min.'
      FieldName = 'MIN'
    end
    object xMinMaxFaseMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object QMLstMarcajes: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT SUM(TIEMPO_DEC) AS TIEMPO_DEC, SUM(TIEMPO) AS TIEMPO_NORM' +
        ', SUM(UNIDADES_FAB) AS CANTIDAD, PRECIO_RECURSO'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_FASE = :LINEA_FASE AND'
      'LINEA_TAREA = :LINEA_TAREA'
      'GROUP BY PRECIO_RECURSO')
    UniDirectional = False
    DataSource = DSLstTareas
    Opciones = []
    AutoSQLdeVistas = False
    Left = 392
    Top = 352
  end
  object DSLstMarcajes: TDataSource
    DataSet = QMLstMarcajes
    Left = 520
    Top = 352
  end
  object QMLstCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_LST_ORDEN_COMPRAS(:ID_ORDEN, :LINEA_FASE)'
      'WHERE'
      'V_LINEA_COMPRA_DEST = 0 AND'
      'V_FECHA_IMPUTACION >= :DESDE AND'
      'V_FECHA_IMPUTACION <= :HASTA AND'
      'V_TIPO <> '#39'FAP'#39
      'ORDER BY V_FECHA_IMPUTACION')
    UniDirectional = False
    DataSource = DSLstFases
    Left = 392
    Top = 400
  end
  object DSLstCompras: TDataSource
    DataSet = QMLstCompras
    Left = 520
    Top = 400
  end
  object frDBListadoCompras: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstCompras
    Left = 648
    Top = 400
  end
  object QMLstTareasAgru: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TAR.ID_ORDEN, TAR.TIPOTAREA, TAR.EMPRESA, TAR.EJERCICIO, ' +
        'TAR.CANAL, TAR.SERIE, TAR.RIG_OF, TAR.LINEA_FASE,'
      
        '       TAR.TAREA, TAR.RECURSO, REC.TITULO AS TITULO_RECURSO, TAR' +
        '.ARTICULO, SUM(TAR.CANTIDAD) AS CANTIDAD,'
      
        '       SUM(TAR.TOTAL_VAR_PRE) AS TOTAL_VAR_PRE, SUM(TAR.TOTAL_PR' +
        'E) AS TOTAL_PRE,'
      
        '       SUM(TAR.CANTIDAD_UTIL) AS CANTIDAD_UTIL, SUM(TAR.TOTAL_VA' +
        'R_REAL) AS TOTAL_VAR_REAL,'
      
        '       SUM(TAR.TOTAL_REAL) AS TOTAL_REAL, SUM(TAR.UDS_FABRICADAS' +
        ') AS UDS_FABRICADAS,'
      '       SUM(TAR.PRECIO_FIJO_REAL) AS PRECIO_FIJO_REAL'
      'FROM PRO_ORD_TAREA TAR'
      
        'JOIN PRO_RECURSOS REC ON (TAR.EMPRESA = REC.EMPRESA AND TAR.RECU' +
        'RSO = REC.RECURSO)'
      
        'JOIN PRO_SYS_UTILLAJES UTI ON (UTI.EMPRESA = TAR.EMPRESA AND UTI' +
        '.CODIGO = TAR.ID_UTILLAJE)'
      
        'LEFT JOIN PRO_ORD_DET_MARCA MARCA ON (TAR.IDENTIFICADOR = MARCA.' +
        'IDTAREA)'
      
        'LEFT JOIN OPE_SYS_IMPUTACION IMP ON (MARCA.IMPUTACION = IMP.IMPU' +
        'TACION)'
      
        'LEFT JOIN PRO_ORD_CAB_MARCA MARCA_CAB ON (MARCA_CAB.EMPRESA = MA' +
        'RCA.EMPRESA AND MARCA_CAB.EJERCICIO = MARCA.EJERCICIO AND MARCA_' +
        'CAB.CANAL = MARCA.CANAL AND MARCA_CAB.SERIE = MARCA.SERIE AND MA' +
        'RCA_CAB.TIPO = MARCA.TIPO AND MARCA_CAB.RIG = MARCA.RIG)'
      
        'LEFT JOIN OPE_EMPLEADO OPE ON (MARCA_CAB.EMPRESA = OPE.EMPRESA A' +
        'ND OPE.EMPLEADO = MARCA_CAB.OPERARIO)'
      'LEFT JOIN SYS_TERCEROS TER ON (TER.TERCERO = OPE.TERCERO)'
      'WHERE'
      'TAR.ID_ORDEN = :ID_ORDEN AND'
      'TAR.LINEA_FASE = :LINEA_FASE'
      
        'GROUP BY TAR.ID_ORDEN, TAR.TIPOTAREA, TAR.EMPRESA, TAR.EJERCICIO' +
        ', TAR.CANAL, TAR.SERIE, TAR.RIG_OF, TAR.LINEA_FASE, TAR.TAREA, T' +
        'AR.RECURSO, REC.TITULO, TAR.ARTICULO'
      ' ')
    UniDirectional = False
    DataSource = DSLstFases
    AfterOpen = QMLstTareasAgruAfterOpen
    BeforeClose = QMLstTareasAgruBeforeClose
    Left = 48
    Top = 304
  end
  object DSLstTareasAgru: TDataSource
    DataSet = QMLstTareasAgru
    Left = 152
    Top = 304
  end
  object frDBListadoTarAgru: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstTareasAgru
    Left = 256
    Top = 304
  end
  object QMLstMarcajesAgru: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select sum (tiempo_dec) as tiempo_dec,sum(tiempo) as tiempo_norm' +
        ','
      
        'sum(unidades_fab) as cantidad,sum(total_recurso) as total,tipota' +
        'rea'
      ' from pro_ord_det_marca'
      ''
      'where id_orden=?id_orden and tipotarea=?tipotarea'
      ''
      '/*where  empresa=?empresa and ejercicio=?ejercicio and '
      
        'canal=?canal and serie=?series and rig_of=?rig_of and tipotarea=' +
        '?tipotarea*/'
      'group by tipotarea')
    UniDirectional = False
    DataSource = DSLstTareasAgru
    Opciones = []
    AutoSQLdeVistas = False
    Left = 48
    Top = 352
  end
  object DSLstMarcajesAgru: TDataSource
    DataSet = QMLstMarcajesAgru
    Left = 152
    Top = 352
  end
  object frDBlstMarcajesAgru: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstMarcajesAgru
    Left = 256
    Top = 352
  end
  object QMLstIncidencias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DET.*'
      'FROM PRO_MAT_INC_C CAB'
      'LEFT JOIN PRO_MAT_INC_D DET ON (CAB.ID_INC_C = DET.ID_INC_C)'
      'WHERE'
      'CAB.ID_ORDEN = :ID_ORDEN AND'
      'CAB.LINEA_FASE = :LINEA_FASE')
    UniDirectional = False
    DataSource = DSLstFases
    Left = 392
    Top = 448
  end
  object DSLstIncidencias: TDataSource
    DataSet = QMLstIncidencias
    Left = 520
    Top = 448
  end
  object frDBListadoInc: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstIncidencias
    Left = 648
    Top = 448
  end
  object QMLstSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_SERIALIZACION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIES AND'
      'TIPO = '#39'PRO'#39' AND'
      'RIG = :RIG_OF AND'
      'LINEA = 0')
    UniDirectional = False
    Left = 48
    Top = 208
  end
  object DSLstSeries: TDataSource
    DataSet = QMLstSeries
    Left = 152
    Top = 208
  end
  object frDBSeries: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstSeries
    Left = 256
    Top = 208
  end
  object QMLstLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select empresa,almacen,articulo,lote,n_serie,clasificacion,f_fab' +
        'ricacion,f_envasado,'
      '   f_caducidad, id_a,id_lote,proveedor'
      'from pro_ord_mat_lotes'
      'where(empresa=:empresa and ejercicio=:ejercicio and canal=:canal'
      
        '           and serie=:serie and tipo=:tipo and norden=:rig and l' +
        'inea=0)')
    UniDirectional = False
    Left = 48
    Top = 256
  end
  object DSLstLotes: TDataSource
    DataSet = QMLstLotes
    Left = 152
    Top = 256
  end
  object frDBLotes: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstLotes
    Left = 256
    Top = 256
  end
  object xTituloLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT LOTE FROM ART_ARTICULOS_LOTES'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ID_LOTE = ?ID_LOTE AND'
      'ARTICULO = ?COMPUESTO')
    UniDirectional = False
    DataSource = DSLstOrden
    Left = 392
    Top = 496
  end
  object DSxTituloLote: TDataSource
    DataSet = xTituloLote
    Left = 520
    Top = 496
  end
  object xTituloMaquina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_MAQUINAS_C'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CODMAQ = :MAQUINA')
    UniDirectional = False
    DataSource = DSLstTareas
    Left = 392
    Top = 304
  end
  object DSxTituloMaquina: TDataSource
    DataSet = xTituloMaquina
    Left = 520
    Top = 304
  end
  object QMLstFichaTecnica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST (1) ID_ENSAYO, EMPRESA, CAB.FICHA, CAB.REVISION'
      'FROM ISO_ENSAYO_ART ART'
      
        'JOIN ISO_ENSAYO_CAB CAB ON (ART.EMPRESA = CAB.EMPRESA AND CAB.ID' +
        '_ENSAYO = ART.ID_ENSAYO)'
      'WHERE'
      'ART.EMPRESA = :EMPRESA AND'
      'ART.ARTICULO = :COMPUESTO AND'
      'CAB.ACTIVO = 1')
    UniDirectional = False
    DataSource = DSLstOrden
    AfterOpen = QMLstFichaTecnicaAfterOpen
    BeforeClose = QMLstFichaTecnicaBeforeClose
    Left = 48
    Top = 400
  end
  object DSLstFichaTecnica: TDataSource
    DataSet = QMLstFichaTecnica
    Left = 152
    Top = 400
  end
  object frDBFichaTecnica: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstFichaTecnica
    Left = 256
    Top = 400
  end
  object QMLstFichaTecnicaDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DET.ID_ENSAYO, DET.VALOR_2, ENS.DESCRIPCION'
      'FROM ISO_ENSAYO_DET DET'
      'JOIN ISO_ENSAYO ENS ON (ENS.CODIGO = DET.ISO_ENSAYO)'
      'WHERE'
      'DET.EMPRESA = :EMPRESA AND'
      'DET.ID_ENSAYO = :ID_ENSAYO')
    UniDirectional = False
    DataSource = DSLstFichaTecnica
    Left = 48
    Top = 448
  end
  object DSLstFichaTecnicaDet: TDataSource
    DataSet = QMLstFichaTecnicaDet
    Left = 152
    Top = 448
  end
  object frDBFichaTecnicaDet: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstFichaTecnicaDet
    Left = 256
    Top = 448
  end
  object QMLstEtiquetas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_ART_ARTICULOS_FICHA_TECNICA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :COMPUESTO')
    UniDirectional = False
    DataSource = DSLstOrden
    AfterOpen = QMLstEtiquetasAfterOpen
    BeforeClose = QMLstEtiquetasBeforeClose
    Left = 48
    Top = 496
  end
  object DSLstEtiquetas: TDataSource
    DataSet = QMLstEtiquetas
    Left = 152
    Top = 496
  end
  object frDBLstEtiquetas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstEtiquetas
    Left = 256
    Top = 496
  end
  object QMLstEtiDibujo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_ART_ARTICULOS_TEXTOS_ETIQ'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO ')
    UniDirectional = False
    DataSource = DSLstEtiquetas
    Left = 48
    Top = 544
  end
  object DSLstEtiDibujo: TDataSource
    DataSet = QMLstEtiDibujo
    Left = 152
    Top = 544
  end
  object frDBLstEtidibujo: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstEtiDibujo
    Left = 256
    Top = 544
  end
  object QMLstPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      'ID_S = (SELECT FIRST 1 ID_S'
      '        FROM GES_DETALLES_S_PED'
      '        WHERE'
      '        EMPRESA = :EMPRESA AND'
      '        CANAL = :CANAL AND'
      '        SERIE = :SERIES AND'
      '        TIPO = '#39'PEC'#39' AND'
      '        RIG = :PEDIDO AND'
      '        LINEA = :LINEA_PED AND'
      '        ID_ORDEN = :ID_ORDEN'
      '        ORDER BY RIG, LINEA)')
    UniDirectional = False
    DataSource = DSLstOrden
    AfterOpen = QMLstPedidoAfterOpen
    BeforeClose = QMLstPedidoBeforeClose
    Left = 48
    Top = 592
  end
  object DSLstPedido: TDataSource
    DataSet = QMLstPedido
    Left = 152
    Top = 592
  end
  object frDBLstPedido: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstPedido
    Left = 256
    Top = 592
  end
  object QMLstMaterialesLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_MAT_LOTES'
      'WHERE'
      'ID_ORDEN_MAT = :ID_ORDEN_MAT AND'
      'LINEA = :LINEA_MAT')
    UniDirectional = False
    DataSource = DSLstMateriales
    Left = 392
    Top = 208
  end
  object DSQMLstMaterialesLotes: TDataSource
    DataSet = QMLstMaterialesLotes
    Left = 520
    Top = 208
  end
  object frDBLstMaterialesLotes: TfrDBDataSet
    DataSource = DSQMLstMaterialesLotes
    OpenDataSource = False
    Left = 648
    Top = 208
  end
  object xUtillajes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_SYS_UTILLAJES '
      'WHERE'
      'EMPRESA = :EMPRESA AND '
      'CODIGO = :CODIGOUTILLAJE')
    UniDirectional = False
    DataSource = DSLstTareas
    Left = 392
    Top = 544
  end
  object DSxUtillajes: TDataSource
    DataSet = xUtillajes
    Left = 520
    Top = 544
  end
  object frDBDxUtillajes: TfrDBDataSet
    DataSource = DSxUtillajes
    OpenDataSource = False
    Left = 648
    Top = 544
  end
  object xComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?COMPONENTE')
    UniDirectional = False
    DataSource = DSLstMateriales
    Left = 392
    Top = 640
  end
  object SDxComponente: TDataSource
    DataSet = xComponente
    Left = 520
    Top = 640
  end
  object xArticuloCodigoCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_CODCLI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSLstPedidoDet
    Left = 768
    Top = 64
  end
  object QMLstPedidoDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_PEDIDO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIES AND'
      'TIPO = '#39'PEC'#39' AND'
      'RIG = :PEDIDO AND'
      'LINEA = :LINEA_PED AND'
      'ID_ORDEN = :ID_ORDEN'
      'ORDER BY RIG, LINEA')
    UniDirectional = False
    DataSource = DSLstOrden
    AfterOpen = QMLstPedidoDetAfterOpen
    BeforeClose = QMLstPedidoDetBeforeClose
    Left = 48
    Top = 640
  end
  object DSLstPedidoDet: TDataSource
    DataSet = QMLstPedidoDet
    Left = 152
    Top = 640
  end
  object frDBLstPedidoDet: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstPedidoDet
    Left = 256
    Top = 640
  end
  object xCompuestoCodigoCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_CODCLI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :COMPUESTO AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSLstOrden
    Left = 768
    Top = 112
  end
  object frxListadoO: TfrxHYReport
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
    OnBeforePrint = frxListadoOBeforePrint
    OnGetValue = frxListadoOGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 520
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
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
    DataSource = DSLstOrden
    Left = 768
    Top = 160
  end
  object DSxEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 896
    Top = 160
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
    DataSource = DSLstOrden
    Left = 768
    Top = 208
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 896
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
    DataSource = DSLstOrden
    Left = 768
    Top = 256
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 896
    Top = 208
  end
  object xDireccionPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIENTE, :ID_S, 0)'
      'WHERE'
      'NUM = :DIRECCION')
    UniDirectional = False
    DataSource = DSLstPedido
    Left = 48
    Top = 688
  end
  object DSxDireccionPedido: TDataSource
    DataSet = xEmpleado
    Left = 152
    Top = 688
  end
  object xLstTareaEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TAR.*'
      'FROM PRO_ORD ORD'
      
        'JOIN PRO_TAREA_ESC TAR ON TAR.EMPRESA = ORD.EMPRESA AND TAR.ESCA' +
        'NDALLO = ORD.ESCANDALLO'
      'WHERE'
      'ORD.ID_ORDEN = :ID_ORDEN AND'
      'TAR.LINEA_FASE = :LINEA_FASE AND'
      'TAR.LINEA_TAREA = :LINEA_TAREA AND'
      'TAR.TIPO = '#39'EPR'#39)
    UniDirectional = False
    DataSource = DSLstTareas
    Left = 768
    Top = 304
  end
  object DSxLstTareaEsc: TDataSource
    DataSet = xLstTareaEsc
    Left = 896
    Top = 304
  end
end
