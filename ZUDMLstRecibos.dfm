object ZDMLstRecibos: TZDMLstRecibos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 455
  Top = 210
  Height = 501
  Width = 538
  object DSxLstRecibosIngresos: TDataSource
    DataSet = xLstRecibosIngresos
    Left = 152
    Top = 56
  end
  object xLstRecibosIngresos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.ID, CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.ESTADO' +
        ', CAB.RECIBO, CAB.BANCO, CAB.FECHA, CAB.LUGAR,'
      
        '       CAB.IMPORTE, CAB.CUENTA, CAB.CUENTA_COBRO, CAB.CLIENTE, C' +
        'AB.MONTO_RECIBO, DET.MONEDA'
      'FROM Z_RECIBOS_CAB CAB'
      'JOIN EMP_CARTERA_DETALLE DET ON (DET.ID_CAB_Z_RECIBOS = CAB.ID)'
      'WHERE'
      'ID = :ID AND'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL')
    UniDirectional = False
    BeforeScroll = xLstRecibosIngresosBeforeScroll
    Left = 40
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 376
    Top = 8
  end
  object frRecibosIngresos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de recibo de ingresos'
    RebuildPrinter = False
    OnGetValue = frRecibosIngresosGetValue
    OnBeforePrint = frRecibosIngresosEnterRect
    OnEnterRect = frRecibosIngresosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 272
    Top = 8
    ReportForm = {19000000}
  end
  object frDBLstRecibosIngresos: TfrDBDataSet
    DataSource = DSxLstRecibosIngresos
    Left = 272
    Top = 56
  end
  object xLstRecibosLimites: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_RECIBOS_CAB'
      'WHERE'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA AND'
      'CLIENTE >= :CLIENTE_DESDE AND'
      'CLIENTE <= :CLIENTE_HASTA'
      'ORDER BY ID')
    UniDirectional = False
    BeforeScroll = xLstRecibosLimitesBeforeScroll
    Left = 40
    Top = 104
  end
  object DSxLstRecibosLimites: TDataSource
    DataSet = xLstRecibosLimites
    Left = 152
    Top = 104
  end
  object frDBLstRecibosLimites: TfrDBDataSet
    DataSource = DSxLstRecibosLimites
    Left = 272
    Top = 104
  end
  object Letras: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 92
    LongPrimeraLinea = 80
    Separador = ','
    Relleno = '*'
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 456
    Top = 8
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA,TITULO, GENERO_MASCULINO, DEC_VER,DESC_DECIMALES '
      'FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 40
    Top = 152
  end
end
