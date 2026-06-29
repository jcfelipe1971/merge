object DMPreparacionReserva: TDMPreparacionReserva
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 307
  Top = 205
  Height = 486
  Width = 408
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
    Left = 288
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 288
    Top = 56
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 176
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 64
    Top = 8
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COMP.*, RES.UNIDADES UNIDADES_RES, RES.LINEA_RES, ART.SER' +
        'IALIZADO, ART.SERIALIZADO_KRI, ART.UBICABLE, ART.LOTES,'
      
        '       RES.ID_RESERVA, RES.ID_LOTE ID_LOTE_RESERVA, RES.FECHA AS' +
        ' FECHA_RESERVA,'
      '       (SELECT COUNT(*)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN /* AND '
      '              LINEA_RES <> RES.LINEA_RES*/ ) CANT_RESERVAS,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN /* AND '
      '              LINEA_RES <> RES.LINEA_RES*/ ) UNIDADES_RESERVAS,'
      '       (SELECT FIRST 1 CAB.RIG'
      '        FROM PRO_ORD_TAREA TA'
      
        '        JOIN PRO_ORD_TAREA_TEX TE ON (TA.EMPRESA = TE.EMPRESA AN' +
        'D TA.EJERCICIO = TE.EJERCICIO AND TA.CANAL = TE.CANAL AND TA.SER' +
        'IE = TE.SERIE AND TA.RIG_OF = TE.RIG_OF AND TA.LINEA_FASE = TE.L' +
        'INEA_FASE AND TA.LINEA_TAREA = TE.LINEA_TAREA)'
      
        '        JOIN GES_CABECERAS_E_PED CAB ON (CAB.ID_E = TE.ID_E_PEDI' +
        'DO)'
      '        WHERE'
      '        TA.ID_ORDEN = COMP.ID_ORDEN AND'
      '        TA.RECURSO = '#39'T1'#39
      '        ORDER BY TA.LINEA_TAREA DESC) RIG_PEDIDO_PROVEEDOR,'
      '       (SELECT PRO.PROVEEDOR'
      '        FROM ART_ALMACENES ALM'
      '        JOIN SYS_TERCEROS TER ON (ALM.TERCERO = TER.TERCERO)'
      '        JOIN EMP_PROVEEDORES PRO ON (PRO.TERCERO = TER.TERCERO)'
      '        WHERE'
      '        PRO.EMPRESA = COMP.EMPRESA AND'
      '        ALM.EMPRESA = COMP.EMPRESA AND'
      '        ALM.ALMACEN = (SELECT FIRST 1 POM.ALMACEN'
      '                       FROM PRO_ORD_TAREA POT'
      
        '                       JOIN PRO_ORD_MAT POM ON (POT.ID_ORDEN = P' +
        'OM.ID_ORDEN AND POT.LINEA_FASE = POM.LINEA_FASE)'
      '                       WHERE'
      '                       POT.ID_ORDEN = COMP.ID_ORDEN AND'
      '                       POT.RECURSO = '#39'T1'#39
      '                       ORDER BY POT.LINEA_TAREA DESC)) PROVEEDOR'
      'FROM PRO_ORD_RESERVA RES'
      
        'LEFT JOIN PRO_ORD COMP ON (COMP.ID_ORDEN = RES.ID_ORDEN /*AND RE' +
        'S.LINEA_RES = :LINEA_RES*/ )'
      
        'LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND A' +
        'LM.ALMACEN = COMP.ALMACEN_SAL)'
      
        'LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND A' +
        'RT.ARTICULO = COMP.COMPUESTO)'
      'WHERE'
      'RES.ID_RESERVA = :ID_RESERVA')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 64
    Top = 56
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 288
    Top = 104
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 176
    Top = 104
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RI' +
        'G_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN,'
      
        '       MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTI' +
        'L, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI,'
      
        '       MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION' +
        ', MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT,'
      
        '       RES.UNIDADES AS UNIDADES_FAB, MAT.UNIDADES_STOCK, MAT.PRE' +
        '_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV,'
      
        '       PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT' +
        '.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS,'
      
        '       MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.U' +
        'NIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR,'
      
        '       MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT' +
        '.UDS_COMPRA, RESERVA_STOCK, MAT.N_MOV_STOCK,'
      
        '       MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DE' +
        'SACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO,'
      
        '       DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_' +
        'ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER,'
      
        '       MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICA' +
        'CION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK,'
      
        '       ART.TITULO_LARGO AS TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, M' +
        'AT.ID_UBICACION, RES.LINEA_RES, RES.ID_RESERVA_MAT,'
      '       RES.UNIDADES_ENVIAR, RES.PREPARADO,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_MAT_RESERVA_LOTES'
      '        WHERE'
      '        ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) ID_LOTE,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_MAT_RESERVA_LOTES'
      '        WHERE'
      '        ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) LOTE,'
      '       (SELECT COUNT(ID_LOTE)'
      '        FROM PRO_ORD_MAT_RESERVA_LOTES'
      '        WHERE'
      '        ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND'
      '        LINEA_RES = RES.LINEA_RES) CANT_LOTE,'
      '        R.ESTADO ESTADO_RESERVA'
      'FROM PRO_ORD_MAT MAT'
      
        'LEFT JOIN PRO_ORD_MAT_RESERVA RES ON (MAT.ID_ORDEN_MAT = RES.ID_' +
        'ORDEN_MAT AND RES.LINEA_RES = :LINEA_RES)'
      'LEFT JOIN PRO_ORD_RESERVA R ON (RES.ID_RESERVA = R.ID_RESERVA)'
      
        'LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = MAT.EMPRESA AND AL' +
        'M.ALMACEN = MAT.ALMACEN)'
      
        'LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND AR' +
        'T.ARTICULO = MAT.COMPONENTE)'
      'WHERE'
      'R.ID_RESERVA = :ID_RESERVA'
      'ORDER BY MAT.ORDEN, MAT.LINEA_FASE, MAT.LINEA_MAT')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    Left = 64
    Top = 104
  end
  object frDBLoteCabecera: TfrDBDataSet
    DataSource = DSQMLoteCabecera
    Left = 288
    Top = 152
  end
  object DSQMLoteCabecera: TDataSource
    DataSet = QMLoteCabecera
    Left = 176
    Top = 152
  end
  object QMLoteCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_LOTES'
      'WHERE '
      'ID_LOTE = :ID_LOTE_RESERVA')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 64
    Top = 152
  end
  object frDBLoteDetalle: TfrDBDataSet
    DataSource = DSQMLoteDetalle
    Left = 288
    Top = 200
  end
  object DSQMLoteDetalle: TDataSource
    DataSet = QMLoteDetalle
    Left = 176
    Top = 200
  end
  object QMLoteDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_MAT_RESERVA_LOTES'
      'WHERE'
      'ID_ORDEN_MAT = :ID_ORDEN_MAT AND'
      'LINEA_RES = :LINEA_RES'
      'ORDER BY ID_LOTE')
    UniDirectional = False
    DataSource = DSQMDetalle
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 64
    Top = 200
  end
  object frxListado: TfrxHYReport
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
    OnBeforePrint = frxListadoBeforePrint
    OnGetValue = frxListadoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 344
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DSComponente: TDataSource
    DataSet = xComponente
    Left = 176
    Top = 296
  end
  object xComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO=:EJERCICIO AND'
      'CANAL=:CANAL AND'
      'ARTICULO = :COMPONENTE')
    UniDirectional = False
    DataSource = DSQMDetalle
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 64
    Top = 296
  end
  object xEmpleadoUltimaMod: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST 1 EM.*'
      'FROM SYS_ENTRADAS EN'
      'JOIN SYS_USUARIOS US ON (EN.USUARIO = US.USUARIO)'
      
        'LEFT JOIN VER_EMPLEADOS_CUENTAS EM ON (US.EMPRESA = EM.EMPRESA A' +
        'ND US.USUARIO = EM.USUARIO)'
      'WHERE'
      'EM.EMPRESA = :EMPRESA AND'
      'EM.EJERCICIO = :EJERCICIO AND'
      'EM.CANAL = :CANAL AND'
      'EN.ENTRADA = :ENTRADA'
      'ORDER BY EM.EMPLEADO DESC')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 64
    Top = 344
  end
  object DSxEmpleadoOP: TDataSource
    DataSet = xEmpleadoUltimaMod
    Left = 176
    Top = 344
  end
  object frDBxEmpleadoOP: TfrDBDataSet
    DataSource = DSxEmpleadoOP
    Left = 288
    Top = 344
  end
  object xEmpleadoResponsable: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'EMPLEADO = :RESPONSABLE')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 64
    Top = 392
  end
  object DSxEmpleadoResp: TDataSource
    DataSet = xEmpleadoResponsable
    Left = 176
    Top = 392
  end
  object frDBxEmpleadoResp: TfrDBDataSet
    DataSource = DSxEmpleadoResp
    Left = 288
    Top = 392
  end
  object DSxCompuesto: TDataSource
    DataSet = xCompuesto
    Left = 176
    Top = 248
  end
  object xCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO=:EJERCICIO AND'
      'CANAL=:CANAL AND'
      'ARTICULO = :COMPUESTO')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 64
    Top = 248
  end
  object xLoteProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST 1 P.PROVEEDOR, T.NOMBRE_R_SOCIAL'
      'FROM ART_ARTICULOS_LOTES AL'
      'JOIN EMP_PROVEEDORES P ON (AL.PROVEEDOR = P.PROVEEDOR)'
      'JOIN SYS_TERCEROS T ON (P.TERCERO = T.TERCERO)'
      'WHERE'
      'AL.ID_LOTE = :ID_LOTE AND'
      'AL.ID_A = :ID_A   ')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 64
    Top = 440
  end
  object DSxLoteProveedor: TDataSource
    DataSet = xLoteProveedor
    Left = 176
    Top = 440
  end
  object frDBxLoteProveedor: TfrDBDataSet
    DataSource = DSxLoteProveedor
    Left = 291
    Top = 443
  end
  object xMaquinasTareasOP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT LIST(MC.DESCRIPCION, '#39' | '#39') MAQUINA'
      'FROM PRO_ORD_TAREA OT'
      
        'JOIN PRO_MAQUINAS_C MC ON (OT.EMPRESA = MC.EMPRESA AND OT.MAQUIN' +
        'A = MC.CODMAQ)'
      'WHERE'
      'OT.ID_ORDEN = :ID_ORDEN AND'
      'MC.ID_MAQUINA <> 0')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 64
    Top = 504
  end
  object frDBxMaquinasTareasOP: TfrDBDataSet
    DataSource = DSxMaquinasTareasOP
    Left = 296
    Top = 504
  end
  object DSxMaquinasTareasOP: TDataSource
    DataSet = xMaquinasTareasOP
    Left = 176
    Top = 504
  end
end
