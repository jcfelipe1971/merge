object DMVentasArt: TDMVentasArt
  OldCreateOrder = False
  OnCreate = DMVentasArtCreate
  OnDestroy = DMVentasArtDestroy
  Left = 366
  Top = 204
  Height = 267
  Width = 442
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 144
    Top = 16
  end
  object DSxVentasCliente: TDataSource
    DataSet = xVentasCliente
    Left = 144
    Top = 64
  end
  object xVentasCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_VENTAS_CLI_ART'
      'WHERE'
      '  CLIENTE=?old_CLIENTE AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_VENTAS_CLI_ART'
      
        '  (UNIDADES,COSTE,PV,TOTAL_VENTAS,UNIDADES_SEC,CLIENTE,ENTRADA,T' +
        'ITULO,TITULO_MODELO)'
      'VALUES'
      
        '  (?UNIDADES,?COSTE,?PV,?TOTAL_VENTAS,?UNIDADES_SEC,?CLIENTE,?EN' +
        'TRADA,?TITULO,?TITULO_MODELO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_VENTAS_CLI_ART'
      'WHERE'
      '  CLIENTE=?CLIENTE AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_VENTAS_CLI_ART'
      'WHERE'
      'ENTRADA = :ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_VENTAS_CLI_ART'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,COSTE=?COSTE '
      '  ,PV=?PV '
      '  ,TOTAL_VENTAS=?TOTAL_VENTAS '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,TITULO=?TITULO '
      '  ,TITULO_MODELO=?TITULO_MODELO '
      'WHERE'
      '  CLIENTE=?CLIENTE AND '
      '  ENTRADA=?ENTRADA ')
    OnCalcFields = xVentasClienteCalcFields
    ClavesPrimarias.Strings = (
      'CLIENTE '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_VENTAS_CLI_ART'
    BloqOpt = True
    UpdateTransaction = TLocal
    Left = 48
    Top = 64
    object xVentasClienteTOTAL_VENTAS: TFloatField
      DisplayLabel = 'Total Ventas'
      FieldName = 'TOTAL_VENTAS'
    end
    object xVentasClienteUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xVentasClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasClienteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
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
    object xVentasClienteMARGEN_PORC: TFloatField
      DisplayLabel = 'Margen %'
      FieldKind = fkCalculated
      FieldName = 'MARGEN_PORC'
      Calculated = True
    end
  end
  object frDBDSxVentasCliente: TfrDBDataSet
    DataSource = DSxVentasCliente
    Left = 256
    Top = 64
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
    Top = 16
    ReportForm = {19000000}
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 48
    Top = 112
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 112
  end
end
