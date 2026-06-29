object DMConfiguraAlmacen: TDMConfiguraAlmacen
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 412
  Top = 281
  Height = 428
  Width = 547
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 48
    Top = 8
  end
  object QMUbicacionAlmacen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ALMACENES_UBICACIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  CALLE=?old_CALLE AND '
      '  ESTANTERIA=?old_ESTANTERIA AND '
      '  REPISA=?old_REPISA AND '
      '  POSICION=?old_POSICION ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ALMACENES_UBICACIONES'
      
        '  (EMPRESA,ALMACEN,CALLE,ESTANTERIA,REPISA,POSICION,TITULO,VOLUM' +
        'EN_MAX,DIAMETRO_MAX,PESO_MAX,VOLUMEN_ACC,PESO_ACC,DIAMETRO_ACC,S' +
        'ECTOR,TIPO,DISPONIBLE)'
      'VALUES'
      
        '  (?EMPRESA,?ALMACEN,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?TITUL' +
        'O,?VOLUMEN_MAX,?DIAMETRO_MAX,?PESO_MAX,?VOLUMEN_ACC,?PESO_ACC,?D' +
        'IAMETRO_ACC,?SECTOR,?TIPO,?DISPONIBLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES_UBICACIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN AND '
      '  CALLE=?CALLE AND '
      '  ESTANTERIA=?ESTANTERIA AND '
      '  REPISA=?REPISA AND '
      '  POSICION=?POSICION ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ALMACENES_UBICACIONES'
      'WHERE EMPRESA=?EMPRESA AND'
      '               ALMACEN=?ALMACEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ALMACENES_UBICACIONES'
      'SET'
      '  TITULO=?TITULO '
      '  ,VOLUMEN_MAX=?VOLUMEN_MAX '
      '  ,DIAMETRO_MAX=?DIAMETRO_MAX '
      '  ,PESO_MAX=?PESO_MAX '
      '  ,VOLUMEN_ACC=?VOLUMEN_ACC '
      '  ,PESO_ACC=?PESO_ACC '
      '  ,DIAMETRO_ACC=?DIAMETRO_ACC '
      '  ,SECTOR=?SECTOR'
      '  ,TIPO=?TIPO'
      '  ,DISPONIBLE=?DISPONIBLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN AND '
      '  CALLE=?CALLE AND '
      '  ESTANTERIA=?ESTANTERIA AND '
      '  REPISA=?REPISA AND '
      '  POSICION=?POSICION ')
    DataSource = DSxAlmacen
    BeforePost = QMUbicacionAlmacenBeforePost
    OnNewRecord = QMUbicacionAlmacenNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ALMACEN '
      'CALLE '
      'ESTANTERIA '
      'REPISA '
      'POSICION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ALMACENES_UBICACIONES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'ART_ALMACENES_UBICACIONES')
    CamposBloqueo.Strings = (
      'ID_UBICACION')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMUbicacionAlmacenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUbicacionAlmacenALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMUbicacionAlmacenCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMUbicacionAlmacenESTANTERIA: TFIBStringField
      DisplayLabel = 'Est.'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMUbicacionAlmacenREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMUbicacionAlmacenPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMUbicacionAlmacenTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMUbicacionAlmacenVOLUMEN_MAX: TFloatField
      DisplayLabel = 'Vol. Max.'
      FieldName = 'VOLUMEN_MAX'
    end
    object QMUbicacionAlmacenDIAMETRO_MAX: TFloatField
      DisplayLabel = 'Diam. Max.'
      FieldName = 'DIAMETRO_MAX'
    end
    object QMUbicacionAlmacenPESO_MAX: TFloatField
      DisplayLabel = 'Peso Max.'
      FieldName = 'PESO_MAX'
    end
    object QMUbicacionAlmacenVOLUMEN_ACC: TFloatField
      DisplayLabel = 'Vol. Act.'
      FieldName = 'VOLUMEN_ACC'
    end
    object QMUbicacionAlmacenPESO_ACC: TFloatField
      DisplayLabel = 'Peso Act.'
      FieldName = 'PESO_ACC'
    end
    object QMUbicacionAlmacenDIAMETRO_ACC: TFloatField
      DisplayLabel = 'Diam. Act.'
      FieldName = 'DIAMETRO_ACC'
    end
    object QMUbicacionAlmacenID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMUbicacionAlmacenCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
    end
    object QMUbicacionAlmacenTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMUbicacionAlmacenSECTOR: TFIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 5
    end
    object QMUbicacionAlmacenDISPONIBLE: TIntegerField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
  object DSQMUbicacionAlmacen: TDataSource
    DataSet = QMUbicacionAlmacen
    Left = 176
    Top = 104
  end
  object xAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ALMACENES'
      'WHERE EMPRESA = ?EMPRESA  AND'
      '               CTROL_UBICACION=1')
    UniDirectional = False
    AfterOpen = xAlmacenAfterOpen
    Left = 48
    Top = 56
    object xAlmacenALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlmacenTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAlmacen: TDataSource
    DataSet = xAlmacen
    Left = 176
    Top = 56
  end
  object QTreeAlmacenes: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select almacen,titulo from art_almacenes'
      'where empresa = ?empresa and '
      '           almacen = ?almacen')
    Transaction = TLocal
    Left = 48
    Top = 152
  end
  object QTreeCalles: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT distinct(UBI.CALLE) AS CALLE,CA.DESCRIPCION AS TITULO'
      'FROM ART_ALMACENES_UBICACIONES UBI'
      'JOIN ART_CALLES CA'
      'ON ((UBI.EMPRESA=CA.EMPRESA) AND (UBI.CALLE=CA.CALLE))'
      'WHERE UBI.EMPRESA = ?EMPRESA AND '
      '               UBI.ALMACEN = ?ALMACEN')
    Transaction = TLocal
    Left = 48
    Top = 200
  end
  object QTreeEstanterias: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT distinct(UBI.ESTANTERIA) AS ESTANTERIA,ST.DESCRIPCION AS ' +
        'TITULO'
      'FROM ART_ALMACENES_UBICACIONES UBI'
      'JOIN ART_ESTANTERIAS ST'
      
        'ON ((UBI.EMPRESA=ST.EMPRESA) AND  (UBI.ESTANTERIA=ST.ESTANTERIA)' +
        ')'
      'WHERE UBI.EMPRESA =?EMPRESA AND'
      '               UBI.ALMACEN = ?ALMACEN AND'
      '               UBI.CALLE       = ?CALLE'
      '')
    Transaction = TLocal
    Left = 48
    Top = 344
  end
  object QTreeRepisas: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT distinct(UBI.REPISA) AS REPISA,ART.DESCRIPCION AS TITULO'
      'FROM ART_ALMACENES_UBICACIONES UBI'
      'JOIN ART_REPISAS ART'
      'ON ((UBI.EMPRESA=ART.EMPRESA) AND (UBI.REPISA=ART.REPISA))'
      'WHERE UBI.EMPRESA       = ?EMPRESA AND'
      '               UBI.ALMACEN        = ?ALMACEN AND'
      '               UBI.CALLE              = ?CALLE      AND'
      '               UBI.ESTANTERIA   = ?ESTANTERIA '
      '')
    Transaction = TLocal
    Left = 48
    Top = 248
  end
  object QTreePosiciones: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT distinct(UBI.POSICION) AS POSICION,ART.DESCRIPCION AS TIT' +
        'ULO'
      'FROM ART_ALMACENES_UBICACIONES UBI'
      'JOIN ART_POSICION ART'
      'ON ((UBI.EMPRESA=ART.EMPRESA) AND  (UBI.POSICION=ART.POSICION))'
      'WHERE UBI.EMPRESA        = ?EMPRESA AND'
      '               UBI.ALMACEN        = ?ALMACEN AND'
      '               UBI.CALLE              = ?CALLE      AND'
      '               UBI.ESTANTERIA   = ?ESTANTERIA  AND'
      '               UBI.REPISA             = ?REPISA'
      '')
    Transaction = TLocal
    Left = 48
    Top = 296
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 176
    Top = 8
  end
end
