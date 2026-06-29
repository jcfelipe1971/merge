object DMCentrosInventario: TDMCentrosInventario
  OldCreateOrder = False
  OnCreate = DMCentrosInventarioCreate
  Left = 446
  Top = 564
  Height = 218
  Width = 358
  object QMCentrosInventario: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CENTROS_INVENTARIO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CENTRO=?old_CENTRO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CENTROS_INVENTARIO'
      '  (TERCERO,EMPRESA,TITULO,CENTRO)'
      'VALUES'
      '  (?TERCERO,?EMPRESA,?TITULO,?CENTRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CENTROS_INVENTARIO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CENTRO=?CENTRO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CENTROS_INVENTARIO'
      'where empresa=?empresa'
      'ORDER BY CENTRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CENTROS_INVENTARIO'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CENTRO=?CENTRO ')
    AfterOpen = QMCentrosInventarioAfterOpen
    AfterPost = Graba
    BeforeClose = QMCentrosInventarioBeforeClose
    OnNewRecord = QMCentrosInventarioNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CENTRO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CENTROS_INVENTARIO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 44
    Top = 8
    object QMCentrosInventarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentrosInventarioCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object QMCentrosInventarioTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMCentrosInventarioTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMCentrosInventarioTERCEROChange
    end
  end
  object DSQMCentrosInventario: TDataSource
    DataSet = QMCentrosInventario
    Left = 168
    Top = 8
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 120
    Top = 88
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 96
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL'
      ' FROM SYS_TERCEROS where tercero=?tercero                   ')
    UniDirectional = False
    DataSource = DSQMCentrosInventario
    Left = 32
    Top = 88
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 264
    Top = 24
  end
end
