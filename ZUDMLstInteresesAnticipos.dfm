object ZDMLstInteresesAnticipos: TZDMLstInteresesAnticipos
  OldCreateOrder = False
  OnCreate = ZDMLstAnticiposCreate
  Left = 416
  Top = 235
  Height = 333
  Width = 489
  object xAnticipoDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID FROM Z_INTERES_ANTICIPO_CAB'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  ID=?ID')
    UniDirectional = False
    Left = 32
    Top = 66
    object xAnticipoDesdeID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 14
  end
  object xAnticipoHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID FROM Z_INTERES_ANTICIPO_CAB'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  ID=?ID')
    UniDirectional = False
    Left = 32
    Top = 122
    object xAnticipoHastaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object DSxAnticipoDesde: TDataSource
    DataSet = xAnticipoDesde
    Left = 118
    Top = 66
  end
  object DSxAnticipoHasta: TDataSource
    DataSet = xAnticipoHasta
    Left = 118
    Top = 124
  end
  object xAnticipos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_INTERES_ANTICIPO_CAB'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  ID>=?IDDESDE AND'
      '  ID<=?IDHASTA'
      'order by id')
    UniDirectional = False
    Left = 28
    Top = 184
    object xAnticiposID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xAnticiposEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAnticiposEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAnticiposCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAnticiposCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xAnticiposESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xAnticiposINTERES: TFloatField
      DisplayLabel = 'Interes'
      FieldName = 'INTERES'
    end
    object xAnticiposFECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. Corte'
      FieldName = 'FECHA_CORTE'
    end
    object xAnticiposCONTABILIZAR: TIntegerField
      DisplayLabel = 'Contabilizar'
      FieldName = 'CONTABILIZAR'
    end
    object xAnticiposREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xAnticiposASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xAnticiposCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xAnticiposC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA'
      Size = 15
    end
    object xAnticiposCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_PGC'
    end
    object xAnticiposC_CONTRAPARTIDA_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA_PGC'
    end
    object xAnticiposIMPORTE_INTERES: TFloatField
      DisplayLabel = 'Imp. Interes'
      FieldName = 'IMPORTE_INTERES'
    end
  end
  object HYRSxAnticipos: THYReportSource
    DataSet = xAnticipos
    CloseDataset = True
    Left = 296
    Top = 182
  end
  object DSxAnticipos: TDataSource
    DataSet = xAnticipos
    Left = 118
    Top = 182
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  Z_ID_INTERES_ANTICIPO=?ID')
    UniDirectional = False
    DataSource = DSxAnticipos
    Left = 58
    Top = 238
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetalleANTICIPO: TIntegerField
      DisplayLabel = 'Anticipo'
      FieldName = 'ANTICIPO'
    end
    object xDetalleTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xDetalleCUENTA_CLI_PRO: TFIBStringField
      DisplayLabel = 'Cta. Cli./Pro.'
      FieldName = 'CUENTA_CLI_PRO'
      Size = 15
    end
    object xDetalleC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA'
      Size = 15
    end
    object xDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDetalleCONTABILIZAR: TIntegerField
      DisplayLabel = 'Contabilizar'
      FieldName = 'CONTABILIZAR'
    end
    object xDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xDetalleASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xDetalleID_CAB_Z_TALONES: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_TALONES'
    end
    object xDetalleMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object xDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xDetalleZ_TALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'Z_TALON'
      Size = 15
    end
    object xDetalleZ_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'Z_DESCRIPCION'
      Size = 60
    end
    object xDetalleZ_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'Z_BANCO'
    end
    object xDetalleC_CONTRAPARTIDA_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA_PGC'
    end
    object xDetalleCUENTA_CLI_PRO_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Cli./Prov.'
      FieldName = 'CUENTA_CLI_PRO_PGC'
    end
    object xDetalleZ_INTERES_ANTICIPO: TFloatField
      DisplayLabel = 'Intereses Ant.'
      FieldName = 'Z_INTERES_ANTICIPO'
    end
    object xDetalleZ_FECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. Corte'
      FieldName = 'Z_FECHA_CORTE'
    end
    object xDetalleZ_IMPORTE_INTERES: TFloatField
      DisplayLabel = 'Importe Int.'
      FieldName = 'Z_IMPORTE_INTERES'
    end
    object xDetalleZ_MARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'Z_MARCADO'
    end
    object xDetalleZ_ID_INTERES_ANTICIPO: TIntegerField
      DisplayLabel = 'ID Interes Ant.'
      FieldName = 'Z_ID_INTERES_ANTICIPO'
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 136
    Top = 238
  end
  object HYRxDetalle: THYReportSource
    DataSet = xDetalle
    CloseDataset = True
    Left = 298
    Top = 242
  end
  object frDBxAnticipos: TfrDBDataSet
    DataSource = DSxAnticipos
    Left = 208
    Top = 182
  end
  object frDBDBDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 212
    Top = 240
  end
  object frLstInteresAnticipo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Interes Anticipo'
    RebuildPrinter = False
    OnBeforePrint = frLstInteresAnticipoEnterRect
    OnEnterRect = frLstInteresAnticipoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 216
    Top = 20
    ReportForm = {19000000}
  end
  object xBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM emp_bancos'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSxAnticipos
    Left = 212
    Top = 98
    object xBancoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBancoBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xBancoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xBancoCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xBancoRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object xBancoRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object xBancoACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xBancoRIESGO_DES: TFloatField
      DisplayLabel = 'Riesgo Descuento'
      FieldName = 'RIESGO_DES'
    end
    object xBancoRIESGO_CFM: TFloatField
      DisplayLabel = 'Riesgo Confirming'
      FieldName = 'RIESGO_CFM'
    end
    object xBancoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xBancoCUENTA_CORRIENTE: TFIBStringField
      DisplayLabel = 'Cta. Corriente'
      FieldName = 'CUENTA_CORRIENTE'
    end
    object xBancoBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object xBancoIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
  end
  object DSxBanco: TDataSource
    DataSet = xBanco
    Left = 290
    Top = 97
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, GENERO_MASCULINO, DEC_VER '
      'FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 384
    Top = 103
    object xMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xMonedasGENERO_MASCULINO: TIntegerField
      DisplayLabel = 'Masculino'
      FieldName = 'GENERO_MASCULINO'
    end
    object xMonedasDEC_VER: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 398
    Top = 167
  end
  object SPDameInteresAnticipo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(ID),min(ID)  from Z_INTERES_ANTICIPO_CAB'
      
        '  where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?c' +
        'anal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 400
    Top = 26
  end
  object frxLstInteresAnticipo: TfrxHYReport
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
    Left = 315
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
