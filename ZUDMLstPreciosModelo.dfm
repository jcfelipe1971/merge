object ZDMLstPreciosModelo: TZDMLstPreciosModelo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 639
  Top = 81
  Height = 212
  Width = 430
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 18
  end
  object frLstPrecios: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLstPreciosGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object xLstPrecios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from z_lst_precios_modelo (?empresa, ?modelo, ?tipo_lon' +
        'a, ?tarifa_modelo)')
    UniDirectional = False
    Left = 32
    Top = 72
    object xLstPreciosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstPreciosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xLstPreciosLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object xLstPreciosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xLstPreciosP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xLstPreciosMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xLstPreciosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstPreciosSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object xLstPreciosMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
    object xLstPreciosTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object xLstPreciosTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object xLstPreciosTOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
    object xLstPreciosP_COSTE_FABRICACION: TFloatField
      DisplayLabel = 'P. Coste Fab.'
      FieldName = 'P_COSTE_FABRICACION'
    end
  end
  object frDBDSLstPrecios: TfrDBDataSet
    DataSource = DSxLstPrecios
    Left = 120
    Top = 72
  end
  object DSxLstPrecios: TDataSource
    DataSet = xLstPrecios
    Left = 32
    Top = 120
  end
  object xModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion '
      'from z_sys_modelos'
      'where codigo=?modelo')
    UniDirectional = False
    Left = 240
    Top = 19
    object xModeloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxModelo: TDataSource
    DataSet = xModelo
    Left = 240
    Top = 71
  end
  object xTipoLona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion, multiplo'
      'from z_sys_lonas'
      'where codigo=?tipo_lona')
    UniDirectional = False
    Left = 312
    Top = 19
    object xTipoLonaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xTipoLonaMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
  end
  object DSxTipoLona: TDataSource
    DataSet = xTipoLona
    Left = 312
    Top = 71
  end
end
