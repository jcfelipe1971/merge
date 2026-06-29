object DMLstHojaDePreparacion: TDMLstHojaDePreparacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 504
  Top = 76
  Height = 604
  Width = 459
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 16
  end
  object frHojaDePreparacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 176
    Top = 16
    ReportForm = {19000000}
  end
  object frxHojaDePreparacion: TfrxHYReport
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
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 328
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDSQMCabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 329
    Top = 63
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_S_PRE'
      'WHERE EMPRESA=?EMPRESA AND HOJA=?HOJA'
      'ORDER BY HOJA')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 64
    object QMCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabeceraRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCabeceraTITUTLO_RESPONSABLE: TFIBStringField
      DisplayLabel = 'Nombre Resp.'
      FieldName = 'TITUTLO_RESPONSABLE'
      Size = 60
    end
    object QMCabeceraFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMCabeceraFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMCabeceraCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMCabeceraTOTAL_UNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'TOTAL_UNIDADES'
    end
    object QMCabeceraTOTAL_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Total Uds. Log.'
      FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMCabeceraID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraTOTAL_PUNTOS: TFloatField
      DisplayLabel = 'Total Puntos'
      FieldName = 'TOTAL_PUNTOS'
    end
    object QMCabeceraGENERAR_ALBARAN: TIntegerField
      DisplayLabel = 'Generar Alb.'
      FieldName = 'GENERAR_ALBARAN'
    end
    object QMCabeceraCP: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CP'
      Size = 10
    end
    object QMCabeceraLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMCabeceraPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMCabeceraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 176
    Top = 64
  end
  object frDSQMDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 329
    Top = 159
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_PRE'
      'WHERE ID_HOJA=?ID'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    Left = 40
    Top = 160
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNIDADES_PED'
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetallePICO: TFloatField
      DisplayLabel = 'Pico'
      FieldName = 'PICO'
    end
    object QMDetallePUNTOS: TFloatField
      DisplayLabel = 'Puntos'
      FieldName = 'PUNTOS'
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePREPARACION: TIntegerField
      DisplayLabel = 'Preparacion'
      FieldName = 'PREPARACION'
    end
    object QMDetalleID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetalleID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleUNIDADES_A_SERVIR: TFloatField
      DisplayLabel = 'Uds. a Servir'
      FieldName = 'UNIDADES_A_SERVIR'
    end
    object QMDetalleCAJAS: TIntegerField
      DisplayLabel = 'Cajas'
      FieldName = 'CAJAS'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 176
    Top = 160
  end
  object frDSQMDetalleUbicacion: TfrDBDataSet
    DataSource = DSQMDetalleUbicacion
    Left = 329
    Top = 207
  end
  object QMDetalleUbicacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*SELECT * FROM GES_DETALLES_S_PRE_UBICACIONES*/'
      
        'SELECT detubi.*, ubi.titulo as titulo_ubi FROM GES_DETALLES_S_PR' +
        'E_UBICACIONES detubi'
      
        'left join art_almacenes_ubicaciones ubi on (detubi.id_ubicacion ' +
        '= ubi.id_ubicacion)'
      'WHERE '
      '    ID_HOJA_DET=?ID'
      'ORDER BY LINEA_UBICACION')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 208
    object QMDetalleUbicacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleUbicacionHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMDetalleUbicacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleUbicacionLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDetalleUbicacionUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetalleUbicacionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleUbicacionCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleUbicacionESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleUbicacionREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetalleUbicacionPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleUbicacionVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDetalleUbicacionPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetalleUbicacionDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDetalleUbicacionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetalleUbicacionID_HOJA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA'
    end
    object QMDetalleUbicacionID_HOJA_DET: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_HOJA_DET'
    end
    object QMDetalleUbicacionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleUbicacionID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleUbicacionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMDetalleUbicacionID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetalleUbicacionID_D_S_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_UBICACION'
    end
    object QMDetalleUbicacionLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMDetalleUbicacionID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleUbicacionTITULO_UBI: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_UBI'
      Size = 60
    end
  end
  object DSQMDetalleUbicacion: TDataSource
    DataSet = QMDetalleUbicacion
    Left = 176
    Top = 208
  end
  object frDSxCliente: TfrDBDataSet
    DataSource = DSxCliente
    Left = 329
    Top = 255
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT cu.*,ter.nombre_r_social as titulo_transportista'
      'FROM VER_CLIENTES_CUENTAS cu'
      
        'left join EMP_ACREEDORES EA on (cu.empresa=ea.empresa and cu.tra' +
        'nsportista=ea.acreedor)'
      'left join SYS_TERCEROS ter on (EA.TERCERO=ter.TERCERO)'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 256
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 176
    Top = 256
  end
  object frDSxArticulo: TfrDBDataSet
    DataSource = DSxArticulo
    Left = 329
    Top = 303
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  ARTICULO=ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 304
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 176
    Top = 304
  end
  object frDSxTipoUnidLogisticas: TfrDBDataSet
    DataSource = DSxTipoUnidLogisticas
    Left = 329
    Top = 351
  end
  object xTipoUnidLogisticas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_UNIDAD_LOGISTICA'
      'WHERE'
      '  TIPO=?TIPO_UNIDAD_LOGISTICA')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 352
    object xTipoUnidLogisticasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xTipoUnidLogisticasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xTipoUnidLogisticasUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
  end
  object DSxTipoUnidLogisticas: TDataSource
    DataSet = xTipoUnidLogisticas
    Left = 176
    Top = 352
  end
  object frDSxCabPedido: TfrDBDataSet
    DataSource = DSxCabPedido
    Left = 329
    Top = 399
  end
  object xCabPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      '  ID_S=?ID_S')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 400
    object xCabPedidoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCabPedidoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCabPedidoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCabPedidoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xCabPedidoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xCabPedidoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCabPedidoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xCabPedidoMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xCabPedidoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xCabPedidoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCabPedidoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCabPedidoDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xCabPedidoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCabPedidoCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xCabPedidoSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xCabPedidoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xCabPedidoCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xCabPedidoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xCabPedidoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xCabPedidoBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xCabPedidoLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xCabPedidoBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xCabPedidoI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xCabPedidoS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xCabPedidoM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xCabPedidoC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object xCabPedidoAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xCabPedidoS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xCabPedidoS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xCabPedidoB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xCabPedidoDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xCabPedidoDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xCabPedidoI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xCabPedidoI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xCabPedidoB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xCabPedidoI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xCabPedidoPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xCabPedidoI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xCabPedidoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xCabPedidoENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xCabPedidoFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xCabPedidoFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
    end
    object xCabPedidoSERVIDO: TIntegerField
      DisplayLabel = 'Serv.'
      FieldName = 'SERVIDO'
    end
    object xCabPedidoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xCabPedidoPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xCabPedidoTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xCabPedidoAGRUPACION_KRI: TIntegerField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION_KRI'
    end
    object xCabPedidoID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xCabPedidoIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xCabPedidoUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xCabPedidoMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object xCabPedidoTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xCabPedidoPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object xCabPedidoI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xCabPedidoI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object xCabPedidoCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xCabPedidoVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object xCabPedidoPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xCabPedidoNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Internas'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object xCabPedidoTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object xCabPedidoFECHA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Cli.'
      FieldName = 'FECHA_CLIENTE'
    end
    object xCabPedidoTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xCabPedidoFECHA_CREACION_KRI: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION_KRI'
    end
    object xCabPedidoPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cli.'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
  end
  object DSxCabPedido: TDataSource
    DataSet = xCabPedido
    Left = 176
    Top = 400
  end
  object frDSxDetPedido: TfrDBDataSet
    DataSource = DSxDetPedido
    Left = 329
    Top = 447
  end
  object xDetPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 448
    object xDetPedidoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetPedidoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetPedidoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetPedidoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetPedidoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDetPedidoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDetPedidoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetPedidoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDetPedidoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xDetPedidoMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xDetPedidoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xDetPedidoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDetPedidoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDetPedidoUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xDetPedidoUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Serv.'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object xDetPedidoUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
    end
    object xDetPedidoUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reservadas'
      FieldName = 'UNIDADES_RESERVADAS'
    end
    object xDetPedidoSERVIDO: TIntegerField
      DisplayLabel = 'Serv.'
      FieldName = 'SERVIDO'
    end
    object xDetPedidoPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xDetPedidoPIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object xDetPedidoBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xDetPedidoDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object xDetPedidoDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xDetPedidoDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xDetPedidoCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xDetPedidoP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDetPedidoM_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object xDetPedidoTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xDetPedidoP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xDetPedidoP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xDetPedidoBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xDetPedidoB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xDetPedidoI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Descuento'
      FieldName = 'I_DESCUENTO'
    end
    object xDetPedidoB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xDetPedidoB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xDetPedidoI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xDetPedidoC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object xDetPedidoC_RECARGO: TFloatField
      DisplayLabel = 'Cuota Rec.'
      FieldName = 'C_RECARGO'
    end
    object xDetPedidoT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object xDetPedidoM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xDetPedidoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDetPedidoENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xDetPedidoENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object xDetPedidoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xDetPedidoUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xDetPedidoORDEN_PRODUCCION: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object xDetPedidoUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object xDetPedidoDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object xDetPedidoID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xDetPedidoID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xDetPedidoID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xDetPedidoID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object xDetPedidoCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Comision Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object xDetPedidoI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object xDetPedidoFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xDetPedidoFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object xDetPedidoTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object xDetPedidoMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object xDetPedidoTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object xDetPedidoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xDetPedidoTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object xDetPedidoPROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object xDetPedidoORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object xDetPedidoID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object xDetPedidoAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object xDetPedidoPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xDetPedidoNOTAS2: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object xDetPedidoCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xDetPedidoCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object xDetPedidoPRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Nro. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object xDetPedidoTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object xDetPedidoTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Titulo UL'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object xDetPedidoUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
  end
  object DSxDetPedido: TDataSource
    DataSet = xDetPedido
    Left = 176
    Top = 448
  end
  object frDSQMResponsable: TfrDBDataSet
    DataSource = DSQMResponsable
    Left = 329
    Top = 111
  end
  object QMResponsable: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_EF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?RESPONSABLE')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_EF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?RESPONSABLE')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 112
    object QMResponsableEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMResponsableEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMResponsableTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMResponsableTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMResponsableNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSQMResponsable: TDataSource
    DataSet = QMResponsable
    Left = 176
    Top = 112
  end
  object frDSQMDetalleUbicacionSimple: TfrDBDataSet
    DataSource = DSQMDetalleUbicacionSimple
    Left = 329
    Top = 503
  end
  object DSQMDetalleUbicacionSimple: TDataSource
    DataSet = QMDetalleUbicacionSimple
    Left = 176
    Top = 504
  end
  object QMDetalleUbicacionSimple: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM EMP_UBICACION_SIMPLE'
      'WHERE'
      'ID_UBICACION_SIMPLE=?ID_UBICACION')
    UniDirectional = False
    DataSource = DSQMDetalleUbicacion
    Left = 40
    Top = 504
  end
end
