object DMUbicaArticulo: TDMUbicaArticulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 562
  Top = 414
  Height = 366
  Width = 286
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 8
  end
  object xArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from art_articulos'
      'where '
      'empresa=?empresa and '
      'articulo=?articulo and '
      'ubicable=1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = xArticulosAfterOpen
    BeforeEdit = xArticulosBeforeEdit
    BeforePost = xArticulosBeforePost
    OnNewRecord = xArticulosNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 160
    Top = 56
  end
  object DSQMArticuloUbicacion: TDataSource
    DataSet = QMArticuloUbicacion
    Left = 160
    Top = 104
  end
  object QMArticuloUbicacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_UBICACIONES'
      'WHERE '
      'ID_A=?ID_A AND '
      'ID_UBICACION=?ID_UBICACION AND'
      'LINEA=?LINEA')
    InsertSQL.Strings = (
      
        'INSERT INTO VER_ARTICULOS_UBICACIONES(ID_A,ID_UBICACION,PRIORIDA' +
        'D,LINEA,COMPOSICION)'
      '  VALUES(?ID_A,?ID_UBICACION,?PRIORIDAD,?LINEA,?COMPOSICION)')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_UBICACIONES'
      'WHERE '
      'ID_A=?ID_A AND '
      'ID_UBICACION=?ID_UBICACION AND '
      'LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_UBICACIONES'
      'WHERE'
      'ID_A = ?ID_A'
      'ORDER BY PRIORIDAD DESC, COMPOSICION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_UBICACIONES'
      'SET PRIORIDAD=?PRIORIDAD'
      'WHERE '
      '  ID_A=?ID_A AND'
      '  ID_UBICACION=?ID_UBICACION AND'
      '  LINEA=?LINEA')
    DataSource = DSxArticulos
    AfterPost = QMArticuloUbicacionAfterPost
    BeforePost = QMArticuloUbicacionBeforePost
    OnNewRecord = QMArticuloUbicacionNewRecord
    ClavesPrimarias.Strings = (
      'ID_A '
      'ID_UBICACION '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_UBICACIONES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'art_articulos_ubicaciones'
      'art_articulos'
      'art_almacenes_ubicaciones')
    CamposBloqueo.Strings = (
      'id_a_ubicacion'
      'id_a'
      'id_ubicacion')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMArticuloUbicacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticuloUbicacionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticuloUbicacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticuloUbicacionTITULO_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_DESCRIPCION'
      Size = 60
    end
    object QMArticuloUbicacionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMArticuloUbicacionPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMArticuloUbicacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMArticuloUbicacionCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      OnChange = QMArticuloUbicacionCOMPOSICIONChange
    end
    object QMArticuloUbicacionID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMArticuloUbicacionGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 160
    Top = 8
  end
end
