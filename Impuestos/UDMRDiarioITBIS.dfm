object DMRDiarioITBIS: TDMRDiarioITBIS
  OldCreateOrder = False
  OnCreate = DMRDiarioIVACreate
  OnDestroy = DMRDiarioIVADestroy
  Left = 388
  Top = 137
  Height = 412
  Width = 488
  object QSPDiarioITBIS: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_C_CREA_DIARIO_ITBIS'
      
        '(?empresa,?ejercicio,?canal,?pais,?signo,?tipo,?serie, ?fecha_de' +
        'sde,'
      '?fecha_hasta, ?num_desde, ?num_hasta,?modo)')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 64
    object QSPDiarioITBISREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QSPDiarioITBISTIPO_RAZON: TIntegerField
      DisplayLabel = 'Tipo raz'#243'n'
      FieldName = 'TIPO_RAZON'
    end
    object QSPDiarioITBISCODIGO_NCF: TFIBStringField
      DisplayLabel = 'Codigo NCF'
      FieldName = 'CODIGO_NCF'
      Size = 60
    end
    object QSPDiarioITBISFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object QSPDiarioITBISTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QSPDiarioITBISCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 80
    end
    object QSPDiarioITBISTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QSPDiarioITBISDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QSPDiarioITBISDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QSPDiarioITBISDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QSPDiarioITBISMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QSPDiarioITBISESTATUS: TFIBStringField
      DisplayLabel = 'Status'
      FieldName = 'ESTATUS'
      Size = 100
    end
    object QSPDiarioITBISCIF: TFIBStringField
      DisplayLabel = 'C.I.F.'
      FieldName = 'CIF'
    end
    object QSPDiarioITBISDESCRIPCION_CTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_CTA'
      Size = 150
    end
    object QSPDiarioITBISTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QSPDiarioITBISFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QSPDiarioITBISDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object QSPDiarioITBISB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QSPDiarioITBISP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QSPDiarioITBISP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_REC'
    end
    object QSPDiarioITBISI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QSPDiarioITBISI_REC: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_REC'
    end
    object QSPDiarioITBISNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QSPDiarioITBISRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object QSPDiarioITBISNCF: TFIBStringField
      DisplayLabel = 'NFC'
      FieldName = 'NCF'
      Size = 19
    end
    object QSPDiarioITBISNCF_CONTADOR: TFIBStringField
      DisplayLabel = 'Contador NFC'
      FieldName = 'NCF_CONTADOR'
      Size = 19
    end
    object QSPDiarioITBISNCF_ORIGEN: TFIBStringField
      DisplayLabel = 'NFC Orig.'
      FieldName = 'NCF_ORIGEN'
      Size = 19
    end
    object QSPDiarioITBISNCF_ORIGEN_CONTADOR: TFIBStringField
      DisplayLabel = 'Contador NFC Orig.'
      FieldName = 'NCF_ORIGEN_CONTADOR'
      Size = 19
    end
    object QSPDiarioITBISDESCRIPCION_BIENES: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_BIENES'
      Size = 60
    end
    object QSPDiarioITBISTIPO_BIENES: TFIBStringField
      DisplayLabel = 'Tipo Bien'
      FieldName = 'TIPO_BIENES'
      Size = 2
    end
    object QSPDiarioITBISTIPO_ID: TIntegerField
      DisplayLabel = 'Tipo ID'
      FieldName = 'TIPO_ID'
    end
    object QSPDiarioITBISIMPORTE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Retencion'
      FieldName = 'IMPORTE_RETENCION'
    end
    object QSPDiarioITBISFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QSPDiarioITBISIMPORTE_ISR: TFloatField
      DisplayLabel = 'Imp. ISR'
      FieldName = 'IMPORTE_ISR'
    end
  end
  object xVer_Canales_Series: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_CANALES_SERIES'
      'WHERE empresa=?empresa AND ejercicio=?ejercicio AND '
      '               canal=?canal AND serie=?serie')
    UniDirectional = False
    Left = 40
    Top = 160
  end
  object SPRangos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_diario_iva_max_min (?empresa,?ejercicio,?can' +
        'al,?signo)')
    Transaction = TLocal
    AutoTrans = True
    Left = 168
    Top = 256
  end
  object DSQSPDiarioITBIS: TDataSource
    DataSet = QSPDiarioITBIS
    Left = 168
    Top = 64
  end
  object DSxVer_Canales_Series: TDataSource
    DataSet = xVer_Canales_Series
    Left = 168
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 288
    Top = 16
  end
  object frDiarioITBIS: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDiarioITBISGetValue
    OnBeforePrint = frDiarioITBISEnterRect
    OnEnterRect = frDiarioITBISEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object frDBQSPDiarioITBIS: TfrDBDataSet
    DataSource = DSQSPDiarioITBIS
    Left = 288
    Top = 64
  end
  object QMTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM C_CREA_DIARIO_IVA_TOTALES(?empresa,?ejercicio,?canal,?pais,' +
        '?signo,?tipo,?serie, ?fecha_desde,'
      '?fecha_hasta, ?num_desde, ?num_hasta,?modo)'
      '')
    UniDirectional = False
    Left = 40
    Top = 112
    object QMTotalesB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMTotalesI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMTotalesI_REC: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_REC'
    end
    object QMTotalesMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMTotalesTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMTotalesP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMTotalesP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_REC'
    end
    object QMTotalesT_TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'T_TITULO'
      Size = 15
    end
    object QMTotalesM_TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'M_TITULO'
      Size = 40
    end
  end
  object DSQMTotales: TDataSource
    DataSet = QMTotales
    Left = 168
    Top = 112
  end
  object frDSQMTotales: TfrDBDataSet
    DataSource = DSQMTotales
    Left = 288
    Top = 112
  end
  object frxDiarioITBIS: TfrxHYReport
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
    OnBeforePrint = frxDiarioITBISBeforePrint
    OnGetValue = frxDiarioITBISGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 168
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TER.NIF FROM sys_empresas emp '
      'join sys_terceros ter on (ter.tercero=emp.tercero)'
      '  where empresa=?empresa')
    UniDirectional = False
    Left = 40
    Top = 208
    object xEmpresaNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object SPTotalesExportar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'select count(*) as cantidad_registros, sum(b_imponible) as total' +
        '_monto_facturado'
      
        ' from Z_C_CREA_DIARIO_ITBIS(?empresa,?ejercicio,?canal,?pais,?si' +
        'gno,?tipo,?serie, ?fecha_desde,'
      '?fecha_hasta, ?num_desde, ?num_hasta,?modo) ')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 40
    Top = 256
  end
end
