object DMReetiquetaLotes: TDMReetiquetaLotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 238
  Top = 142
  Height = 316
  Width = 368
  object Tlocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 44
    Top = 10
  end
  object DSQMReetiquetado_Lotes: TDataSource
    DataSet = QMReetiquetado_Lotes
    Left = 177
    Top = 109
  end
  object QMReetiquetado_Lotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Tlocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_REETIQUETADO_LOTES'
      'WHERE'
      '  D_PROVEEDOR=?old_D_PROVEEDOR AND '
      '  D_SERIE=?old_D_SERIE AND '
      '  D_LOTE=?old_D_LOTE AND '
      '  D_ARTICULO=?old_D_ARTICULO AND '
      '  D_ALMACEN=?old_D_ALMACEN AND '
      '  D_CANAL=?old_D_CANAL AND '
      '  D_EMPRESA=?old_D_EMPRESA AND '
      '  O_PROVEEDOR=?old_O_PROVEEDOR AND '
      '  O_SERIE=?old_O_SERIE AND '
      '  O_LOTE=?old_O_LOTE AND '
      '  O_ARTICULO=?old_O_ARTICULO AND '
      '  O_ALMACEN=?old_O_ALMACEN AND '
      '  O_CANAL=?old_O_CANAL AND '
      '  O_EMPRESA=?old_O_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_REETIQUETADO_LOTES'
      
        '  (O_EMPRESA,O_CANAL,O_ALMACEN,O_ARTICULO,O_LOTE,O_SERIE,O_PROVE' +
        'EDOR,O_ID_A,O_ID_LOTE,D_EMPRESA,D_CANAL,D_ALMACEN,D_ARTICULO,D_L' +
        'OTE,D_SERIE,D_PROVEEDOR,D_ID_A,D_ID_LOTE)'
      'VALUES'
      
        '  (?O_EMPRESA,?O_CANAL,?O_ALMACEN,?O_ARTICULO,?O_LOTE,?O_SERIE,?' +
        'O_PROVEEDOR,?O_ID_A,?O_ID_LOTE,?D_EMPRESA,?D_CANAL,?D_ALMACEN,?D' +
        '_ARTICULO,?D_LOTE,?D_SERIE,?D_PROVEEDOR,?D_ID_A,?D_ID_LOTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_REETIQUETADO_LOTES'
      'WHERE'
      '  D_PROVEEDOR=?D_PROVEEDOR AND '
      '  D_SERIE=?D_SERIE AND '
      '  D_LOTE=?D_LOTE AND '
      '  D_ARTICULO=?D_ARTICULO AND '
      '  D_ALMACEN=?D_ALMACEN AND '
      '  D_CANAL=?D_CANAL AND '
      '  D_EMPRESA=?D_EMPRESA AND '
      '  O_PROVEEDOR=?O_PROVEEDOR AND '
      '  O_SERIE=?O_SERIE AND '
      '  O_LOTE=?O_LOTE AND '
      '  O_ARTICULO=?O_ARTICULO AND '
      '  O_ALMACEN=?O_ALMACEN AND '
      '  O_CANAL=?O_CANAL AND '
      '  O_EMPRESA=?O_EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_REETIQUETADO_LOTES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_REETIQUETADO_LOTES'
      'SET'
      '  O_ID_A=?O_ID_A '
      '  ,O_ID_LOTE=?O_ID_LOTE '
      '  ,D_ID_A=?D_ID_A '
      '  ,D_ID_LOTE=?D_ID_LOTE '
      'WHERE'
      '  D_PROVEEDOR=?D_PROVEEDOR AND '
      '  D_SERIE=?D_SERIE AND '
      '  D_LOTE=?D_LOTE AND '
      '  D_ARTICULO=?D_ARTICULO AND '
      '  D_ALMACEN=?D_ALMACEN AND '
      '  D_CANAL=?D_CANAL AND '
      '  D_EMPRESA=?D_EMPRESA AND '
      '  O_PROVEEDOR=?O_PROVEEDOR AND '
      '  O_SERIE=?O_SERIE AND '
      '  O_LOTE=?O_LOTE AND '
      '  O_ARTICULO=?O_ARTICULO AND '
      '  O_ALMACEN=?O_ALMACEN AND '
      '  O_CANAL=?O_CANAL AND '
      '  O_EMPRESA=?O_EMPRESA ')
    ClavesPrimarias.Strings = (
      'D_PROVEEDOR '
      'D_SERIE '
      'D_LOTE '
      'D_ARTICULO '
      'D_ALMACEN '
      'D_CANAL '
      'D_EMPRESA '
      'O_PROVEEDOR '
      'O_SERIE '
      'O_LOTE '
      'O_ARTICULO '
      'O_ALMACEN '
      'O_CANAL '
      'O_EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_REETIQUETADO_LOTES'
    Left = 46
    Top = 108
  end
  object QMArticulos_Lotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Tlocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_LOTES'
      'WHERE'
      '  ID_A = ?OLD_ID_A AND'
      '  SERIE=?old_SERIE AND '
      '  LOTE=?old_LOTE AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  CANAL=?old_CANAL')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_LOTES'
      'WHERE'
      '  ID_A = ?ID_A AND'
      '  SERIE=?SERIE AND '
      '  LOTE=?LOTE AND '
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_LOTES'
      'WHERE ID_LOTE = ?ID_LOTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    ClavesPrimarias.Strings = (
      'ID_A '
      'SERIE '
      'LOTE '
      'ALMACEN '
      'CANAL'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_LOTES'
    Left = 46
    Top = 60
    object QMArticulos_LotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulos_LotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticulos_LotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMArticulos_LotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulos_LotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMArticulos_LotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMArticulos_LotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMArticulos_LotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
	  Size = 100
    end
    object QMArticulos_LotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object QMArticulos_LotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMArticulos_LotesSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMArticulos_LotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMArticulos_LotesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticulos_LotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMArticulos_LotesAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object QMArticulos_LotesCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
  end
  object DSQMArticulos_Lotes: TDataSource
    DataSet = QMArticulos_Lotes
    Left = 177
    Top = 61
  end
  object QMaxCodigo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(codigo) as maximo from art_articulos_lotes '
      '  where empresa=?empresa')
    Transaction = Tlocal
    AutoTrans = False
    Left = 280
    Top = 8
  end
  object QTituloAlmacen: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select titulo from art_almacenes'
      'where ((empresa=?empresa) and'
      '            (almacen=?almacen))')
    Transaction = Tlocal
    Left = 282
    Top = 61
  end
  object QTituloProveedor: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from ver_proveedores_empresa'
      ' where empresa=?empresa and proveedor=?proveedor')
    Transaction = Tlocal
    Left = 280
    Top = 120
  end
  object QTituloArticulo: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select titulo_largo as titulo from art_articulos'
      'where id_a=?id_a')
    Transaction = Tlocal
    Left = 280
    Top = 176
  end
  object SPReetiquetaLote: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure  g_reetiqueta_lote(?id_lote,?nuevolote,?automa' +
        'tico, ?id_detalles_e)')
    Transaction = Tlocal
    Left = 48
    Top = 168
  end
end
