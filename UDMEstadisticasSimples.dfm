object DMEstadisticasSimples: TDMEstadisticasSimples
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 330
  Top = 133
  Height = 530
  Width = 824
  object xEstadisticaClientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.EMAIL' +
        ', '
      '       SUM(D.B_DTO_LINEA) B_DTO_LINEA, SUM(D.UNIDADES) UNIDADES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.F' +
        'AMILIA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '-- C.EJERCICIO = _EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND'
      'C.ESTADO = 5 AND'
      'C.CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE AND'
      'D.ARTICULO BETWEEN :DESDE_ARTICULO AND :HASTA_ARTICULO AND'
      'A.FAMILIA BETWEEN :DESDE_FAMILIA AND :HASTA_FAMILIA AND'
      '--'
      'CASE'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        ')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) = '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        '))'
      
        '      -- OR ((C.SERIE = _SERIE2) OR (CAST(_SERIE2 AS VARCHAR(10)' +
        ') = '#39#39'))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      --((C.SERIE = _SERIE1) OR (CAST(_SERIE1 AS VARCHAR(10)) = ' +
        #39#39')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) = '#39#39')) THEN'
      '      (1 = 1)'
      'END'
      
        'GROUP BY C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.EMA' +
        'IL ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 104
    object xEstadisticaClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xEstadisticaClientesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEstadisticaClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xEstadisticaClientesB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_DTO_LINEA'
    end
    object xEstadisticaClientesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xEstadisticaClientesEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object DSxEstadisticaClientes: TDataSource
    DataSet = xEstadisticaClientes
    Left = 232
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 368
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
    Left = 424
    Top = 8
  end
  object DSxEstadisticaArticulos: TDataSource
    DataSet = xEstadisticaArticulos
    Left = 232
    Top = 8
  end
  object xEstadisticaArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT D.ARTICULO, A.TITULO_LARGO, SUM(D.B_DTO_LINEA) B_DTO_LINE' +
        'A, SUM(D.UNIDADES) UNIDADES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '-- C.EJERCICIO = _EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND'
      'C.ESTADO = 5 AND'
      'C.CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE AND'
      'D.ARTICULO BETWEEN :DESDE_ARTICULO AND :HASTA_ARTICULO AND'
      'A.FAMILIA BETWEEN :DESDE_FAMILIA AND :HASTA_FAMILIA AND'
      '--'
      'CASE'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        ')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) = '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        '))'
      
        '      -- OR ((C.SERIE = _SERIE2) OR (CAST(_SERIE2 AS VARCHAR(10)' +
        ') = '#39#39'))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      --((C.SERIE = _SERIE1) OR (CAST(_SERIE1 AS VARCHAR(10)) = ' +
        #39#39')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) = '#39#39')) THEN'
      '      (1 = 1)'
      'END'
      'GROUP BY D.ARTICULO, A.TITULO_LARGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object xEstadisticaArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEstadisticaArticulosTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object xEstadisticaArticulosB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Impionible'
      FieldName = 'B_DTO_LINEA'
    end
    object xEstadisticaArticulosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSxEstadisticaFamilias: TDataSource
    DataSet = xEstadisticaFamilias
    Left = 232
    Top = 56
  end
  object xEstadisticaFamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT F.FAMILIA, F.TITULO, SUM(D.B_DTO_LINEA) B_DTO_LINEA, SUM(' +
        'D.UNIDADES) UNIDADES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.F' +
        'AMILIA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '-- C.EJERCICIO = _EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND'
      'C.ESTADO = 5 AND'
      'C.CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE AND'
      'D.ARTICULO BETWEEN :DESDE_ARTICULO AND :HASTA_ARTICULO AND'
      'A.FAMILIA BETWEEN :DESDE_FAMILIA AND :HASTA_FAMILIA AND'
      '--'
      'CASE'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        ')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) = '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        '))'
      
        '      -- OR ((C.SERIE = _SERIE2) OR (CAST(_SERIE2 AS VARCHAR(10)' +
        ') = '#39#39'))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      --((C.SERIE = _SERIE1) OR (CAST(_SERIE1 AS VARCHAR(10)) = ' +
        #39#39')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) = '#39#39')) THEN'
      '      (1 = 1)'
      'END'
      'GROUP BY F.FAMILIA, F.TITULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
    object xEstadisticaFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 15
    end
    object xEstadisticaFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEstadisticaFamiliasB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_DTO_LINEA'
    end
    object xEstadisticaFamiliasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object xEstadisticaClientesFamilia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.EMAIL' +
        ', F.FAMILIA, F.TITULO, '
      '       SUM(D.B_DTO_LINEA) B_DTO_LINEA, SUM(D.UNIDADES) UNIDADES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.F' +
        'AMILIA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '-- C.EJERCICIO = _EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND'
      'C.ESTADO = 5 AND'
      'C.CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE AND'
      'D.ARTICULO BETWEEN :DESDE_ARTICULO AND :HASTA_ARTICULO AND'
      'A.FAMILIA BETWEEN :DESDE_FAMILIA AND :HASTA_FAMILIA AND'
      '--'
      'CASE'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        ')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) = '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        '))'
      
        '      -- OR ((C.SERIE = _SERIE2) OR (CAST(_SERIE2 AS VARCHAR(10)' +
        ') = '#39#39'))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      --((C.SERIE = _SERIE1) OR (CAST(_SERIE1 AS VARCHAR(10)) = ' +
        #39#39')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) = '#39#39')) THEN'
      '      (1 = 1)'
      'END'
      
        'GROUP BY C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.EMA' +
        'IL, F.FAMILIA, F.TITULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 152
    object xEstadisticaClientesFamiliaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xEstadisticaClientesFamiliaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEstadisticaClientesFamiliaNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xEstadisticaClientesFamiliaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 15
    end
    object xEstadisticaClientesFamiliaTITULO: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO'
      Size = 40
    end
    object xEstadisticaClientesFamiliaB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_DTO_LINEA'
    end
    object xEstadisticaClientesFamiliaUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xEstadisticaClientesFamiliaEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object DSxEstadisticaClientesFamilia: TDataSource
    DataSet = xEstadisticaClientesFamilia
    Left = 232
    Top = 152
  end
  object xEstadisticaClientesArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.EMAIL' +
        ', A.ARTICULO, A.TITULO_LARGO, '
      '       SUM(D.B_DTO_LINEA) B_DTO_LINEA, SUM(D.UNIDADES) UNIDADES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '-- C.EJERCICIO = _EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND'
      'C.ESTADO = 5 AND'
      'C.CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE AND'
      'D.ARTICULO BETWEEN :DESDE_ARTICULO AND :HASTA_ARTICULO AND'
      'A.FAMILIA BETWEEN :DESDE_FAMILIA AND :HASTA_FAMILIA AND'
      '--'
      'CASE'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        ')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) <> '#39#39') AND (CAST(:SERIE2 A' +
        'S VARCHAR(10)) = '#39#39')) THEN'
      '      ('
      
        '      ((C.SERIE = :SERIE1) OR (CAST(:SERIE1 AS VARCHAR(10)) = '#39#39 +
        '))'
      
        '      -- OR ((C.SERIE = _SERIE2) OR (CAST(_SERIE2 AS VARCHAR(10)' +
        ') = '#39#39'))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) <> '#39#39')) THEN'
      '      ('
      
        '      --((C.SERIE = _SERIE1) OR (CAST(_SERIE1 AS VARCHAR(10)) = ' +
        #39#39')) OR'
      
        '      ((C.SERIE = :SERIE2) OR (CAST(:SERIE2 AS VARCHAR(10)) = '#39#39 +
        '))'
      '      )'
      
        '  WHEN ((CAST(:SERIE1 AS VARCHAR(10)) = '#39#39') AND (CAST(:SERIE2 AS' +
        ' VARCHAR(10)) = '#39#39')) THEN'
      '      (1 = 1)'
      'END'
      
        'GROUP BY C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.EMA' +
        'IL, A.ARTICULO, A.TITULO_LARGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
    object xEstadisticaClientesArticuloCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xEstadisticaClientesArticuloNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEstadisticaClientesArticuloNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xEstadisticaClientesArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEstadisticaClientesArticuloTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      DisplayWidth = 256
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object xEstadisticaClientesArticuloB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_DTO_LINEA'
    end
    object xEstadisticaClientesArticuloUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xEstadisticaClientesArticuloEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object DSxEstadisticaClientesArticulo: TDataSource
    DataSet = xEstadisticaClientesArticulo
    Left = 232
    Top = 200
  end
end
