object DMLstConsumo: TDMLstConsumo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 369
  Top = 116
  Height = 454
  Width = 503
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 144
    Top = 8
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
    Top = 8
    ReportForm = {19000000}
  end
  object xLstCabConsumo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CLIENTES_CONSUMO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CLIENTE >= :CLIENTE_DESDE AND'
      'CLIENTE <= :CLIENTE_HASTA AND'
      'CLIENTE IN (SELECT CLIENTE'
      '            FROM EMP_CLIENTES'
      '            WHERE'
      '            EMPRESA = :EMPRESA AND'
      '            AGENTE >= :AGENTE_DESDE AND'
      '            AGENTE <= :AGENTE_HASTA) AND'
      
        '((AGRUPACION = CAST(:AGRUPACION AS VARCHAR(3))) OR (CAST(:AGRUPA' +
        'CION AS VARCHAR(3)) = '#39#39'))')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 56
  end
  object DSxLstCabConsumo: TDataSource
    DataSet = xLstCabConsumo
    Left = 144
    Top = 56
  end
  object frDBLstCabConsumo: TfrDBDataSet
    DataSource = DSxLstCabConsumo
    Left = 248
    Top = 56
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
      'WHERE '
      'AGRUPACION=?agrupacion'
      'AND FECHA>=?fecha_desde '
      'AND FECHA<=?fecha_hasta'
      'AND EMPRESA=?empresa'
      'AND CANAL=?canal'
      'AND SERIE>=?serie_desde '
      'AND SERIE<=?serie_hasta'
      'AND DET.TIPO='#39'FAC'#39
      'AND cliente=?cliente')
    UniDirectional = False
    DataSource = DSxLstCabConsumo
    Left = 40
    Top = 104
  end
  object DSxLstFactConsumo: TDataSource
    DataSet = xLstFactConsumo
    Left = 144
    Top = 104
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
      'WHERE '
      'empresa=?empresa '
      'and cliente=?cliente')
    UniDirectional = False
    DataSource = DSxLstCabConsumo
    Left = 40
    Top = 152
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 144
    Top = 152
  end
end
