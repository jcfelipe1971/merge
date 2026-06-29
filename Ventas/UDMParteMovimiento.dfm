object DMParteMovimiento: TDMParteMovimiento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 204
  Top = 179
  Height = 364
  Width = 429
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 320
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 8
  end
  object xDatos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S')
    UniDirectional = False
    Left = 32
    Top = 8
  end
  object xListado: TRxMemoryData
    FieldDefs = <>
    Left = 32
    Top = 56
    object xListadoCOLUMNA_INICIAL: TIntegerField
      FieldName = 'COLUMNA_INICIAL'
    end
    object xListadoARTICULO: TStringField
      DisplayWidth = 15
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xListadoTITULO: TStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xListadoSTOCK_INICIAL: TFloatField
      FieldName = 'STOCK_INICIAL'
    end
    object xListadoDOCUMENTO_01: TStringField
      FieldName = 'DOCUMENTO_01'
      Size = 15
    end
    object xListadoFECHA_01: TDateField
      FieldName = 'FECHA_01'
    end
    object xListadoUNIDADES_01: TFloatField
      FieldName = 'UNIDADES_01'
    end
    object xListadoDOCUMENTO_02: TStringField
      FieldName = 'DOCUMENTO_02'
      Size = 15
    end
    object xListadoFECHA_02: TDateField
      FieldName = 'FECHA_02'
    end
    object xListadoUNIDADES_02: TFloatField
      FieldName = 'UNIDADES_02'
    end
    object xListadoDOCUMENTO_03: TStringField
      FieldName = 'DOCUMENTO_03'
      Size = 15
    end
    object xListadoFECHA_03: TDateField
      FieldName = 'FECHA_03'
    end
    object xListadoUNIDADES_03: TFloatField
      FieldName = 'UNIDADES_03'
    end
    object xListadoDOCUMENTO_04: TStringField
      FieldName = 'DOCUMENTO_04'
      Size = 15
    end
    object xListadoFECHA_04: TDateField
      FieldName = 'FECHA_04'
    end
    object xListadoUNIDADES_04: TFloatField
      FieldName = 'UNIDADES_04'
    end
    object xListadoDOCUMENTO_05: TStringField
      FieldName = 'DOCUMENTO_05'
      Size = 15
    end
    object xListadoFECHA_05: TDateField
      FieldName = 'FECHA_05'
    end
    object xListadoUNIDADES_05: TFloatField
      FieldName = 'UNIDADES_05'
    end
    object xListadoDOCUMENTO_06: TStringField
      FieldName = 'DOCUMENTO_06'
      Size = 15
    end
    object xListadoFECHA_06: TDateField
      FieldName = 'FECHA_06'
    end
    object xListadoUNIDADES_06: TFloatField
      FieldName = 'UNIDADES_06'
    end
    object xListadoDOCUMENTO_07: TStringField
      FieldName = 'DOCUMENTO_07'
      Size = 15
    end
    object xListadoFECHA_07: TDateField
      FieldName = 'FECHA_07'
    end
    object xListadoUNIDADES_07: TFloatField
      FieldName = 'UNIDADES_07'
    end
    object xListadoDOCUMENTO_08: TStringField
      FieldName = 'DOCUMENTO_08'
      Size = 15
    end
    object xListadoFECHA_08: TDateField
      FieldName = 'FECHA_08'
    end
    object xListadoUNIDADES_08: TFloatField
      FieldName = 'UNIDADES_08'
    end
    object xListadoDOCUMENTO_09: TStringField
      FieldName = 'DOCUMENTO_09'
      Size = 15
    end
    object xListadoFECHA_09: TDateField
      FieldName = 'FECHA_09'
    end
    object xListadoUNIDADES_09: TFloatField
      FieldName = 'UNIDADES_09'
    end
    object xListadoDOCUMENTO_10: TStringField
      FieldName = 'DOCUMENTO_10'
      Size = 15
    end
    object xListadoFECHA_10: TDateField
      FieldName = 'FECHA_10'
    end
    object xListadoUNIDADES_10: TFloatField
      FieldName = 'UNIDADES_10'
    end
    object xListadoCODIGO_PROVEEDOR: TStringField
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 192
    Top = 8
    ReportForm = {19000000}
  end
  object frDBxListado: TfrDBDataSet
    DataSet = xListado
    Left = 192
    Top = 56
  end
end
