object DMGaleriaImagen: TDMGaleriaImagen
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 215
  Width = 308
  object QMGaleria: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_GALERIA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_GALERIA'
      '  (ID,TITULO)'
      'VALUES'
      '  (?ID,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_GALERIA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GALERIA'
      'WHERE ID <> 0'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_GALERIA'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    BeforePost = QMGaleriaBeforePost
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GALERIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMGaleriaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMGaleriaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
  end
  object DSQMGaleria: TDataSource
    DataSet = QMGaleria
    Left = 136
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 56
  end
  object QMGaleriaImagen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_GALERIA_IMAGEN'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_GALERIA_IMAGEN'
      '  (ID,ID_GALERIA,CODIGO,IMAGEN,NOMBRE,FORMATO,REPOSITORIO,RUTA)'
      'VALUES'
      
        '  (?ID,?ID_GALERIA,?CODIGO,?IMAGEN,?NOMBRE,?FORMATO,?REPOSITORIO' +
        ',?RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_GALERIA_IMAGEN'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_GALERIA_IMAGEN'
      'WHERE ID_GALERIA = ?ID'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_GALERIA_IMAGEN'
      'SET'
      '  ID_GALERIA=?ID_GALERIA '
      '  ,CODIGO=?CODIGO '
      '  ,IMAGEN=?IMAGEN '
      '  ,NOMBRE=?NOMBRE '
      '  ,FORMATO=?FORMATO '
      '  ,REPOSITORIO=?REPOSITORIO '
      '  ,RUTA=?RUTA '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMGaleria
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_GALERIA_IMAGEN'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMGaleriaImagenID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMGaleriaImagenID_GALERIA: TIntegerField
      DisplayLabel = 'Id Galeria'
      FieldName = 'ID_GALERIA'
    end
    object QMGaleriaImagenCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMGaleriaImagenIMAGEN: TBlobField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
      Size = 8
    end
    object QMGaleriaImagenNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 35
    end
    object QMGaleriaImagenFORMATO: TFIBStringField
      DisplayLabel = 'Formato'
      FieldName = 'FORMATO'
      Size = 5
    end
    object QMGaleriaImagenREPOSITORIO: TIntegerField
      DisplayLabel = 'Repositorio'
      FieldName = 'REPOSITORIO'
    end
    object QMGaleriaImagenRUTA: TFIBStringField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      Size = 200
    end
    object QMGaleriaImagenORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSQMGaleriaImagen: TDataSource
    DataSet = QMGaleriaImagen
    Left = 136
    Top = 56
  end
  object ILGaleria: TImageList
    Height = 150
    Masked = False
    Width = 150
    Left = 232
    Top = 104
  end
end
