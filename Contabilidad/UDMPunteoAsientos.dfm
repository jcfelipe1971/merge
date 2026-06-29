object DMPunteoAsientos: TDMPunteoAsientos
  OldCreateOrder = False
  OnCreate = DMPunteoAsientosCreate
  OnDestroy = DMPunteoAsientosDestroy
  Left = 631
  Top = 115
  Height = 369
  Width = 343
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 24
  end
  object QMPunteos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CUENTAS_PUNTEOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  RIC=?old_RIC AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CUENTAS_PUNTEOS'
      
        '  (IMPORTE,DOC_SERIE,DOC_FECHA,FECHA,FECHA_PUNTEO,RIC,LINEA,DOC_' +
        'NUMERO,ASIENTO,EMPRESA,EJERCICIO,CANAL,TEXTO,PUNTEO,CUENTA,SIGNO' +
        ')'
      'VALUES'
      
        '  (?IMPORTE,?DOC_SERIE,?DOC_FECHA,?FECHA,?FECHA_PUNTEO,?RIC,?LIN' +
        'EA,?DOC_NUMERO,?ASIENTO,?EMPRESA,?EJERCICIO,?CANAL,?TEXTO,?PUNTE' +
        'O,?CUENTA,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CUENTAS_PUNTEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_PUNTEOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      '/*EJERCICIO = _EJERCICIO AND*/'
      'CANAL = :CANAL AND'
      'CUENTA = :CUENTA AND'
      
        'CAST(EXTRACT(DAY FROM FECHA)||'#39'.'#39'|| EXTRACT(MONTH FROM FECHA)||'#39 +
        '.'#39'|| EXTRACT(YEAR FROM FECHA) AS DATE) BETWEEN :DFECHA AND :HFEC' +
        'HA'
      'ORDER BY FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CUENTAS_PUNTEOS'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,FECHA=?FECHA '
      '  ,FECHA_PUNTEO=?FECHA_PUNTEO '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,ASIENTO=?ASIENTO '
      '  ,TEXTO=?TEXTO '
      '  ,PUNTEO=?PUNTEO '
      '  ,CUENTA=?CUENTA '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA ')
    AfterPost = QMPunteosAfterPost
    AfterScroll = QMPunteosAfterScroll
    BeforePost = QMPunteosBeforePost
    OnNewRecord = QMPunteosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'RIC '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CUENTAS_PUNTEOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMPunteosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPunteosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPunteosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPunteosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMPunteosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPunteosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMPunteosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMPunteosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMPunteosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMPunteosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMPunteosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMPunteosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMPunteosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPunteosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMPunteosPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
      OnChange = QMPunteosPUNTEOChange
    end
    object QMPunteosFECHA_PUNTEO: TDateTimeField
      DisplayLabel = 'Fec. Punteo'
      FieldName = 'FECHA_PUNTEO'
      OnGetText = QMPunteosFECHA_PUNTEOGetText
    end
    object QMPunteosCANT_RELACIONES: TIntegerField
      DisplayLabel = 'Cant. Relaciones'
      FieldName = 'CANT_RELACIONES'
    end
    object QMPunteosRELACION: TFIBStringField
      DisplayLabel = 'Relacion'
      FieldName = 'RELACION'
      Size = 256
    end
    object QMPunteosIMPORTE_DEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'IMPORTE_DEBE'
    end
    object QMPunteosIMPORTE_HABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'IMPORTE_HABER'
    end
  end
  object DSQMPunteos: TDataSource
    DataSet = QMPunteos
    Left = 112
    Top = 24
  end
  object QMNorma43: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_NORMA_43_CAB_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CON_NORMA_43_CAB_KRI'
      
        '  (ID,OFICINA,FECHA_OPERACION,FECHA_VALOR,SIGNO,IMPORTE,DOC_NUME' +
        'RO,REFERENCIA1,REFERENCIA2,LINEA_IMPORTADA,EMPRESA,CONCEPTO_COMU' +
        'N,CONCEPTO_PROPIO)'
      'VALUES'
      
        '  (?ID,?OFICINA,?FECHA_OPERACION,?FECHA_VALOR,?SIGNO,?IMPORTE,?D' +
        'OC_NUMERO,?REFERENCIA1,?REFERENCIA2,?LINEA_IMPORTADA,?EMPRESA,?C' +
        'ONCEPTO_COMUN,?CONCEPTO_PROPIO)')
    RefreshSQL.Strings = (
      'SELECT C.*,'
      
        '       (CAST(SUBSTRING((SELECT LIST(EJERCICIO || '#39'-'#39' || CANAL ||' +
        ' '#39'-'#39' || RIC || '#39'-'#39' || LINEA)'
      '                        FROM CON_NORMA_43_REL_KRI'
      '                        WHERE'
      
        '                        ID = C.ID) FROM 1 FOR 256) AS VARCHAR(26' +
        '5))) AS RELACION,'
      '       (SELECT TITULO'
      '        FROM SYS_TIPO_NORMA43'
      '        WHERE'
      '        ENTIDAD = '#39'0000'#39' AND'
      '        CONCEPTO_COMUN = C.CONCEPTO_COMUN AND'
      
        '        CONCEPTO_PROPIO = -1) TIT_CONC_COMUN, COALESCE((SELECT T' +
        'ITULO'
      
        '                                                        FROM SYS' +
        '_TIPO_NORMA43'
      '                                                        WHERE'
      
        '                                                        ENTIDAD ' +
        '= B.ENTIDAD AND'
      
        '                                                        CONCEPTO' +
        '_COMUN = C.CONCEPTO_COMUN AND'
      
        '                                                        CONCEPTO' +
        '_PROPIO = C.CONCEPTO_PROPIO),'
      '       (SELECT FIRST 1 TITULO'
      '        FROM SYS_TIPO_NORMA43'
      '        WHERE'
      '        ENTIDAD = B.ENTIDAD AND'
      
        '        CONCEPTO_PROPIO = C.CONCEPTO_PROPIO), '#39#39') TIT_CONC_PROPI' +
        'O, --'
      
        '       CAST((SELECT SUBSTRING(LIST(CONCEPTO, ASCII_CHAR(13) || A' +
        'SCII_CHAR(10)) FROM 1 FOR 256)'
      
        '             FROM (SELECT COD_DATO || '#39': '#39' || CONCEPTO1 || '#39' '#39' |' +
        '| CONCEPTO2 AS CONCEPTO'
      '                   FROM CON_NORMA_43_DET_KRI'
      '                   WHERE'
      '                   ID_CAB = C.ID'
      '                   ORDER BY COD_DATO)) AS VARCHAR(256)) CONCEPTO'
      'FROM CON_NORMA_43_CAB_KRI C'
      'JOIN EMP_BANCOS B ON C.EMPRESA = B.EMPRESA AND C.BANCO = B.BANCO'
      'WHERE'
      'C.ID = :ID')
    SelectSQL.Strings = (
      'SELECT C.*,'
      
        '       (CAST(SUBSTRING((SELECT LIST(EJERCICIO || '#39'-'#39' || CANAL ||' +
        ' '#39'-'#39' || RIC || '#39'-'#39' || LINEA)'
      '                        FROM CON_NORMA_43_REL_KRI'
      '                        WHERE'
      
        '                        ID = C.ID) FROM 1 FOR 256) AS VARCHAR(26' +
        '5))) AS RELACION,'
      '       (SELECT TITULO'
      '        FROM SYS_TIPO_NORMA43'
      '        WHERE'
      '        ENTIDAD = '#39'0000'#39' AND'
      '        CONCEPTO_COMUN = C.CONCEPTO_COMUN AND'
      
        '        CONCEPTO_PROPIO = -1) TIT_CONC_COMUN, COALESCE((SELECT T' +
        'ITULO'
      
        '                                                        FROM SYS' +
        '_TIPO_NORMA43'
      '                                                        WHERE'
      
        '                                                        ENTIDAD ' +
        '= B.ENTIDAD AND'
      
        '                                                        CONCEPTO' +
        '_COMUN = C.CONCEPTO_COMUN AND'
      
        '                                                        CONCEPTO' +
        '_PROPIO = C.CONCEPTO_PROPIO),'
      '       (SELECT FIRST 1 TITULO'
      '        FROM SYS_TIPO_NORMA43'
      '        WHERE'
      '        ENTIDAD = B.ENTIDAD AND'
      
        '        CONCEPTO_PROPIO = C.CONCEPTO_PROPIO), '#39#39') TIT_CONC_PROPI' +
        'O, --'
      
        '       CAST((SELECT SUBSTRING(LIST(CONCEPTO, ASCII_CHAR(13) || A' +
        'SCII_CHAR(10)) FROM 1 FOR 256)'
      
        '             FROM (SELECT COD_DATO || '#39': '#39' || CONCEPTO1 || '#39' '#39' |' +
        '| CONCEPTO2 AS CONCEPTO'
      '                   FROM CON_NORMA_43_DET_KRI'
      '                   WHERE'
      '                   ID_CAB = C.ID'
      '                   ORDER BY COD_DATO)) AS VARCHAR(256)) CONCEPTO'
      'FROM CON_NORMA_43_CAB_KRI C'
      'JOIN EMP_BANCOS B ON C.EMPRESA = B.EMPRESA AND C.BANCO = B.BANCO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.BANCO = :BANCO AND'
      
        'CAST(EXTRACT(DAY FROM C.FECHA_OPERACION) || '#39'.'#39' || EXTRACT(MONTH' +
        ' FROM C.FECHA_OPERACION) || '#39'.'#39' || EXTRACT(YEAR FROM C.FECHA_OPE' +
        'RACION) AS DATE) BETWEEN :DFECHA AND :HFECHA'
      'ORDER BY C.IMPORTE, C.FECHA_OPERACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_NORMA_43_CAB_KRI'
      'SET'
      '  OFICINA=?OFICINA '
      '  ,FECHA_OPERACION=?FECHA_OPERACION '
      '  ,FECHA_VALOR=?FECHA_VALOR '
      '  ,SIGNO=?SIGNO '
      '  ,IMPORTE=?IMPORTE '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,REFERENCIA1=?REFERENCIA1 '
      '  ,REFERENCIA2=?REFERENCIA2 '
      '  ,LINEA_IMPORTADA=?LINEA_IMPORTADA '
      '  ,EMPRESA=?EMPRESA '
      '  ,CONCEPTO_COMUN=?CONCEPTO_COMUN '
      '  ,CONCEPTO_PROPIO=?CONCEPTO_PROPIO '
      '  ,PUNTEO=?PUNTEO'
      'WHERE'
      '  ID=?ID ')
    OnNewRecord = QMPunteosNewRecord
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_NORMA_43_CAB_KRI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMNorma43ID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNorma43EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNorma43OFICINA: TFIBStringField
      DisplayLabel = 'Oficina'
      FieldName = 'OFICINA'
      Size = 4
    end
    object QMNorma43FECHA_OPERACION: TDateTimeField
      DisplayLabel = 'Fec. Oper.'
      FieldName = 'FECHA_OPERACION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMNorma43FECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMNorma43CONCEPTO_COMUN: TIntegerField
      DisplayLabel = 'Conc. Com.'
      FieldName = 'CONCEPTO_COMUN'
    end
    object QMNorma43CONCEPTO_PROPIO: TIntegerField
      DisplayLabel = 'Conc. Prop.'
      FieldName = 'CONCEPTO_PROPIO'
    end
    object QMNorma43SIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMNorma43IMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      DisplayFormat = ',0.00'
    end
    object QMNorma43DOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMNorma43REFERENCIA1: TFIBStringField
      DisplayLabel = 'Ref. 1'
      DisplayWidth = 256
      FieldName = 'REFERENCIA1'
    end
    object QMNorma43REFERENCIA2: TFIBStringField
      DisplayLabel = 'Ref. 2'
      DisplayWidth = 256
      FieldName = 'REFERENCIA2'
    end
    object QMNorma43LINEA_IMPORTADA: TFIBStringField
      DisplayLabel = 'Linea Importada'
      DisplayWidth = 256
      FieldName = 'LINEA_IMPORTADA'
      Size = 100
    end
    object QMNorma43TIT_CONC_COMUN: TStringField
      DisplayLabel = 'Conc. Comun'
      DisplayWidth = 200
      FieldName = 'TIT_CONC_COMUN'
      Size = 200
    end
    object QMNorma43TIT_CONC_PROPIO: TStringField
      DisplayLabel = 'Titulo Conc. Propio'
      FieldName = 'TIT_CONC_PROPIO'
      Size = 200
    end
    object QMNorma43PUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
      OnChange = QMNorma43PUNTEOChange
    end
    object QMNorma43BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMNorma43RELACION: TFIBStringField
      DisplayLabel = 'Relacion'
      FieldName = 'RELACION'
      Size = 265
    end
    object QMNorma43CONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Size = 256
    end
  end
  object DSQMNorma43: TDataSource
    DataSet = QMNorma43
    Left = 112
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 24
  end
  object xSaldoPunteado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT COALESCE((SELECT SUM(IMPORTE)'
      '        FROM CON_CUENTAS_APUNTES'
      '        WHERE'
      '        EMPRESA = :EMPRESA AND'
      '        EJERCICIO = :EJERCICIO AND'
      '        CANAL = :CANAL AND'
      '        CUENTA = :CUENTA AND'
      '        PUNTEO = 1 AND'
      '        SIGNO = '#39'D'#39'), 0)'
      '       -'
      '       COALESCE((SELECT SUM(IMPORTE)'
      '        FROM CON_CUENTAS_APUNTES'
      '        WHERE'
      '        EMPRESA = :EMPRESA AND'
      '        EJERCICIO = :EJERCICIO AND'
      '        CANAL = :CANAL AND'
      '        CUENTA = :CUENTA AND'
      '        PUNTEO = 1 AND'
      '        SIGNO = '#39'H'#39'), 0) AS SALDO'
      'FROM RDB$DATABASE')
    SelectSQL.Strings = (
      'SELECT COALESCE((SELECT SUM(IMPORTE)'
      '        FROM CON_CUENTAS_APUNTES'
      '        WHERE'
      '        EMPRESA = :EMPRESA AND'
      '        EJERCICIO = :EJERCICIO AND'
      '        CANAL = :CANAL AND'
      '        CUENTA = :CUENTA AND'
      '        PUNTEO = 1 AND'
      '        SIGNO = '#39'D'#39'), 0)'
      '       -'
      '       COALESCE((SELECT SUM(IMPORTE)'
      '        FROM CON_CUENTAS_APUNTES'
      '        WHERE'
      '        EMPRESA = :EMPRESA AND'
      '        EJERCICIO = :EJERCICIO AND'
      '        CANAL = :CANAL AND'
      '        CUENTA = :CUENTA AND'
      '        PUNTEO = 1 AND'
      '        SIGNO = '#39'H'#39'), 0) AS SALDO'
      'FROM RDB$DATABASE')
    UniDirectional = False
    Left = 32
    Top = 120
    object xSaldoPunteadoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxSaldoPunteado: TDataSource
    DataSet = xSaldoPunteado
    Left = 112
    Top = 120
  end
  object xSaldoN43: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT COALESCE((SELECT SUM(C.IMPORTE)'
      '        FROM CON_NORMA_43_CAB_KRI C'
      '        WHERE'
      '        C.EMPRESA = :EMPRESA AND'
      '        C.BANCO = :BANCO AND'
      '        C.PUNTEO = 1 AND'
      '        C.SIGNO = '#39'D'#39' AND'
      '        EXISTS(SELECT R.ID'
      '               FROM CON_NORMA_43_REL_KRI R'
      '               WHERE'
      '               C.ID = R.ID AND'
      '               EJERCICIO = :EJERCICIO)), 0)'
      '       -'
      '       COALESCE((SELECT SUM(C.IMPORTE)'
      '        FROM CON_NORMA_43_CAB_KRI C'
      '        WHERE'
      '        C.EMPRESA = :EMPRESA AND'
      '        C.BANCO = :BANCO AND'
      '        C.PUNTEO = 1 AND'
      '        C.SIGNO = '#39'H'#39' AND'
      '        EXISTS(SELECT R.ID'
      '               FROM CON_NORMA_43_REL_KRI R'
      '               WHERE'
      '               C.ID = R.ID AND'
      '               EJERCICIO = :EJERCICIO)), 0) AS SALDO'
      'FROM RDB$DATABASE')
    SelectSQL.Strings = (
      'SELECT COALESCE((SELECT SUM(C.IMPORTE)'
      '        FROM CON_NORMA_43_CAB_KRI C'
      '        WHERE'
      '        C.EMPRESA = :EMPRESA AND'
      '        C.BANCO = :BANCO AND'
      '        C.PUNTEO = 1 AND'
      '        C.SIGNO = '#39'D'#39' AND'
      '        EXISTS(SELECT R.ID'
      '               FROM CON_NORMA_43_REL_KRI R'
      '               WHERE'
      '               C.ID = R.ID AND'
      '               EJERCICIO = :EJERCICIO)), 0)'
      '       -'
      '       COALESCE((SELECT SUM(C.IMPORTE)'
      '        FROM CON_NORMA_43_CAB_KRI C'
      '        WHERE'
      '        C.EMPRESA = :EMPRESA AND'
      '        C.BANCO = :BANCO AND'
      '        C.PUNTEO = 1 AND'
      '        C.SIGNO = '#39'H'#39' AND'
      '        EXISTS(SELECT R.ID'
      '               FROM CON_NORMA_43_REL_KRI R'
      '               WHERE'
      '               C.ID = R.ID AND'
      '               EJERCICIO = :EJERCICIO)), 0) AS SALDO'
      'FROM RDB$DATABASE')
    UniDirectional = False
    Left = 32
    Top = 168
    object xSaldoN43SALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxSaldoN43: TDataSource
    DataSet = xSaldoN43
    Left = 112
    Top = 168
  end
end
