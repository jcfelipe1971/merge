object DMNomConstantes: TDMNomConstantes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 380
  Top = 291
  Height = 588
  Width = 581
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 528
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 528
    Top = 56
  end
  object DSQMNomConstantes: TDataSource
    DataSet = QMNomConstantes
    Left = 168
    Top = 56
  end
  object QMNomConstantes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_CONSTANTES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_CONSTANTES'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,PERIODO,CODIGO,IMPORTE,DATO_TEXT' +
        'O,GLOSA,TIPO_DATO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?CODIGO,?IMPORTE,?D' +
        'ATO_TEXTO,?GLOSA,?TIPO_DATO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_CONSTANTES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_NOMINAS_CONSTANTES'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL and'
      'PERIODO = ?PERIODO'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_CONSTANTES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PERIODO=?PERIODO '
      '  ,CODIGO=?CODIGO '
      '  ,IMPORTE=?IMPORTE '
      '  ,DATO_TEXTO=?DATO_TEXTO '
      '  ,GLOSA=?GLOSA '
      '  ,TIPO_DATO=?TIPO_DATO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSPeriodos
    BeforePost = QMNomConstantesBeforePost
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_CONSTANTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMNomConstantesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomConstantesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomConstantesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNomConstantesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNomConstantesPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMNomConstantesCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMNomConstantesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      OnGetText = QMNomConstantesIMPORTEGetText
    end
    object QMNomConstantesDATO_TEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'DATO_TEXTO'
      Size = 15
    end
    object QMNomConstantesGLOSA: TFIBStringField
      DisplayLabel = 'Closa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMNomConstantesTIPO_DATO: TFIBStringField
      DisplayLabel = 'Tipo Dato'
      FieldName = 'TIPO_DATO'
      Size = 15
    end
  end
  object DSPeriodos: TDataSource
    DataSet = xPeriodos
    Left = 168
    Top = 8
  end
  object xPeriodos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PERIODOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PERIODOS'
      '  (EMPRESA,'#13#10'EJERCICIO,PERIODO,TITULO,DESDE,HASTA)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?EJERCICIO,?PERIODO,?TITULO,?DESDE,?HASTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PERIODOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PERIODOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  PERIODO BETWEEN '#39'01'#39' AND '#39'12'#39
      'ORDER BY PERIODO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PERIODOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  PERIODO=?PERIODO ')
    AfterOpen = xPeriodosAfterOpen
    BeforeClose = xPeriodosBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PERIODOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object xPeriodosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPeriodosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPeriodosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xPeriodosDESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object xPeriodosHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
  end
  object QMAFPIndicadores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT * FROM VER_AFP_EQUIVALENCIA '
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'EJERCICIO = :EJERCICIO AND '
      'CANAL = :CANAL AND '
      'PERIODO = :PERIODO AND'
      'CODIGO = :CODIGO')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT * FROM VER_AFP_EQUIVALENCIA '
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL and'
      'PERIODO = ?PERIODO'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AFP_EQUIVALENCIA'
      'SET'
      'TASA_AFP_DEPENDIENTE = :TASA_AFP_DEPENDIENTE,'
      'TASA_SIS_DEPENDIENTE = :TASA_SIS_DEPENDIENTE,'
      'TASA_AFP_INDEPENDIENTE = :TASA_AFP_INDEPENDIENTE'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO = :PERIODO AND'
      'CODIGO = :CODIGO  ')
    DataSource = DSPeriodos
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AFP_EQUIVALENCIA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QMAFPIndicadoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAFPIndicadoresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAFPIndicadoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAFPIndicadoresPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMAFPIndicadoresCODIGO: TFIBStringField
      DisplayLabel = 'Codigo AFP'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMAFPIndicadoresGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMAFPIndicadoresTASA_AFP_DEPENDIENTE: TFloatField
      DisplayLabel = ' AFP Dep. %'
      FieldName = 'TASA_AFP_DEPENDIENTE'
    end
    object QMAFPIndicadoresTASA_SIS_DEPENDIENTE: TFloatField
      DisplayLabel = 'SIS Dep. %'
      FieldName = 'TASA_SIS_DEPENDIENTE'
    end
    object QMAFPIndicadoresTASA_AFP_INDEPENDIENTE: TFloatField
      DisplayLabel = 'AFP Indep. %'
      FieldName = 'TASA_AFP_INDEPENDIENTE'
    end
  end
  object DSQMAFPIndicadores: TDataSource
    DataSet = QMAFPIndicadores
    Left = 168
    Top = 104
  end
  object xInfoActualizada: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '       -- CANTIDAD DE EMPLEADOS'
      '       (SELECT COUNT(*)'
      '        FROM OPE_EMPLEADO E'
      
        '        JOIN CON_CUENTAS_GES_EMP C ON C.EMPRESA = E.EMPRESA AND ' +
        'C.EMPLEADO = E.EMPLEADO'
      '        WHERE'
      '        E.EMPRESA = :EMPRESA AND'
      '        C.EJERCICIO = :EJERCICIO AND'
      '        C.CANAL = :CANAL AND'
      '        E.ACTIVO = 1) AS CANTIDAD_EMPLEADOS,'
      '       -- CANTIDAD DE NOMINAS'
      '       (SELECT COUNT(*)'
      '        FROM EMP_NOMINAS_CABECERA N'
      '        WHERE'
      '        N.EMPRESA = :EMPRESA AND'
      '        N.EJERCICIO = :EJERCICIO AND'
      '        N.CANAL = :CANAL AND'
      '        N.PERIODO = :PERIODO) NOMINAS_PERIODO,'
      '       -- CANTIDAD DE NOMINAS CERRADAS'
      '       (SELECT COUNT(*)'
      '        FROM EMP_NOMINAS_CABECERA N'
      '        WHERE'
      '        N.EMPRESA = :EMPRESA AND'
      '        N.EJERCICIO = :EJERCICIO AND'
      '        N.CANAL = :CANAL AND'
      '        N.PERIODO = :PERIODO AND'
      '        N.ESTADO = 5) NOMINAS_CERRADAS'
      'FROM RDB$DATABASE')
    SelectSQL.Strings = (
      'SELECT'
      '       -- CANTIDAD DE EMPLEADOS'
      '       (SELECT COUNT(*)'
      '        FROM OPE_EMPLEADO E'
      
        '        JOIN CON_CUENTAS_GES_EMP C ON C.EMPRESA = E.EMPRESA AND ' +
        'C.EMPLEADO = E.EMPLEADO'
      '        WHERE'
      '        E.EMPRESA = :EMPRESA AND'
      '        C.EJERCICIO = :EJERCICIO AND'
      '        C.CANAL = :CANAL AND'
      '        E.ACTIVO = 1) AS CANTIDAD_EMPLEADOS,'
      '       -- CANTIDAD DE NOMINAS'
      '       (SELECT COUNT(*)'
      '        FROM EMP_NOMINAS_CABECERA N'
      '        WHERE'
      '        N.EMPRESA = :EMPRESA AND'
      '        N.EJERCICIO = :EJERCICIO AND'
      '        N.CANAL = :CANAL AND'
      '        N.PERIODO = :PERIODO) NOMINAS_PERIODO,'
      '       -- CANTIDAD DE NOMINAS CERRADAS'
      '       (SELECT COUNT(*)'
      '        FROM EMP_NOMINAS_CABECERA N'
      '        WHERE'
      '        N.EMPRESA = :EMPRESA AND'
      '        N.EJERCICIO = :EJERCICIO AND'
      '        N.CANAL = :CANAL AND'
      '        N.PERIODO = :PERIODO AND'
      '        N.ESTADO = 5) NOMINAS_CERRADAS,'
      '       -- TOTAL LIQUIDO DE NOMINAS'
      '       (SELECT SUM(H.IMPORTE)'
      '        FROM EMP_NOMINAS_CABECERA C'
      '        JOIN EMP_NOMINAS_DET_HABERES H ON C.ID = H.ID_CABECERA'
      '        WHERE'
      '        C.EMPRESA = :EMPRESA AND'
      '        C.EJERCICIO = :EJERCICIO AND'
      '        C.CANAL = :CANAL AND'
      '        C.PERIODO = :PERIODO AND'
      '        C.ESTADO = 5 AND'
      '        H.CODIGO = '#39'H020'#39') TOTAL_LIQUIDO'
      'FROM RDB$DATABASE')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSPeriodos
    OnCalcFields = xInfoActualizadaCalcFields
    Left = 56
    Top = 152
    object xInfoActualizadaCANTIDAD_EMPLEADOS: TIntegerField
      DisplayLabel = 'Cant. Empleados'
      FieldName = 'CANTIDAD_EMPLEADOS'
    end
    object xInfoActualizadaNOMINAS_PERIODO: TIntegerField
      DisplayLabel = 'Nominas Periodo'
      FieldName = 'NOMINAS_PERIODO'
    end
    object xInfoActualizadaNOMINAS_CERRADAS: TIntegerField
      DisplayLabel = 'Nominas Cerradas'
      FieldName = 'NOMINAS_CERRADAS'
    end
    object xInfoActualizadaNOMINAS_PENDIENTES: TIntegerField
      DisplayLabel = 'Nominas Pendientes'
      FieldKind = fkCalculated
      FieldName = 'NOMINAS_PENDIENTES'
      Calculated = True
    end
    object xInfoActualizadaTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 168
    Top = 152
  end
  object QMTramosRenta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_NOMINAS_TRAMOS_RENTA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_NOMINAS_TRAMOS_RENTA'
      
        '  (ID,EMPRESA,EJERCICIO,CANAL,PERIODO,DESDE,HASTA,FACTOR,REBAJAR' +
        ',MAXIMO,PERIDOCIDAD)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?DESDE,?HASTA,?FACTOR' +
        ',?REBAJAR,?MAXIMO,?PERIDOCIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_NOMINAS_TRAMOS_RENTA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_NOMINAS_TRAMOS_RENTA'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL and'
      'PERIODO = ?PERIODO'
      'ORDER BY DESDE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_NOMINAS_TRAMOS_RENTA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PERIODO=?PERIODO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,FACTOR=?FACTOR '
      '  ,REBAJAR=?REBAJAR '
      '  ,MAXIMO=?MAXIMO '
      '  ,PERIDOCIDAD=?PERIDOCIDAD '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSPeriodos
    OnNewRecord = QMTramosRentaNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_NOMINAS_TRAMOS_RENTA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 200
    object QMTramosRentaID: TIntegerField
      FieldName = 'ID'
    end
    object QMTramosRentaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTramosRentaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTramosRentaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTramosRentaPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMTramosRentaDESDE: TFloatField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMTramosRentaHASTA: TFloatField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMTramosRentaFACTOR: TFloatField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
    end
    object QMTramosRentaREBAJAR: TFloatField
      DisplayLabel = 'Rebajar'
      FieldName = 'REBAJAR'
    end
    object QMTramosRentaMAXIMO: TFloatField
      DisplayLabel = 'M'#225'ximo'
      FieldName = 'MAXIMO'
    end
    object QMTramosRentaPERIDOCIDAD: TFIBStringField
      DisplayLabel = 'Periodicidad'
      FieldName = 'PERIDOCIDAD'
      Size = 15
    end
  end
  object DSQMTramosRenta: TDataSource
    DataSet = QMTramosRenta
    Left = 168
    Top = 200
  end
  object xNominas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT * FROM VER_EMP_NOMINAS_CABECERA'
      'WHERE'
      'ID = ?ID')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_NOMINAS_CABECERA'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'PERIODO = ?PERIODO'
      'ORDER BY NIF')
    UniDirectional = False
    DataSource = DSPeriodos
    AfterOpen = xNominasAfterOpen
    BeforeClose = xNominasBeforeClose
    Left = 304
    Top = 8
  end
  object DSxNominas: TDataSource
    DataSet = xNominas
    Left = 416
    Top = 8
  end
  object xEmpleadoNomina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      'EMPRESA= ?EMPRESA AND'
      'EJERCICIO= ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'EMPLEADO = ?EMPLEADO')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      'EMPRESA= ?EMPRESA AND'
      'EJERCICIO= ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'EMPLEADO = ?EMPLEADO ')
    UniDirectional = False
    DataSource = DSxNominas
    AfterOpen = xEmpleadoNominaAfterOpen
    BeforeClose = xEmpleadoNominaBeforeClose
    Left = 304
    Top = 200
  end
  object DSxEmpleadoNomina: TDataSource
    DataSet = xEmpleadoNomina
    Left = 416
    Top = 200
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT E.*, DI.*, LO.*, RE.REGION, RE.TITULO AS TITULO_REGION, R' +
        'E.LRE AS LRE_REGION, RE.ABREVIATURA, PRL.PROVINCIA,'
      
        '       PR.TITULO AS TITULO_PROVINCIA, PR.LRE AS LRE_PROVINCIA, P' +
        'O.POBLACION, PO.TITULO AS TITULO_POBLACION,'
      '       PO.LRE AS LRE_POBLACION'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS TE ON (E.TERCERO = TE.TERCERO)'
      'JOIN SYS_TERCEROS_DIRECCIONES DI ON TE.TERCERO = DI.TERCERO'
      'JOIN SYS_LOCALIDADES LO ON DI.ID_LOCAL = LO.ID_LOCAL'
      
        'JOIN SYS_PROVINCIAS PRL ON PRL.PAIS = LO.PAIS AND PRL.PROVINCIA ' +
        '= LO.PROVINCIA'
      'JOIN SYS_PAISES PA ON PA.PAIS = DI.PAIS_DIRECCION'
      
        'LEFT JOIN SYS_REGIONES RE ON RE.PAIS = DI.PAIS_DIRECCION AND RE.' +
        'REGION = DI.REGION'
      
        'LEFT JOIN SYS_PROVINCIAS PR ON PR.PAIS = DI.PAIS_DIRECCION AND P' +
        'R.PROVINCIA = DI.PROVINCIA'
      
        'LEFT JOIN SYS_POBLACION PO ON PO.PAIS = DI.PAIS_DIRECCION AND PO' +
        '.POBLACION = DI.POBLACION'
      
        'LEFT JOIN SYS_CODIGOS_POSTALES CP ON CP.PAIS = DI.PAIS_DIRECCION' +
        ' AND CP.CODIGO_POSTAL = DI.CODIGO_POSTAL'
      'WHERE'
      'DI.DIR_DEFECTO = 1 AND'
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSPeriodos
    Left = 304
    Top = 296
  end
  object DSxEmpresa: TDataSource
    DataSet = xEmpresa
    Left = 416
    Top = 296
  end
  object xContrato: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM OPE_EMPLEADOS_CONTRATOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EMPLEADO = ?EMPLEADO'
      'ORDER BY CONTRATO DESC')
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM OPE_EMPLEADOS_CONTRATOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EMPLEADO = ?EMPLEADO'
      'ORDER BY CONTRATO DESC')
    UniDirectional = False
    DataSource = DSxEmpleadoNomina
    Left = 304
    Top = 248
  end
  object DSxContrato: TDataSource
    DataSet = xContrato
    Left = 416
    Top = 248
  end
  object DSxNomDetHaberes: TDataSource
    DataSet = xNomDetHaberes
    Left = 416
    Top = 56
  end
  object xNomDetHaberes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT CODIGO, IMPORTE'
      'FROM EMP_NOMINAS_DET_HABERES'
      'WHERE'
      'ID_CABECERA = ?ID'
      'ORDER BY CODIGO')
    UniDirectional = False
    DataSource = DSxNominas
    Left = 304
    Top = 56
  end
  object xNomDetDescuentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT CODIGO, IMPORTE'
      'FROM EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      'ID_CABECERA = ?ID'
      'ORDER BY CODIGO')
    UniDirectional = False
    DataSource = DSxNominas
    Left = 304
    Top = 104
  end
  object xNomDetParametros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT CODIGO, IMPORTE, DATO_TEXTO, DATO_FECHA'
      'FROM EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      'ID_CABECERA = ?ID'
      'ORDER BY CODIGO')
    UniDirectional = False
    DataSource = DSxNominas
    Left = 304
    Top = 152
  end
  object DSxNomDetDescuentos: TDataSource
    DataSet = xNomDetDescuentos
    Left = 416
    Top = 104
  end
  object DSxNomDetParametros: TDataSource
    DataSet = xNomDetParametros
    Left = 416
    Top = 152
  end
  object DSQPagos: TDataSource
    DataSet = QPagos
    Left = 168
    Top = 248
  end
  object QPagos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_NOMINAS_CABECERA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_NOMINAS_CABECERA'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,EMPLEADO,PERIODO,CERRADO,EJERCIC' +
        'IO_CIERRE,ENTRADA,FECHA_INI_PERIODO,ESTADO,'#13#10'FECHA,FECHA_FIN_PER' +
        'IODO,FECHA_COBRO,TDEVENGO,TDEDUCCION,PERCIBIR,LISTADO,PAGADO,RIC' +
        '_CIERRE,EJERCICIO_PAGO,'#13#10'RIC_PAGO,IMP_PAGADO,IMP_ANTICIPO,CUENTA' +
        '_PAGO,FECHA_PAGO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?EMPLEADO,?PERIODO,?CERRADO,' +
        '?EJERCICIO_CIERRE,?ENTRADA,?FECHA_INI_PERIODO,?ESTADO,'#13#10'?FECHA,?' +
        'FECHA_FIN_PERIODO,?FECHA_COBRO,?TDEVENGO,?TDEDUCCION,?PERCIBIR,?' +
        'LISTADO,?PAGADO,?RIC_CIERRE,?EJERCICIO_PAGO,'#13#10'?RIC_PAGO,?IMP_PAG' +
        'ADO,?IMP_ANTICIPO,?CUENTA_PAGO,?FECHA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_NOMINAS_CABECERA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      
        'SELECT N.ID, N.PAGADO, T.NIF AS RUT, T.NOMBRE_R_SOCIAL AS NOMBRE' +
        ', 3 AS MOD_PAGO, B.CUENTA AS CTA_EMPLEADO,'
      
        '       N.CUENTA_PAGO, N.FECHA_PAGO, T.EMAIL AS CORREO, N.PERIODO' +
        ', N.EJERCICIO, N.RIC_PAGO, N.EJERCICIO_PAGO, N.ESTADO,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = N.ID AND'
      '        CODIGO = '#39'H020'#39') AS MONTO'
      'FROM EMP_NOMINAS_CABECERA N'
      
        'JOIN OPE_EMPLEADO E ON N.EMPRESA = E.EMPRESA AND N.EMPLEADO = E.' +
        'EMPLEADO'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_BANCOS B ON T.TERCERO = B.TERCERO AND B.B' +
        'ANCO = 1'
      'WHERE'
      'N.EMPRESA = :EMPRESA AND'
      'N.EJERCICIO = :EJERCICIO AND'
      'N.CANAL = :CANAL AND'
      'N.PERIODO = :PERIODO AND'
      'N.ESTADO = 5')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_NOMINAS_CABECERA'
      'SET'
      '  ID=?ID '
      '  ,CERRADO=?CERRADO '
      '  ,EJERCICIO_CIERRE=?EJERCICIO_CIERRE '
      '  ,ENTRADA=?ENTRADA '
      '  ,FECHA_INI_PERIODO=?FECHA_INI_PERIODO '
      '  ,ESTADO=?ESTADO '
      '  ,FECHA=?FECHA '
      '  ,FECHA_FIN_PERIODO=?FECHA_FIN_PERIODO '
      '  ,FECHA_COBRO=?FECHA_COBRO '
      '  ,TDEVENGO=?TDEVENGO '
      '  ,TDEDUCCION=?TDEDUCCION '
      '  ,PERCIBIR=?PERCIBIR '
      '  ,LISTADO=?LISTADO '
      '  ,PAGADO=?PAGADO '
      '  ,RIC_CIERRE=?RIC_CIERRE '
      '  ,EJERCICIO_PAGO=?EJERCICIO_PAGO '
      '  ,RIC_PAGO=?RIC_PAGO '
      '  ,IMP_PAGADO=?IMP_PAGADO '
      '  ,IMP_ANTICIPO=?IMP_ANTICIPO '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      '  ,FECHA_PAGO=?FECHA_PAGO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO ')
    DataSource = DSPeriodos
    OnCalcFields = QPagosCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'EMPLEADO '
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_NOMINAS_CABECERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 248
    object QPagosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QPagosRUT: TFIBStringField
      FieldName = 'RUT'
    end
    object QPagosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QPagosMOD_PAGO: TIntegerField
      DisplayLabel = 'Modo de Pago'
      FieldName = 'MOD_PAGO'
    end
    object QPagosCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 100
    end
    object QPagosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 40
    end
    object QPagosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QPagosMONTO: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'MONTO'
    end
    object QPagosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QPagosm: TIntegerField
      DisplayLabel = 'Seleccion'
      FieldKind = fkCalculated
      FieldName = 'MARCA'
      Calculated = True
    end
    object QPagosCTA_EMPLEADO: TFIBStringField
      DisplayLabel = 'Cta. Empleado'
      FieldName = 'CTA_EMPLEADO'
    end
    object QPagosCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QPagosFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QPagosRIC_PAGO: TIntegerField
      DisplayLabel = 'Asiento Contable'
      FieldName = 'RIC_PAGO'
    end
    object QPagosEJERCICIO_PAGO: TIntegerField
      FieldName = 'EJERCICIO_PAGO'
    end
    object QPagosESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object QPagosTOTAL_LIQUIDO_BANCO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_LIQUIDO_BANCO'
      Calculated = True
    end
  end
end
