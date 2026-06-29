object DMDiarioCostes: TDMDiarioCostes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 519
  Top = 224
  Height = 288
  Width = 463
  object QMDiarioCostes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CON_CUENTA_APUNTES_COSTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  RIC=?old_RIC AND '
      '  LINEA=?old_LINEA AND '
      '  SUBLINEA=?old_SUBLINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CON_CUENTA_APUNTES_COSTES'
      
        '  (EMPRESA,EJERCICIO,CANAL,RIC,LINEA,DIGITO_1,DIGITO_2,DIGITO_3,' +
        'DIGITO_4,DIGITO_5,SUBLINEA,IMPORTE,PCOSTE,CUENTA,TITULO_CUENTA,P' +
        'GC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?RIC,?LINEA,?DIGITO_1,?DIGITO_2,?D' +
        'IGITO_3,?DIGITO_4,?DIGITO_5,?SUBLINEA,?IMPORTE,?PCOSTE,?CUENTA,?' +
        'TITULO_CUENTA,?PGC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTA_APUNTES_COSTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA AND '
      '  SUBLINEA=?SUBLINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CON_CUENTA_APUNTES_COSTES'
      'where'
      '(empresa=?empresa and ejercicio=?ejercicio and canal=?canal) and'
      '((cuenta=?cuenta) or (?cuenta=cast('#39#39' as varchar(15)) )) and'
      '((digito_1=?digito_1) or (?digito_1=cast('#39#39' as varchar(3)))) and'
      '((digito_2=?digito_2) or (?digito_2=cast('#39#39' as varchar(3)))) and'
      '((digito_3=?digito_3) or (?digito_3=cast('#39#39' as varchar(3)))) and'
      '((digito_4=?digito_4) or (?digito_4=cast('#39#39' as varchar(3)))) and'
      '((digito_5=?digito_5) or (?digito_5=cast('#39#39' as varchar(3)))) and'
      '(fecha between ?desde and ?hasta) and'
      '(restriccion<=?restriccion)'
      'order by ric,linea,sublinea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CON_CUENTA_APUNTES_COSTES'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      '  ,IMPORTE=?IMPORTE '
      '  ,PCOSTE=?PCOSTE '
      '  ,CUENTA=?CUENTA '
      '  ,TITULO_CUENTA=?TITULO_CUENTA '
      '  ,PGC=?PGC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA AND '
      '  SUBLINEA=?SUBLINEA ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'RIC '
      'LINEA '
      'SUBLINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CON_CUENTA_APUNTES_COSTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 24
    object QMDiarioCostesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDiarioCostesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDiarioCostesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDiarioCostesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDiarioCostesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDiarioCostesDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMDiarioCostesDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMDiarioCostesDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMDiarioCostesDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMDiarioCostesDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
    object QMDiarioCostesSUBLINEA: TIntegerField
      DisplayLabel = 'SubL'#237'nea'
      FieldName = 'SUBLINEA'
    end
    object QMDiarioCostesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMDiarioCostesPCOSTE: TFloatField
      DisplayLabel = 'P.Coste'
      FieldName = 'PCOSTE'
    end
    object QMDiarioCostesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMDiarioCostesTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
    object QMDiarioCostesSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMDiarioCostesTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMDiarioCostesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDiarioCostesPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object QMDiarioCostesRESTRICCION: TIntegerField
      DisplayLabel = 'Cta. Restringida'
      FieldName = 'RESTRICCION'
    end
    object QMDiarioCostesASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
  end
  object DSQMDiarioCostes: TDataSource
    DataSet = QMDiarioCostes
    Left = 168
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 24
  end
  object DSQMDiarioCostesT: TDataSource
    DataSet = QMDiarioCostesT
    Left = 168
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 288
    Top = 72
  end
  object QMDiarioCostesT: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT sum(pcoste)  as TImporte FROM VER_CON_CUENTA_APUNTES_COST' +
        'ES'
      'where'
      '(empresa=?empresa and ejercicio=?ejercicio and canal=?canal) and'
      '((cuenta=?cuenta) or (?cuenta=cast('#39#39' as varchar(15)) )) and'
      '((digito_1=?digito_1) or (?digito_1=cast('#39#39' as varchar(3)))) and'
      '((digito_2=?digito_2) or (?digito_2=cast('#39#39' as varchar(3)))) and'
      '((digito_3=?digito_3) or (?digito_3=cast('#39#39' as varchar(3)))) and'
      '((digito_4=?digito_4) or (?digito_4=cast('#39#39' as varchar(3)))) and'
      '((digito_5=?digito_5) or (?digito_5=cast('#39#39' as varchar(3)))) and'
      '(fecha between ?desde and ?hasta) and'
      '(restriccion<=?restriccion)')
    UniDirectional = False
    Left = 48
    Top = 72
    object QMDiarioCostesTTIMPORTE: TFloatField
      DisplayLabel = 'T. Importe'
      FieldName = 'TIMPORTE'
    end
  end
  object DSQMAsientosSinCCoste: TDataSource
    DataSet = QMAsientosSinCCoste
    Left = 168
    Top = 120
  end
  object QMAsientosSinCCoste: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '   SELECT'
      
        '   APU.EMPRESA, APU.EJERCICIO, APU.CANAL, APU.RIC, ASI.ASIENTO, ' +
        'APU.LINEA,'
      '   APU.CUENTA, APU.SIGNO, APU.TEXTO, ASI.FECHA,'
      
        '   CAST('#39#39' AS VARCHAR(3)) DIGITO_1, CAST('#39#39' AS VARCHAR(3)) DIGIT' +
        'O_2,'
      
        '   CAST('#39#39' AS VARCHAR(3)) DIGITO_3, CAST('#39#39' AS VARCHAR(3)) DIGIT' +
        'O_4,'
      '   CAST('#39#39' AS VARCHAR(3)) DIGITO_5, CAST(0 AS INTEGER) SUBLINEA,'
      
        '   CAST(0 AS DOUBLE PRECISION) IMPORTE, CAST(0 AS DOUBLE PRECISI' +
        'ON) PCOSTE,'
      '   C.TITULO TITULO_CUENTA, C.PGC, C.RESTRICCION'
      '   FROM CON_CUENTAS_APUNTES APU'
      '   JOIN CON_CUENTAS_ASIENTOS ASI'
      '   ON'
      '   APU.EMPRESA = ASI.EMPRESA AND'
      '   APU.EJERCICIO = ASI.EJERCICIO AND'
      '   APU.CANAL = ASI.CANAL AND'
      '   APU.RIC = ASI.RIC'
      '   JOIN CON_CUENTAS C'
      '   ON'
      '   APU.EMPRESA = C.EMPRESA AND'
      '   APU.EJERCICIO = C.EJERCICIO AND'
      '   APU.CANAL = C.CANAL AND'
      '   APU.CUENTA = C.CUENTA AND'
      '   APU.CUENTA_PGC = C.PGC'
      '   LEFT JOIN CON_CUENTAS_APUNTES_COSTES CC'
      '   ON'
      '   APU.EMPRESA = CC.EMPRESA AND'
      '   APU.EJERCICIO = CC.EJERCICIO AND'
      '   APU.CANAL = CC.CANAL AND'
      '   APU.RIC = CC.RIC AND'
      '   APU.LINEA = CC.LINEA'
      '   WHERE'
      '   APU.EMPRESA = ?EMPRESA AND'
      '   APU.EJERCICIO = ?EJERCICIO AND'
      '   APU.CANAL = ?CANAL AND '
      '   C.RESTRICCION <= ?RESTRICCION AND '
      '   C.CENTRO_COSTE = 1 AND'
      '   CC.EMPRESA IS NULL')
    UniDirectional = False
    Left = 48
    Top = 120
    object QMAsientosSinCCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAsientosSinCCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAsientosSinCCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAsientosSinCCosteRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMAsientosSinCCosteASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMAsientosSinCCosteLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMAsientosSinCCosteCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMAsientosSinCCosteSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMAsientosSinCCosteTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMAsientosSinCCosteFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAsientosSinCCosteDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMAsientosSinCCosteDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMAsientosSinCCosteDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMAsientosSinCCosteDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMAsientosSinCCosteDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
    object QMAsientosSinCCosteSUBLINEA: TIntegerField
      DisplayLabel = 'SubL'#237'nea'
      FieldName = 'SUBLINEA'
    end
    object QMAsientosSinCCosteIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMAsientosSinCCostePCOSTE: TFloatField
      DisplayLabel = 'P.Coste'
      FieldName = 'PCOSTE'
    end
    object QMAsientosSinCCostePGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object QMAsientosSinCCosteRESTRICCION: TIntegerField
      DisplayLabel = 'Cta. Restringida'
      FieldName = 'RESTRICCION'
    end
    object QMAsientosSinCCosteTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
  end
  object DSQMResumen: TDataSource
    DataSet = QMResumen
    Left = 168
    Top = 168
  end
  object QMResumen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT T.*, C.TITULO FROM TMP_CENTROS_COSTE_2 T'
      'JOIN CON_CUENTAS C'
      'ON'
      'T.EMPRESA=C.EMPRESA AND'
      'T.EJERCICIO=C.EJERCICIO AND'
      'T.CANAL=C.CANAL AND'
      'T.CUENTA=C.CUENTA'
      'WHERE'
      'T.ENTRADA = ?ENTRADA AND'
      'C.PGC = ?PGC'
      'ORDER BY CUENTA, NIVEL')
    UniDirectional = False
    Left = 48
    Top = 168
    object QMResumenENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMResumenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMResumenEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMResumenCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMResumenCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMResumenNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMResumenNUM_DIGITO: TIntegerField
      DisplayLabel = 'Nro. Digito'
      FieldName = 'NUM_DIGITO'
    end
    object QMResumenD1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'D1'
      Size = 3
    end
    object QMResumenI1: TFloatField
      DisplayLabel = 'Imp. 1'
      FieldName = 'I1'
    end
    object QMResumenD2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'D2'
      Size = 3
    end
    object QMResumenI2: TFloatField
      DisplayLabel = 'Imp. 2'
      FieldName = 'I2'
    end
    object QMResumenD3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'D3'
      Size = 3
    end
    object QMResumenI3: TFloatField
      DisplayLabel = 'Imp. 3'
      FieldName = 'I3'
    end
    object QMResumenD4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'D4'
      Size = 3
    end
    object QMResumenI4: TFloatField
      DisplayLabel = 'Imp. 4'
      FieldName = 'I4'
    end
    object QMResumenD5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'D5'
      Size = 3
    end
    object QMResumenI5: TFloatField
      DisplayLabel = 'Imp. 5'
      FieldName = 'I5'
    end
    object QMResumenD6: TFIBStringField
      DisplayLabel = 'Dig. 6'
      FieldName = 'D6'
      Size = 3
    end
    object QMResumenI6: TFloatField
      DisplayLabel = 'Imp. 6'
      FieldName = 'I6'
    end
    object QMResumenD7: TFIBStringField
      DisplayLabel = 'Dig. 7'
      FieldName = 'D7'
      Size = 3
    end
    object QMResumenI7: TFloatField
      DisplayLabel = 'Imp. 7'
      FieldName = 'I7'
    end
    object QMResumenD8: TFIBStringField
      DisplayLabel = 'Dig. 8'
      FieldName = 'D8'
      Size = 3
    end
    object QMResumenI8: TFloatField
      DisplayLabel = 'Imp. 8'
      FieldName = 'I8'
    end
    object QMResumenD9: TFIBStringField
      DisplayLabel = 'Dig. 9'
      FieldName = 'D9'
      Size = 3
    end
    object QMResumenI9: TFloatField
      DisplayLabel = 'Imp. 9'
      FieldName = 'I9'
    end
    object QMResumenD10: TFIBStringField
      DisplayLabel = 'Dig. 10'
      FieldName = 'D10'
      Size = 3
    end
    object QMResumenI10: TFloatField
      DisplayLabel = 'Imp. 10'
      FieldName = 'I10'
    end
    object QMResumenD11: TFIBStringField
      DisplayLabel = 'Dig. 11'
      FieldName = 'D11'
      Size = 3
    end
    object QMResumenI11: TFloatField
      DisplayLabel = 'Imp. 11'
      FieldName = 'I11'
    end
    object QMResumenD12: TFIBStringField
      DisplayLabel = 'Dig. 12'
      FieldName = 'D12'
      Size = 3
    end
    object QMResumenI12: TFloatField
      DisplayLabel = 'Imp. 12'
      FieldName = 'I12'
    end
    object QMResumenD13: TFIBStringField
      DisplayLabel = 'Dig. 13'
      FieldName = 'D13'
      Size = 3
    end
    object QMResumenI13: TFloatField
      DisplayLabel = 'Imp. 13'
      FieldName = 'I13'
    end
    object QMResumenD14: TFIBStringField
      DisplayLabel = 'Dig. 14'
      FieldName = 'D14'
      Size = 3
    end
    object QMResumenI14: TFloatField
      DisplayLabel = 'Imp. 14'
      FieldName = 'I14'
    end
    object QMResumenD15: TFIBStringField
      DisplayLabel = 'Dig. 15'
      FieldName = 'D15'
      Size = 3
    end
    object QMResumenI15: TFloatField
      DisplayLabel = 'Imp. 15'
      FieldName = 'I15'
    end
    object QMResumenD16: TFIBStringField
      DisplayLabel = 'Dig. 16'
      FieldName = 'D16'
      Size = 3
    end
    object QMResumenI16: TFloatField
      DisplayLabel = 'Imp. 16'
      FieldName = 'I16'
    end
    object QMResumenD17: TFIBStringField
      DisplayLabel = 'Dig. 17'
      FieldName = 'D17'
      Size = 3
    end
    object QMResumenI17: TFloatField
      DisplayLabel = 'Imp. 17'
      FieldName = 'I17'
    end
    object QMResumenD18: TFIBStringField
      DisplayLabel = 'Dig. 18'
      FieldName = 'D18'
      Size = 3
    end
    object QMResumenI18: TFloatField
      DisplayLabel = 'Imp. 18'
      FieldName = 'I18'
    end
    object QMResumenD19: TFIBStringField
      DisplayLabel = 'Dig. 19'
      FieldName = 'D19'
      Size = 3
    end
    object QMResumenI19: TFloatField
      DisplayLabel = 'Imp. 19'
      FieldName = 'I19'
    end
    object QMResumenD20: TFIBStringField
      DisplayLabel = 'Dig. 20'
      FieldName = 'D20'
      Size = 3
    end
    object QMResumenI20: TFloatField
      DisplayLabel = 'Imp. 20'
      FieldName = 'I20'
    end
    object QMResumenD21: TFIBStringField
      DisplayLabel = 'Dig. 21'
      FieldName = 'D21'
      Size = 3
    end
    object QMResumenI21: TFloatField
      DisplayLabel = 'Imp. 21'
      FieldName = 'I21'
    end
    object QMResumenD22: TFIBStringField
      DisplayLabel = 'Dig. 22'
      FieldName = 'D22'
      Size = 3
    end
    object QMResumenI22: TFloatField
      DisplayLabel = 'Imp. 22'
      FieldName = 'I22'
    end
    object QMResumenD23: TFIBStringField
      DisplayLabel = 'Dig. 23'
      FieldName = 'D23'
      Size = 3
    end
    object QMResumenI23: TFloatField
      DisplayLabel = 'Imp. 23'
      FieldName = 'I23'
    end
    object QMResumenD24: TFIBStringField
      DisplayLabel = 'Dig. 24'
      FieldName = 'D24'
      Size = 3
    end
    object QMResumenI24: TFloatField
      DisplayLabel = 'Imp. 24'
      FieldName = 'I24'
    end
    object QMResumenD25: TFIBStringField
      DisplayLabel = 'Dig. 25'
      FieldName = 'D25'
      Size = 3
    end
    object QMResumenI25: TFloatField
      DisplayLabel = 'Imp. 25'
      FieldName = 'I25'
    end
    object QMResumenD26: TFIBStringField
      DisplayLabel = 'Dig. 26'
      FieldName = 'D26'
      Size = 3
    end
    object QMResumenI26: TFloatField
      DisplayLabel = 'Imp. 26'
      FieldName = 'I26'
    end
    object QMResumenD27: TFIBStringField
      DisplayLabel = 'Dig. 27'
      FieldName = 'D27'
      Size = 3
    end
    object QMResumenI27: TFloatField
      DisplayLabel = 'Imp. 27'
      FieldName = 'I27'
    end
    object QMResumenD28: TFIBStringField
      DisplayLabel = 'Dig. 28'
      FieldName = 'D28'
      Size = 3
    end
    object QMResumenI28: TFloatField
      DisplayLabel = 'Imp. 28'
      FieldName = 'I28'
    end
    object QMResumenD29: TFIBStringField
      DisplayLabel = 'Dig. 29'
      FieldName = 'D29'
      Size = 3
    end
    object QMResumenI29: TFloatField
      DisplayLabel = 'Imp. 29'
      FieldName = 'I29'
    end
    object QMResumenD30: TFIBStringField
      DisplayLabel = 'Dig. 30'
      FieldName = 'D30'
      Size = 3
    end
    object QMResumenI30: TFloatField
      DisplayLabel = 'Imp. 30'
      FieldName = 'I30'
    end
    object QMResumenTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
  end
end
