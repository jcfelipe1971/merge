object DMLstCuotasCliente: TDMLstCuotasCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 485
  Top = 244
  Height = 445
  Width = 903
  object frCuotas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frCuotasGetValue
    OnBeforePrint = frCuotasEnterRect
    OnEnterRect = frCuotasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 64
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 216
    Top = 8
  end
  object QMCuotasDetDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE AND'
      'CUOTA = :CUOTA'
      'ORDER BY LINEA, LINEA_DET')
    UniDirectional = False
    DataSource = DSQMCuotasCab
    AfterOpen = QMCuotasDetDocAfterOpen
    BeforeClose = QMCuotasDetDocBeforeClose
    Left = 64
    Top = 152
  end
  object DSQMCuotasDetDoc: TDataSource
    DataSet = QMCuotasDetDoc
    Left = 216
    Top = 152
  end
  object QMCuotasDocumentoDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S'
      'WHERE'
      ' ID_S = ?ID_S')
    UniDirectional = False
    DataSource = DSQMCuotasDetDoc
    Left = 64
    Top = 200
  end
  object DSQMCuotasDocumentoDestino: TDataSource
    DataSet = QMCuotasDocumentoDestino
    Left = 216
    Top = 200
  end
  object frDBQMCuotaDetDoc: TfrDBDataSet
    DataSource = DSQMCuotasDetDoc
    Left = 344
    Top = 152
  end
  object QMCuotasDatosTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE '
      'TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSQMCuotasCab
    Left = 64
    Top = 248
  end
  object DSQMCuotasDatosTercero: TDataSource
    DataSet = QMCuotasDatosTercero
    Left = 216
    Top = 248
  end
  object QMContrato: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CLIENTES_CUOTAS'
      'WHERE'
      'ID_CUOTA = ?ID_CUOTA')
    UniDirectional = False
    AfterOpen = QMContratoAfterOpen
    BeforeClose = QMContratoBeforeClose
    Left = 472
    Top = 56
  end
  object DSQMContrato: TDataSource
    DataSet = QMContrato
    Left = 624
    Top = 56
  end
  object frDBQMContrato: TfrDBDataSet
    DataSource = DSQMContrato
    Left = 744
    Top = 56
  end
  object QMContratoDatosTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE '
      'TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSQMContrato
    Left = 472
    Top = 104
  end
  object DSQMContratoDatosTercero: TDataSource
    DataSet = QMContratoDatosTercero
    Left = 624
    Top = 104
  end
  object QMContratoDireccionTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE '
      'DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSQMContrato
    Left = 472
    Top = 152
  end
  object DSQMContratoDireccionTercero: TDataSource
    DataSet = QMContratoDireccionTercero
    Left = 624
    Top = 152
  end
  object QMCuotasCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CLIENTES_CUOTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE'
      'ORDER BY CLIENTE, CUOTA, ARTICULO')
    UniDirectional = False
    AfterOpen = QMCuotasCabAfterOpen
    BeforeClose = QMCuotasCabBeforeClose
    Left = 64
    Top = 56
  end
  object DSQMCuotasCab: TDataSource
    DataSet = QMCuotasCab
    Left = 216
    Top = 56
  end
  object frDBQMCuotasCab: TfrDBDataSet
    DataSource = DSQMCuotasCab
    Left = 344
    Top = 56
  end
  object QMCuotasProyecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_PROYECTOS'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'PROYECTO = :PROYECTO')
    UniDirectional = False
    DataSource = DSQMCuotasCab
    Left = 64
    Top = 344
  end
  object DSQMCuotasProyecto: TDataSource
    DataSet = QMCuotasProyecto
    Left = 216
    Top = 344
  end
  object QMCuotasDireccionTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE '
      'DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSQMCuotasCab
    Left = 64
    Top = 296
  end
  object DSQMCuotasDireccionTercero: TDataSource
    DataSet = QMCuotasDireccionTercero
    Left = 216
    Top = 296
  end
  object QMCuotasDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CLIENTES_CUOTAS_DETALLE'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE AND'
      'CUOTA = :CUOTA'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMCuotasCab
    Left = 64
    Top = 104
  end
  object DSQMCuotasDet: TDataSource
    DataSet = QMCuotasDet
    Left = 216
    Top = 104
  end
  object frDBQMCuotaDet: TfrDBDataSet
    DataSource = DSQMCuotasDet
    Left = 344
    Top = 104
  end
end
