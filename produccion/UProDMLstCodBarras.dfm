object ProDMLstCodBarras: TProDMLstCodBarras
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 660
  Top = 476
  Height = 387
  Width = 669
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 608
    Top = 8
  end
  object xTemp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TMP_COD_BARRAS'
      'where entrada=?entrada')
    UniDirectional = False
    Left = 24
    Top = 8
    object xTempEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTempCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xTempTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTempENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xTempCODIGOBARRAS: TFIBStringField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'CODIGOBARRAS'
      Size = 25
    end
    object xTempTIPOBARRAS: TIntegerField
      DisplayLabel = 'Tipo Barras'
      FieldName = 'TIPOBARRAS'
    end
    object xTempFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xTempCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xTempARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object xFaseD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from pro_sys_fases'
      'where fase=?codigo')
    UniDirectional = False
    Left = 211
    Top = 5
    object xFaseDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSFaseD: TDataSource
    DataSet = xFaseD
    Left = 299
    Top = 5
  end
  object DSFaseH: TDataSource
    DataSet = xFaseH
    Left = 299
    Top = 61
  end
  object xFaseH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from pro_sys_fases'
      'where fase=?codigo')
    UniDirectional = False
    Left = 211
    Top = 61
    object xFaseHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object frCodBarras: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de c'#243'digo de barras'
    RebuildPrinter = False
    OnGetValue = frCodBarrasGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 131
    ReportForm = {19000000}
  end
  object frDBCodBarras: TfrDBDataSet
    DataSet = xTemp
    Left = 112
    Top = 136
  end
  object xMaquinaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_maquinas_c'
      'where empresa=?empresa and codmaq=?codigo')
    UniDirectional = False
    Left = 211
    Top = 111
    object xMaquinaDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSMaquinaC: TDataSource
    DataSet = xMaquinaD
    Left = 299
    Top = 111
  end
  object DSMaquinaH: TDataSource
    DataSet = xMaquinaH
    Left = 299
    Top = 167
  end
  object xMaquinaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_maquinas_c'
      'where empresa=?empresa and codmaq=?codigo')
    UniDirectional = False
    Left = 211
    Top = 167
    object xMaquinaHDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object xEmpleadoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?codigo')
    UniDirectional = False
    Left = 211
    Top = 217
    object xEmpleadoDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxEmpleadoD: TDataSource
    DataSet = xEmpleadoD
    Left = 299
    Top = 217
  end
  object DSxEmpleadoH: TDataSource
    DataSet = xEmpleadoH
    Left = 299
    Top = 273
  end
  object xEmpleadoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?codigo')
    UniDirectional = False
    Left = 211
    Top = 273
    object xEmpleadoHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xTareaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from pro_sys_tareas'
      'where tarea=?codigo')
    UniDirectional = False
    Left = 371
    Top = 5
    object xTareaDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTareaD: TDataSource
    DataSet = xTareaD
    Left = 459
    Top = 5
  end
  object DSxTareaH: TDataSource
    DataSet = xTareaH
    Left = 459
    Top = 61
  end
  object xTareaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from pro_sys_tareas'
      'where tarea=?codigo')
    UniDirectional = False
    Left = 371
    Top = 61
    object xTareaHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xOrdenD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?codigo')
    UniDirectional = False
    Left = 379
    Top = 121
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxOrdenD: TDataSource
    DataSet = xOrdenD
    Left = 467
    Top = 121
  end
  object DSOrdenH: TDataSource
    DataSet = xOrdenH
    Left = 467
    Top = 177
  end
  object xOrdenH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?codigo')
    UniDirectional = False
    Left = 379
    Top = 177
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
end
