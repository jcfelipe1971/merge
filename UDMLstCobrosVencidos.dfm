object DMLstCobrosVencidos: TDMLstCobrosVencidos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 787
  Top = 102
  Height = 526
  Width = 470
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 16
  end
  object DSxListado: TDataSource
    Left = 104
    Top = 80
  end
  object frCobros: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de recibos por Agente'
    RebuildPrinter = False
    OnGetValue = frCobrosGetValue
    OnBeforePrint = frCobrosEnterRect
    OnEnterRect = frCobrosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object frDBxListado: TfrDBDataSet
    DataSet = xListado
    Left = 191
    Top = 82
  end
  object frxCobros: TfrxHYReport
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
    OnBeforePrint = frxCobrosBeforePrint
    OnGetValue = frxCobrosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 105
    Top = 16
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
    Left = 256
    Top = 16
  end
  object xListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_cobros_vencidos where entrada=?entrada')
    UniDirectional = False
    Left = 32
    Top = 80
    object xListadoENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xListadoEMPRESALST: TIntegerField
      DisplayLabel = 'Empresa Lst.'
      FieldName = 'EMPRESALST'
    end
    object xListadoEJERCICIOLST: TIntegerField
      DisplayLabel = 'Ejercicio Lst.'
      FieldName = 'EJERCICIOLST'
    end
    object xListadoCANALLST: TIntegerField
      DisplayLabel = 'Canal Lst.'
      FieldName = 'CANALLST'
    end
    object xListadoSIGNOLST: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNOLST'
      Size = 1
    end
    object xListadoREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xListadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xListadoCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xListadoVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xListadoCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xListadoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xListadoLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xListadoPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xListadoIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object xListadoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xListadoTIT_FORMA_PAGO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_FORMA_PAGO'
      Size = 40
    end
    object xListadoTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xListadoREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xListadoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xListadoREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xListadoESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xListadoRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xListadoFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xListadoACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xListadoVENCIMIENTO_30: TFloatField
      DisplayLabel = 'Venc. 30'
      FieldName = 'VENCIMIENTO_30'
    end
    object xListadoVENCIMIENTO_60: TFloatField
      DisplayLabel = 'Venc. 60'
      FieldName = 'VENCIMIENTO_60'
    end
    object xListadoVENCIMIENTO_90: TFloatField
      DisplayLabel = 'Venc. 90'
      FieldName = 'VENCIMIENTO_90'
    end
    object xListadoVENCIMIENTO_120: TFloatField
      DisplayLabel = 'Venc. 120'
      FieldName = 'VENCIMIENTO_120'
    end
    object xListadoVENCIMIENTO_121: TFloatField
      DisplayLabel = 'Venc. +120'
      FieldName = 'VENCIMIENTO_121'
    end
    object xListadoMONEDA_LISTADO: TFIBStringField
      DisplayLabel = 'Mon. Listado'
      FieldName = 'MONEDA_LISTADO'
      Size = 3
    end
    object xListadoDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xListadoDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xListadoDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xListadoRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xListadoRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object xListadoFECHA_CIERR: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERR'
    end
    object xListadoDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xListadoN_COMERCIAL: TFIBStringField
      DisplayLabel = 'Comercial'
      FieldName = 'N_COMERCIAL'
      Size = 60
    end
    object xListadoR_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'R_SOCIAL'
      Size = 60
    end
    object xListadoTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xListadoDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xListadoNO_VENCIDO: TFloatField
      DisplayLabel = 'No venc.'
      FieldName = 'NO_VENCIDO'
    end
    object xListadoPROV_ACR: TIntegerField
      DisplayLabel = 'Prov./Acr.'
      FieldName = 'PROV_ACR'
    end
    object xListadoNO_VENCIDO_CANAL: TFloatField
      DisplayLabel = 'No venc.'
      FieldName = 'NO_VENCIDO_CANAL'
    end
    object xListadoVTO_30_CANAL: TFloatField
      DisplayLabel = 'Vto. Canal 30'
      FieldName = 'VTO_30_CANAL'
    end
    object xListadoVTO_60_CANAL: TFloatField
      DisplayLabel = 'Vto. Canal 60'
      FieldName = 'VTO_60_CANAL'
    end
    object xListadoVTO_90_CANAL: TFloatField
      DisplayLabel = 'Vto. Canal 90'
      FieldName = 'VTO_90_CANAL'
    end
    object xListadoVTO_120_CANAL: TFloatField
      DisplayLabel = 'Vto. Canal 120'
      FieldName = 'VTO_120_CANAL'
    end
    object xListadoVTO_121_CANAL: TFloatField
      DisplayLabel = 'Vto. Canal +120'
      FieldName = 'VTO_121_CANAL'
    end
    object xListadoMOROSO: TIntegerField
      DisplayLabel = 'Moroso'
      FieldName = 'MOROSO'
    end
    object xListadoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xListadoSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldName = 'SALDO_DEUDOR'
    end
    object xListadoSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldName = 'SALDO_ACREEDOR'
    end
    object xListadoTOT_VENCIMIENTO: TFloatField
      DisplayLabel = 'T.Venc.'
      FieldName = 'TOT_VENCIMIENTO'
    end
    object xListadoTOT_VENCIMIENTO_CANAL: TFloatField
      DisplayLabel = 'T. Venc. Canal'
      FieldName = 'TOT_VENCIMIENTO_CANAL'
    end
    object xListadoCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
  end
end
