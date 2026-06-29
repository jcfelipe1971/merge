object DMRUnidadesPendientes: TDMRUnidadesPendientes
  OldCreateOrder = False
  OnCreate = DMRDepositosActivosCreate
  OnDestroy = DMRInventario_StocksDestroy
  Left = 424
  Top = 234
  Height = 482
  Width = 494
  object frUnidadesPendientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Unidades Pendientes'
    RebuildPrinter = False
    OnGetValue = frUnidadesPendientesGetValue
    OnBeforePrint = frUnidadesPendientesEnterRect
    OnEnterRect = frUnidadesPendientesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 24
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 296
    Top = 24
  end
  object xUnidadesPendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      '-- Se modifica dinamicamente'
      
        'SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, ' +
        'D.LINEA, D.ALMACEN ALMACEN_DET, D.ARTICULO, D.TITULO,'
      
        '       D.UNIDADES, D.PRECIO, D.PIEZAS_X_BULTO, D.BULTOS, D.DESCU' +
        'ENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.COMISION,'
      
        '       D.P_COSTE, D.TIPO_IVA, D.P_IVA, D.P_RECARGO, D.BRUTO, D.B' +
        '_COMISION, D.DTO_PP, D.DTO_CIAL, D.I_DTO_PP,'
      
        '       D.I_DTO_CIAL, D.I_DESCUENTO, D.B_IMPONIBLE, D.I_COMISION,' +
        ' D.NOTAS NOTAS_DET, D.UNIDADES_EXT, D.IVA_INCLUIDO,'
      
        '       D.NSERIE, D.B_COMISION_CANAL, D.UNIDADES_SEC, D.NO_FABRIC' +
        'ACION_KRI, D.ID_DETALLES_S, D.ID_A_M_C_T, D.ID_C_A,'
      
        '       D.ID_A, D.COMISION_LINEAL, D.I_COMISION_LINEAL, D.TITULO_' +
        'IDIOMA, D.MARGEN_KRI, D.TIPO_LINEA_KRI, D.ORDEN,'
      
        '       D.TIPO_LINEA, D.ORIGEN, D.ID_P, D.APLICA_UNIDADES_SECUNDA' +
        'RIAS, D.PROYECTO PROYECTO_DET, D.CERTIFICADO,'
      
        '       D.CERT_NEGATIVO, D.LINEA_RELACION, D.NOTAS2 NOTAS2_DET, D' +
        '.CRC_NOTAS, D.CRC_NOTAS2, D.PRO_NUM_PLANO,'
      
        '       D.ID_REGISTRO, D.ID_DESPIECE, D.COSTE_ADICIONAL, D.MANIPU' +
        'LACION, D.INVERSION_SUJETO_PASIVO, D.B_DTO_LINEA,'
      
        '       D.C_IVA, D.C_RECARGO, D.LIQUIDO, D.T_COSTE, D.M_BRUTO, D.' +
        'LOTE_SIMPLE, D.TIPO_IMPUESTO_ADICIONAL,'
      
        '       D.AGENTE AGENTE_DET, D.PESO, D.PESO_TOTAL, D.PESO_REAL, D' +
        '.PEDIR, D.UNIDAD_FOMENTO,'
      '       --'
      
        '       DP.FECHA_ENTREGA_PREV FECHA_ENTREGA_PREV_DET, DP.U_SERVID' +
        'AS, DP.U_PENDIENTES, DP.U_RESERVADAS, DP.SERVIDO,'
      
        '       DP.ORDEN_PRODUCCION, DP.DIRECCION_ENTREGA, DP.FECHA_REC_D' +
        'ET, DP.ID_ESC, DP.ID_ORDEN, DP.ID_MEDIDA,'
      
        '       DP.TIPO_UNIDAD_LOGISTICA, DP.UNIDADES_LOGISTICAS, DP.ID_R' +
        'EGISTRO, DP.FECHA_CONF_DET, DP.ID_IMAGEN,'
      
        '       DP.U_PREPARADAS, DP.DIRECCION_ALM_LOGISTICO, DP.U_LOGISTI' +
        'CAS_RESERVADAS, DP.ID_ESC_2,'
      '       --'
      
        '       C.ALMACEN ALMACEN_CAB, C.MONEDA, C.FECHA, C.CLIENTE, C.TE' +
        'RCERO, C.DIRECCION, C.SU_REFERENCIA, C.FORMA_PAGO,'
      
        '       C.CAMPANYA, C.NOTAS NOTAS_CAB, C.ESTADO, C.BULTOS, C.BRUT' +
        'O, C.I_DTO_LINEAS, C.S_BASES, C.M_BRUTO, C.C_TOTAL,'
      
        '       C.AGENTE AGENTE_CAB, C.S_CUOTA_IVA, C.S_CUOTA_RE, C.DTO_P' +
        'P, C.DTO_CIAL, C.B_COMISION, C.I_COMISION,'
      
        '       C.POR_FINANCIACION, C.I_FINANCIACION, C.I_DTO_PP, C.I_DTO' +
        '_CIAL, C.PORTES, C.I_FINANCIACION_CANAL,'
      
        '       C.S_BASES_CANAL, C.S_CUOTA_IVA_CANAL, C.S_CUOTA_RE_CANAL,' +
        ' C.CHG_MONEDA, C.TARIFA, C.B_DTO_LINEAS, C.ID_S,'
      
        '       C.MODIFICA_DOC, C.COMISION_LINEAL, C.I_COMISION_LINEAL, C' +
        '.FECHA_ENTREGA, C.IDIOMA, C.ENVIO, C.USUARIO,'
      
        '       C.CONTACTO, C.MARGEN_KRI, C.NOTAS_INTERNAS_KRI, C.TIPO_LI' +
        'NEA_KRI, C.I_PORTES, C.POR_PORTES, C.TIPO_PORTES,'
      
        '       C.I_PORTES_CANAL, C.RANGO, C.INDICE, C.CAMBIO_FIJO, C.VAL' +
        'OR_CAMB_FIJO, C.PROYECTO PROYECTO_CAB,'
      
        '       C.FECHA_CREACION_KRI, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_' +
        'OBSERVACION, C.ID_REGISTRO, C.INVERSION_SUJETO_PASIVO,'
      
        '       C.TRANSPORTISTA, C.POR_RETENCION_GARANTIA, C.I_RETENCION_' +
        'GARANTIA, C.FECHA_RETENCION_GARANTIA, C.BANCO,'
      
        '       C.LIQUIDO, C.LIQUIDO_CANAL, C.CLIENTE_EDI, C.COMPRADOR, C' +
        '.VENDEDOR, C.DPTO, C.RECEPTOR, C.MUELLE, C.PAGADOR,'
      
        '       C.RECOGIDA, C.DESTINO, C.S_CUOTA_IMPUESTO_ADICIONAL, C.S_' +
        'CUOTA_IMP_ADICIONAL_CANAL, C.DIR_ENTREGA_MANUAL,'
      
        '       C.DIR_RECOGIDA_MANUAL, C.EMPAQUETADO_EMPRESA, C.EQUIPO_RE' +
        'COGIDA, C.EQUIPO_ENTREGA, C.MATRICULA_RECOGIDA,'
      
        '       C.MATRICULA_ENTREGA, C.FECHA_RECOGIDA_MANUAL, C.FECHA_ENT' +
        'REGA_MANUAL, C.VALOR_UNIDAD_FOMENTO, C.MODO_IVA,'
      '       C.ID_FICHA_TECNICA, C.ORIGEN_DOCUMENTO,'
      '       --'
      
        '       CP.FECHA_ENTREGA_PREV FECHA_ENTREGA_PREV_CAB, CP.FECHA_RE' +
        'C_CAB, CP.Z_COD_BARRAS_PED, CP.ID_REGISTRO,'
      
        '       CP.LISTO_PARA_PREPARAR, CP.PEDIDO_VALORADO, CP.EMPLEADO_R' +
        'ESPONSABLE, CP.EMPLEADO_ATENCION, CP.DOCUMENTO_MUESTRAS,'
      
        '       CP.ASEGURADO, CP.PACIENTE, CP.AUTORIZACION, CP.POLIZA, CP' +
        '.FEC_REC_IH, CP.FECHA_CLIENTE, CP.DATOS_EMBARQUE_IZQ,'
      
        '       CP.DATOS_EMBARQUE_DER, CP.ENTRADA_AGRUPACION, CP.FECHA_PA' +
        'CKING_LIST, CP.TRATADO,'
      '       --'
      '       A.*, E.DETALLE, E.CANTIDAD, AE.TITULO TITULO_DETALLE,'
      '       (E.CANTIDAD * D.UNIDADES) UNIDADES_ESCANDALLO'
      'FROM GES_DETALLES_S D'
      
        'JOIN GES_DETALLES_S_PED DP ON (D.ID_DETALLES_S = DP.ID_DETALLES_' +
        'S)'
      'JOIN GES_CABECERAS_S C ON (D.ID_S = C.ID_S)'
      'JOIN GES_CABECERAS_S_PED CP ON (C.ID_S = CP.ID_S)'
      'JOIN ART_ARTICULOS A ON (D.ID_A = A.ID_A)'
      
        'LEFT JOIN ART_ARTICULOS_ESCANDALLO E ON A.EMPRESA = E.EMPRESA AN' +
        'D A.ARTICULO = E.ARTICULO'
      'LEFT JOIN ART_ARTICULOS AE ON (E.ID_A_DET = AE.ID_A)'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO <= :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.SERIE >= :SERIE_INI AND'
      'D.SERIE <= :SERIE_FIN AND'
      '((D.ARTICULO >= :ARTICULO_INI AND'
      'D.ARTICULO <= :ARTICULO_FIN) OR (E.DETALLE >= :ARTICULO_INI AND'
      'E.DETALLE <= :ARTICULO_FIN)) AND'
      'A.FAMILIA >= :FAMILIA_INI AND'
      'A.FAMILIA <= :FAMILIA_FIN AND'
      'D.ALMACEN >= :ALMACEN_INI AND'
      'D.ALMACEN <= :ALMACEN_FIN AND'
      'C.CLIENTE >= :CLI_INI AND'
      'C.CLIENTE <= :CLI_FIN AND'
      'DP.U_PENDIENTES > 0 AND'
      'DP.SERVIDO = 0 AND'
      'C.ESTADO = 0'
      '-- Segun parametro LSTPEPP001'
      'AND'
      'CP.FECHA_ENTREGA_PREV >= :FECHA_INI AND'
      'CP.FECHA_ENTREGA_PREV <= :FECHA_FIN')
    UniDirectional = False
    Left = 48
    Top = 88
  end
  object DSxUnidadesPendientes: TDataSource
    DataSet = xUnidadesPendientes
    Left = 168
    Top = 88
  end
  object frDBxUnidadesPendientes: TfrDBDataSet
    DataSource = DSxUnidadesPendientes
    Left = 296
    Top = 88
  end
  object frxUnidadesPendientes: TfrxHYReport
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
    OnBeforePrint = frxUnidadesPendientesBeforePrint
    OnGetValue = frxUnidadesPendientesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 168
    Top = 24
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
    Left = 384
    Top = 24
  end
end
