object ProDMLstNecesidadesEsc: TProDMLstNecesidadesEsc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 593
  Top = 231
  Height = 352
  Width = 418
  object frDBlstNecesidades: TfrDBDataSet
    DataSource = DSQGenerarLst
    Left = 240
    Top = 160
  end
  object xCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?COMPUESTO')
    UniDirectional = False
    DataSource = DSEscandallo
    Left = 32
    Top = 112
    object xCompuestoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSCompuesto: TDataSource
    DataSet = xCompuesto
    Left = 128
    Top = 112
  end
  object DSEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 128
    Top = 64
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT EMPRESA, COMPUESTO, DESCRIPCION, TIPO FROM PRO_ESCANDALLO'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ESCANDALLO = ?ESCANDALLO AND'
      'TIPO = ?TIPO')
    UniDirectional = False
    AfterOpen = xEscandalloAfterOpen
    BeforeClose = xEscandalloBeforeClose
    Left = 32
    Top = 64
    object xEscandalloCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEscandalloTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xEscandalloDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 328
    Top = 16
  end
  object frListadoN: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Necesidades'
    RebuildPrinter = False
    OnGetValue = frListadoNGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object QGenerarLst: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_LST_NECESIDADES_LANZAR_ESC'
      
        '(:EMPRESA, :ESCANDALLO, :TIPO, :CANAL, :ENTRADA, :ALM_DESDE, :AL' +
        'M_HASTA, :TIPO_LST, 1 /*CALCULA_STOCK*/)')
    UniDirectional = False
    AfterOpen = QGenerarLstAfterOpen
    BeforeClose = QGenerarLstBeforeClose
    Left = 32
    Top = 160
  end
  object QMCodProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT P.*, T.NOMBRE_R_SOCIAL, C.CODIGO_PROVEEDOR'
      'FROM ART_ARTICULOS_PROVEEDORES P'
      
        'JOIN EMP_PROVEEDORES EP ON P.EMPRESA = EP.EMPRESA AND P.PROVEEDO' +
        'R = EP.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON EP.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODPROV C ON P.EMPRESA = C.EMPRESA AND P' +
        '.ARTICULO = C.ARTICULO AND P.PROVEEDOR = C.PROVEEDOR'
      'WHERE'
      'P.EMPRESA = :EMPRESA AND'
      'P.ARTICULO = :V_ARTICULO AND'
      'P.ACTIVO = 1'
      'ORDER BY P.PRIORIDAD, P.PROVEEDOR')
    UniDirectional = False
    DataSource = DSQGenerarLst
    BeforeOpen = QMCodProvBeforeOpen
    Left = 32
    Top = 208
  end
  object DSCodProv: TDataSource
    DataSet = QMCodProv
    Left = 128
    Top = 208
  end
  object DSQGenerarLst: TDataSource
    DataSet = QGenerarLst
    Left = 128
    Top = 160
  end
end
