object DMRUnidPendRecibir: TDMRUnidPendRecibir
  OldCreateOrder = False
  OnCreate = DMRDepositosActivosCreate
  OnDestroy = DMRInventario_StocksDestroy
  Left = 377
  Top = 265
  Height = 481
  Width = 666
  object frUnidPendRecibir: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Unidades Pendientes de Recibir'
    RebuildPrinter = False
    OnGetValue = frUnidPendRecibirGetValue
    OnBeforePrint = frUnidPendRecibirEnterRect
    OnEnterRect = frUnidPendRecibirEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 22
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 254
    Top = 24
  end
  object xUnidadesPendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- Se modifica dinamicamente'
      
        'SELECT D.EMPRESA, D.EJERCICIO VCANAL, D.SERIE, D.TIPO, D.RIG, D.' +
        'LINEA, D.ALMACEN ALMACEN_DET, D.ARTICULO, D.TITULO,'
      
        '       D.UNIDADES, D.PRECIO, D.DESCUENTO, D.DESCUENTO_2, D.DESCU' +
        'ENTO_3, D.P_COSTE, D.PAIS, D.TIPO_IVA, D.P_IVA,'
      
        '       D.P_RECARGO, D.BRUTO, D.I_DESCUENTO, D.B_IMPONIBLE, D.ENT' +
        'RADA, D.DTO_PP, D.M_MOV_STOCK, D.ENTRADA_RECEPCION,'
      
        '       D.UNIDADES_EXT, D.NOTAS, D.B_IMPONIBLE_CANAL, D.BASE_IMPO' +
        'RTACION, D.ID_DETALLES_E, D.ID_E, D.ID_D_E_GR,'
      
        '       D.ID_A_M_C_T, D.ID_C_A, D.ID_A, D.ID_MOV_STOCKS, D.I_DTO_' +
        'CIAL, D.NSERIE, D.BULTOS, D.ORDEN, D.UNIDADES_SEC,'
      
        '       D.APLICA_UNIDADES_SECUNDARIAS, D.PROYECTO, D.NOTAS2, D.CR' +
        'C_NOTAS, D.CRC_NOTAS2, D.ID_DETALLES_E_REGALO, D.CUENTA,'
      
        '       D.IMPORTE_ICE, D.INVERSION_SUJETO_PASIVO, D.B_DTO_LINEA, ' +
        'D.C_IVA, D.C_RECARGO, D.LIQUIDO,'
      
        '       D.TIPO_IMPUESTO_ADICIONAL, D.P_IMPUESTO_ADICIONAL, D.I_IM' +
        'PUESTO_ADICIONAL, D.I_IMPUESTO_ADICIONAL_CANAL, D.PESO,'
      
        '       D.PESO_TOTAL, D.PESO_REAL, D.COSTE_ADICIONAL, D.T_COSTE, ' +
        'D.M_BRUTO, D.PRO_NUM_PLANO,'
      '       --'
      
        '       DP.UNIDADES_ORIGINALES, DP.UNIDADES_SERVIDAS, DP.UNIDADES' +
        '_POR_SERVIR, DP.LINEA_SERVIDA, DP.P_COSTE, DP.DESCUENTO,'
      
        '       DP.UNIDADES_RECEPCION, DP.FECHA_PRE_DET, DP.FECHA_REC_DET' +
        ', DP.SERVIR_LINEA, DP.FECHA_CONF_KRI,'
      
        '       DP.PLAZO_CONFIRM_KRI, DP.TIPO_UNIDAD_LOGISTICA, DP.UNIDAD' +
        'ES_LOGISTICAS,'
      '       --'
      
        '       C.ALMACEN ALMACEN_CAB, C.MONEDA, C.FECHA, C.NOTAS, C.ESTA' +
        'DO, C.BULTOS, C.LINEAS, C.BRUTO, C.I_DTO_LINEAS,'
      
        '       C.S_BASES, C.S_CUOTA_IVA, C.S_CUOTA_RE, C.DTO_PP, C.DTO_C' +
        'IAL, C.I_DTO_CIAL, C.I_DTO_PP, C.POR_FINANCIACION,'
      
        '       C.I_FINANCIACION, C.FORMA_DE_PAGO, C.I_FINANCIACION_CANAL' +
        ', C.S_BASES_CANAL, C.S_CUOTA_IVA_CANAL,'
      
        '       C.S_CUOTA_RE_CANAL, C.CHG_MONEDA, C.SU_REFERENCIA, C.MODI' +
        'FICA_DOC, C.I_PORTES, C.POR_PORTES, C.TIPO_PORTES,'
      
        '       C.I_PORTES_CANAL, C.CAMBIO_FIJO, C.VALOR_CAMB_FIJO, C.PRO' +
        'CESO_AUTO, C.PROYECTO, C.PERMITIR_SUPERAR_IMPORTE_KRI,'
      
        '       C.INVERSION_SUJETO_PASIVO, C.IMPORTE_ICE_TOTAL, C.B_DTO_L' +
        'INEAS, C.LIQUIDO, C.LIQUIDO_CANAL,'
      
        '       C.S_CUOTA_IMPUESTO_ADICIONAL, C.S_CUOTA_IMP_ADICIONAL_CAN' +
        'AL, C.DIR_ENTREGA_MANUAL, C.IDIOMA,'
      
        '       C.DIR_RECOGIDA_MANUAL, C.EMPAQUETADO_EMPRESA, C.EQUIPO_RE' +
        'COGIDA, C.EQUIPO_ENTREGA, C.MATRICULA_RECOGIDA,'
      
        '       C.MATRICULA_ENTREGA, C.FECHA_RECOGIDA_MANUAL, C.FECHA_ENT' +
        'REGA_MANUAL, C.FECHA_CREACION, C.USUARIO_CREACION,'
      '       C.ORIGEN_DOCUMENTO, C.OBSERVACIONES'
      '       --'
      
        '       , CP.TERCERO, CP.PROVEEDOR, CP.FECHA_ENTREGA FECHA_ENTREG' +
        'A, CP.FECHA_PRE_CAB, CP.FECHA_REC_CAB, CP.TRANSPORTISTA,'
      
        '       CP.FECHA_CONFIRMADA_KRI, CP.PLAZO_INICIAL_KRI, CP.PLAZO_C' +
        'ONFIRM_KRI, CP.NO_AGREGAR_LINEAS_KRI, CP.ID_ORDEN,'
      
        '       CP.LIN_FASE, CP.DIRECCION, CP.RIG_OF, CP.PEDIDO_VALORADO,' +
        ' CP.ENTRADA_AGRUPACION, CP.ACEPTA_ENTREGA_PARCIAL,'
      '       CP.PEDIDO_RECIBIDO,'
      '       --'
      '       A.*,'
      '       --'
      '       E.DETALLE, E.CANTIDAD, AE.TITULO TITULO_DETALLE,'
      '       (E.CANTIDAD * D.UNIDADES) UNIDADES_ESCANDALLO'
      'FROM GES_DETALLES_E D'
      'JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E'
      'JOIN GES_CABECERAS_E C ON C.ID_E = DP.ID_E'
      'JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'LEFT JOIN ART_ARTICULOS_ESCANDALLO E ON A.EMPRESA = E.EMPRESA AN' +
        'D A.ARTICULO = E.ARTICULO'
      'LEFT JOIN ART_ARTICULOS AE ON E.ID_A_DET = AE.ID_A'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO <= :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.SERIE >= :SERIE_INI AND'
      'D.SERIE <= :SERIE_FIN AND'
      '((D.ARTICULO >= :ARTICULO_INI AND'
      'D.ARTICULO <= :ARTICULO_FIN) OR (E.DETALLE >= :ARTICULO_INI AND'
      'E.DETALLE <= :ARTICULO_FIN)) AND'
      'C.ALMACEN >= :ALM_INI AND'
      'C.ALMACEN <= :ALM_FIN AND'
      'A.FAMILIA >= :FAMILIA_INI AND'
      'A.FAMILIA <= :FAMILIA_FIN AND'
      'CP.PROVEEDOR >= :PROV_INI AND'
      'CP.PROVEEDOR <= :PROV_FIN AND'
      'C.FECHA >= :FECHA_INI AND'
      'C.FECHA <= :FECHA_FIN AND'
      'DP.UNIDADES_POR_SERVIR > 0 AND'
      'DP.LINEA_SERVIDA = 0 AND'
      'C.ESTADO = 0'
      'ORDER BY C.RIG, C.ALMACEN, CP.PROVEEDOR, C.FECHA')
    UniDirectional = False
    Left = 40
    Top = 88
  end
  object DSxUnidadesPendientes: TDataSource
    DataSet = xUnidadesPendientes
    Left = 145
    Top = 88
  end
  object frDBxUnidadesPendientes: TfrDBDataSet
    DataSource = DSxUnidadesPendientes
    Left = 255
    Top = 88
  end
  object frxUnidPendRecibir: TfrxHYReport
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
    OnBeforePrint = frxUnidPendRecibirBeforePrint
    OnGetValue = frxUnidPendRecibirGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 151
    Top = 23
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
    Left = 326
    Top = 24
  end
end
