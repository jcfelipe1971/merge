object ProDMListadosPMP: TProDMListadosPMP
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 348
  Top = 332
  Height = 366
  Width = 552
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 48
    Top = 8
  end
  object SPListadoPMP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_LISTADOS_PMP(:TIPO_TAREA, :ID_PLANIFICACION, :FILTRO)'
      'ORDER BY COMPONENTE, COMPUESTO'
      '/*ORDER BY ID_ORDEN_PMP*/')
    UniDirectional = False
    Left = 48
    Top = 56
  end
  object DSSPListadoPMP: TDataSource
    DataSet = SPListadoPMP
    Left = 144
    Top = 56
  end
  object frDBLstPmp: TfrDBDataSet
    DataSource = DSSPListadoPMP
    Left = 248
    Top = 56
  end
  object frListadoPMPMat: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado PMP'
    RebuildPrinter = False
    OnGetValue = frListadoPMPMatGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 144
    Top = 8
    ReportForm = {19000000}
  end
  object frListadoPMPMaq: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado PMP'
    RebuildPrinter = False
    OnGetValue = frListadoPMPMatGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 352
    Top = 8
    ReportForm = {19000000}
  end
  object frListadoPMP: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado PMP'
    RebuildPrinter = False
    OnGetValue = frListadoPMPMatGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 440
    Top = 8
    ReportForm = {19000000}
  end
  object frListadoPMPEti: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado PMP'
    RebuildPrinter = False
    OnGetValue = frListadoPMPMatGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 248
    Top = 8
    ReportForm = {19000000}
  end
  object xLstEtiquetas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT E.*, A.TITULO_LARGO'
      
        'FROM PRO_PMP_CREA_ETIQUETAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE' +
        ', :PLANIFICACION) E'
      
        'JOIN ART_ARTICULOS A ON E.EMPRESA_CAB = A.EMPRESA AND E.COMPUEST' +
        'O = A.ARTICULO')
    UniDirectional = False
    AfterOpen = xLstEtiquetasAfterOpen
    Left = 48
    Top = 104
  end
  object DSxLstEtiquetas: TDataSource
    DataSet = xLstEtiquetas
    Left = 144
    Top = 104
  end
  object frDBLstEtiPMP: TfrDBDataSet
    DataSource = DSxLstEtiquetas
    Left = 248
    Top = 104
  end
  object xLstTareasEti: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TTAR.TAREA, TTAR.TITULO'
      'FROM PRO_ORD_TAREA TAR'
      
        'JOIN PRO_SYS_TAREAS TTAR ON (TAR.EMPRESA = TTAR.EMPRESA AND TAR.' +
        'TIPOTAREA = TTAR.TAREA)'
      'WHERE'
      'TAR.ID_ORDEN = :ID_ORDEN'
      'ORDER BY TAR.LINEA_FASE, TAR.LINEA_TAREA')
    UniDirectional = False
    DataSource = DSxLstEtiquetas
    Left = 48
    Top = 152
  end
  object DSxTareasEti: TDataSource
    DataSet = xLstTareasEti
    Left = 144
    Top = 152
  end
  object frDBLstTareasEti: TfrDBDataSet
    DataSource = DSxTareasEti
    Left = 248
    Top = 152
  end
end
