object ProDMLstNecesidades: TProDMLstNecesidades
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 299
  Top = 233
  Height = 527
  Width = 437
  object frDBlstNecesidades: TfrDBDataSet
    DataSet = QGenerarLst
    Left = 296
    Top = 112
  end
  object DSOrden: TDataSource
    DataSet = xOrden
    Left = 168
    Top = 64
  end
  object xOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM VER_PRO_ORD'
      'WHERE '
      'ID_ORDEN = ?ID_ORDEN')
    SelectSQL.Strings = (
      'SELECT'
      'ORD.*,'
      'ALSAL.TITULO AS TITULOSAL,'
      'ALENT.TITULO AS TITULOENT,'
      'ALLANZ.TITULO AS TITULOLANZ,'
      'ART.TITULO AS TITULO_ART,'
      'TER.NOMBRE_R_SOCIAL AS NOMBRECLIENTE,'
      'ART.TITULO AS NOMBRECOMPUESTO,'
      'ART.IMAGEN,'
      'ART.NOTAS NOTAS_ART'
      'FROM VER_PRO_ORD ORD'
      'JOIN ART_ARTICULOS ART'
      'ON (ORD.COMPUESTO = ART.ARTICULO AND ORD.EMPRESA = ART.EMPRESA)'
      'JOIN ART_ALMACENES ALSAL'
      
        'ON (ORD.EMPRESA = ALSAL.EMPRESA AND ORD.ALMACEN_SAL = ALSAL.ALMA' +
        'CEN)'
      'JOIN ART_ALMACENES ALENT'
      
        'ON (ORD.EMPRESA = ALENT.EMPRESA AND ORD.ALMACEN_ENT = ALENT.ALMA' +
        'CEN)'
      'JOIN ART_ALMACENES ALLANZ'
      
        'ON (ORD.EMPRESA = ALLANZ.EMPRESA AND ORD.ALMACEN_LAN = ALLANZ.AL' +
        'MACEN)'
      'JOIN EMP_CLIENTES CLI'
      'ON (ORD.EMPRESA = CLI.EMPRESA AND ORD.CLIENTE = CLI.CLIENTE)'
      'JOIN SYS_TERCEROS TER'
      'ON (CLI.TERCERO = TER.TERCERO)'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    AfterOpen = xOrdenAfterOpen
    BeforeClose = xOrdenBeforeClose
    Left = 48
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 296
    Top = 16
  end
  object frListadoN: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Necesidades'
    RebuildPrinter = False
    OnGetValue = frListadoNGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object QGenerarLst: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*Select Dinamica*/'
      
        'SELECT * FROM PRO_LST_NECESIDADES_LANZAR(:ID_ORDEN, :ALM_DESDE, ' +
        ':ALM_HASTA, :ENTRADA, :TIPOLST)')
    UniDirectional = False
    AfterOpen = QGenerarLstAfterOpen
    BeforeClose = QGenerarLstBeforeClose
    Left = 48
    Top = 112
  end
  object QListarUbicaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT UB.ALMACEN, UB.COMPOSICION, UB.EXISTENCIAS, UB.ID_A, ALM.' +
        'TITULO, UB.ID_UBICACION'
      'FROM ART_STOCKS_UBICACIONES UB'
      
        'JOIN ART_ALMACENES_UBICACIONES ALM ON (UB.ID_UBICACION = ALM.ID_' +
        'UBICACION)'
      'JOIN ART_ARTICULOS ART ON (UB.ID_A = ART.ID_A)'
      'WHERE'
      'UB.EMPRESA = :EMPRESA AND'
      'UB.CANAL = :CANAL AND'
      'UB.ID_A = :V_ID_A AND'
      'UB.ALMACEN >= :V_ALM_DESDE AND'
      'UB.ALMACEN <= :V_ALM_HASTA AND'
      'UB.EXISTENCIAS > 0 AND'
      'ART.UBICABLE = 1')
    UniDirectional = False
    DataSource = DSLstNec
    Left = 48
    Top = 160
  end
  object DSLstNec: TDataSource
    DataSet = QGenerarLst
    Left = 168
    Top = 112
  end
  object frDBlstUbicaciones: TfrDBDataSet
    DataSet = QListarUbicaciones
    Left = 296
    Top = 160
  end
  object QMLstPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CAB.*, DET.NOTAS, DET.LINEA'
      'FROM VER_CABECERAS_PEDIDO CAB'
      'LEFT JOIN GES_DETALLES_S DET ON (CAB.ID_S = DET.ID_S)'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA AND'
      'CAB.EJERCICIO = :EJERCICIO AND'
      'CAB.CANAL = :CANAL AND'
      'CAB.SERIE = :SERIES AND'
      'CAB.TIPO = '#39'PEC'#39' AND'
      'CAB.RIG = :PEDIDO AND'
      'DET.LINEA = :LINEA_PED')
    UniDirectional = False
    DataSource = DSOrden
    Left = 48
    Top = 208
  end
  object DSLstPedido: TDataSource
    DataSet = QMLstPedido
    Left = 168
    Top = 208
  end
  object frDBLstPedido: TfrDBDataSet
    CloseDataSource = True
    DataSet = QMLstPedido
    Left = 296
    Top = 208
  end
  object QMLstTareasUtillaje: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TAR.*,'
      'REC.TITULO AS NOMBRERECURSO,'
      'UTI.CODIGO AS CODIGOUTILLAJE,'
      'UTI.ARTICULO AS ARTICULOUTILLAJE,'
      'UTI.DESCRIPCION AS NOMBREUTILLAJE,'
      'MARCA.IMPUTACION,'
      'IMP.DESCRIPCION AS DESCRIPCION_IMP,'
      'MARCA_CAB.FECHA AS FECHA_MARCAJE,'
      'OPE.EMPLEADO,'
      'TER.NOMBRE_R_SOCIAL'
      'FROM PRO_ORD_TAREA TAR'
      
        'LEFT JOIN PRO_RECURSOS REC ON (TAR.EMPRESA = REC.EMPRESA AND TAR' +
        '.RECURSO = REC.RECURSO)'
      
        'LEFT JOIN PRO_SYS_UTILLAJES UTI ON (UTI.EMPRESA = TAR.EMPRESA AN' +
        'D UTI.CODIGO = TAR.ID_UTILLAJE)'
      
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
      'UTI.CODIGO <> '#39'000'#39
      'ORDER BY TAR.ORDEN, TAR.LINEA_FASE, TAR.LINEA_TAREA')
    UniDirectional = False
    DataSource = DSOrden
    Left = 48
    Top = 304
  end
  object DSLstTareasUtillaje: TDataSource
    DataSet = QMLstTareasUtillaje
    Left = 168
    Top = 304
  end
  object frDBLstTareasUtillaje: TfrDBDataSet
    DataSet = QMLstTareasUtillaje
    Left = 296
    Top = 304
  end
  object xArticuloCodigoCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_CODCLI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSLstPedidoDet
    Left = 48
    Top = 400
  end
  object QMLstPedidoDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_PEDIDO '
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIES AND'
      'TIPO = '#39'PEC'#39' AND'
      'RIG = :PEDIDO AND'
      'LINEA = :LINEA_PED')
    UniDirectional = False
    DataSource = DSOrden
    AfterOpen = QMLstPedidoDetAfterOpen
    BeforeClose = QMLstPedidoDetBeforeClose
    Left = 48
    Top = 256
  end
  object DSLstPedidoDet: TDataSource
    DataSet = QMLstPedidoDet
    Left = 168
    Top = 256
  end
  object frDBLstPedidoDet: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSLstPedidoDet
    Left = 296
    Top = 256
  end
  object QMLstMaterialesLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT L.* FROM PRO_ORD_MAT_LOTES L'
      'JOIN PRO_ORD_MAT M'
      'ON L.ID_ORDEN_MAT = M.ID_ORDEN_MAT'
      'WHERE'
      'L.ID_ORDEN = :ID_ORDEN AND'
      'L.ID_A = :V_ID_A AND'
      '((M.LINEA_FASE = :V_LINEA_FASE) or (:V_LINEA_FASE = 0))')
    UniDirectional = False
    DataSource = DSLstNec
    Left = 48
    Top = 352
  end
  object DSQMLstMaterialesLotes: TDataSource
    DataSet = QMLstMaterialesLotes
    Left = 168
    Top = 352
  end
  object frDBLstMaterialesLotes: TfrDBDataSet
    DataSource = DSQMLstMaterialesLotes
    OpenDataSource = False
    Left = 296
    Top = 352
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
    DataSource = DSOrden
    Left = 48
    Top = 448
  end
end
