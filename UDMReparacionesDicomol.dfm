object DMReparacionesDicomol: TDMReparacionesDicomol
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 384
  Top = 296
  Height = 465
  Width = 498
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 8
  end
  object ZQMReparaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_REPARACIONES'
      'WHERE'
      '  IDREPARACION=?old_IDREPARACION ')
    InsertSQL.Strings = (
      'INSERT INTO Z_REPARACIONES'
      
        '  (IDREPARACION,CLIENTE,FAMILIA,ARTICULO,FECHA,EMPRESA,SERIE,ID_' +
        'ORDEN, ESTADO_REP)'
      'VALUES'
      
        '  (?IDREPARACION,?CLIENTE,?FAMILIA,?ARTICULO,?FECHA,?EMPRESA,?SE' +
        'RIE, ?ID_ORDEN,?ESTADO_REP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_REPARACIONES'
      'WHERE'
      '  IDREPARACION=?IDREPARACION ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_REPARACIONES'
      'ORDER BY IDREPARACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_REPARACIONES'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,FAMILIA=?FAMILIA '
      '  ,ARTICULO=?ARTICULO '
      '  ,FECHA=?FECHA '
      '  ,EMPRESA=?EMPRESA'
      '  ,SERIE=?SERIE'
      '  ,ID_ORDEN=?ID_ORDEN'
      '  ,ESTADO_REP=?ESTADO_REP'
      'WHERE'
      '  IDREPARACION=?IDREPARACION ')
    AfterDelete = Graba
    AfterOpen = ZQMReparacionesAfterOpen
    AfterPost = Graba
    AfterScroll = ZQMReparacionesAfterScroll
    BeforeEdit = ZQMReparacionesBeforeEdit
    OnNewRecord = ZQMReparacionesNewRecord
    ClavesPrimarias.Strings = (
      'IDREPARACION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_REPARACIONES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 8
    object ZQMReparacionesIDREPARACION: TIntegerField
      FieldName = 'IDREPARACION'
    end
    object ZQMReparacionesCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      OnChange = ZQMReparacionesCLIENTEChange
    end
    object ZQMReparacionesFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      OnChange = ZQMReparacionesFAMILIAChange
      Size = 5
    end
    object ZQMReparacionesARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      OnChange = ZQMReparacionesARTICULOChange
      Size = 15
    end
    object ZQMReparacionesFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object ZQMReparacionesEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object ZQMReparacionesSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object ZQMReparacionesID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
    end
    object ZQMReparacionesDescFamilia: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescFamilia'
      OnGetText = ZQMReparacionesDescFamiliaGetText
      Size = 25
      Calculated = True
    end
    object ZQMReparacionesDescCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescCliente'
      OnGetText = ZQMReparacionesDescClienteGetText
      Size = 40
      Calculated = True
    end
    object ZQMReparacionesDescArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = ZQMReparacionesDescArticuloGetText
      Size = 40
      Calculated = True
    end
    object ZQMReparacionesESTADO_REP: TIntegerField
      FieldName = 'ESTADO_REP'
    end
    object ZQMReparacionesTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = ZQMReparacionesTITULO_ESTADOGetText
      Size = 40
      Calculated = True
    end
  end
  object ZDSQMReparaciones: TDataSource
    DataSet = ZQMReparaciones
    Left = 144
    Top = 8
  end
  object xFamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_FAMILIAS_CUENTAS'
      'WHERE empresa=?empresa '
      'and ejercicio=?ejercicio'
      'and canal=?canal'
      'and familia=?familia'
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_FAMILIAS_CUENTAS'
      'where EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND FAMILIA=?FAMILIA')
    UniDirectional = False
    DataSource = ZDSQMReparaciones
    Left = 40
    Top = 56
    object xFamiliaTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamilia: TDataSource
    DataSet = xFamilia
    Left = 144
    Top = 56
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES'
      'where EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = ZDSQMReparaciones
    Left = 40
    Top = 104
    object xClienteTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 144
    Top = 104
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'where EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = ZDSQMReparaciones
    Left = 40
    Top = 152
    object xArticuloTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 144
    Top = 152
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 352
    Top = 56
  end
  object frDBReparaciones: TfrDBDataSet
    DataSource = DSxLstReparaciones
    Left = 248
    Top = 200
  end
  object frLstReparaciones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de reparaciones'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 352
    Top = 8
    ReportForm = {19000000}
  end
  object xLstReparaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_reparaciones'
      'where idreparacion=?idreparacion')
    UniDirectional = False
    DataSource = ZDSQMReparaciones
    Left = 40
    Top = 200
  end
  object DSxLstReparaciones: TDataSource
    DataSet = xLstReparaciones
    Left = 144
    Top = 200
  end
end
