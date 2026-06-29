object DMEmpBancos: TDMEmpBancos
  OldCreateOrder = False
  OnCreate = DMEmp_BancosCreate
  OnDestroy = DataModuleDestroy
  Left = 390
  Top = 218
  Height = 225
  Width = 520
  object QMEmp_Bancos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_BANCOS_CUENTAS'
      'WHERE '
      '    EMPRESA=?old_EMPRESA AND'
      '    EJERCICIO=?old_EJERCICIO AND'
      '    CANAL=?old_CANAL AND'
      '    BANCO=?old_BANCO')
    InsertSQL.Strings = (
      'INSERT INTO VER_BANCOS_CUENTAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,BANCO,TITULO,TERCERO,ENTIDAD,SUCURSAL' +
        ',CONTROL,CUENTA_CORRIENTE,RIESGO_CON,RIESGO_UTI,RIESGO_DES,RIESG' +
        'O_CFM,ACTIVO,CUENTA_CONTABLE,CUENTA_CC,CUENTA_AHORRO,CUENTA_CONF' +
        'IRMING,CUENTA_DTO,SEPARA_APUNTES,CUENTA_GASTOS,CUENTA_GASTOS_DES' +
        'CUENTO,DIA_VALOR,CUENTA_PAGARES,CUENTAS_GASTOS_PAGARES,CUENTA_IN' +
        'TERESES,IBAN,BIC,CONTADOR_TALON,CONTADOR_TALON_AUTOMATICO,CUENTA' +
        '_GASTOS_IMPAGADO, CEDENTE_CONFIRMING, CODIGO_ORDENANTE, ALFANUME' +
        'RO, PAIS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?BANCO,?TITULO,?TERCERO,?ENTIDAD,?' +
        'SUCURSAL,?CONTROL,?CUENTA_CORRIENTE,?RIESGO_CON,?RIESGO_UTI,?RIE' +
        'SGO_DES,?RIESGO_CFM,?ACTIVO,?CUENTA_CONTABLE,?CUENTA_CC,?CUENTA_' +
        'AHORRO,?CUENTA_CONFIRMING,?CUENTA_DTO,?SEPARA_APUNTES,?CUENTA_GA' +
        'STOS,?CUENTA_GASTOS_DESCUENTO,?DIA_VALOR,?CUENTA_PAGARES,?CUENTA' +
        'S_GASTOS_PAGARES,?CUENTA_INTERESES,?IBAN,?BIC,?CONTADOR_TALON,?C' +
        'ONTADOR_TALON_AUTOMATICO,?CUENTA_GASTOS_IMPAGADO, ?CEDENTE_CONFI' +
        'RMING, ?CODIGO_ORDENANTE, ?ALFANUMERO, ?PAIS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_BANCOS_CUENTAS'
      'WHERE'
      '    EMPRESA=?EMPRESA AND'
      '    EJERCICIO=?EJERCICIO AND'
      '    CANAL=?CANAL AND'
      '    BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT * FROM VER_BANCOS_CUENTAS'
      'WHERE'
      '    EMPRESA=?EMPRESA AND'
      '    EJERCICIO=?EJERCICIO AND'
      '    CANAL=?CANAL'
      'ORDER BY BANCO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_BANCOS_CUENTAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TERCERO=?TERCERO '
      '  ,ENTIDAD=?ENTIDAD '
      '  ,SUCURSAL=?SUCURSAL '
      '  ,CONTROL=?CONTROL '
      '  ,CUENTA_CORRIENTE=?CUENTA_CORRIENTE '
      '  ,RIESGO_CON=?RIESGO_CON '
      '  ,RIESGO_UTI=?RIESGO_UTI '
      '  ,RIESGO_DES=?RIESGO_DES '
      '  ,RIESGO_CFM=?RIESGO_CFM '
      '  ,ACTIVO=?ACTIVO '
      '  ,CUENTA_CONTABLE=?CUENTA_CONTABLE '
      '  ,CUENTA_CC=?CUENTA_CC '
      '  ,CUENTA_AHORRO=?CUENTA_AHORRO '
      '  ,CUENTA_CONFIRMING=?CUENTA_CONFIRMING '
      '  ,CUENTA_DTO=?CUENTA_DTO '
      '  ,SEPARA_APUNTES=?SEPARA_APUNTES '
      '  ,CUENTA_GASTOS=?CUENTA_GASTOS '
      '  ,CUENTA_GASTOS_DESCUENTO=?CUENTA_GASTOS_DESCUENTO '
      '  ,DIA_VALOR=?DIA_VALOR '
      '  ,CUENTA_PAGARES=?CUENTA_PAGARES'
      '  ,CUENTAS_GASTOS_PAGARES=?CUENTAS_GASTOS_PAGARES'
      '  ,CUENTA_INTERESES=?CUENTA_INTERESES'
      '  ,CUENTA_GASTOS_IMPAGADO=?CUENTA_GASTOS_IMPAGADO '
      '  ,IBAN=?IBAN'
      '  ,BIC=?BIC'
      '  ,CONTADOR_TALON=?CONTADOR_TALON'
      '  ,CONTADOR_TALON_AUTOMATICO=?CONTADOR_TALON_AUTOMATICO'
      '  ,CEDENTE_CONFIRMING=?CEDENTE_CONFIRMING'
      '  ,CODIGO_ORDENANTE=?CODIGO_ORDENANTE'
      '  ,ALFANUMERO=?ALFANUMERO'
      '  ,PAIS=?PAIS'
      'WHERE'
      '    EMPRESA=?old_EMPRESA AND'
      '    EJERCICIO=?old_EJERCICIO AND'
      '    CANAL=?old_CANAL AND'
      '    BANCO=?old_BANCO')
    AfterInsert = QMEmp_BancosAfterInsert
    AfterOpen = QMEmp_BancosAfterOpen
    AfterPost = QMEmp_BancosAfterPost
    BeforeClose = QMEmp_BancosBeforeClose
    BeforeEdit = QMEmp_BancosBeforeEdit
    BeforePost = QMEmp_BancosBeforePost
    OnNewRecord = QMEmp_BancosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'BANCO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_BANCOS_CUENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMEmp_BancosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmp_BancosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmp_BancosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmp_BancosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMEmp_BancosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMEmp_BancosSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object QMEmp_BancosCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object QMEmp_BancosRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object QMEmp_BancosRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object QMEmp_BancosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEmp_BancosCUENTA_CONTABLE: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CONTABLE'
      Size = 15
    end
    object QMEmp_BancosRIESGO_DIF: TFloatField
      DisplayLabel = 'Riesgo Dif.'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_DIF'
      OnGetText = QMEmp_BancosRIESGO_DIFGetText
      Calculated = True
    end
    object QMEmp_BancosCUENTA_CC: TFIBStringField
      DisplayLabel = 'Cta. Ccorriente'
      FieldName = 'CUENTA_CC'
      Size = 15
    end
    object QMEmp_BancosCUENTA_AHORRO: TFIBStringField
      DisplayLabel = 'Cta. Ahorro'
      FieldName = 'CUENTA_AHORRO'
      Size = 15
    end
    object QMEmp_BancosCUENTA_DTO: TFIBStringField
      DisplayLabel = 'Cta. Dto.'
      FieldName = 'CUENTA_DTO'
      Size = 15
    end
    object QMEmp_BancosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object QMEmp_BancosSEPARA_APUNTES: TIntegerField
      DisplayLabel = 'Separa Apu.'
      FieldName = 'SEPARA_APUNTES'
    end
    object QMEmp_BancosRIESGO_DES: TFloatField
      DisplayLabel = 'Riesgo Descuento'
      FieldName = 'RIESGO_DES'
    end
    object QMEmp_BancosRIESGO_CFM: TFloatField
      DisplayLabel = 'Riesgo Confirming'
      FieldName = 'RIESGO_CFM'
    end
    object QMEmp_BancosCUENTA_CONFIRMING: TFIBStringField
      DisplayLabel = 'Cta. Confirming'
      FieldName = 'CUENTA_CONFIRMING'
      Size = 15
    end
    object QMEmp_BancosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEmp_BancosCUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMEmp_BancosCUENTA_GASTOS_DESCUENTO: TFIBStringField
      DisplayLabel = 'Cta. Gastos Dto.'
      FieldName = 'CUENTA_GASTOS_DESCUENTO'
      Size = 15
    end
    object QMEmp_BancosDIA_VALOR: TIntegerField
      DisplayLabel = 'Dia Valor'
      FieldName = 'DIA_VALOR'
    end
    object QMEmp_BancosCUENTA_PAGARES: TFIBStringField
      DisplayLabel = 'Cta. Pagares'
      FieldName = 'CUENTA_PAGARES'
      Size = 15
    end
    object QMEmp_BancosCUENTAS_GASTOS_PAGARES: TFIBStringField
      DisplayLabel = 'Cta. Gastos Pagares'
      FieldName = 'CUENTAS_GASTOS_PAGARES'
      Size = 15
    end
    object QMEmp_BancosCUENTA_INTERESES: TFIBStringField
      DisplayLabel = 'Cta. Intereses'
      FieldName = 'CUENTA_INTERESES'
      Size = 15
    end
    object QMEmp_BancosRIESGO_DES_PAG: TFloatField
      DisplayLabel = 'Riesgo Des. Pagare'
      FieldName = 'RIESGO_DES_PAG'
    end
    object QMEmp_BancosIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object QMEmp_BancosBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object QMEmp_BancosCUENTA_CORRIENTE: TFIBStringField
      DisplayLabel = 'Cta. Corriente'
      FieldName = 'CUENTA_CORRIENTE'
    end
    object QMEmp_BancosCONTADOR_TALON: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR_TALON'
    end
    object QMEmp_BancosCONTADOR_TALON_AUTOMATICO: TIntegerField
      DisplayLabel = 'Auto'
      FieldName = 'CONTADOR_TALON_AUTOMATICO'
    end
    object QMEmp_BancosCUENTA_GASTOS_IMPAGADO: TFIBStringField
      DisplayLabel = 'Cta. Gastos Impagado'
      FieldName = 'CUENTA_GASTOS_IMPAGADO'
      Size = 15
    end
    object QMEmp_BancosCEDENTE_CONFIRMING: TFIBStringField
      DisplayLabel = 'Cedente Confirming'
      FieldName = 'CEDENTE_CONFIRMING'
      Size = 35
    end
    object QMEmp_BancosCODIGO_ORDENANTE: TFIBStringField
      DisplayLabel = 'C'#243'digo Ordenante'
      FieldName = 'CODIGO_ORDENANTE'
      Size = 3
    end
    object QMEmp_BancosALFANUMERO: TFIBStringField
      DisplayLabel = 'Alfan'#250'mero'
      FieldName = 'ALFANUMERO'
      Size = 11
    end
    object QMEmp_BancosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSQMEmp_Bancos: TDataSource
    DataSet = QMEmp_Bancos
    Left = 168
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 352
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
  object QMCendentesPorMoneda: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_BANCOS_CENDENTES_MONEDA'
      'WHERE'
      '  MONEDA=?old_MONEDA AND '
      '  BANCO=?old_BANCO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_BANCOS_CENDENTES_MONEDA'
      '  (EMPRESA,BANCO,MONEDA,CEDENTE)'
      'VALUES'
      '  (?EMPRESA,?BANCO,?MONEDA,?CEDENTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_BANCOS_CENDENTES_MONEDA'
      'WHERE'
      '  MONEDA=?MONEDA AND '
      '  BANCO=?BANCO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_BANCOS_CENDENTES_MONEDA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  BANCO=?BANCO '
      'ORDER BY MONEDA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_BANCOS_CENDENTES_MONEDA'
      'SET'
      '  CEDENTE=?CEDENTE '
      'WHERE'
      '  MONEDA=?MONEDA AND '
      '  BANCO=?BANCO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmp_Bancos
    OnNewRecord = QMCendentesPorMonedaNewRecord
    ClavesPrimarias.Strings = (
      'MONEDA '
      'BANCO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_BANCOS_CENDENTES_MONEDA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMCendentesPorMonedaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCendentesPorMonedaBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCendentesPorMonedaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCendentesPorMonedaCEDENTE: TFIBStringField
      DisplayLabel = 'Cedente'
      FieldName = 'CEDENTE'
      Size = 35
    end
  end
  object DSQMCendentesPorMoneda: TDataSource
    DataSet = QMCendentesPorMoneda
    Left = 168
    Top = 56
  end
end
