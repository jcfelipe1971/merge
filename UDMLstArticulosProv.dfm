object DMLstArticulosProv: TDMLstArticulosProv
  OldCreateOrder = False
  OnCreate = DMLstFacturaProvArtCreate
  OnDestroy = DMLstFacturaDestroy
  Left = 505
  Top = 284
  Height = 265
  Width = 346
  object frArticulosProv: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frArticulosProvGetValue
    OnBeforePrint = frArticulosProvEnterRect
    OnEnterRect = frArticulosProvEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object frDBArticulosProv: TfrDBDataSet
    DataSource = DSQMArticulosProv
    OpenDataSource = False
    Left = 172
    Top = 82
  end
  object DSQMArticulosProv: TDataSource
    DataSet = QMArticulosProv
    Left = 106
    Top = 82
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 114
    Top = 16
  end
  object QMArticulosProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'where    (empresa=?empresa) ')
    UniDirectional = False
    AfterOpen = QMArticulosProvAfterOpen
    BeforeClose = QMArticulosProvBeforeClose
    Left = 47
    Top = 82
    object QMArticulosProvARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosProvTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMArticulosProvID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticulosProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object QMProveedores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  ID_A = ?ID_A AND'
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_COD_PROV'
      
        '  (EMPRESA,ARTICULO,PROVEEDOR,CODIGO_PROVEEDOR,NOMBRE_PROVEEDOR,' +
        'ID_A)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?PROVEEDOR,?CODIGO_PROVEEDOR,?NOMBRE_PROVE' +
        'EDOR,?ID_A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  ID_A = ?ID_A AND'
      '  PROVEEDOR=?PROVEEDOR AND'
      '  CODIGO_PROVEEDOR = ?CODIGO_PROVEEDOR'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_COD_PROV'
      'WHERE empresa=?empresa and ID_a = ?ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_COD_PROV'
      'SET'
      '  CODIGO_PROVEEDOR=?CODIGO_PROVEEDOR,'
      '  PROVEEDOR = ?PROVEEDOR '
      'WHERE'
      '  ID_A = ?ID_A')
    DataSource = DSQMArticulosProv
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_A '
      'PROVEEDOR '
      'CODIGO_PROVEEDOR'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_COD_PROV'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 142
    object QMProveedoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProveedoresARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProveedoresPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProveedoresNOMBRE_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_PROVEEDOR'
      Size = 60
    end
    object QMProveedoresCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 15
    end
    object QMProveedoresID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSQMProveedores: TDataSource
    DataSet = QMProveedores
    Left = 114
    Top = 142
  end
  object frDBProveedores: TfrDBDataSet
    DataSource = DSQMProveedores
    OpenDataSource = False
    Left = 188
    Top = 138
  end
end
