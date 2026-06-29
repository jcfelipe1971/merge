object ZDMLstConsumo: TZDMLstConsumo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 369
  Top = 116
  Height = 736
  Width = 820
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 156
    Top = 35
  end
  object frConsumo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de stocks por almacen'
    RebuildPrinter = False
    OnGetValue = frConsumoGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 35
    ReportForm = {19000000}
  end
  object xLstCabConsumo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from emp_clientes_consumo '
      'where cliente>=?cliente_desde and cliente<=?cliente_hasta'
      'and agrupacion=?agrupacion')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 99
    object xLstCabConsumoIDDETCONSUMO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDDETCONSUMO'
    end
    object xLstCabConsumoAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xLstCabConsumoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstCabConsumoCONSUMO: TFloatField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
    end
    object xLstCabConsumoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xLstCabConsumoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstCabConsumoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xLstCabConsumoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxLstCabConsumo: TDataSource
    DataSet = xLstCabConsumo
    Left = 160
    Top = 99
  end
  object frDBLstCabConsumo: TfrDBDataSet
    DataSource = DSxLstCabConsumo
    Left = 40
    Top = 163
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_AGRUPACIONES '
      'where agrupacion=?agrupacion')
    UniDirectional = False
    Left = 426
    Top = 218
    object xAgrupacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 516
    Top = 222
  end
  object xSerie_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM GEN_SERIES'
      'WHERE empresa=?empresa AND serie=?serie '
      '')
    UniDirectional = False
    Left = 424
    Top = 112
    object xSerie_DesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSerie_Desde: TDataSource
    DataSet = xSerie_Desde
    Left = 512
    Top = 112
  end
  object xSerie_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM GEN_SERIES'
      'WHERE empresa=?empresa AND serie=?serie ')
    UniDirectional = False
    Left = 424
    Top = 160
    object xSerie_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSerie_Hasta: TDataSource
    DataSet = xSerie_Hasta
    Left = 512
    Top = 160
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 160
    Top = 170
  end
  object xCliente_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_CLIENTES_EF'
      
        'where cliente=?cliente and empresa=?empresa and ejercicio=?ejerc' +
        'icio'
      'and canal=?canal')
    UniDirectional = False
    Left = 426
    Top = 282
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCliente_Desde: TDataSource
    DataSet = xCliente_Desde
    Left = 516
    Top = 286
  end
  object xCliente_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_CLIENTES_EF'
      
        'where cliente=?cliente and empresa=?empresa and ejercicio=?ejerc' +
        'icio'
      'and canal=?canal')
    UniDirectional = False
    Left = 426
    Top = 338
    object xCliente_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxCliente_Hasta: TDataSource
    DataSet = xCliente_Hasta
    Left = 516
    Top = 342
  end
  object xLstFactConsumo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SUM(DET.BRUTO) AS CONSUMOFACT '
      'FROM GES_DETALLES_S DET'
      'JOIN EMP_AGRUPACIONES_ART AGR ON  (AGR.ARTICULO=DET.ARTICULO)'
      'JOIN GES_CABECERAS_S CAB ON (DET.ID_S=CAB.ID_S)'
      'WHERE AGRUPACION=?agrupacion'
      'AND FECHA>=?fecha_desde AND FECHA<=?fecha_hasta'
      'AND EMPRESA=?empresa'
      'AND CANAL=?canal'
      'AND SERIE>=?serie_desde AND SERIE<=?serie_hasta'
      'AND DET.TIPO='#39'FAC'#39
      'AND cliente=?cliente')
    UniDirectional = False
    DataSource = DSxLstCabConsumo
    Left = 112
    Top = 408
    object xLstFactConsumoCONSUMOFACT: TFloatField
      DisplayLabel = 'Consumo Fact.'
      FieldName = 'CONSUMOFACT'
    end
  end
  object DSxLstFactConsumo: TDataSource
    DataSet = xLstFactConsumo
    Left = 216
    Top = 400
  end
  object frDBLstDetConsumo: TfrDBDataSet
    CloseDataSource = True
    Left = 43
    Top = 217
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'WHERE empresa=?empresa '
      'and ejercicio=?ejercicio'
      'and canal=?canal'
      'and cliente=?cliente')
    SelectSQL.Strings = (
      'SELECT tercero, ter.nombre_r_social FROM EMP_CLIENTES cli'
      'join ver_terceros ter on (cli.tercero=ter.tercero)'
      'WHERE empresa=?empresa '
      'and cliente=?cliente')
    UniDirectional = False
    DataSource = DSxLstCabConsumo
    Left = 230
    Top = 482
    object xClientesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xClientesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 290
    Top = 482
  end
end
