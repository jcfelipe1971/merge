object DMVentasCli: TDMVentasCli
  OldCreateOrder = False
  OnCreate = DMVentasCliCreate
  OnDestroy = DMVentasCliDestroy
  Left = 799
  Top = 210
  Height = 261
  Width = 434
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 144
    Top = 8
  end
  object DSxVentasCliente: TDataSource
    DataSet = xVentasCliente
    Left = 144
    Top = 56
  end
  object xVentasCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM TMP_VENTAS_ART_CLI'
      'WHERE'
      'ENTRADA = ?ENTRADA'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 48
    Top = 56
    object xVentasClienteTOTAL_VENTAS: TFloatField
      DisplayLabel = 'Total Ventas'
      FieldName = 'TOTAL_VENTAS'
    end
    object xVentasClienteUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xVentasClienteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVentasClienteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVentasClienteCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xVentasClientePV: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'PV'
    end
    object xVentasClienteMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xVentasClienteENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xVentasClienteUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
  end
  object frDBDSxVentasCliente: TfrDBDataSet
    DataSource = DSxVentasCliente
    Left = 248
    Top = 56
  end
  object frHYVentasClientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Ventas por Cliente Uds. Secundarias'
    RebuildPrinter = False
    OnGetValue = frHYVentasClientesGetValue
    OnBeforePrint = frHYVentasClientesEnterRect
    OnEnterRect = frHYVentasClientesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 48
    Top = 8
    ReportForm = {19000000}
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 48
    Top = 104
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 104
  end
end
