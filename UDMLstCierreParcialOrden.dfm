object DMLstCierreParcialOrden: TDMLstCierreParcialOrden
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 618
  Top = 199
  Height = 342
  Width = 448
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 24
    Top = 16
  end
  object frDSQMCierreParcial: TfrDBDataSet
    DataSource = DSQMCierreParcial
    Left = 337
    Top = 87
  end
  object QMCierreParcial: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CIERRE_PARCIAL'
      'WHERE'
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    AfterOpen = QMCierreParcialAfterOpen
    BeforeClose = QMCierreParcialBeforeClose
    Left = 32
    Top = 88
    object QMCierreParcialEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object QMCierreParcialESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCierreParcialCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMCierreParcialID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMCierreParcialENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object QMCierreParcialDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET'
      'WHERE '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMCierreParcial
    AfterOpen = QMCierreParcialDetalleAfterOpen
    BeforeClose = QMCierreParcialDetalleBeforeClose
    Left = 32
    Top = 152
    object QMCierreParcialDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialDetalleCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCierreParcialDetalleRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMCierreParcialDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCierreParcialDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMCierreParcialDetalleORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QMCierreParcialDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCierreParcialDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMCierreParcialDetalleID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMCierreParcialDetalleID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMCierreParcialDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMCierreParcialDetalleRIG_MOV: TIntegerField
      DisplayLabel = 'Rig Mov.'
      FieldName = 'RIG_MOV'
    end
    object QMCierreParcialDetalleENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object QMCierreParcialDetalleLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CIERRE=?CIERRE AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY SUB_LINEA')
    UniDirectional = False
    DataSource = DSQMCierreParcialDetalle
    Left = 40
    Top = 216
    object QMCierreParcialDetalleLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCierreParcialDetalleLoteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCierreParcialDetalleLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCierreParcialDetalleLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCierreParcialDetalleLoteCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMCierreParcialDetalleLoteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCierreParcialDetalleLoteSUB_LINEA: TIntegerField
      DisplayLabel = 'Sublinea'
      FieldName = 'SUB_LINEA'
    end
    object QMCierreParcialDetalleLoteRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMCierreParcialDetalleLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMCierreParcialDetalleLoteALM_DEST: TFIBStringField
      DisplayLabel = 'Alm. Dst.'
      FieldName = 'ALM_DEST'
      Size = 3
    end
    object QMCierreParcialDetalleLoteUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
    end
    object QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISITCAS'
    end
    object QMCierreParcialDetalleLoteUNIDADES_POR_UL: TFloatField
      DisplayLabel = 'Cant.x U.L.'
      FieldName = 'UNIDADES_POR_UL'
    end
    object QMCierreParcialDetalleLoteUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMCierreParcialDetalleLoteID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMCierreParcialDetalleLoteID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMCierreParcialDetalleLoteID_DET: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DET'
    end
    object QMCierreParcialDetalleLoteESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCierreParcialDetalleLoteID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMCierreParcialDetalleLoteID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMCierreParcialDetalleLoteLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMCierreParcialDetalleLoteID_D_ST_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_ST_UBICACION'
    end
    object QMCierreParcialDetalleLoteENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object DSQMCierreParcial: TDataSource
    DataSet = QMCierreParcial
    Left = 184
    Top = 88
  end
  object DSQMCierreParcialDetalle: TDataSource
    DataSet = QMCierreParcialDetalle
    Left = 184
    Top = 152
  end
  object DSQMCierreParcialDetalleLote: TDataSource
    DataSet = QMCierreParcialDetalleLote
    Left = 184
    Top = 216
  end
  object frDSQMCierreParcialDetalle: TfrDBDataSet
    DataSource = DSQMCierreParcialDetalle
    Left = 341
    Top = 150
  end
  object frDSQMCierreParcialDetalleLote: TfrDBDataSet
    DataSource = DSQMCierreParcialDetalleLote
    Left = 342
    Top = 216
  end
  object frListadoCierre: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoCierreGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 192
    Top = 24
    ReportForm = {19000000}
  end
  object frxListadoCierre: TfrxHYReport
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
    OnBeforePrint = frxListadoCierreBeforePrint
    OnGetValue = frxListadoCierreGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 336
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
