object DMAcreedores: TDMAcreedores
  OldCreateOrder = False
  OnCreate = DMAcreedoresCreate
  OnDestroy = DMAcreedoresDestroy
  Left = 359
  Top = 149
  Height = 759
  Width = 756
  object QMAcreedores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ACREEDOR=?old_ACREEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ACREEDORES_CUENTAS'
      '  (EMPRESA,'
      
        'EJERCICIO,CANAL,ACREEDOR,TIPO,TERCERO,FORMA_PAGO,DIA_PAGO_1,DIA_' +
        'PAGO_2,DIA_PAGO_3,DESCUENTO_PP,'
      
        'NOTAS,MODO_IVA,CUENTA,TITULO,TIPO_IRPF,PAIS,NOMBRE_R_SOCIAL,USAR' +
        '_ANTICIPOS,EVAL_FEB,EVAL_FEB_SI,'
      
        'MONEDA,CUENTA_GASTOS,FINANCIACION,POR_FINANCIACION,TIT_LOCALIDAD' +
        ',CODIGO_POSTAL,CUENTA_DTOPP,CUENTA_IRPF,TRANSPORTE_RAPIDO_KRI,GE' +
        'NERA_TALONES,'
      
        'BAJA,FECHA_BAJA,MOTIVO_BAJA,TIPO_NCF,IDIOMA,RECC,BANCO_PAGOS,INT' +
        'RA,INTRA_TRANS,PAIS_C2,'
      
        'TRANSPORTISTA_CREA_RUTA,BLOQUEO,MOTIVO_BLOQUEO,GENERA_ENVIO,NIF,' +
        'ID_ACREEDOR,FECHA_ALTA,ALFA_1,ALFA_2,ALFA_3,'
      
        'ALFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,TITULO_REGION,TITULO_PROVINCI' +
        'A,TITULO_POBLACION,TITULO_CODIGO_POSTAL,PROYECTO)'
      'VALUES'
      '  (?EMPRESA,'
      
        '?EJERCICIO,?CANAL,?ACREEDOR,?TIPO,?TERCERO,?FORMA_PAGO,?DIA_PAGO' +
        '_1,?DIA_PAGO_2,?DIA_PAGO_3,?DESCUENTO_PP,'
      
        '?NOTAS,?MODO_IVA,?CUENTA,?TITULO,?TIPO_IRPF,?PAIS,?NOMBRE_R_SOCI' +
        'AL,?USAR_ANTICIPOS,?EVAL_FEB,?EVAL_FEB_SI,'
      
        '?MONEDA,?CUENTA_GASTOS,?FINANCIACION,?POR_FINANCIACION,?TIT_LOCA' +
        'LIDAD,?CODIGO_POSTAL,?CUENTA_DTOPP,?CUENTA_IRPF,?TRANSPORTE_RAPI' +
        'DO_KRI,?GENERA_TALONES,'
      
        '?BAJA,?FECHA_BAJA,?MOTIVO_BAJA,?TIPO_NCF,?IDIOMA,?RECC,?BANCO_PA' +
        'GOS,?INTRA,?INTRA_TRANS,?PAIS_C2,'
      
        '?TRANSPORTISTA_CREA_RUTA,?BLOQUEO,?MOTIVO_BLOQUEO,?GENERA_ENVIO,' +
        '?NIF,?ID_ACREEDOR,?FECHA_ALTA,?ALFA_1,?ALFA_2,?ALFA_3,'
      
        '?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?TITULO_REGION,?TITULO_P' +
        'ROVINCIA,?TITULO_POBLACION,?TITULO_CODIGO_POSTAL,?PROYECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ACREEDOR=?ACREEDOR ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY ACREEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ACREEDORES_CUENTAS'
      'SET'
      '  TIPO=?TIPO '
      '  ,TERCERO=?TERCERO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,DIA_PAGO_1=?DIA_PAGO_1 '
      '  ,DIA_PAGO_2=?DIA_PAGO_2 '
      '  ,DIA_PAGO_3=?DIA_PAGO_3 '
      '  ,DESCUENTO_PP=?DESCUENTO_PP '
      '  ,NOTAS=?NOTAS '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,CUENTA=?CUENTA '
      '  ,TITULO=?TITULO '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,PAIS=?PAIS '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,USAR_ANTICIPOS=?USAR_ANTICIPOS '
      '  ,EVAL_FEB=?EVAL_FEB '
      '  ,EVAL_FEB_SI=?EVAL_FEB_SI '
      '  ,MONEDA=?MONEDA '
      '  ,CUENTA_GASTOS=?CUENTA_GASTOS '
      '  ,FINANCIACION=?FINANCIACION '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,CUENTA_DTOPP=?CUENTA_DTOPP '
      '  ,CUENTA_IRPF=?CUENTA_IRPF '
      '  ,TRANSPORTE_RAPIDO_KRI=?TRANSPORTE_RAPIDO_KRI '
      '  ,GENERA_TALONES=?GENERA_TALONES '
      '  ,BAJA=?BAJA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,TIPO_NCF=?TIPO_NCF '
      '  ,IDIOMA=?IDIOMA '
      '  ,RECC=?RECC '
      '  ,BANCO_PAGOS=?BANCO_PAGOS '
      '  ,INTRA=?INTRA '
      '  ,INTRA_TRANS=?INTRA_TRANS '
      '  ,PAIS_C2=?PAIS_C2 '
      '  ,TRANSPORTISTA_CREA_RUTA=?TRANSPORTISTA_CREA_RUTA '
      '  ,BLOQUEO=?BLOQUEO '
      '  ,MOTIVO_BLOQUEO=?MOTIVO_BLOQUEO '
      '  ,GENERA_ENVIO=?GENERA_ENVIO '
      '  ,NIF=?NIF '
      '  ,ID_ACREEDOR=?ID_ACREEDOR '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,TITULO_REGION=?TITULO_REGION '
      '  ,TITULO_PROVINCIA=?TITULO_PROVINCIA '
      '  ,TITULO_POBLACION=?TITULO_POBLACION '
      '  ,TITULO_CODIGO_POSTAL=?TITULO_CODIGO_POSTAL '
      '  ,PROYECTO=?PROYECTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ACREEDOR=?ACREEDOR ')
    AfterOpen = QMAcreedoresAfterOpen
    BeforeClose = QMAcreedoresBeforeClose
    BeforeEdit = QMAcreedoresBeforeEdit
    BeforePost = QMAcreedoresBeforePost
    OnNewRecord = QMAcreedoresNewRecord
    OnPostError = QMAcreedoresPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ACREEDOR ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ACREEDORES_CUENTAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_ACR'
      'EMP_ACREEDORES')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,ACREEDOR'
      'EMPRESA,ACREEDOR')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object QMAcreedoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAcreedoresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAcreedoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAcreedoresACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object QMAcreedoresTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMAcreedoresTIPOChange
    end
    object QMAcreedoresTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMAcreedoresTERCEROChange
    end
    object QMAcreedoresFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMAcreedoresFORMA_PAGOChange
      Size = 3
    end
    object QMAcreedoresDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMAcreedoresDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMAcreedoresNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAcreedoresCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMAcreedoresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAcreedoresMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
      OnChange = QMAcreedoresMODO_IVAChange
    end
    object QMAcreedoresTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
      OnChange = QMAcreedoresTIPO_IRPFChange
    end
    object QMAcreedoresPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMAcreedoresNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMAcreedoresUSAR_ANTICIPOS: TIntegerField
      DisplayLabel = 'Usar Antic.'
      FieldName = 'USAR_ANTICIPOS'
    end
    object QMAcreedoresDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMAcreedoresDIA_PAGO_3: TIntegerField
      DisplayLabel = 'Dia Pago 3'
      FieldName = 'DIA_PAGO_3'
    end
    object QMAcreedoresEVAL_FEB: TIntegerField
      DisplayLabel = 'Eval. Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMAcreedoresEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval. Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMAcreedoresMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMAcreedoresMONEDAChange
      Size = 3
    end
    object QMAcreedoresCUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      OnChange = QMAcreedoresCUENTA_GASTOSChange
      Size = 15
    end
    object QMAcreedoresFINANCIACION: TIntegerField
      DisplayLabel = 'Financ.'
      FieldName = 'FINANCIACION'
    end
    object QMAcreedoresPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMAcreedoresTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMAcreedoresCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMAcreedoresCUENTA_DTOPP: TFIBStringField
      DisplayLabel = 'Cta. Dto. P.P.'
      FieldName = 'CUENTA_DTOPP'
      OnChange = QMAcreedoresCUENTA_DTOPPChange
      Size = 15
    end
    object QMAcreedoresTRANSPORTE_RAPIDO_KRI: TIntegerField
      DisplayLabel = 'Transp. Rapido'
      FieldName = 'TRANSPORTE_RAPIDO_KRI'
    end
    object QMAcreedoresGENERA_TALONES: TIntegerField
      DisplayLabel = 'Genera Talones'
      FieldName = 'GENERA_TALONES'
    end
    object QMAcreedoresBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMAcreedoresFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMAcreedoresMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object QMAcreedoresTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object QMAcreedoresIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMAcreedoresRECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Critero de Caja'
      FieldName = 'RECC'
    end
    object QMAcreedoresBANCO_PAGOS: TIntegerField
      DisplayLabel = 'Banco Pagos'
      FieldName = 'BANCO_PAGOS'
    end
    object QMAcreedoresINTRA: TIntegerField
      DisplayLabel = 'Intra.'
      FieldName = 'INTRA'
    end
    object QMAcreedoresINTRA_TRANS: TIntegerField
      DisplayLabel = 'Intra. Trans.'
      FieldName = 'INTRA_TRANS'
      OnChange = QMAcreedoresINTRA_TRANSChange
    end
    object QMAcreedoresPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      OnChange = QMAcreedoresPAIS_C2Change
      Size = 2
    end
    object QMAcreedoresTRANSPORTISTA_CREA_RUTA: TIntegerField
      DisplayLabel = 'Crea ruta'
      FieldName = 'TRANSPORTISTA_CREA_RUTA'
    end
    object QMAcreedoresBLOQUEO: TIntegerField
      DisplayLabel = 'Bloqueo'
      FieldName = 'BLOQUEO'
    end
    object QMAcreedoresMOTIVO_BLOQUEO: TFIBStringField
      DisplayLabel = 'Motivo Bloqueo'
      FieldName = 'MOTIVO_BLOQUEO'
      Size = 40
    end
    object QMAcreedoresGENERA_ENVIO: TIntegerField
      DisplayLabel = 'Gen. Env'#237'o Aut.'
      FieldName = 'GENERA_ENVIO'
    end
    object QMAcreedoresCUENTA_IRPF: TFIBStringField
      DisplayLabel = 'Cuenta IRPF'
      FieldName = 'CUENTA_IRPF'
      Size = 15
    end
    object QMAcreedoresNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMAcreedoresID_ACREEDOR: TIntegerField
      DisplayLabel = 'Id Acr.'
      FieldName = 'ID_ACREEDOR'
    end
    object QMAcreedoresFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMAcreedoresALFA_1: TStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMAcreedoresALFA_2: TStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMAcreedoresALFA_3: TStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMAcreedoresALFA_4: TStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMAcreedoresALFA_5: TStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMAcreedoresALFA_6: TStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMAcreedoresALFA_7: TStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMAcreedoresALFA_8: TStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMAcreedoresTITULO_REGION: TFIBStringField
      DisplayLabel = 'Titulo Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object QMAcreedoresTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Titulo Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMAcreedoresTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Titulo Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object QMAcreedoresTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Titulo Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object QMAcreedoresPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
  end
  object DSQMAcreedores: TDataSource
    DataSet = QMAcreedores
    Left = 168
    Top = 8
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 168
    Top = 56
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 168
    Top = 104
  end
  object DSxTipos: TDataSource
    DataSet = xTipos
    Left = 168
    Top = 152
  end
  object DSxIvaModos: TDataSource
    DataSet = xIvaModos
    Left = 168
    Top = 200
  end
  object DSxIRPF: TDataSource
    DataSet = xIRPF
    Left = 168
    Top = 248
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL FROM SYS_TERCEROS                   '
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 56
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FORMA_PAGO,TITULO FROM CON_CUENTAS_GES_FP'
      '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL AND FORMA_PAGO=?FORMA_PAGO'
      '  ORDER BY EMPRESA, EJERCICIO, CANAL, FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 104
    object xFormasPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xFormasPagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xTipos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO FROM SYS_TIPO_ACREEDOR'
      'WHERE TIPO = ?TIPO')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 152
  end
  object xIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MODO,TITULO FROM SYS_MODO_IVA'
      'WHERE MODO=?MODO_IVA')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 200
  end
  object xIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT P_IRPF,TITULO FROM SYS_TIPO_IRPF'
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 248
    object xIRPFP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object xIRPFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object xMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 344
    object xMonedaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xMonedaSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object xMonedaDEC_VER: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
    object xMonedaDEC_CALCULOS: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object xMonedaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMoneda: TDataSource
    DataSet = xMoneda
    Left = 168
    Top = 344
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'CUENTA = ?CUENTA_GASTOS AND '
      'PGC = ?PGC')
    UniDirectional = False
    DataSource = DSQMAcreedores
    BeforeOpen = xCuentasBeforeOpen
    Left = 72
    Top = 392
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 168
    Top = 392
  end
  object xCuentaDto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'CUENTA = ?CUENTA_DTOPP')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 296
  end
  object DSxCuentaDto: TDataSource
    DataSet = xCuentaDto
    Left = 168
    Top = 296
  end
  object xIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_INCIDENCIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO_TERCERO=?TIPO_TERCERO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO AND '
      '  INCIDENCIA=?INCIDENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'COD_CLI_PRO =  ?ACREEDOR AND'
      'TIPO_TERCERO = '#39'ACR'#39
      'ORDER BY INCIDENCIA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMAcreedores
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TIPO_TERCERO '
      'COD_CLI_PRO '
      'INCIDENCIA ')
    AccionesInhibidas = [Borrar, Insertar, Modificar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INCIDENCIAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 440
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_INCIDENCIA'
      Size = 60
    end
    object xIncidenciasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xIncidenciasFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recep.'
      FieldName = 'FECHA_RECEPCION'
    end
    object xIncidenciasTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Incidencia'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fec. Respuesta'
      FieldName = 'FECHA_RESPUESTA'
    end
    object xIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Respuesta'
      FieldName = 'RESPUESTA_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xIncidenciasID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xIncidenciasDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xIncidenciasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_RIG'
    end
    object xIncidenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xIncidenciasDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object xIncidenciasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 76
    end
    object xIncidenciasAGENTE: TIntegerField
      DisplayLabel = 'Age.'
      FieldName = 'AGENTE'
    end
    object xIncidenciasCONTACTO: TIntegerField
      DisplayLabel = 'Cont. 1'
      FieldName = 'CONTACTO'
    end
    object xIncidenciasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Contacto 1'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xIncidenciasCONTACTO2: TIntegerField
      DisplayLabel = 'Cont. 2'
      FieldName = 'CONTACTO2'
    end
    object xIncidenciasTIT_CONTACTO2: TFIBStringField
      DisplayLabel = 'Contacto 2'
      FieldName = 'TIT_CONTACTO2'
      Size = 81
    end
    object xIncidenciasCONTACTO3: TIntegerField
      DisplayLabel = 'Cont. 3'
      FieldName = 'CONTACTO3'
    end
    object xIncidenciasTIT_CONTACTO3: TFIBStringField
      DisplayLabel = 'Contacto 3'
      FieldName = 'TIT_CONTACTO3'
      Size = 81
    end
    object xIncidenciasTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Agente'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Inc.'
      FieldName = 'TIPO_INCIDENCIA_KRI'
      Size = 3
    end
    object xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Desc. Tipo Inc.'
      FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
      Size = 40
    end
    object xIncidenciasUSUARIO: TIntegerField
      DisplayLabel = 'Usu.'
      FieldName = 'USUARIO'
    end
    object xIncidenciasNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
    object xIncidenciasHORAS: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object xIncidenciasFINALIZADO: TIntegerField
      DisplayLabel = 'Finalizado'
      FieldName = 'FINALIZADO'
    end
  end
  object DSxIncidencias: TDataSource
    DataSet = xIncidencias
    Left = 168
    Top = 440
  end
  object DSxFacturasMensual: TDataSource
    DataSet = xFacturasMensual
    Left = 480
    Top = 8
  end
  object xPrevisionAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_acr'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?POR' +
        'CENTAJE_VENTAS, ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 248
    object xPrevisionAnualTOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xPrevisionAnualTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxPrevisionAnual: TDataSource
    DataSet = xPrevisionAnual
    Left = 480
    Top = 248
  end
  object xFacturasAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 104
    object xFacturasAnualTOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnual: TDataSource
    DataSet = xFacturasAnual
    Left = 480
    Top = 104
  end
  object DSxFacturasMensualCompara: TDataSource
    DataSet = xFacturasMensualCompara
    Left = 480
    Top = 56
  end
  object xFacturasMensualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 56
    object xFacturasMensualComparaACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xFacturasMensualComparaB_ENERO: TFloatField
      DisplayLabel = 'B. Enero'
      FieldName = 'B_ENERO'
    end
    object xFacturasMensualComparaL_ENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'L_ENERO'
    end
    object xFacturasMensualComparaB_FEBRERO: TFloatField
      DisplayLabel = 'B. Febrero'
      FieldName = 'B_FEBRERO'
    end
    object xFacturasMensualComparaL_FEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'L_FEBRERO'
    end
    object xFacturasMensualComparaB_MARZO: TFloatField
      DisplayLabel = 'B. Marzo'
      FieldName = 'B_MARZO'
    end
    object xFacturasMensualComparaL_MARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'L_MARZO'
    end
    object xFacturasMensualComparaB_ABRIL: TFloatField
      DisplayLabel = 'B. Abril'
      FieldName = 'B_ABRIL'
    end
    object xFacturasMensualComparaL_ABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'L_ABRIL'
    end
    object xFacturasMensualComparaB_MAYO: TFloatField
      DisplayLabel = 'B. Mayo'
      FieldName = 'B_MAYO'
    end
    object xFacturasMensualComparaL_MAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'L_MAYO'
    end
    object xFacturasMensualComparaB_JUNIO: TFloatField
      DisplayLabel = 'B. Junio'
      FieldName = 'B_JUNIO'
    end
    object xFacturasMensualComparaL_JUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'L_JUNIO'
    end
    object xFacturasMensualComparaB_JULIO: TFloatField
      DisplayLabel = 'B. Julio'
      FieldName = 'B_JULIO'
    end
    object xFacturasMensualComparaL_JULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'L_JULIO'
    end
    object xFacturasMensualComparaB_AGOSTO: TFloatField
      DisplayLabel = 'B. Agostro'
      FieldName = 'B_AGOSTO'
    end
    object xFacturasMensualComparaL_AGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'L_AGOSTO'
    end
    object xFacturasMensualComparaB_SEPTIEMBRE: TFloatField
      DisplayLabel = 'B. Septiembre'
      FieldName = 'B_SEPTIEMBRE'
    end
    object xFacturasMensualComparaL_SEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'L_SEPTIEMBRE'
    end
    object xFacturasMensualComparaB_OCTUBRE: TFloatField
      DisplayLabel = 'B. Octubre'
      FieldName = 'B_OCTUBRE'
    end
    object xFacturasMensualComparaL_OCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'L_OCTUBRE'
    end
    object xFacturasMensualComparaB_NOVIEMBRE: TFloatField
      DisplayLabel = 'B. Noviembre'
      FieldName = 'B_NOVIEMBRE'
    end
    object xFacturasMensualComparaL_NOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'L_NOVIEMBRE'
    end
    object xFacturasMensualComparaB_DICIEMBRE: TFloatField
      DisplayLabel = 'B. Diciembre'
      FieldName = 'B_DICIEMBRE'
    end
    object xFacturasMensualComparaL_DICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'L_DICIEMBRE'
    end
  end
  object xPrevisionMensual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_acr'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?POR' +
        'CENTAJE_VENTAS,  ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 200
    object xPrevisionMensualB_ENERO: TFloatField
      DisplayLabel = 'B. Enero'
      FieldName = 'B_ENERO'
    end
    object xPrevisionMensualL_ENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'L_ENERO'
    end
    object xPrevisionMensualB_FEBRERO: TFloatField
      DisplayLabel = 'B. Febrero'
      FieldName = 'B_FEBRERO'
    end
    object xPrevisionMensualL_FEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'L_FEBRERO'
    end
    object xPrevisionMensualB_MARZO: TFloatField
      DisplayLabel = 'B. Marzo'
      FieldName = 'B_MARZO'
    end
    object xPrevisionMensualL_MARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'L_MARZO'
    end
    object xPrevisionMensualB_ABRIL: TFloatField
      DisplayLabel = 'B. Abril'
      FieldName = 'B_ABRIL'
    end
    object xPrevisionMensualL_ABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'L_ABRIL'
    end
    object xPrevisionMensualB_MAYO: TFloatField
      DisplayLabel = 'B. Mayo'
      FieldName = 'B_MAYO'
    end
    object xPrevisionMensualL_MAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'L_MAYO'
    end
    object xPrevisionMensualB_JUNIO: TFloatField
      DisplayLabel = 'B. Junio'
      FieldName = 'B_JUNIO'
    end
    object xPrevisionMensualL_JUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'L_JUNIO'
    end
    object xPrevisionMensualB_JULIO: TFloatField
      DisplayLabel = 'B. Julio'
      FieldName = 'B_JULIO'
    end
    object xPrevisionMensualL_JULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'L_JULIO'
    end
    object xPrevisionMensualB_AGOSTO: TFloatField
      DisplayLabel = 'B. Agostro'
      FieldName = 'B_AGOSTO'
    end
    object xPrevisionMensualL_AGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'L_AGOSTO'
    end
    object xPrevisionMensualB_SEPTIEMBRE: TFloatField
      DisplayLabel = 'B. Septiembre'
      FieldName = 'B_SEPTIEMBRE'
    end
    object xPrevisionMensualL_SEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'L_SEPTIEMBRE'
    end
    object xPrevisionMensualB_OCTUBRE: TFloatField
      DisplayLabel = 'B. Octubre'
      FieldName = 'B_OCTUBRE'
    end
    object xPrevisionMensualL_OCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'L_OCTUBRE'
    end
    object xPrevisionMensualB_NOVIEMBRE: TFloatField
      DisplayLabel = 'B. Noviembre'
      FieldName = 'B_NOVIEMBRE'
    end
    object xPrevisionMensualL_NOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'L_NOVIEMBRE'
    end
    object xPrevisionMensualB_DICIEMBRE: TFloatField
      DisplayLabel = 'B. Diciembre'
      FieldName = 'B_DICIEMBRE'
    end
    object xPrevisionMensualL_DICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'L_DICIEMBRE'
    end
  end
  object DSxPrevisionMensual: TDataSource
    DataSet = xPrevisionMensual
    Left = 480
    Top = 200
  end
  object xFacturasMensual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    AutoCommit = True
    Left = 376
    Top = 8
    object xFacturasMensualACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xFacturasMensualB_ENERO: TFloatField
      DisplayLabel = 'B. Enero'
      FieldName = 'B_ENERO'
    end
    object xFacturasMensualL_ENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'L_ENERO'
    end
    object xFacturasMensualB_FEBRERO: TFloatField
      DisplayLabel = 'B. Febrero'
      FieldName = 'B_FEBRERO'
    end
    object xFacturasMensualL_FEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'L_FEBRERO'
    end
    object xFacturasMensualB_MARZO: TFloatField
      DisplayLabel = 'B. Marzo'
      FieldName = 'B_MARZO'
    end
    object xFacturasMensualL_MARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'L_MARZO'
    end
    object xFacturasMensualB_ABRIL: TFloatField
      DisplayLabel = 'B. Abril'
      FieldName = 'B_ABRIL'
    end
    object xFacturasMensualL_ABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'L_ABRIL'
    end
    object xFacturasMensualB_MAYO: TFloatField
      DisplayLabel = 'B. Mayo'
      FieldName = 'B_MAYO'
    end
    object xFacturasMensualL_MAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'L_MAYO'
    end
    object xFacturasMensualB_JUNIO: TFloatField
      DisplayLabel = 'B. Junio'
      FieldName = 'B_JUNIO'
    end
    object xFacturasMensualL_JUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'L_JUNIO'
    end
    object xFacturasMensualB_JULIO: TFloatField
      DisplayLabel = 'B. Julio'
      FieldName = 'B_JULIO'
    end
    object xFacturasMensualL_JULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'L_JULIO'
    end
    object xFacturasMensualB_AGOSTO: TFloatField
      DisplayLabel = 'B. Agostro'
      FieldName = 'B_AGOSTO'
    end
    object xFacturasMensualL_AGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'L_AGOSTO'
    end
    object xFacturasMensualB_SEPTIEMBRE: TFloatField
      DisplayLabel = 'B. Septiembre'
      FieldName = 'B_SEPTIEMBRE'
    end
    object xFacturasMensualL_SEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'L_SEPTIEMBRE'
    end
    object xFacturasMensualB_OCTUBRE: TFloatField
      DisplayLabel = 'B. Octubre'
      FieldName = 'B_OCTUBRE'
    end
    object xFacturasMensualL_OCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'L_OCTUBRE'
    end
    object xFacturasMensualB_NOVIEMBRE: TFloatField
      DisplayLabel = 'B. Noviembre'
      FieldName = 'B_NOVIEMBRE'
    end
    object xFacturasMensualL_NOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'L_NOVIEMBRE'
    end
    object xFacturasMensualB_DICIEMBRE: TFloatField
      DisplayLabel = 'B. Diciembre'
      FieldName = 'B_DICIEMBRE'
    end
    object xFacturasMensualL_DICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'L_DICIEMBRE'
    end
  end
  object xFacturasAnualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 152
    object xFacturasAnualComparaTOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualComparaTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualCompara: TDataSource
    DataSet = xFacturasAnualCompara
    Left = 480
    Top = 152
  end
  object DSxMonedas: TDataSource
    Left = 480
    Top = 296
  end
  object xFacturasAnualC_1: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 344
    object xFacturasAnualC_1TOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualC_1TOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualC_1: TDataSource
    DataSet = xFacturasAnualC_1
    Left = 480
    Top = 344
  end
  object xFacturasAnualC_2: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 392
    object xFacturasAnualC_2TOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualC_2TOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualC_2: TDataSource
    DataSet = xFacturasAnualC_2
    Left = 480
    Top = 392
  end
  object xFacturasAnualC_3: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_acreedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?ACREEDOR,  ?MODO, ?MONEDA, ?TIP' +
        'O, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 440
    object xFacturasAnualC_3TOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualC_3TOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualC_3: TDataSource
    DataSet = xFacturasAnualC_3
    Left = 480
    Top = 440
  end
  object xMonedas: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from sys_monedas')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 376
    Top = 296
    object xMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object xFactPend: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from g_estado_recibos '
      '(?Empresa, ?Ejercicio, ?Canal, ?Acreedor,  ?Moneda, '#39'FCR'#39', 1)')
    UniDirectional = True
    DataSource = DSQMAcreedores
    Left = 72
    Top = 488
    object xFactPendN_PAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'N_PAGADO'
    end
    object xFactPendT_PAGADO: TFloatField
      DisplayLabel = 'T. Pagado'
      FieldName = 'T_PAGADO'
    end
    object xFactPendN_IMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'N_IMPAGADO'
    end
    object xFactPendT_IMPAGADO: TFloatField
      DisplayLabel = 'Total Impagado'
      FieldName = 'T_IMPAGADO'
    end
    object xFactPendN_PEND_COBRAR: TIntegerField
      DisplayLabel = 'Pend. Cobrar'
      FieldName = 'N_PEND_COBRAR'
    end
    object xFactPendT_PEND_COBRAR: TFloatField
      DisplayLabel = 'Total Pend. Cobrar'
      FieldName = 'T_PEND_COBRAR'
    end
    object xFactPendN_PEND_RECIBIR: TIntegerField
      DisplayLabel = 'Pend. Recibir'
      FieldName = 'N_PEND_RECIBIR'
    end
    object xFactPendT_PEND_RECIBIR: TFloatField
      DisplayLabel = 'Total Pend. Recibir'
      FieldName = 'T_PEND_RECIBIR'
    end
    object xFactPendMEDIA_DIAS_PAGO: TIntegerField
      DisplayLabel = 'Media Dias Pago'
      FieldName = 'MEDIA_DIAS_PAGO'
    end
    object xFactPendMEDIA_DIAS_REC: TIntegerField
      DisplayLabel = 'Medias Dias Rec.'
      FieldName = 'MEDIA_DIAS_REC'
    end
  end
  object DSxfactPend: TDataSource
    DataSet = xFactPend
    Left = 168
    Top = 488
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 168
    Top = 536
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from g_estado_recibos '
      '(?Empresa, ?Ejercicio, ?Canal, ?Acreedor,  ?Moneda, '#39'FCR'#39', 2)')
    UniDirectional = True
    DataSource = DSQMAcreedores
    Left = 72
    Top = 536
    object xDocumentosT_PAGADO: TFloatField
      DisplayLabel = 'T. Pagado'
      FieldName = 'T_PAGADO'
    end
    object xDocumentosT_PEND_COBRAR: TFloatField
      DisplayLabel = 'Total Pend. Cobrar'
      FieldName = 'T_PEND_COBRAR'
    end
    object xDocumentosT_PEND_RECIBIR: TFloatField
      DisplayLabel = 'Total Pend. Recibir'
      FieldName = 'T_PEND_RECIBIR'
    end
    object xDocumentosCUENTA_PEND: TFIBStringField
      DisplayLabel = 'Cta. Pend.'
      FieldName = 'CUENTA_PEND'
      Size = 15
    end
    object xDocumentosCUENTA_ANTICIPO: TFIBStringField
      DisplayLabel = 'Cta. Anticipo'
      FieldName = 'CUENTA_ANTICIPO'
      Size = 15
    end
    object xDocumentosN_FAC_PEND: TIntegerField
      DisplayLabel = 'Fac. Pdte.'
      FieldName = 'N_FAC_PEND'
    end
    object xDocumentosB_FAC_PEND: TFloatField
      DisplayLabel = 'B Fac. Pend'
      FieldName = 'B_FAC_PEND'
    end
    object xDocumentosT_FAC_PEND: TFloatField
      DisplayLabel = 'Total Fac. Pend.'
      FieldName = 'T_FAC_PEND'
    end
    object xDocumentosN_PEND_COBRAR: TIntegerField
      DisplayLabel = 'Pend. Cobrar'
      FieldName = 'N_PEND_COBRAR'
    end
    object xDocumentosN_PEND_RECIBIR: TIntegerField
      DisplayLabel = 'Pend. Recibir'
      FieldName = 'N_PEND_RECIBIR'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 56
  end
  object xComunicaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_COMUNICACIONES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_COMUNICACIONES'
      
        '  (ID,EMPRESA,TIPO,COD_CLI_PRO,FECHA_CREACION,FECHA_MODIFICACION' +
        ',ARCHIVO,DESCRIPCION)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?TIPO,?COD_CLI_PRO,?FECHA_CREACION,?FECHA_MODIFI' +
        'CACION,?ARCHIVO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_COMUNICACIONES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COMUNICACIONES'
      'WHERE'
      ' EMPRESA=?EMPRESA AND'
      ' TIPO='#39'ACR'#39' AND'
      ' COD_CLI_PRO=?ACREEDOR'
      ' ORDER BY ID desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_COMUNICACIONES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TIPO=?TIPO '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_MODIFICACION=?FECHA_MODIFICACION '
      '  ,ARCHIVO=?ARCHIVO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMAcreedores
    Plan.Strings = (
      ' ')
    BeforePost = xComunicacionesBeforePost
    OnNewRecord = xComunicacionesNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_COMUNICACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 376
    Top = 488
    object xComunicacionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xComunicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xComunicacionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xComunicacionesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLI_PRO'
    end
    object xComunicacionesARCHIVO: TFIBStringField
      DisplayLabel = 'Archivo'
      FieldName = 'ARCHIVO'
      Size = 100
    end
    object xComunicacionesFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fecha Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object xComunicacionesFECHA_MODIFICACION: TDateTimeField
      DisplayLabel = 'Fecha Modificacion'
      FieldName = 'FECHA_MODIFICACION'
    end
    object xComunicacionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
  end
  object DSxComunicaciones: TDataSource
    DataSet = xComunicaciones
    Left = 480
    Top = 488
  end
  object xTipoNCF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF'
      'WHERE'
      'TIPO_NCF=?TIPO_NCF')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF '
      'WHERE TIPO_DOCUMENTO IN (0, 1)'
      'ORDER BY TIPO_NCF')
    UniDirectional = False
    Left = 376
    Top = 536
    object xTipoNCFTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object xTipoNCFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTipoNCF: TDataSource
    DataSet = xTipoNCF
    Left = 480
    Top = 536
  end
  object xTipoTrans: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'from SYS_TIPOS_TRANSPORTE'
      'where tipo=?intra_trans')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 72
    Top = 584
    object xTipoTransTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xTipoTransTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTipoTrans: TDataSource
    DataSet = xTipoTrans
    Left = 168
    Top = 584
  end
  object xPais: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'from SYS_PAISES'
      'where pais_c2=?pais_c2')
    UniDirectional = False
    DataSource = DSQMAcreedores
    Left = 376
    Top = 584
    object xPaisPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xPaisTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPaisPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xPaisPAIS_N3: TFIBStringField
      DisplayLabel = 'Pais N3'
      FieldName = 'PAIS_N3'
      Size = 3
    end
    object xPaisCODIGO_TEL: TFIBStringField
      DisplayLabel = 'Cod. Tel.'
      FieldName = 'CODIGO_TEL'
      Size = 4
    end
    object xPaisIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
  end
  object DSxPais: TDataSource
    DataSet = xPais
    Left = 480
    Top = 584
  end
  object xTarifaPortes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TARIFA_PORTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ACREEDOR=?old_ACREEDOR AND '
      '  ZONA=?old_ZONA AND '
      '  PAIS=?old_PAIS AND '
      '  CODIGO_POSTAL_INI=?old_CODIGO_POSTAL_INI AND '
      '  CODIGO_POSTAL_FIN=?old_CODIGO_POSTAL_FIN ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TARIFA_PORTES'
      
        '  (IMPORTE,IMPORTE_RMB,ACREEDOR,EMPRESA,EJERCICIO,CANAL,TITULO,Z' +
        'ONA,PAIS,CODIGO_POSTAL_INI,CODIGO_POSTAL_FIN)'
      'VALUES'
      
        '  (?IMPORTE,?IMPORTE_RMB,?ACREEDOR,?EMPRESA,?EJERCICIO,?CANAL,?T' +
        'ITULO,?ZONA,?PAIS,?CODIGO_POSTAL_INI,?CODIGO_POSTAL_FIN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TARIFA_PORTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ACREEDOR=?ACREEDOR AND '
      '  ZONA=?old_ZONA AND '
      '  PAIS=?old_PAIS AND '
      '  CODIGO_POSTAL_INI=?old_CODIGO_POSTAL_INI AND '
      '  CODIGO_POSTAL_FIN=?old_CODIGO_POSTAL_FIN ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TARIFA_PORTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ACREEDOR=?ACREEDOR'
      'ORDER BY ZONA, PAIS, CODIGO_POSTAL_INI, CODIGO_POSTAL_FIN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TARIFA_PORTES'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,IMPORTE_RMB=?IMPORTE_RMB '
      '  ,TITULO=?TITULO '
      '  ,ZONA=?new_ZONA'
      '  ,PAIS=?new_PAIS'
      '  ,CODIGO_POSTAL_INI=?new_CODIGO_POSTAL_INI  '
      '  ,CODIGO_POSTAL_FIN=?new_CODIGO_POSTAL_FIN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ACREEDOR=?ACREEDOR AND '
      '  ZONA=?old_ZONA AND '
      '  PAIS=?old_PAIS AND '
      '  CODIGO_POSTAL_INI=?old_CODIGO_POSTAL_INI AND '
      '  CODIGO_POSTAL_FIN=?old_CODIGO_POSTAL_FIN '
      ' ')
    DataSource = DSQMAcreedores
    OnNewRecord = xTarifaPortesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ACREEDOR '
      'ZONA '
      'PAIS '
      'CODIGO_POSTAL_INI '
      'CODIGO_POSTAL_FIN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TARIFA_PORTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 632
    object xTarifaPortesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTarifaPortesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTarifaPortesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTarifaPortesACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xTarifaPortesZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object xTarifaPortesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTarifaPortesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xTarifaPortesIMPORTE_RMB: TFloatField
      DisplayLabel = 'Importe Reembolso'
      FieldName = 'IMPORTE_RMB'
    end
    object xTarifaPortesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xTarifaPortesTITULO_PAIS: TFIBStringField
      DisplayLabel = 'Titulo Pais'
      FieldName = 'TITULO_PAIS'
      Size = 60
    end
    object xTarifaPortesCODIGO_POSTAL_INI: TFIBStringField
      DisplayLabel = 'Cod. Postal Ini'
      FieldName = 'CODIGO_POSTAL_INI'
      Size = 10
    end
    object xTarifaPortesCODIGO_POSTAL_FIN: TFIBStringField
      DisplayLabel = 'Cod. Postal Fin'
      FieldName = 'CODIGO_POSTAL_FIN'
      Size = 10
    end
  end
  object DSxTarifaPortes: TDataSource
    DataSet = xTarifaPortes
    Left = 168
    Top = 632
  end
  object DSxCompras: TDataSource
    DataSet = xCompras
    Left = 480
    Top = 632
  end
  object xCompras: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DOCUMENTOS_ACREEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DOCUMENTOS_ACREEDOR'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'ACREEDOR = :ACREEDOR'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSQMAcreedores
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_DOCUMENTOS_ACREEDOR'
    Left = 376
    Top = 632
    object xComprasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xComprasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xComprasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xComprasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xComprasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xComprasRIG: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'RIG'
    end
    object xComprasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xComprasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xComprasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xComprasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xComprasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xComprasBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xComprasLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xComprasBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xComprasI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Linea'
      FieldName = 'I_DTO_LINEAS'
    end
    object xComprasS_BASES: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'S_BASES'
    end
    object xComprasS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xComprasS_CUOTA_RE: TFloatField
      DisplayLabel = 'Cuota R.E.'
      FieldName = 'S_CUOTA_RE'
    end
    object xComprasB_DTO_LINEAS: TFloatField
      DisplayLabel = 'Base Dto. Linea'
      FieldName = 'B_DTO_LINEAS'
    end
    object xComprasDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP.'
      FieldName = 'DTO_PP'
    end
    object xComprasDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xComprasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xComprasI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xComprasI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xComprasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xComprasPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xComprasI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xComprasFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO'
      Size = 3
    end
    object xComprasI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Moneda'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xComprasS_BASES_CANAL: TFloatField
      DisplayLabel = 'Base Moneda'
      FieldName = 'S_BASES_CANAL'
    end
    object xComprasS_CUOTA_IVA_CANAL: TFloatField
      DisplayLabel = 'Cuota IVA Moneda'
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object xComprasS_CUOTA_RE_CANAL: TFloatField
      DisplayLabel = 'Cuota R.E. Moneda'
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object xComprasLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Moneda'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xComprasCHG_MONEDA: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CHG_MONEDA'
    end
    object xComprasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xComprasID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xComprasMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'MODIFICA_DOC'
    end
    object xComprasFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object xComprasI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xComprasPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object xComprasTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xComprasI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Moneda'
      FieldName = 'I_PORTES_CANAL'
    end
    object xComprasCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xComprasVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio'
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object xComprasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Auto'
      FieldName = 'PROCESO_AUTO'
    end
    object xComprasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xComprasPERMITIR_SUPERAR_IMPORTE_KRI: TIntegerField
      DisplayLabel = 'Permite Superar Riesgo'
      FieldName = 'PERMITIR_SUPERAR_IMPORTE_KRI'
    end
    object xComprasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xComprasACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xComprasNUM_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Nro. Doc. Acr.'
      FieldName = 'NUM_DOCUMENTO'
      Size = 40
    end
  end
  object DSxComprasDetalle: TDataSource
    DataSet = xComprasDetalle
    Left = 480
    Top = 680
  end
  object xComprasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT * FROM VER_DOCUMENTOS_ACREEDOR_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND'
      '  LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DOCUMENTOS_ACREEDOR_DET'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ACREEDOR = :ACREEDOR AND'
      'TERCERO = :TERCERO'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSQMAcreedores
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA'#13)
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'VER_DOCUMENTOS_ACREEDOR_DET'
    Left = 376
    Top = 680
    object xComprasDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xComprasDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xComprasDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xComprasDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xComprasDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xComprasDetalleRIG: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'RIG'
    end
    object xComprasDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xComprasDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xComprasDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xComprasDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xComprasDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xComprasDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xComprasDetalleLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xComprasDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xComprasDetalleI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xComprasDetalleS_BASES: TFloatField
      DisplayLabel = 'Bases'
      FieldName = 'S_BASES'
    end
    object xComprasDetalleS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xComprasDetalleS_CUOTA_RE: TFloatField
      DisplayLabel = 'Cuota R.E.'
      FieldName = 'S_CUOTA_RE'
    end
    object xComprasDetalleB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEAS'
    end
    object xComprasDetalleDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object xComprasDetalleDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object xComprasDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xComprasDetalleI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xComprasDetalleI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xComprasDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xComprasDetallePOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xComprasDetalleI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xComprasDetalleFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_DE_PAGO'
      Size = 3
    end
    object xComprasDetalleI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Moneda'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xComprasDetalleS_BASES_CANAL: TFloatField
      DisplayLabel = 'Bases Moneda'
      FieldName = 'S_BASES_CANAL'
    end
    object xComprasDetalleS_CUOTA_IVA_CANAL: TFloatField
      DisplayLabel = 'Cuota IVA Moneda'
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object xComprasDetalleS_CUOTA_RE_CANAL: TFloatField
      DisplayLabel = 'Cuota R.E. Moneda'
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object xComprasDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Moneda'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xComprasDetalleCHG_MONEDA: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CHG_MONEDA'
    end
    object xComprasDetalleSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xComprasDetalleID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xComprasDetalleMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'MODIFICA_DOC'
    end
    object xComprasDetalleFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entr.'
      FieldName = 'FECHA_ENTREGA'
    end
    object xComprasDetalleI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xComprasDetallePOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object xComprasDetalleTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xComprasDetalleI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Moneda'
      FieldName = 'I_PORTES_CANAL'
    end
    object xComprasDetalleCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xComprasDetalleVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object xComprasDetallePROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Automatico'
      FieldName = 'PROCESO_AUTO'
    end
    object xComprasDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xComprasDetallePERMITIR_SUPERAR_IMPORTE_KRI: TIntegerField
      DisplayLabel = 'Permitir Superar Riesgo'
      FieldName = 'PERMITIR_SUPERAR_IMPORTE_KRI'
    end
    object xComprasDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xComprasDetalleACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xComprasDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xComprasDetalleALMACEN_DET: TFIBStringField
      DisplayLabel = 'Alm. Det.'
      FieldName = 'ALMACEN_DET'
      Size = 3
    end
    object xComprasDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xComprasDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xComprasDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xComprasDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xComprasDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DESCUENTO'
    end
    object xComprasDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xComprasDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xComprasDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xComprasDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xComprasDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xComprasDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Recargo'
      FieldName = 'P_RECARGO'
    end
    object xComprasDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object xComprasDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xComprasDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xComprasDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object xComprasDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_RECARGO'
    end
    object xComprasDetalleT_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'T_COSTE'
    end
    object xComprasDetalleM_BRUTO: TFloatField
      DisplayLabel = 'Margen Bruto'
      FieldName = 'M_BRUTO'
    end
    object xComprasDetalleNOTAS_DET: TBlobField
      DisplayLabel = 'Notas Det.'
      FieldName = 'NOTAS_DET'
      Size = 8
    end
    object xComprasDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object xComprasDetalleID_C_A: TIntegerField
      DisplayLabel = 'Id Art Cta.'
      FieldName = 'ID_C_A'
    end
    object xComprasDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xComprasDetalleID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'Id Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object xComprasDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xComprasDetalleBULTOS_DET: TFloatField
      DisplayLabel = 'Bultos Det.'
      FieldName = 'BULTOS_DET'
    end
    object xComprasDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xComprasDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object xComprasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object xComprasDetallePROYECTO_DET: TIntegerField
      DisplayLabel = 'Proyecto Det.'
      FieldName = 'PROYECTO_DET'
    end
    object xComprasDetalleNOTAS_DET2: TBlobField
      DisplayLabel = 'Notas 2 Det.'
      FieldName = 'NOTAS_DET2'
      Size = 8
    end
    object xComprasDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas Det'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xComprasDetalleCRC_NOTAS_DET2: TFIBStringField
      DisplayLabel = 'CRC Notas 2 Det'
      FieldName = 'CRC_NOTAS_DET2'
      Size = 15
    end
    object xComprasDetalleID_DETALLES_E_REGALO: TIntegerField
      DisplayLabel = 'Id Det. Doc. Regalo'
      FieldName = 'ID_DETALLES_E_REGALO'
    end
    object xComprasDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
  end
  object xTipoGiro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_ACREEDORES_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?old_CODIGO_GIRO AND '
      '  ACREEDOR=?old_ACREEDOR AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_ACREEDORES_GIROS'
      
        '  (EMPRESA,ACREEDOR,CODIGO_GIRO,ID_TIPO_GIRO,ID_ACREEDOR,DEFECTO' +
        ')'
      'VALUES'
      
        '  (?EMPRESA,?ACREEDOR,?CODIGO_GIRO,?ID_TIPO_GIRO,?ID_ACREEDOR,?D' +
        'EFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_ACREEDORES_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  ACREEDOR=?ACREEDOR AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  A.*, T.TITULO'
      'FROM EMP_ACREEDORES_GIROS A'
      'JOIN SYS_TIPO_GIRO T'
      'ON A.CODIGO_GIRO = T.CODIGO'
      'WHERE'
      '  A.EMPRESA=?EMPRESA AND'
      '  A.ACREEDOR=?ACREEDOR'
      'ORDER BY A.CODIGO_GIRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_ACREEDORES_GIROS'
      'SET'
      '  ID_TIPO_GIRO=?ID_TIPO_GIRO '
      '  ,ID_ACREEDOR=?ID_ACREEDOR '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  ACREEDOR=?ACREEDOR AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMAcreedores
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterPost = xTipoGiroAfterPost
    BeforeDelete = xTipoGiroBeforeDelete
    OnNewRecord = xTipoGiroNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO_GIRO '
      'ACREEDOR '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_ACREEDORES_GIROS'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 680
    object xTipoGiroEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTipoGiroACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xTipoGiroCODIGO_GIRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_GIRO'
    end
    object xTipoGiroDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object xTipoGiroTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object DSxTipoGiro: TDataSource
    DataSet = xTipoGiro
    Left = 168
    Top = 680
  end
  object xAvisos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      'TIPO_OBJETO, ID_OBJETO, ACTIVO_FCR, MENSAJE_FCR)'
      'VALUES ('
      #39'ACR'#39', :ID_OBJETO, :ACTIVO_FCR, :MENSAJE_FCR)'
      'MATCHING (TIPO_OBJETO, ID_OBJETO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_AVISOS'
      'WHERE'
      '  TIPO_OBJETO=?TIPO_OBJETO AND '
      '  ID_OBJETO=?ID_OBJETO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_AVISOS'
      'WHERE'
      'TIPO_OBJETO = '#39'ACR'#39' AND'
      'ID_OBJETO = :ID_ACREEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      'TIPO_OBJETO, ID_OBJETO, ACTIVO_FCR, MENSAJE_FCR)'
      'VALUES ('
      #39'ACR'#39', :ID_OBJETO, :ACTIVO_FCR, :MENSAJE_FCR)'
      'MATCHING (TIPO_OBJETO, ID_OBJETO)')
    DataSource = DSQMAcreedores
    BeforePost = xAvisosBeforePost
    OnNewRecord = xAvisosNewRecord
    ClavesPrimarias.Strings = (
      'TIPO_OBJETO '
      'ID_OBJETO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_AVISOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 584
    Top = 8
    object xAvisosTIPO_OBJETO: TFIBStringField
      FieldName = 'TIPO_OBJETO'
      Size = 3
    end
    object xAvisosID_OBJETO: TIntegerField
      FieldName = 'ID_OBJETO'
    end
    object xAvisosID_AVISO_OFC: TIntegerField
      FieldName = 'ID_AVISO_OFC'
    end
    object xAvisosACTIVO_OFC: TIntegerField
      FieldName = 'ACTIVO_OFC'
    end
    object xAvisosMENSAJE_OFC: TMemoField
      FieldName = 'MENSAJE_OFC'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_PEC: TIntegerField
      FieldName = 'ID_AVISO_PEC'
    end
    object xAvisosACTIVO_PEC: TIntegerField
      FieldName = 'ACTIVO_PEC'
    end
    object xAvisosMENSAJE_PEC: TMemoField
      FieldName = 'MENSAJE_PEC'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_ALB: TIntegerField
      FieldName = 'ID_AVISO_ALB'
    end
    object xAvisosACTIVO_ALB: TIntegerField
      FieldName = 'ACTIVO_ALB'
    end
    object xAvisosMENSAJE_ALB: TMemoField
      FieldName = 'MENSAJE_ALB'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_FAC: TIntegerField
      FieldName = 'ID_AVISO_FAC'
    end
    object xAvisosACTIVO_FAC: TIntegerField
      FieldName = 'ACTIVO_FAC'
    end
    object xAvisosMENSAJE_FAC: TMemoField
      FieldName = 'MENSAJE_FAC'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_OFP: TIntegerField
      FieldName = 'ID_AVISO_OFP'
    end
    object xAvisosACTIVO_OFP: TIntegerField
      FieldName = 'ACTIVO_OFP'
    end
    object xAvisosMENSAJE_OFP: TMemoField
      FieldName = 'MENSAJE_OFP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_OCP: TIntegerField
      FieldName = 'ID_AVISO_OCP'
    end
    object xAvisosACTIVO_OCP: TIntegerField
      FieldName = 'ACTIVO_OCP'
    end
    object xAvisosMENSAJE_OCP: TMemoField
      FieldName = 'MENSAJE_OCP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_PEP: TIntegerField
      FieldName = 'ID_AVISO_PEP'
    end
    object xAvisosACTIVO_PEP: TIntegerField
      FieldName = 'ACTIVO_PEP'
    end
    object xAvisosMENSAJE_PEP: TMemoField
      FieldName = 'MENSAJE_PEP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_ALP: TIntegerField
      FieldName = 'ID_AVISO_ALP'
    end
    object xAvisosACTIVO_ALP: TIntegerField
      FieldName = 'ACTIVO_ALP'
    end
    object xAvisosMENSAJE_ALP: TMemoField
      FieldName = 'MENSAJE_ALP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_FAP: TIntegerField
      FieldName = 'ID_AVISO_FAP'
    end
    object xAvisosACTIVO_FAP: TIntegerField
      FieldName = 'ACTIVO_FAP'
    end
    object xAvisosMENSAJE_FAP: TMemoField
      FieldName = 'MENSAJE_FAP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_FCR: TIntegerField
      FieldName = 'ID_AVISO_FCR'
    end
    object xAvisosACTIVO_FCR: TIntegerField
      FieldName = 'ACTIVO_FCR'
    end
    object xAvisosMENSAJE_FCR: TMemoField
      FieldName = 'MENSAJE_FCR'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSxAvisos: TDataSource
    DataSet = xAvisos
    Left = 688
    Top = 8
  end
  object TEstadistica: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 104
  end
end
