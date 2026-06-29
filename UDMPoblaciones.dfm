object DMPoblaciones: TDMPoblaciones
  OldCreateOrder = False
  OnCreate = DMPoblacionesCreate
  Left = 416
  Top = 195
  Height = 387
  Width = 465
  object QMPaises: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PAISES'
      'WHERE'
      '  PAIS=?old_PAIS ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PAISES'
      '  (TITULO,PAIS_C2,CODIGO_TEL,PAIS,PAIS_N3,IDIOMA,PERTENECE_CEE)'
      'VALUES'
      
        '  (?TITULO,?PAIS_C2,?CODIGO_TEL,?PAIS,?PAIS_N3,?IDIOMA,?PERTENEC' +
        'E_CEE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PAISES'
      'WHERE'
      '  PAIS=?old_PAIS ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PAISES'
      'ORDER BY PAIS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PAISES'
      'SET'
      '  TITULO=?TITULO '
      '  ,PAIS_C2=?PAIS_C2 '
      '  ,CODIGO_TEL=?CODIGO_TEL '
      '  ,PAIS_N3=?PAIS_N3 '
      '  ,IDIOMA=?IDIOMA'
      '  ,PERTENECE_CEE=?PERTENECE_CEE'
      'WHERE'
      '  PAIS=?old_PAIS ')
    OnNewRecord = QMPaisesNewRecord
    ClavesPrimarias.Strings = (
      'PAIS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PAISES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMPaisesPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMPaisesPAIS_C2: TFIBStringField
      DisplayLabel = 'Pa'#237's C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object QMPaisesPAIS_N3: TFIBStringField
      DisplayLabel = 'Pa'#237's N3'
      FieldName = 'PAIS_N3'
      Size = 3
    end
    object QMPaisesCODIGO_TEL: TFIBStringField
      DisplayLabel = 'C'#243'digo Tel.'
      FieldName = 'CODIGO_TEL'
      Size = 4
    end
    object QMPaisesIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMPaisesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPaisesPERTENECE_CEE: TIntegerField
      DisplayLabel = 'Pertenece C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
  end
  object DSQMPaises: TDataSource
    DataSet = QMPaises
    Left = 128
    Top = 24
  end
  object QMProvincias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PROVINCIAS'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  PROVINCIA=?old_PROVINCIA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PROVINCIAS'
      '  (PROVINCIA,TITULO,CODIGO_TEL,PAIS,INE)'
      'VALUES'
      '  (?PROVINCIA,?TITULO,?CODIGO_TEL,?PAIS,?INE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PROVINCIAS'
      'WHERE'
      '  PAIS=?OLD_PAIS AND '
      '  PROVINCIA=?OLD_PROVINCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PROVINCIAS'
      'ORDER BY PAIS, PROVINCIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PROVINCIAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,CODIGO_TEL=?CODIGO_TEL '
      '  ,INE=?INE'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  PROVINCIA=?old_PROVINCIA ')
    ClavesPrimarias.Strings = (
      'PAIS '
      'PROVINCIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PROVINCIAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMProvinciasPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMProvinciasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object QMProvinciasCODIGO_TEL: TFIBStringField
      DisplayLabel = 'C'#243'digo Tel.'
      FieldName = 'CODIGO_TEL'
      Size = 4
    end
    object QMProvinciasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMProvinciasINE: TFIBStringField
      DisplayLabel = 'I.N.E.'
      FieldName = 'INE'
      Size = 2
    end
    object QMProvinciasLRE: TFIBStringField
      FieldName = 'LRE'
      Size = 15
    end
  end
  object DSQMProvincias: TDataSource
    DataSet = QMProvincias
    Left = 128
    Top = 72
  end
  object QMLocalidades: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_LOCALIDADES'
      'WHERE'
      '  LOCALIDAD=?old_LOCALIDAD ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_LOCALIDADES'
      
        '  (LOCALIDAD,CODIGO_POSTAL,TITULO,PROVINCIA,PAIS,COLONIA,TIPO_CO' +
        'LONIA,CIUDAD,LATITUD, LONGITUD, ZONA_HORARIA, ID_LOCAL)'
      'VALUES'
      
        '  (?LOCALIDAD,?CODIGO_POSTAL,?TITULO,?PROVINCIA,?PAIS,?COLONIA,?' +
        'TIPO_COLONIA,?CIUDAD,?LATITUD,?LONGITUD,?ZONA_HORARIA, ?ID_LOCAL' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_LOCALIDADES'
      'WHERE'
      '  ID_LOCAL=?OLD_ID_LOCAL')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_LOCALIDADES'
      'ORDER BY LOCALIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_LOCALIDADES'
      'SET'
      '  CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,TITULO=?TITULO '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,PAIS=?PAIS '
      '  ,COLONIA=?COLONIA'
      '  ,TIPO_COLONIA=?TIPO_COLONIA'
      '  ,CIUDAD=?CIUDAD'
      '  ,LATITUD=?LATITUD'
      '  ,LONGITUD=?LONGITUD'
      '  ,ZONA_HORARIA=?ZONA_HORARIA'
      'WHERE'
      '  ID_LOCAL=?old_ID_LOCAL')
    BeforeEdit = QMLocalidadesBeforeEdit
    BeforePost = QMLocalidadesBeforePost
    ClavesPrimarias.Strings = (
      'ID_LOCAL'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_LOCALIDADES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 120
    object QMLocalidadesLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object QMLocalidadesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMLocalidadesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C'#243'd. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMLocalidadesPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      OnChange = QMLocalidadesPAISChange
      Size = 3
    end
    object QMLocalidadesPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object QMLocalidadesID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object QMLocalidadesULT_MODIFICACION: TDateTimeField
      DisplayLabel = #218'lt. Modif.'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMLocalidadesCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMLocalidadesTIPO_COLONIA: TFIBStringField
      DisplayLabel = 'Tipo Colonia'
      FieldName = 'TIPO_COLONIA'
      Size = 40
    end
    object QMLocalidadesCIUDAD: TFIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CIUDAD'
      Size = 40
    end
    object QMLocalidadesLATITUD: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'LATITUD'
    end
    object QMLocalidadesLONGITUD: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
    object QMLocalidadesZONA_HORARIA: TFloatField
      DisplayLabel = 'Zona Horaria'
      FieldName = 'ZONA_HORARIA'
    end
  end
  object DSQMLocalidades: TDataSource
    DataSet = QMLocalidades
    Left = 128
    Top = 120
  end
  object EntornoLoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 216
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 24
  end
  object QMRegiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_REGIONES'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  REGION=?old_REGION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_REGIONES'
      '  (ID_REGION,TITULO,PAIS,REGION)'
      'VALUES'
      '  (?ID_REGION,?TITULO,?PAIS,?REGION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_REGIONES'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  REGION=?REGION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_REGIONES'
      'ORDER BY PAIS, REGION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_REGIONES'
      'SET'
      '  ID_REGION=?ID_REGION '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  REGION=?REGION ')
    ClavesPrimarias.Strings = (
      'PAIS '
      'REGION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_REGIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 168
    object QMRegionesID_REGION: TIntegerField
      DisplayLabel = 'Id Region'
      FieldName = 'ID_REGION'
    end
    object QMRegionesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMRegionesREGION: TFIBStringField
      DisplayLabel = 'Region'
      FieldName = 'REGION'
      Size = 15
    end
    object QMRegionesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMRegionesLRE: TFIBStringField
      FieldName = 'LRE'
      Size = 15
    end
    object QMRegionesABREVIATURA: TFIBStringField
      DisplayLabel = 'Abreviatura'
      FieldName = 'ABREVIATURA'
      Size = 15
    end
  end
  object DSQMRegiones: TDataSource
    DataSet = QMRegiones
    Left = 128
    Top = 168
  end
  object QMPoblaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_POBLACION'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  POBLACION=?old_POBLACION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_POBLACION'
      '  (ID_POBLACION,PROVINCIA,TITULO,PAIS,POBLACION)'
      'VALUES'
      '  (?ID_POBLACION,?PROVINCIA,?TITULO,?PAIS,?POBLACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_POBLACION'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  POBLACION=?POBLACION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_POBLACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_POBLACION'
      'SET'
      '  ID_POBLACION=?ID_POBLACION '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  POBLACION=?POBLACION ')
    ClavesPrimarias.Strings = (
      'PAIS '
      'POBLACION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_POBLACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 216
    object QMPoblacionesID_POBLACION: TIntegerField
      DisplayLabel = 'Id Poblacion'
      FieldName = 'ID_POBLACION'
    end
    object QMPoblacionesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMPoblacionesPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 15
    end
    object QMPoblacionesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMPoblacionesPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object QMPoblacionesLRE: TFIBStringField
      FieldName = 'LRE'
      Size = 15
    end
  end
  object DSQMPoblaciones: TDataSource
    DataSet = QMPoblaciones
    Left = 128
    Top = 216
  end
end
