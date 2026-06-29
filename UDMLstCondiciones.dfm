object DMLstCondiciones: TDMLstCondiciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 304
  Top = 231
  Height = 234
  Width = 373
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 218
    Top = 20
  end
  object frCondiciones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frCondicionesGetValue
    OnBeforePrint = frCondicionesEnterRect
    OnEnterRect = frCondicionesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 28
    Top = 20
    ReportForm = {19000000}
  end
  object xCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_C'
      '  where (empresa=?empresa)'
      '  and (ejercicio=?ejercicio)'
      '  and (canal=?canal)')
    UniDirectional = False
    AfterScroll = xCabeceraAfterScroll
    Left = 28
    Top = 72
    object xCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCabeceraTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xCabeceraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCabeceraTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 60
    end
    object xCabeceraFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCabeceraTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xCabeceraPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object xCabeceraTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PERFIL'
      Size = 60
    end
    object xCabeceraAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCabeceraTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object xCabeceraALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'ALTA'
    end
    object xCabeceraBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object xCabeceraACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 119
    Top = 71
  end
  object frDBxCabecera: TfrDBDataSet
    DataSource = DSxCabecera
    Left = 219
    Top = 72
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_CONDICIONES_D'
      'where (empresa=?empresa)'
      '  and (ejercicio=?ejercicio)'
      '  and (canal=?canal)'
      '  and (tipo=?tipo)'
      '  and (rig=?rig)'
      'order by UNID_MINIMAS')
    UniDirectional = False
    DataSource = DSxCabecera
    Left = 26
    Top = 122
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
    object xDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetalleUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object xDetalleUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object xDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object xDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
  end
  object frDBxDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 218
    Top = 121
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 117
    Top = 121
  end
  object frxCondiciones: TfrxHYReport
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
    OnBeforePrint = frxCondicionesBeforePrint
    OnGetValue = frxCondicionesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 122
    Top = 20
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
