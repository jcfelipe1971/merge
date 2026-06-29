object DMDiarioReparaciones: TDMDiarioReparaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 313
  Width = 511
  object QMCabReparar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT R.SERIE, R.IDCABREPARAR, R.CLIENTE, R.NOMBRE_R_SOCIAL_CLI' +
        'ENTE, R.FECHA, R.ESTADO, R.TITULO_ESTADO, R.SITUACION,'
      
        '       R.TITULO_SITUACION, R.TIPO_ACTUACION, R.TITULO_TIPO_ACTUA' +
        'CION,'
      '       --'
      
        '       R.FECHA_AVISO, R.FECHA_ENTRADA, R.FECHA_PREV_SALIDA, R.FE' +
        'CHA_HORA_CIERRE, R.FECHA_HORA_CIERRE_ITV,'
      '       --'
      
        '       R.ID_S, C.TIPO, C.SERIE SERIE_DOC, C.RIG, C.FORMA_PAGO, C' +
        '.S_BASES, C.S_CUOTA_IVA,'
      '       --'
      '       (SELECT SUM(TOTAL)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      
        '        IDCABREPARAR = R.IDCABREPARAR) MATERIALES, R.TITULO_EMPL' +
        'EADOS_TAREAS'
      'FROM VER_REPAR_CAB_REPARACIONES R'
      'LEFT JOIN GES_CABECERAS_S C ON R.ID_S = C.ID_S'
      'WHERE'
      'R.IDCABREPARAR = :IDCABREPARAR')
    SelectSQL.Strings = (
      
        'SELECT R.SERIE, R.IDCABREPARAR, R.CLIENTE, R.NOMBRE_R_SOCIAL_CLI' +
        'ENTE, R.FECHA, R.ESTADO, R.TITULO_ESTADO, R.SITUACION,'
      
        '       R.TITULO_SITUACION, R.TIPO_ACTUACION, R.TITULO_TIPO_ACTUA' +
        'CION,'
      '       --'
      
        '       R.FECHA_AVISO, R.FECHA_ENTRADA, R.FECHA_PREV_SALIDA, R.FE' +
        'CHA_HORA_CIERRE, R.FECHA_HORA_CIERRE_ITV,'
      '       --'
      
        '       R.ID_S, C.TIPO, C.SERIE SERIE_DOC, C.RIG, C.FORMA_PAGO, C' +
        '.S_BASES, C.S_CUOTA_IVA,'
      '       --'
      '       (SELECT SUM(TOTAL)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      
        '        IDCABREPARAR = R.IDCABREPARAR) MATERIALES, R.TITULO_EMPL' +
        'EADOS_TAREAS'
      'FROM VER_REPAR_CAB_REPARACIONES R'
      'LEFT JOIN GES_CABECERAS_S C ON R.ID_S = C.ID_S'
      'WHERE'
      'R.EMPRESA = :EMPRESA AND'
      'R.CANAL = :CANAL AND'
      '((R.SERIE = :SERIE) OR (CAST(:SERIE AS VARCHAR(10)) = '#39#39')) AND'
      'R.FECHA_ENTRADA BETWEEN :DESDE_FECHA AND :HASTA_FECHA'
      'ORDER BY R.SERIE, R.FECHA_ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_REPAR_CAB_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMCabRepararSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabRepararIDCABREPARAR: TIntegerField
      DisplayLabel = 'Id Reparacion'
      FieldName = 'IDCABREPARAR'
    end
    object QMCabRepararNOMBRE_R_SOCIAL_CLIENTE: TFIBStringField
      DisplayLabel = 'Nombre Cliente'
      FieldName = 'NOMBRE_R_SOCIAL_CLIENTE'
      Size = 60
    end
    object QMCabRepararFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabRepararFECHA_AVISO: TDateTimeField
      DisplayLabel = 'Fec. Aviso'
      FieldName = 'FECHA_AVISO'
    end
    object QMCabRepararFECHA_ENTRADA: TDateTimeField
      DisplayLabel = 'Fec. Entrada'
      FieldName = 'FECHA_ENTRADA'
    end
    object QMCabRepararFECHA_PREV_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. Prev. Salida'
      FieldName = 'FECHA_PREV_SALIDA'
    end
    object QMCabRepararFECHA_HORA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_HORA_CIERRE'
    end
    object QMCabRepararFECHA_HORA_CIERRE_ITV: TDateTimeField
      DisplayLabel = 'Fec. Cierre ITV'
      FieldName = 'FECHA_HORA_CIERRE_ITV'
    end
    object QMCabRepararTIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabRepararSERIE_DOC: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMCabRepararRIG: TIntegerField
      DisplayLabel = 'Dpc. Num.'
      FieldName = 'RIG'
    end
    object QMCabRepararFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabRepararS_BASES: TFloatField
      DisplayLabel = 'Bases'
      FieldName = 'S_BASES'
    end
    object QMCabRepararS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Cuota'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabRepararMATERIALES: TFloatField
      DisplayLabel = 'Materiales'
      FieldName = 'MATERIALES'
    end
    object QMCabRepararTITULO_EMPLEADOS_TAREAS: TFIBStringField
      DisplayLabel = 'Empeado'
      FieldName = 'TITULO_EMPLEADOS_TAREAS'
      Size = 256
    end
    object QMCabRepararCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabRepararID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMCabRepararESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabRepararTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Desc, Estado'
      FieldName = 'TITULO_ESTADO'
      Size = 40
    end
    object QMCabRepararSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMCabRepararTITULO_SITUACION: TFIBStringField
      DisplayLabel = 'Desc. Situacion'
      FieldName = 'TITULO_SITUACION'
      Size = 40
    end
    object QMCabRepararTIPO_ACTUACION: TIntegerField
      DisplayLabel = 'Tipo Actuacion'
      FieldName = 'TIPO_ACTUACION'
    end
    object QMCabRepararTITULO_TIPO_ACTUACION: TFIBStringField
      DisplayLabel = 'Desc. Tipo Actuacion'
      FieldName = 'TITULO_TIPO_ACTUACION'
      Size = 25
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 264
    Top = 24
  end
  object DSCabReparar: TDataSource
    DataSet = QMCabReparar
    Left = 152
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 24
  end
  object xDiarioFac: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT D.TIPO, D.FECHA, D.EJERCICIO, D.SERIE, D.RIG, D.ID_S, R.S' +
        'ERIE, R.REPARACION, R.IDCABREPARAR, F.MATRICULA,'
      
        '       F.MARCA, R.CLIENTE, TER.NOMBRE_R_SOCIAL NOMBRE_CLIENTE, T' +
        'ER.NIF, R.FECHA_ENTRADA, R.FECHA_SALIDA, D.S_BASES BASE,'
      
        '       D.S_CUOTA_IVA, D.LIQUIDO AS TOTAL_FAC, D.FORMA_PAGO, RR.F' +
        'ECHA FECHA_RECEPCION, E.ESTADO ESTADO_REP,'
      
        '       E.TITULO TITULO_ESTADO_REP, S.SITUACION SITUACION_REP, S.' +
        'TITULO TITULO_SITUACION_REP,'
      
        '       S.COLOR COLOR_SITUACION_REP, T.TIPO TIPO_REPARACION, T.TI' +
        'TULO TITULO_TIPO_REPARACION, A.TIPO TIPO_ACTUALCION,'
      '       A.TITULO TITULO_TIPO_ACTUALCION'
      'FROM REPAR_CAB_REPARACIONES R'
      'JOIN SYS_TERCEROS TER ON TER.TERCERO = R.TERCERO'
      
        'LEFT JOIN REP_FICHA_TECNICA F ON R.ID_FICHA_TECNICA = F.ID_FICHA' +
        '_TECNICA'
      
        'LEFT JOIN REP_RECEPCION RR ON R.ID_REP_RECEPCION = RR.ID_REP_REC' +
        'EPCION'
      'LEFT JOIN SYS_GES_ESTADOS_REPARACIONES E ON E.ESTADO = R.ESTADO'
      'LEFT JOIN REPAR_SITUACIONES S ON S.SITUACION = R.SITUACION'
      'LEFT JOIN SYS_TIPO_REPARACION T ON T.TIPO = R.TIPO'
      'LEFT JOIN SYS_TIPO_ACTUACION A ON A.TIPO = R.TIPO_ACTUACION'
      
        'LEFT JOIN SYS_LOCALIDADES L ON L.LOCALIDAD = R.CONTACTO_LOCALIDA' +
        'D'
      'LEFT JOIN GES_CABECERAS_S O ON O.ID_S = R.ID_S_ORIGEN'
      'LEFT JOIN GES_CABECERAS_S D ON D.ID_S = R.ID_S'
      'WHERE'
      'R.IDCABREPARAR = :IDCABREPARAR')
    SelectSQL.Strings = (
      
        'SELECT D.TIPO, D.FECHA, D.EJERCICIO, D.SERIE SERIE_DOC, D.RIG, D' +
        '.ID_S, R.SERIE, R.REPARACION, R.IDCABREPARAR, F.MATRICULA,'
      
        '       F.MARCA, R.CLIENTE, TER.NOMBRE_R_SOCIAL NOMBRE_CLIENTE, T' +
        'ER.NIF, R.FECHA_ENTRADA, R.FECHA_SALIDA, D.S_BASES BASE,'
      
        '       D.S_CUOTA_IVA, D.LIQUIDO AS TOTAL_FAC, D.FORMA_PAGO, RR.F' +
        'ECHA FECHA_RECEPCION, E.ESTADO ESTADO_REP,'
      
        '       E.TITULO TITULO_ESTADO_REP, S.SITUACION SITUACION_REP, S.' +
        'TITULO TITULO_SITUACION_REP,'
      
        '       S.COLOR COLOR_SITUACION_REP, T.TIPO TIPO_REPARACION, T.TI' +
        'TULO TITULO_TIPO_REPARACION, A.TIPO TIPO_ACTUALCION,'
      '       A.TITULO TITULO_TIPO_ACTUALCION'
      'FROM REPAR_CAB_REPARACIONES R'
      'JOIN SYS_TERCEROS TER ON TER.TERCERO = R.TERCERO'
      
        'LEFT JOIN REP_FICHA_TECNICA F ON R.ID_FICHA_TECNICA = F.ID_FICHA' +
        '_TECNICA'
      
        'LEFT JOIN REP_RECEPCION RR ON R.ID_REP_RECEPCION = RR.ID_REP_REC' +
        'EPCION'
      'LEFT JOIN SYS_GES_ESTADOS_REPARACIONES E ON E.ESTADO = R.ESTADO'
      'LEFT JOIN REPAR_SITUACIONES S ON S.SITUACION = R.SITUACION'
      'LEFT JOIN SYS_TIPO_REPARACION T ON T.TIPO = R.TIPO'
      'LEFT JOIN SYS_TIPO_ACTUACION A ON A.TIPO = R.TIPO_ACTUACION'
      
        'LEFT JOIN SYS_LOCALIDADES L ON L.LOCALIDAD = R.CONTACTO_LOCALIDA' +
        'D'
      'LEFT JOIN GES_CABECERAS_S O ON O.ID_S = R.ID_S_ORIGEN'
      'LEFT JOIN GES_CABECERAS_S D ON D.ID_S = R.ID_S'
      'WHERE'
      'R.EMPRESA = :EMPRESA AND'
      'R.CANAL = :CANAL AND'
      '((R.SERIE = :SERIE) OR (CAST(:SERIE AS VARCHAR(10)) = '#39#39')) AND'
      'R.FECHA_ENTRADA BETWEEN :DESDE_FECHA AND :HASTA_FECHA'
      'ORDER BY R.SERIE, D.SERIE, D.EJERCICIO, D.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_REPAR_CAB_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 72
    object xDiarioFacTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDiarioFacFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xDiarioFacEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDiarioFacSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object xDiarioFacRIG: TIntegerField
      DisplayLabel = 'Nro. Doc'
      FieldName = 'RIG'
    end
    object xDiarioFacID_S: TIntegerField
      DisplayLabel = 'ID Doc'
      FieldName = 'ID_S'
    end
    object xDiarioFacSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDiarioFacREPARACION: TIntegerField
      DisplayLabel = 'Reparacion'
      FieldName = 'REPARACION'
    end
    object xDiarioFacIDCABREPARAR: TIntegerField
      DisplayLabel = 'Id Rep.'
      FieldName = 'IDCABREPARAR'
    end
    object xDiarioFacMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object xDiarioFacMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object xDiarioFacCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xDiarioFacNOMBRE_CLIENTE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_CLIENTE'
      Size = 60
    end
    object xDiarioFacNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xDiarioFacFECHA_ENTRADA: TDateTimeField
      DisplayLabel = 'Fec. Entrada'
      FieldName = 'FECHA_ENTRADA'
    end
    object xDiarioFacFECHA_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. Salida'
      FieldName = 'FECHA_SALIDA'
    end
    object xDiarioFacBASE: TFloatField
      DisplayLabel = 'Base Imponible'
      FieldName = 'BASE'
    end
    object xDiarioFacS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Cuota'
      FieldName = 'S_CUOTA_IVA'
    end
    object xDiarioFacTOTAL_FAC: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_FAC'
    end
    object xDiarioFacFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDiarioFacFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fec. Recepcion'
      FieldName = 'FECHA_RECEPCION'
    end
    object xDiarioFacESTADO_REP: TIntegerField
      DisplayLabel = 'Estado Rep.'
      FieldName = 'ESTADO_REP'
    end
    object xDiarioFacTITULO_ESTADO_REP: TFIBStringField
      DisplayLabel = 'Desc. Estado Rep.'
      FieldName = 'TITULO_ESTADO_REP'
      Size = 40
    end
    object xDiarioFacSITUACION_REP: TIntegerField
      DisplayLabel = 'Situacion Rep.'
      FieldName = 'SITUACION_REP'
    end
    object xDiarioFacTITULO_SITUACION_REP: TFIBStringField
      DisplayLabel = 'Desc. Situacion Rep.'
      FieldName = 'TITULO_SITUACION_REP'
      Size = 40
    end
    object xDiarioFacCOLOR_SITUACION_REP: TFloatField
      DisplayLabel = 'Color Situacion Rep.'
      FieldName = 'COLOR_SITUACION_REP'
    end
    object xDiarioFacTIPO_REPARACION: TIntegerField
      DisplayLabel = 'Tipo Rep.'
      FieldName = 'TIPO_REPARACION'
    end
    object xDiarioFacTITULO_TIPO_REPARACION: TFIBStringField
      DisplayLabel = 'Desc. Tipo Rep.'
      FieldName = 'TITULO_TIPO_REPARACION'
      Size = 25
    end
    object xDiarioFacTIPO_ACTUALCION: TIntegerField
      DisplayLabel = 'Tipo Actuacion'
      FieldName = 'TIPO_ACTUALCION'
    end
    object xDiarioFacTITULO_TIPO_ACTUALCION: TFIBStringField
      DisplayLabel = 'Desc. Tipo Act.'
      FieldName = 'TITULO_TIPO_ACTUALCION'
      Size = 25
    end
  end
  object DSxDiarioFac: TDataSource
    DataSet = xDiarioFac
    Left = 152
    Top = 72
  end
  object xTazabilidadCompras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.TIPO || '#39' '#39' || C.EJERCICIO || '#39'-'#39' || C.SERIE || '#39'/'#39' || ' +
        'C.RIG || '#39'.'#39' || D.LINEA ALB_COMPRA,'
      '       --'
      '       C.ID_E, D.ID_DETALLES_E, C.SERIE, C.RIG, D.LINEA,'
      '       --'
      
        '       A.FAMILIA, D.ARTICULO, D.TITULO, D.UNIDADES, CA.NUM_ALBAR' +
        'AN,'
      '       --'
      '       CA.PROVEEDOR, T.NOMBRE_COMERCIAL NOM_PROVEEDOR,'
      '       --'
      
        '       R.D_TIPO || '#39' '#39' || R.D_EJERCICIO || '#39'-'#39' || R.D_SERIE || '#39 +
        '/'#39' || R.D_RIG FAC_COMPRA,'
      '       --'
      '       RR.IDCABREPARAR,'
      '       --'
      
        '       CF.ID_S, CF.TIPO || '#39' '#39' || CF.EJERCICIO || '#39'-'#39' || CF.SERI' +
        'E || '#39'/'#39' || CF.RIG FAC_VENTA'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_ALB CA ON C.ID_E = CA.ID_E'
      
        'JOIN EMP_PROVEEDORES P ON CA.EMPRESA = P.EMPRESA AND CA.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'LEFT JOIN GES_DETALLES_E_RELACIONES R ON D.EMPRESA = R.O_EMPRESA' +
        ' AND D.EJERCICIO = R.O_EJERCICIO AND D.CANAL = R.O_CANAL AND D.S' +
        'ERIE = R.O_SERIE AND D.TIPO = R.O_TIPO AND D.RIG = R.O_RIG AND D' +
        '.LINEA = R.O_LINEA AND R.D_TIPO = '#39'FAP'#39
      
        'LEFT JOIN REPAR_DET_REPARACIONES RR ON D.ID_DETALLES_E = RR.ID_D' +
        'ETALLES_E_ORIGEN'
      
        'LEFT JOIN REPAR_CAB_REPARACIONES RC ON RR.IDCABREPARAR = RC.IDCA' +
        'BREPARAR'
      'LEFT JOIN GES_CABECERAS_S CF ON RC.ID_S = CF.ID_S'
      'WHERE'
      'C.ID_E = :ID_E AND'
      'D.ID_DETALLES_E = :ID_DETALLES_E')
    SelectSQL.Strings = (
      
        'SELECT C.TIPO || '#39' '#39' || C.EJERCICIO || '#39'-'#39' || C.SERIE || '#39'/'#39' || ' +
        'C.RIG || '#39'.'#39' || D.LINEA ALB_COMPRA,'
      '       --'
      '       C.ID_E, D.ID_DETALLES_E, C.SERIE, C.RIG, D.LINEA,'
      '       --'
      
        '       A.FAMILIA, D.ARTICULO, D.TITULO, D.UNIDADES, CA.NUM_ALBAR' +
        'AN,'
      '       --'
      '       CA.PROVEEDOR, T.NOMBRE_COMERCIAL NOM_PROVEEDOR,'
      '       --'
      
        '       R.D_TIPO || '#39' '#39' || R.D_EJERCICIO || '#39'-'#39' || R.D_SERIE || '#39 +
        '/'#39' || R.D_RIG FAC_COMPRA,'
      '       --'
      '       RR.IDCABREPARAR,'
      '       --'
      
        '       CF.ID_S, CF.TIPO || '#39' '#39' || CF.EJERCICIO || '#39'-'#39' || CF.SERI' +
        'E || '#39'/'#39' || CF.RIG FAC_VENTA'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_ALB CA ON C.ID_E = CA.ID_E'
      
        'JOIN EMP_PROVEEDORES P ON CA.EMPRESA = P.EMPRESA AND CA.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'LEFT JOIN GES_DETALLES_E_RELACIONES R ON D.EMPRESA = R.O_EMPRESA' +
        ' AND D.EJERCICIO = R.O_EJERCICIO AND D.CANAL = R.O_CANAL AND D.S' +
        'ERIE = R.O_SERIE AND D.TIPO = R.O_TIPO AND D.RIG = R.O_RIG AND D' +
        '.LINEA = R.O_LINEA AND R.D_TIPO = '#39'FAP'#39
      
        'LEFT JOIN REPAR_DET_REPARACIONES RR ON D.ID_DETALLES_E = RR.ID_D' +
        'ETALLES_E_ORIGEN'
      
        'LEFT JOIN REPAR_CAB_REPARACIONES RC ON RR.IDCABREPARAR = RC.IDCA' +
        'BREPARAR'
      'LEFT JOIN GES_CABECERAS_S CF ON RC.ID_S = CF.ID_S'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      '((C.SERIE = :SERIE) OR (CAST(:SERIE AS VARCHAR(10)) = '#39#39')) AND'
      'C.TIPO = '#39'ALP'#39' AND'
      'C.FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA'
      'ORDER BY C.SERIE, C.RIG, D.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_REPAR_CAB_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 120
    object xTazabilidadComprasALB_COMPRA: TFIBStringField
      DisplayLabel = 'Alb. Compra'
      FieldName = 'ALB_COMPRA'
      Size = 45
    end
    object xTazabilidadComprasID_E: TIntegerField
      DisplayLabel = 'ID Compra'
      FieldName = 'ID_E'
    end
    object xTazabilidadComprasID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Det. Compra'
      FieldName = 'ID_DETALLES_E'
    end
    object xTazabilidadComprasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTazabilidadComprasRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xTazabilidadComprasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xTazabilidadComprasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xTazabilidadComprasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTazabilidadComprasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xTazabilidadComprasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xTazabilidadComprasNUM_ALBARAN: TFIBStringField
      DisplayLabel = 'Nro. Alb.'
      FieldName = 'NUM_ALBARAN'
      Size = 40
    end
    object xTazabilidadComprasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xTazabilidadComprasPROVEEDOR1: TFIBStringField
      DisplayLabel = 'Nom. Prov.'
      FieldName = 'NOM_PROVEEDOR'
      Size = 60
    end
    object xTazabilidadComprasFAC_COMPRA: TFIBStringField
      DisplayLabel = 'Fac. Compra'
      FieldName = 'FAC_COMPRA'
      Size = 33
    end
    object xTazabilidadComprasIDCABREPARAR: TIntegerField
      DisplayLabel = 'Id Reparacion'
      FieldName = 'IDCABREPARAR'
    end
    object xTazabilidadComprasID_S: TIntegerField
      DisplayLabel = 'Id Venta'
      FieldName = 'ID_S'
    end
    object xTazabilidadComprasFAC_VENTA: TFIBStringField
      DisplayLabel = 'Fac. Venta'
      FieldName = 'FAC_VENTA'
      Size = 33
    end
  end
  object DSxTazabilidadCompras: TDataSource
    DataSet = xTazabilidadCompras
    Left = 152
    Top = 120
  end
end
