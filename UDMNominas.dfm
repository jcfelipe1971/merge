object DMNominas: TDMNominas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 849
  Top = 357
  Height = 387
  Width = 345
  object DSQMNominas: TDataSource
    DataSet = QMNominas
    Left = 112
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
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
    Left = 280
    Top = 24
  end
  object QMNominas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_NOMINAS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_NOMINAS'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,EMPLEADO,PERIODO,NOMBRE_R_SOCIAL' +
        ',IMP_DEVENGADO,IMP_RETENCION,IMP_RETENCION_ESPECIE,IMP_REMUNERAC' +
        'ION,'#13#10'IMP_REMUNERACION_ESPECIE,IMP_SEG_SOCIAL,IMP_DIETAS,IMP_ANT' +
        'ICIPO,IMP_OTROS,IMP_PAGADO,IMP_SEG_SOCIAL_EMPRESA,IMP_CE_RETA,IM' +
        'P_COBROS_ESPECIE,IMP_ICECES,'#13#10'IMP_EMBARGO,CERRADO,RIC_CIERRE,RIC' +
        '_CIERRE_SEG_SOCIAL_EMPRESA,EJERCICIO_CIERRE,CTA_PAGO,CTA_PAGO_PG' +
        'C,PAGADO,RIC_PAGO,EJERCICIO_PAGO,'#13#10'ENTRADA,CODIGO_GESTORIA,TERCE' +
        'RO,USUARIO,PERIODO_HACIENDA,SELECCIONADO,FECHA_CIERRE,FECHA_PAGO' +
        ')'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?EMPLEADO,?PERIODO,?NOMBRE_R' +
        '_SOCIAL,?IMP_DEVENGADO,?IMP_RETENCION,?IMP_RETENCION_ESPECIE,?IM' +
        'P_REMUNERACION,'#13#10'?IMP_REMUNERACION_ESPECIE,?IMP_SEG_SOCIAL,?IMP_' +
        'DIETAS,?IMP_ANTICIPO,?IMP_OTROS,?IMP_PAGADO,?IMP_SEG_SOCIAL_EMPR' +
        'ESA,?IMP_CE_RETA,?IMP_COBROS_ESPECIE,?IMP_ICECES,'#13#10'?IMP_EMBARGO,' +
        '?CERRADO,?RIC_CIERRE,?RIC_CIERRE_SEG_SOCIAL_EMPRESA,?EJERCICIO_C' +
        'IERRE,?CTA_PAGO,?CTA_PAGO_PGC,?PAGADO,?RIC_PAGO,?EJERCICIO_PAGO,' +
        #13#10'?ENTRADA,?CODIGO_GESTORIA,?TERCERO,?USUARIO,?PERIODO_HACIENDA,' +
        '?SELECCIONADO,?FECHA_CIERRE,?FECHA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_NOMINAS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_NOMINAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PAGADO = 0'
      'ORDER BY PERIODO_HACIENDA DESC, EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_NOMINAS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,PERIODO=?PERIODO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,IMP_DEVENGADO=?IMP_DEVENGADO '
      '  ,IMP_RETENCION=?IMP_RETENCION '
      '  ,IMP_RETENCION_ESPECIE=?IMP_RETENCION_ESPECIE '
      '  ,IMP_REMUNERACION=?IMP_REMUNERACION '
      '  ,IMP_REMUNERACION_ESPECIE=?IMP_REMUNERACION_ESPECIE '
      '  ,IMP_SEG_SOCIAL=?IMP_SEG_SOCIAL '
      '  ,IMP_DIETAS=?IMP_DIETAS '
      '  ,IMP_ANTICIPO=?IMP_ANTICIPO '
      '  ,IMP_OTROS=?IMP_OTROS '
      '  ,IMP_PAGADO=?IMP_PAGADO '
      '  ,IMP_SEG_SOCIAL_EMPRESA=?IMP_SEG_SOCIAL_EMPRESA '
      '  ,IMP_CE_RETA=?IMP_CE_RETA '
      '  ,IMP_COBROS_ESPECIE=?IMP_COBROS_ESPECIE '
      '  ,IMP_ICECES=?IMP_ICECES '
      '  ,IMP_EMBARGO=?IMP_EMBARGO '
      '  ,CERRADO=?CERRADO '
      '  ,RIC_CIERRE=?RIC_CIERRE '
      '  ,RIC_CIERRE_SEG_SOCIAL_EMPRESA=?RIC_CIERRE_SEG_SOCIAL_EMPRESA '
      '  ,EJERCICIO_CIERRE=?EJERCICIO_CIERRE '
      '  ,CTA_PAGO=?CTA_PAGO '
      '  ,CTA_PAGO_PGC=?CTA_PAGO_PGC '
      '  ,PAGADO=?PAGADO '
      '  ,RIC_PAGO=?RIC_PAGO '
      '  ,EJERCICIO_PAGO=?EJERCICIO_PAGO '
      '  ,ENTRADA=?ENTRADA '
      '  ,CODIGO_GESTORIA=?CODIGO_GESTORIA '
      '  ,TERCERO=?TERCERO '
      '  ,USUARIO=?USUARIO '
      '  ,PERIODO_HACIENDA=?PERIODO_HACIENDA '
      '  ,SELECCIONADO=?SELECCIONADO '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,FECHA_PAGO=?FECHA_PAGO '
      'WHERE'
      '  ID=?ID ')
    AfterPost = QMNominasAfterPost
    BeforePost = QMNominasBeforePost
    OnNewRecord = QMNominasNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_NOMINAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMNominasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNominasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNominasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNominasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNominasEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
      OnChange = QMNominasEMPLEADOChange
    end
    object QMNominasPERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 40
    end
    object QMNominasIMP_DEVENGADO: TFloatField
      DisplayLabel = 'Imp. Devengado'
      FieldName = 'IMP_DEVENGADO'
    end
    object QMNominasIMP_RETENCION: TFloatField
      DisplayLabel = 'Imp. Retenci'#243'n'
      FieldName = 'IMP_RETENCION'
    end
    object QMNominasIMP_REMUNERACION: TFloatField
      DisplayLabel = 'Imp. Remuneraci'#243'n'
      FieldName = 'IMP_REMUNERACION'
    end
    object QMNominasIMP_SEG_SOCIAL: TFloatField
      DisplayLabel = 'Imp. Seg. Social'
      FieldName = 'IMP_SEG_SOCIAL'
    end
    object QMNominasIMP_ANTICIPO: TFloatField
      DisplayLabel = 'Imp. Anticipo'
      FieldName = 'IMP_ANTICIPO'
    end
    object QMNominasCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QMNominasRIC_CIERRE: TIntegerField
      DisplayLabel = 'RIC Cierre'
      FieldName = 'RIC_CIERRE'
    end
    object QMNominasEJERCICIO_CIERRE: TIntegerField
      DisplayLabel = 'Ejer. Cierre'
      FieldName = 'EJERCICIO_CIERRE'
    end
    object QMNominasPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMNominasRIC_PAGO: TIntegerField
      DisplayLabel = 'RIC Pago'
      FieldName = 'RIC_PAGO'
    end
    object QMNominasEJERCICIO_PAGO: TIntegerField
      DisplayLabel = 'Ejer. Pago'
      FieldName = 'EJERCICIO_PAGO'
    end
    object QMNominasCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMNominasCTA_PAGO_PGC: TIntegerField
      DisplayLabel = 'Cta. Pago PGC'
      FieldName = 'CTA_PAGO_PGC'
    end
    object QMNominasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMNominasNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMNominasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNominasUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMNominasIMP_RETENCION_ESPECIE: TFloatField
      DisplayLabel = 'Imp. Retenci'#243'n Esp.'
      FieldName = 'IMP_RETENCION_ESPECIE'
    end
    object QMNominasIMP_REMUNERACION_ESPECIE: TFloatField
      DisplayLabel = 'Imp. Remuneraci'#243'n Esp.'
      FieldName = 'IMP_REMUNERACION_ESPECIE'
    end
    object QMNominasIMP_DIETAS: TFloatField
      DisplayLabel = 'Imp. Dietas'
      FieldName = 'IMP_DIETAS'
    end
    object QMNominasPERIODO_HACIENDA: TFIBStringField
      DisplayLabel = 'Periodo Hacienda'
      FieldName = 'PERIODO_HACIENDA'
      Size = 2
    end
    object QMNominasSELECCIONADO: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'SELECCIONADO'
    end
    object QMNominasIMP_SEG_SOCIAL_EMPRESA: TFloatField
      DisplayLabel = 'Imp. Seg. Social Emp.'
      FieldName = 'IMP_SEG_SOCIAL_EMPRESA'
    end
    object QMNominasRIC_CIERRE_SEG_SOCIAL_EMPRESA: TIntegerField
      DisplayLabel = 'RIC Cierre Seg. Soc. Emp.'
      FieldName = 'RIC_CIERRE_SEG_SOCIAL_EMPRESA'
    end
    object QMNominasIMP_OTROS: TFloatField
      DisplayLabel = 'Imp. Otros'
      FieldName = 'IMP_OTROS'
    end
    object QMNominasIMP_PAGADO: TFloatField
      DisplayLabel = 'Imp. Pagado'
      FieldName = 'IMP_PAGADO'
    end
    object QMNominasFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMNominasFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QMNominasCODIGO_GESTORIA: TFIBStringField
      DisplayLabel = 'Cod. Gestoria'
      FieldName = 'CODIGO_GESTORIA'
      Size = 25
    end
    object QMNominasIMP_CE_RETA: TFloatField
      DisplayLabel = 'Imp. CE RETA'
      FieldName = 'IMP_CE_RETA'
    end
    object QMNominasIMP_COBROS_ESPECIE: TFloatField
      DisplayLabel = 'Imp. Cobros Esp.'
      FieldName = 'IMP_COBROS_ESPECIE'
    end
    object QMNominasIMP_ICECES: TFloatField
      DisplayLabel = 'Imp. ICECES'
      FieldName = 'IMP_ICECES'
    end
    object QMNominasIMP_EMBARGO: TFloatField
      DisplayLabel = 'Imp. Embargo'
      FieldName = 'IMP_EMBARGO'
    end
  end
  object DSQMAnticipos: TDataSource
    DataSet = QMAnticipos
    Left = 112
    Top = 72
  end
  object QMAnticipos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_NOMINAS_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ANTICIPO=?old_ANTICIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_NOMINAS_ANTICIPOS'
      
        '  (ID,EMPRESA,EJERCICIO,CANAL,EMPLEADO,ANTICIPO,NOMBRE_R_SOCIAL,' +
        'IMPORTE,PAGADO,RIC_PAGO,EJERCICIO_PAGO,CTA_PAGO,CTA_PAGO_PGC,LIQ' +
        'UIDADO,RIC_LIQUIDACION,EJERCICIO_LIQUIDACION,ID_NOMINA,ENTRADA,C' +
        'ODIGO_GESTORIA,TERCERO,USUARIO,PERIODO,FECHA_PAGO)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?CANAL,?EMPLEADO,?ANTICIPO,?NOMBRE_R_' +
        'SOCIAL,?IMPORTE,?PAGADO,?RIC_PAGO,?EJERCICIO_PAGO,?CTA_PAGO,?CTA' +
        '_PAGO_PGC,?LIQUIDADO,?RIC_LIQUIDACION,?EJERCICIO_LIQUIDACION,?ID' +
        '_NOMINA,?ENTRADA,?CODIGO_GESTORIA,?TERCERO,?USUARIO,?PERIODO,?FE' +
        'CHA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_NOMINAS_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_NOMINAS_ANTICIPOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'LIQUIDADO = 0'
      'ORDER BY ANTICIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_NOMINAS_ANTICIPOS'
      'SET'
      '  ID=?ID '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,IMPORTE=?IMPORTE '
      '  ,PAGADO=?PAGADO '
      '  ,RIC_PAGO=?RIC_PAGO '
      '  ,EJERCICIO_PAGO=?EJERCICIO_PAGO '
      '  ,CTA_PAGO=?CTA_PAGO '
      '  ,CTA_PAGO_PGC=?CTA_PAGO_PGC '
      '  ,LIQUIDADO=?LIQUIDADO '
      '  ,RIC_LIQUIDACION=?RIC_LIQUIDACION '
      '  ,EJERCICIO_LIQUIDACION=?EJERCICIO_LIQUIDACION '
      '  ,ID_NOMINA=?ID_NOMINA '
      '  ,ENTRADA=?ENTRADA '
      '  ,CODIGO_GESTORIA=?CODIGO_GESTORIA '
      '  ,TERCERO=?TERCERO '
      '  ,USUARIO=?USUARIO '
      '  ,PERIODO=?PERIODO '
      '  ,FECHA_PAGO=?FECHA_PAGO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO ')
    BeforePost = QMAnticiposBeforePost
    OnNewRecord = QMAnticiposNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ANTICIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_NOMINAS_ANTICIPOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMAnticiposID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMAnticiposEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAnticiposEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAnticiposCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAnticiposEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMAnticiposANTICIPO: TIntegerField
      DisplayLabel = 'Anticipo'
      FieldName = 'ANTICIPO'
    end
    object QMAnticiposNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMAnticiposIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMAnticiposPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMAnticiposRIC_PAGO: TIntegerField
      DisplayLabel = 'RIC Pago'
      FieldName = 'RIC_PAGO'
    end
    object QMAnticiposID_NOMINA: TIntegerField
      DisplayLabel = 'ID Nomina'
      FieldName = 'ID_NOMINA'
    end
    object QMAnticiposENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMAnticiposTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMAnticiposUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMAnticiposEJERCICIO_PAGO: TIntegerField
      DisplayLabel = 'Ejer. Pago'
      FieldName = 'EJERCICIO_PAGO'
    end
    object QMAnticiposLIQUIDADO: TIntegerField
      DisplayLabel = 'Liquidado'
      FieldName = 'LIQUIDADO'
    end
    object QMAnticiposRIC_LIQUIDACION: TIntegerField
      DisplayLabel = 'RIC Liquidaci'#243'n'
      FieldName = 'RIC_LIQUIDACION'
    end
    object QMAnticiposEJERCICIO_LIQUIDACION: TIntegerField
      DisplayLabel = 'Ejer. Liquidaci'#243'n'
      FieldName = 'EJERCICIO_LIQUIDACION'
    end
    object QMAnticiposCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMAnticiposCTA_PAGO_PGC: TIntegerField
      DisplayLabel = 'Cta. Pago PGC'
      FieldName = 'CTA_PAGO_PGC'
    end
    object QMAnticiposPERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMAnticiposCODIGO_GESTORIA: TFIBStringField
      DisplayLabel = 'Cod. Gestoria'
      FieldName = 'CODIGO_GESTORIA'
      Size = 25
    end
    object QMAnticiposFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
  end
  object Norma34: TCVBNorma34CSB
    NomFichero = 'CSB34.TXT'
    Euros = True
    Left = 280
    Top = 120
  end
  object Norma34_1: TCVBNorma34_1CSB
    NomFichero = 'CSB34.TXT'
    Left = 280
    Top = 168
  end
  object Norma34_14: TCVBNorma34_14CSB
    NomFichero = 'CSB34.TXT'
    Depura = True
    Left = 280
    Top = 216
  end
  object xBancoOrdPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_BANCOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    Left = 34
    Top = 122
    object xBancoOrdPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBancoOrdPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xBancoOrdPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xBancoOrdPagoBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancoOrdPagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancoOrdPagoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xBancoOrdPagoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xBancoOrdPagoCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xBancoOrdPagoCUENTA_CORRIENTE: TFIBStringField
      DisplayLabel = 'Cta. Corriente'
      DisplayWidth = 20
      FieldName = 'CUENTA_CORRIENTE'
    end
    object xBancoOrdPagoRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object xBancoOrdPagoRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object xBancoOrdPagoACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xBancoOrdPagoCUENTA_CONTABLE: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CONTABLE'
      Size = 15
    end
    object xBancoOrdPagoCUENTA_CC: TFIBStringField
      DisplayLabel = 'Cta. Ccorriente'
      FieldName = 'CUENTA_CC'
      Size = 15
    end
    object xBancoOrdPagoCUENTA_AHORRO: TFIBStringField
      DisplayLabel = 'Cta. Ahorro'
      FieldName = 'CUENTA_AHORRO'
      Size = 15
    end
    object xBancoOrdPagoCUENTA_DTO: TFIBStringField
      DisplayLabel = 'Cta. Dto.'
      FieldName = 'CUENTA_DTO'
      Size = 15
    end
    object xBancoOrdPagoSEPARA_APUNTES: TIntegerField
      DisplayLabel = 'Separa Apu.'
      FieldName = 'SEPARA_APUNTES'
    end
    object xBancoOrdPagoIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object xBancoOrdPagoBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
  end
  object xEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      
        'E.TERCERO, E.EMPLEADO, T.NIF, T.NOMBRE_R_SOCIAL, D.DIR_COMPLETA_' +
        'N, '
      
        'LO.CODIGO_POSTAL AS CODPOSTAL, LO.TITULO AS TITULO_LOCALIDAD, PR' +
        '.TITULO AS TITULO_PROVINCIA, PA.TITULO AS TITULO_PAIS, PA.PAIS_C' +
        '2 AS PAIS_C2, PA.PERTENECE_CEE,'
      'B.ENTIDAD, B.SUCURSAL, B.CONTROL, B.CUENTA, B.IBAN, B.BIC'
      'FROM OPE_EMPLEADO E'
      'JOIN SYS_TERCEROS T'
      'ON E.TERCERO=T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D'
      'ON T.TERCERO=D.TERCERO'
      'JOIN SYS_LOCALIDADES LO'
      'ON D.ID_LOCAL = LO.ID_LOCAL'
      'LEFT JOIN SYS_PROVINCIAS PR'
      'ON (LO.PROVINCIA=PR.PROVINCIA AND LO.PAIS=PR.PAIS)'
      'LEFT JOIN SYS_PAISES PA'
      'ON (PR.PAIS=PA.PAIS)'
      'LEFT JOIN SYS_TERCEROS_BANCOS B'
      
        'ON T.TERCERO=B.TERCERO AND B.BANCO = (SELECT FIRST 1 BANCO FROM ' +
        'SYS_TERCEROS_BANCOS WHERE TERCERO=B.TERCERO AND ACTIVA=1 AND MOD' +
        'O<=1 ORDER BY ORDEN)'
      'WHERE'
      'E.EMPRESA = ?EMPRESA AND'
      'E.EMPLEADO = ?EMPLEADO AND'
      'D.DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSQMNominas
    Left = 34
    Top = 170
    object xEmpleadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xEmpleadoCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xEmpleadoTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object xEmpleadoTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object xEmpleadoTITULO_PAIS: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PAIS'
      Size = 60
    end
    object xEmpleadoPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xEmpleadoPERTENECE_CEE: TIntegerField
      DisplayLabel = 'Pertenece C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
    object xEmpleadoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xEmpleadoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xEmpleadoCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xEmpleadoCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
    end
    object xEmpleadoIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object xEmpleadoBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object xEmpleadoNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xEmpleadoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEmpleadoDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
  end
end
