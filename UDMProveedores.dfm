object DMProveedores: TDMProveedores
  OldCreateOrder = False
  OnCreate = DMProveedoresCreate
  OnDestroy = DMProveedoresDestroy
  Left = 393
  Top = 160
  Height = 692
  Width = 895
  object QMProveedores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PROVEEDORES_CUENTAS'
      
        '  (NOTAS,FECHA_ISO9000,SERIE_A_FACTURAR,CODIGO_POSTAL,POR_PORTES' +
        ',I_PORTES,FECHA_BAJA,IMPORTE_MINIMO_PORTE,FECHA_ALTA,PROVEEDOR,T' +
        'ERCERO,DESCUENTO,DESCUENTO_PP,POR_FINANCIACION,DIAS_ENTREGA,TRAN' +
        'SPORTISTA,TRANSPORTISTA_RAPIDO,DIAS_TRANSPORTE,DIAS_TRANSPORTE_R' +
        'APIDO,DIAS_CONFIRM_TRANSPORTE,BANCO_PAGOS,GRUPO_CUENTAS,ID_PROVE' +
        'EDOR,EMPRESA,EJERCICIO,CANAL,DIA_PAGO_1,DIA_PAGO_2,MODO_IVA,TITU' +
        'LO,TIPO_IRPF,TIPO,PORTES,NOMBRE_R_SOCIAL,USAR_ANTICIPOS,EVAL_FEB' +
        ',EVAL_FEB_SI,ISO9000,FINANCIACION,FACTURAR_SERIE,FACTURAR_ALMACE' +
        'N,INTRA,INTRA_TRANS,PAIS_C2,TIT_LOCALIDAD,TIPO_PORTES,DISTINGUE_' +
        'REFERENCIA,BLOQUEO,MOTIVO_BLOQUEO,BAJA,MOTIVO_BAJA,TIPO_NCF,RECC' +
        ',PEDIDO_VALORADO,ALBARAN_VALORADO,NIF,DIA_PAGO_3,FORMA_PAGO,CUEN' +
        'TA,PAIS,MONEDA,CUENTA_DTOPP,CUENTA_IRPF,CODIGO_INCOTERM,IDIOMA,C' +
        'UENTA_GASTOS,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,ALFA_6,ALFA_7,AL' +
        'FA_8, PROYECTO, FACTORING)'
      'VALUES'
      
        '  (?NOTAS,?FECHA_ISO9000,?SERIE_A_FACTURAR,?CODIGO_POSTAL,?POR_P' +
        'ORTES,?I_PORTES,?FECHA_BAJA,?IMPORTE_MINIMO_PORTE,?FECHA_ALTA,?P' +
        'ROVEEDOR,?TERCERO,?DESCUENTO,?DESCUENTO_PP,?POR_FINANCIACION,?DI' +
        'AS_ENTREGA,?TRANSPORTISTA,?TRANSPORTISTA_RAPIDO,?DIAS_TRANSPORTE' +
        ',?DIAS_TRANSPORTE_RAPIDO,?DIAS_CONFIRM_TRANSPORTE,?BANCO_PAGOS,?' +
        'GRUPO_CUENTAS,?ID_PROVEEDOR,?EMPRESA,?EJERCICIO,?CANAL,?DIA_PAGO' +
        '_1,?DIA_PAGO_2,?MODO_IVA,?TITULO,?TIPO_IRPF,?TIPO,?PORTES,?NOMBR' +
        'E_R_SOCIAL,?USAR_ANTICIPOS,?EVAL_FEB,?EVAL_FEB_SI,?ISO9000,?FINA' +
        'NCIACION,?FACTURAR_SERIE,?FACTURAR_ALMACEN,?INTRA,?INTRA_TRANS,?' +
        'PAIS_C2,?TIT_LOCALIDAD,?TIPO_PORTES,?DISTINGUE_REFERENCIA,?BLOQU' +
        'EO,?MOTIVO_BLOQUEO,?BAJA,?MOTIVO_BAJA,?TIPO_NCF,?RECC,?PEDIDO_VA' +
        'LORADO,?ALBARAN_VALORADO,?NIF,?DIA_PAGO_3,?FORMA_PAGO,?CUENTA,?P' +
        'AIS,?MONEDA,?CUENTA_DTOPP,?CUENTA_IRPF,?CODIGO_INCOTERM,?IDIOMA,' +
        '?CUENTA_GASTOS,?ALFA_1,?ALFA_2,?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?' +
        'ALFA_7,?ALFA_8, ?PROYECTO, ?FACTORING)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PROVEEDORES_CUENTAS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,FECHA_ISO9000=?FECHA_ISO9000 '
      '  ,SERIE_A_FACTURAR=?SERIE_A_FACTURAR '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,IMPORTE_MINIMO_PORTE=?IMPORTE_MINIMO_PORTE '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,TERCERO=?TERCERO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_PP=?DESCUENTO_PP '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,DIAS_ENTREGA=?DIAS_ENTREGA '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,TRANSPORTISTA_RAPIDO=?TRANSPORTISTA_RAPIDO '
      '  ,DIAS_TRANSPORTE=?DIAS_TRANSPORTE '
      '  ,DIAS_TRANSPORTE_RAPIDO=?DIAS_TRANSPORTE_RAPIDO '
      '  ,DIAS_CONFIRM_TRANSPORTE=?DIAS_CONFIRM_TRANSPORTE '
      '  ,BANCO_PAGOS=?BANCO_PAGOS '
      '  ,GRUPO_CUENTAS=?GRUPO_CUENTAS '
      '  ,ID_PROVEEDOR=?ID_PROVEEDOR '
      '  ,DIA_PAGO_1=?DIA_PAGO_1 '
      '  ,DIA_PAGO_2=?DIA_PAGO_2 '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,TITULO=?TITULO '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,TIPO=?TIPO '
      '  ,PORTES=?PORTES '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,USAR_ANTICIPOS=?USAR_ANTICIPOS '
      '  ,EVAL_FEB=?EVAL_FEB '
      '  ,EVAL_FEB_SI=?EVAL_FEB_SI '
      '  ,ISO9000=?ISO9000 '
      '  ,FINANCIACION=?FINANCIACION '
      '  ,FACTURAR_SERIE=?FACTURAR_SERIE '
      '  ,FACTURAR_ALMACEN=?FACTURAR_ALMACEN '
      '  ,INTRA=?INTRA '
      '  ,INTRA_TRANS=?INTRA_TRANS '
      '  ,PAIS_C2=?PAIS_C2 '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,DISTINGUE_REFERENCIA=?DISTINGUE_REFERENCIA '
      '  ,BLOQUEO=?BLOQUEO '
      '  ,MOTIVO_BLOQUEO=?MOTIVO_BLOQUEO '
      '  ,BAJA=?BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,TIPO_NCF=?TIPO_NCF '
      '  ,RECC=?RECC '
      '  ,PEDIDO_VALORADO=?PEDIDO_VALORADO '
      '  ,ALBARAN_VALORADO=?ALBARAN_VALORADO '
      '  ,NIF=?NIF '
      '  ,DIA_PAGO_3=?DIA_PAGO_3 '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,CUENTA=?CUENTA '
      '  ,PAIS=?PAIS '
      '  ,MONEDA=?MONEDA '
      '  ,CUENTA_DTOPP=?CUENTA_DTOPP '
      '  ,CUENTA_IRPF=?CUENTA_IRPF '
      '  ,CODIGO_INCOTERM=?CODIGO_INCOTERM '
      '  ,IDIOMA=?IDIOMA '
      '  ,CUENTA_GASTOS=?CUENTA_GASTOS'
      '  ,ALFA_1=?ALFA_1  '
      '  ,ALFA_2=?ALFA_2'
      '  ,ALFA_3=?ALFA_3  '
      '  ,ALFA_4=?ALFA_4  '
      '  ,ALFA_5=?ALFA_5  '
      '  ,ALFA_6=?ALFA_6  '
      '  ,ALFA_7=?ALFA_7  '
      '  ,ALFA_8=?ALFA_8  '
      '  ,PROYECTO=?PROYECTO'
      '  , FACTORING=?FACTORING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR ')
    AfterCancel = QMProveedoresAfterCancel
    AfterEdit = QMProveedoresAfterEdit
    AfterOpen = QMProveedoresAfterOpen
    AfterScroll = QMProveedoresAfterScroll
    BeforeClose = QMProveedoresBeforeClose
    BeforeEdit = QMProveedoresBeforeEdit
    BeforePost = QMProveedoresBeforePost
    OnNewRecord = QMProveedoresNewRecord
    OnPostError = QMProveedoresPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PROVEEDORES_CUENTAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'con_cuentas_ges_pro'
      'emp_proveedores pro')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,PROVEEDOR'
      'EMPRESA,PROVEEDOR'
      '')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMProveedoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProveedoresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProveedoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProveedoresPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProveedoresTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMProveedoresTERCEROChange
    end
    object QMProveedoresDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMProveedoresFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMProveedoresFORMA_PAGOChange
      Size = 3
    end
    object QMProveedoresDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMProveedoresDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMProveedoresNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMProveedoresDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMProveedoresTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProveedoresCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMProveedoresPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMProveedoresMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
      OnChange = QMProveedoresMODO_IVAChange
    end
    object QMProveedoresTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
      OnChange = QMProveedoresTIPO_IRPFChange
    end
    object QMProveedoresPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMProveedoresTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMProveedoresTIPOChange
    end
    object QMProveedoresNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProveedoresMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMProveedoresMONEDAChange
      Size = 3
    end
    object QMProveedoresUSAR_ANTICIPOS: TIntegerField
      DisplayLabel = 'Usar Ant.'
      FieldName = 'USAR_ANTICIPOS'
    end
    object QMProveedoresEVAL_FEB: TIntegerField
      DisplayLabel = 'Eval. Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMProveedoresEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval. Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMProveedoresISO9000: TIntegerField
      DisplayLabel = 'ISO 9000'
      FieldName = 'ISO9000'
      OnChange = QMProveedoresISO9000Change
    end
    object QMProveedoresFECHA_ISO9000: TDateTimeField
      DisplayLabel = 'Fecha ISO9000'
      FieldName = 'FECHA_ISO9000'
    end
    object QMProveedoresFINANCIACION: TIntegerField
      DisplayLabel = 'Financ.'
      FieldName = 'FINANCIACION'
    end
    object QMProveedoresPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMProveedoresFACTURAR_SERIE: TIntegerField
      DisplayLabel = 'Fact. Serie'
      FieldName = 'FACTURAR_SERIE'
    end
    object QMProveedoresSERIE_A_FACTURAR: TFIBStringField
      DisplayLabel = 'Serie a Fact.'
      FieldName = 'SERIE_A_FACTURAR'
      Size = 10
    end
    object QMProveedoresFACTURAR_ALMACEN: TIntegerField
      DisplayLabel = 'Fact. Alm.'
      FieldName = 'FACTURAR_ALMACEN'
    end
    object QMProveedoresINTRA: TIntegerField
      DisplayLabel = 'Intra.'
      FieldName = 'INTRA'
    end
    object QMProveedoresINTRA_TRANS: TIntegerField
      DisplayLabel = 'Intra. Trans.'
      FieldName = 'INTRA_TRANS'
      OnChange = QMProveedoresINTRA_TRANSChange
    end
    object QMProveedoresPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      OnChange = QMProveedoresPAIS_C2Change
      Size = 2
    end
    object QMProveedoresDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object QMProveedoresTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMProveedoresCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMProveedoresCUENTA_DTOPP: TFIBStringField
      DisplayLabel = 'Cta. Dto. P.P.'
      FieldName = 'CUENTA_DTOPP'
      OnChange = QMProveedoresCUENTA_DTOPPChange
      Size = 15
    end
    object QMProveedoresTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMProveedoresTRANSPORTISTA_RAPIDO: TIntegerField
      DisplayLabel = 'Transp. Rapido'
      FieldName = 'TRANSPORTISTA_RAPIDO'
    end
    object QMProveedoresDIAS_TRANSPORTE: TIntegerField
      DisplayLabel = 'Dias Transp.'
      FieldName = 'DIAS_TRANSPORTE'
    end
    object QMProveedoresDIAS_TRANSPORTE_RAPIDO: TIntegerField
      DisplayLabel = 'Dias Transp. Rap.'
      FieldName = 'DIAS_TRANSPORTE_RAPIDO'
    end
    object QMProveedoresDIAS_CONFIRM_TRANSPORTE: TIntegerField
      DisplayLabel = 'Dias Conf. Transp.'
      FieldName = 'DIAS_CONFIRM_TRANSPORTE'
    end
    object QMProveedoresTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
      OnChange = QMProveedoresTIPO_PORTESChange
    end
    object QMProveedoresPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMProveedoresI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object QMProveedoresDISTINGUE_REFERENCIA: TIntegerField
      DisplayLabel = 'Distingue Ref.'
      FieldName = 'DISTINGUE_REFERENCIA'
    end
    object QMProveedoresBLOQUEO: TIntegerField
      DisplayLabel = 'Bloqueo'
      FieldName = 'BLOQUEO'
    end
    object QMProveedoresMOTIVO_BLOQUEO: TFIBStringField
      DisplayLabel = 'Motivo Bloq.'
      FieldName = 'MOTIVO_BLOQUEO'
      Size = 40
    end
    object QMProveedoresCODIGO_INCOTERM: TFIBStringField
      DisplayLabel = 'Cod. INCOTERM'
      FieldName = 'CODIGO_INCOTERM'
      Size = 3
    end
    object QMProveedoresBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMProveedoresFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMProveedoresMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object QMProveedoresTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object QMProveedoresIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMProveedoresRECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Critero de Caja'
      FieldName = 'RECC'
    end
    object QMProveedoresBANCO_PAGOS: TIntegerField
      DisplayLabel = 'Banco Pagos'
      FieldName = 'BANCO_PAGOS'
    end
    object QMProveedoresPEDIDO_VALORADO: TIntegerField
      DisplayLabel = 'Valorar Ped.'
      FieldName = 'PEDIDO_VALORADO'
    end
    object QMProveedoresALBARAN_VALORADO: TIntegerField
      DisplayLabel = 'Valorar Alb.'
      FieldName = 'ALBARAN_VALORADO'
    end
    object QMProveedoresGRUPO_CUENTAS: TIntegerField
      DisplayLabel = 'Grupo Cuentas'
      FieldName = 'GRUPO_CUENTAS'
    end
    object QMProveedoresCUENTA_IRPF: TFIBStringField
      DisplayLabel = 'Cuenta IRPF'
      FieldName = 'CUENTA_IRPF'
      Size = 15
    end
    object QMProveedoresNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMProveedoresIMPORTE_MINIMO_PORTE: TFloatField
      DisplayLabel = 'Imp. Min. Porte'
      FieldName = 'IMPORTE_MINIMO_PORTE'
    end
    object QMProveedoresID_PROVEEDOR: TIntegerField
      DisplayLabel = 'Id Prov.'
      FieldName = 'ID_PROVEEDOR'
    end
    object QMProveedoresDIA_PAGO_3: TIntegerField
      DisplayLabel = 'Dia Pago 3'
      FieldName = 'DIA_PAGO_3'
    end
    object QMProveedoresFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMProveedoresCUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMProveedoresALFA_1: TStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMProveedoresALFA_2: TStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMProveedoresALFA_3: TStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMProveedoresALFA_4: TStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMProveedoresALFA_5: TStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMProveedoresALFA_6: TStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMProveedoresALFA_7: TStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMProveedoresALFA_8: TStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMProveedoresTITULO_REGION: TFIBStringField
      DisplayLabel = 'Titulo Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object QMProveedoresTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Titulo Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMProveedoresTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Titulo Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object QMProveedoresTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Titulo Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object QMProveedoresPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMProveedoresFACTORING: TIntegerField
      DisplayLabel = 'Factoring'
      FieldName = 'FACTORING'
    end
  end
  object DSProveedores: TDataSource
    DataSet = QMProveedores
    Left = 128
    Top = 16
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 128
    Top = 64
  end
  object DSIvaModos: TDataSource
    DataSet = xIvaModos
    Left = 128
    Top = 112
  end
  object DSIRPF: TDataSource
    DataSet = xIRPF
    Left = 128
    Top = 160
  end
  object DSxTipoTercero: TDataSource
    DataSet = xTipoTercero
    Left = 128
    Top = 208
  end
  object DSxTipo_T: TDataSource
    DataSet = xTipo_T
    Left = 128
    Top = 256
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 16
  end
  object QMRappel: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROVEEDORES_RAPPEL'
      'WHERE'
      '  IMPORTE=?old_IMPORTE AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROVEEDORES_RAPPEL'
      '  (EMPRESA,EJERCICIO,CANAL,PROVEEDOR,IMPORTE,RAPPEL)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?PROVEEDOR,?IMPORTE,?RAPPEL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROVEEDORES_RAPPEL'
      'WHERE'
      '  IMPORTE=?IMPORTE AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROVEEDORES_RAPPEL'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)and'
      '           (proveedor=?proveedor))'
      'order by importe')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROVEEDORES_RAPPEL'
      'SET'
      '  RAPPEL=?RAPPEL '
      'WHERE'
      '  IMPORTE=?IMPORTE AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSProveedores
    OnNewRecord = QMRappelNewRecord
    ClavesPrimarias.Strings = (
      'IMPORTE '
      'PROVEEDOR '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROVEEDORES_RAPPEL'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 232
    Top = 64
    object QMRappelEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRappelEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRappelCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRappelPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMRappelIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMRappelRAPPEL: TFloatField
      DisplayLabel = 'Rappel'
      FieldName = 'RAPPEL'
    end
  end
  object DSQMRappel: TDataSource
    DataSet = QMRappel
    Left = 344
    Top = 64
  end
  object SPCalculaRappelanual: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure e_emp_proveedores_rappel(?empresa,?ejercicio,?' +
        'canal,?proveedor)')
    Transaction = TLocal
    AutoTrans = True
    Left = 728
    Top = 16
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,FORMA_PAGO FROM CON_CUENTAS_GES_FP'
      '  WHERE EMPRESA=?EMPRESA AND'
      '                 EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL AND FORMA_PAGO=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 40
    Top = 64
  end
  object xIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,MODO FROM SYS_MODO_IVA'
      'WHERE MODO=?MODO_IVA')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 40
    Top = 112
  end
  object xIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO,P_IRPF FROM SYS_TIPO_IRPF'
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 40
    Top = 160
    object xIRPFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object xIRPFP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
  end
  object xTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPOS_TERCERO'
      'where tipo=?tipo')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 40
    Top = 208
  end
  object xTipo_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO FROM SYS_TIPOS_TERCERO'
      'where tipo<>0')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 40
    Top = 256
  end
  object xMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'from sys_monedas'
      'where moneda=?moneda')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 208
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
    Left = 344
    Top = 208
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'P'#39' and '
      'agrupacion not in (select agrupacion from emp_agrupaciones_prov'
      
        '                             where empresa=?empresa and proveedo' +
        'r=?proveedor)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 112
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 344
    Top = 112
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM VER_AGRUPACIONES_PROV'
      'where empresa=?empresa and proveedor=?proveedor'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 160
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 344
    Top = 160
  end
  object xTipoTrans: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'from SYS_TIPOS_TRANSPORTE'
      'where tipo=?intra_trans')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 256
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
    Left = 344
    Top = 256
  end
  object xPais: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'from SYS_PAISES'
      'where pais_c2=?pais_c2')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 304
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
    Left = 344
    Top = 304
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'CUENTA = ?CUENTA_DTOPP'
      'AND PGC = ?PGC')
    UniDirectional = False
    DataSource = DSProveedores
    BeforeOpen = xCuentasBeforeOpen
    Left = 40
    Top = 400
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 128
    Top = 400
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
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'COD_CLI_PRO =  ?PROVEEDOR AND'
      'TIPO_TERCERO = '#39'PRO'#39
      'ORDER BY INCIDENCIA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSProveedores
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
    Left = 40
    Top = 304
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incid.'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Titulo'
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
      DisplayLabel = 'Tipo Ter.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object xIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Incid.'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fec. Respuesta'
      FieldName = 'FECHA_RESPUESTA'
    end
    object xIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Fec. Incid.'
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
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_RIG'
    end
    object xIncidenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xIncidenciasDIRECCION: TIntegerField
      DisplayLabel = 'Dir'
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
      DisplayLabel = 'Dec. Tipo Inc.'
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
    Left = 128
    Top = 304
  end
  object xPortes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from con_cuentas_ges_portes'
      'where empresa=?empresa and ejercicio=?ejercicio and'
      'canal=?canal and tipo=?tipo_portes')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 352
    object xPortesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxPortes: TDataSource
    DataSet = xPortes
    Left = 344
    Top = 352
  end
  object xRangos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos'
      'where empresa=?empresa and rango=?rango')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 400
    object xRangosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRangos: TDataSource
    DataSet = xRangos
    Left = 344
    Top = 400
  end
  object xIndices: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos_indices'
      'where empresa=?empresa and rango=?rango and indice=?indice')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 448
    object xIndicesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxIndices: TDataSource
    DataSet = xIndices
    Left = 344
    Top = 448
  end
  object DSxFacturasMensual: TDataSource
    DataSet = xFacturasMensual
    Left = 584
    Top = 16
  end
  object xPrevisionAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_prev_mens_anu_prov'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?PO' +
        'RCENTAJE_VENTAS,  ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 256
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
    Left = 592
    Top = 256
  end
  object xFacturasAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 112
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
    Left = 592
    Top = 112
  end
  object DSxFacturasMensualCompara: TDataSource
    DataSet = xFacturasMensualCompara
    Left = 592
    Top = 64
  end
  object xFacturasMensualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 64
    object xFacturasMensualComparaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
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
      'select * from g_ventas_prev_mens_anu_prov'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?PO' +
        'RCENTAJE_VENTAS,  ?TIPO, ?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 208
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
    Left = 592
    Top = 208
  end
  object xFacturasMensual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    AutoCommit = True
    Left = 488
    Top = 16
    object xFacturasMensualPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
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
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 160
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
    Left = 592
    Top = 160
  end
  object DSxMonedas: TDataSource
    Left = 592
    Top = 304
  end
  object xFacturasAnualC_1: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 352
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
    Left = 592
    Top = 352
  end
  object xFacturasAnualC_2: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 400
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
    Left = 592
    Top = 400
  end
  object xFacturasAnualC_3: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mens_anu_proveedores'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?PROVEEDOR,  ?MODO, ?MONEDA, ?TI' +
        'PO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 488
    Top = 448
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
    Left = 592
    Top = 448
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
    Left = 488
    Top = 304
    object xMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object xFacPend: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from g_estado_recibos '
      '(?Empresa, ?Ejercicio, ?Canal, ?Proveedor, ?Moneda, '#39'FAP'#39', 1)')
    UniDirectional = True
    DataSource = DSProveedores
    Left = 232
    Top = 544
    object xFacPendN_PAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'N_PAGADO'
    end
    object xFacPendT_PAGADO: TFloatField
      DisplayLabel = 'T. Pagado'
      FieldName = 'T_PAGADO'
    end
    object xFacPendN_IMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'N_IMPAGADO'
    end
    object xFacPendT_IMPAGADO: TFloatField
      DisplayLabel = 'Total Impagado'
      FieldName = 'T_IMPAGADO'
    end
    object xFacPendN_PEND_COBRAR: TIntegerField
      DisplayLabel = 'Pend. Cobrar'
      FieldName = 'N_PEND_COBRAR'
    end
    object xFacPendT_PEND_COBRAR: TFloatField
      DisplayLabel = 'Total Pend. Cobrar'
      FieldName = 'T_PEND_COBRAR'
    end
    object xFacPendN_PEND_RECIBIR: TIntegerField
      DisplayLabel = 'Pend. Recibir'
      FieldName = 'N_PEND_RECIBIR'
    end
    object xFacPendT_PEND_RECIBIR: TFloatField
      DisplayLabel = 'Total Pend. Recibir'
      FieldName = 'T_PEND_RECIBIR'
    end
    object xFacPendMEDIA_DIAS_PAGO: TIntegerField
      DisplayLabel = 'Media Dias Pago'
      FieldName = 'MEDIA_DIAS_PAGO'
    end
    object xFacPendMEDIA_DIAS_REC: TIntegerField
      DisplayLabel = 'Medias Dias Rec.'
      FieldName = 'MEDIA_DIAS_REC'
    end
  end
  object DSxFactPend: TDataSource
    DataSet = xFacPend
    Left = 344
    Top = 544
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 128
    Top = 544
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from g_estado_recibos '
      '(?Empresa, ?Ejercicio, ?Canal, ?Proveedor, ?Moneda, '#39'FAP'#39', 2)')
    UniDirectional = True
    DataSource = DSProveedores
    Left = 40
    Top = 544
    object xDocumentosT_PAGADO: TFloatField
      DisplayLabel = 'T. Pagado'
      FieldName = 'T_PAGADO'
    end
    object xDocumentosN_PEND_COBRAR: TIntegerField
      DisplayLabel = 'Pend. Cobrar'
      FieldName = 'N_PEND_COBRAR'
    end
    object xDocumentosT_PEND_COBRAR: TFloatField
      DisplayLabel = 'Total Pend. Cobrar'
      FieldName = 'T_PEND_COBRAR'
    end
    object xDocumentosN_PEND_RECIBIR: TIntegerField
      DisplayLabel = 'Pend. Recibir'
      FieldName = 'N_PEND_RECIBIR'
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
    object xDocumentosN_PED_PEND: TIntegerField
      DisplayLabel = 'Ped. Pdte.'
      FieldName = 'N_PED_PEND'
    end
    object xDocumentosB_PED_PEND: TFloatField
      DisplayLabel = 'B. Ped. Pend.'
      FieldName = 'B_PED_PEND'
    end
    object xDocumentosT_PED_PEND: TFloatField
      DisplayLabel = 'Total Ped. Pend.'
      FieldName = 'T_PED_PEND'
    end
    object xDocumentosN_ALB_PEND: TIntegerField
      DisplayLabel = 'Alb. Pdte.'
      FieldName = 'N_ALB_PEND'
    end
    object xDocumentosB_ALB_PEND: TFloatField
      DisplayLabel = 'B. Alb. Pend.'
      FieldName = 'B_ALB_PEND'
    end
    object xDocumentosT_ALB_PEND: TFloatField
      DisplayLabel = 'Total Alb. Pend.'
      FieldName = 'T_ALB_PEND'
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
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 344
    Top = 16
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
      ' TIPO='#39'PRO'#39' AND'
      ' COD_CLI_PRO=?CLIENTE'
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
    DataSource = DSProveedores
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
    Left = 40
    Top = 448
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
    Left = 128
    Top = 448
  end
  object DSQMDescuentosKri: TDataSource
    DataSet = QMDescuentosKri
    Left = 128
    Top = 352
  end
  object QMDescuentosKri: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_PRO_DESC_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_PRO_DESC_KRI'
      
        '  (ID,EMPRESA,EJERCICIO,CANAL,PROVEEDOR,DTO_CIAL,IMPORTE,ACTIVO,' +
        'APLICA_PEP,APLICA_ALP,APLICA_FAP)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?CANAL,?PROVEEDOR,?DTO_CIAL,?IMPORTE,' +
        '?ACTIVO,?APLICA_PEP,?APLICA_ALP,?APLICA_FAP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_PRO_DESC_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_PRO_DESC_KRI'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PROVEEDOR=?PROVEEDOR'
      'ORDER BY IMPORTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_PRO_DESC_KRI'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,IMPORTE=?IMPORTE '
      '  ,ACTIVO=?ACTIVO '
      '  ,APLICA_PEP=?APLICA_PEP '
      '  ,APLICA_ALP=?APLICA_ALP '
      '  ,APLICA_FAP=?APLICA_FAP '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSProveedores
    Plan.Strings = (
      ' ')
    BeforePost = QMDescuentosKriBeforePost
    OnNewRecord = QMDescuentosKriNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_PRO_DESC_KRI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 352
    object QMDescuentosKriID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDescuentosKriEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDescuentosKriEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDescuentosKriCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDescuentosKriPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDescuentosKriDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMDescuentosKriIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMDescuentosKriACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMDescuentosKriAPLICA_PEP: TIntegerField
      DisplayLabel = 'Aplica Ped.'
      FieldName = 'APLICA_PEP'
    end
    object QMDescuentosKriAPLICA_ALP: TIntegerField
      DisplayLabel = 'Aplica Alb.'
      FieldName = 'APLICA_ALP'
    end
    object QMDescuentosKriAPLICA_FAP: TIntegerField
      DisplayLabel = 'Aplica Fac.'
      FieldName = 'APLICA_FAP'
    end
  end
  object xIsoPro: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from iso_no_conformidad'
      'where empresa=?empresa and clipro=?proveedor')
    UniDirectional = False
    DataSource = DSProveedores
    Left = 232
    Top = 496
    object xIsoProEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIsoProRIC: TIntegerField
      DisplayLabel = 'Inc.'
      FieldName = 'RIC'
    end
    object xIsoProTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xIsoProCLI_PRO_INTE: TIntegerField
      DisplayLabel = 'CLi./Prov. INTE'
      FieldName = 'CLI_PRO_INTE'
    end
    object xIsoProSITUACION: TFIBStringField
      DisplayLabel = 'Doc.'
      FieldName = 'SITUACION'
      Size = 3
    end
    object xIsoProSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object xIsoProNUM_DOC: TIntegerField
      DisplayLabel = 'Num. Doc.'
      FieldName = 'NUM_DOC'
    end
    object xIsoProDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object xIsoProFECHA_INC: TDateTimeField
      DisplayLabel = 'Fecha Inc.'
      FieldName = 'FECHA_INC'
    end
    object xIsoProRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xIsoProPOR_CLASIFICA: TIntegerField
      DisplayLabel = 'Por Clasificar'
      FieldName = 'POR_CLASIFICA'
    end
    object xIsoProESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xIsoProNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xIsoProTIRAR: TIntegerField
      DisplayLabel = 'Tirar'
      FieldName = 'TIRAR'
    end
    object xIsoProRECUPERAR_ISO: TIntegerField
      DisplayLabel = 'Recuperar ISO'
      FieldName = 'RECUPERAR_ISO'
    end
    object xIsoProDEVOLVER: TIntegerField
      DisplayLabel = 'Devolver'
      FieldName = 'DEVOLVER'
    end
    object xIsoProACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xIsoProOTROS: TIntegerField
      DisplayLabel = 'Otros'
      FieldName = 'OTROS'
    end
    object xIsoProVBCALIDAD: TIntegerField
      DisplayLabel = 'VB Calidad'
      FieldName = 'VBCALIDAD'
    end
    object xIsoProVBRESDEPARTAMENTO: TIntegerField
      DisplayLabel = 'VB Res Dpto.'
      FieldName = 'VBRESDEPARTAMENTO'
    end
    object xIsoProCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xIsoProFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xIsoProNDEVOLUCION: TIntegerField
      DisplayLabel = 'Nro. Dev.'
      FieldName = 'NDEVOLUCION'
    end
    object xIsoProCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xIsoProDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object xIsoProEVIDENCIA: TFIBStringField
      DisplayLabel = 'Evidencia'
      FieldName = 'EVIDENCIA'
      Size = 200
    end
    object xIsoProNDOCCLI: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'NDOCCLI'
    end
    object xIsoProREFERENCIACLI: TFIBStringField
      DisplayLabel = 'Ref. Cli.'
      FieldName = 'REFERENCIACLI'
      Size = 40
    end
    object xIsoProNOTAS_INC: TMemoField
      DisplayLabel = 'Notas Inc.'
      FieldName = 'NOTAS_INC'
      BlobType = ftMemo
      Size = 8
    end
    object xIsoProCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object xIsoProLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xIsoProEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xIsoProCLIPRO: TIntegerField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'CLIPRO'
    end
    object xIsoProCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xIsoProCOSTE_INC: TFloatField
      DisplayLabel = 'Coste Inc.'
      FieldName = 'COSTE_INC'
    end
  end
  object DSxIsoPro: TDataSource
    DataSet = xIsoPro
    Left = 344
    Top = 496
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
    Left = 488
    Top = 496
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
    Left = 592
    Top = 496
  end
  object DSQMPrestaShop: TDataSource
    DataSet = QMPrestaShop
    Left = 128
    Top = 496
  end
  object QMPrestaShop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_PROVEEDOR'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_PROVEEDOR=?old_ID_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_PROVEEDOR'
      '  (ULT_SINCRONIZACION,ID_SUPPLIER,ID_PROVEEDOR,ID_CONFIGURACION)'
      'VALUES'
      
        '  (?ULT_SINCRONIZACION,?ID_SUPPLIER,?ID_PROVEEDOR,?ID_CONFIGURAC' +
        'ION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_PROVEEDOR'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PROVEEDOR=?ID_PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_PROVEEDOR'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PROVEEDOR=?ID_PROVEEDOR ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_PROVEEDOR'
      'SET'
      '  ID_SUPPLIER=?ID_SUPPLIER '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PROVEEDOR=?ID_PROVEEDOR ')
    Plan.Strings = (
      ' ')
    BeforePost = xComunicacionesBeforePost
    OnNewRecord = xComunicacionesNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_PROVEEDOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 496
    object QMPrestaShopID_CONFIGURACION: TIntegerField
      DisplayLabel = 'ID Conf.'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMPrestaShopID_PROVEEDOR: TIntegerField
      DisplayLabel = 'ID Prov.'
      FieldName = 'ID_PROVEEDOR'
    end
    object QMPrestaShopID_SUPPLIER: TIntegerField
      DisplayLabel = 'ID Supplier'
      FieldName = 'ID_SUPPLIER'
    end
    object QMPrestaShopULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
  end
  object DSxCompras: TDataSource
    DataSet = xCompras
    Left = 128
    Top = 592
  end
  object xCompras: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DOCUMENTOS_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DOCUMENTOS_PROVEEDOR'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'PROVEEDOR = :PROVEEDOR'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSProveedores
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_DOCUMENTOS_PROVEEDOR'
    Left = 40
    Top = 592
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
    object xComprasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xComprasNUM_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Nro. Doc. Prov.'
      FieldName = 'NUM_DOCUMENTO'
      Size = 40
    end
  end
  object DSxComprasDetalle: TDataSource
    DataSet = xComprasDetalle
    Left = 344
    Top = 592
  end
  object xComprasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DOCUMENTOS_PROVEEDOR_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DOCUMENTOS_PROVEEDOR_DET'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'PROVEEDOR = :PROVEEDOR'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSProveedores
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'VER_DOCUMENTOS_PROVEEDOR_DET'
    Left = 232
    Top = 592
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
    object xComprasDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
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
    object xComprasDetalleCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Codigo Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object xComprasDetalleUNIDADES_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds. Por Servir'
      FieldName = 'UNIDADES_POR_SERVIR'
    end
  end
  object xTipoGiro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROVEEDORES_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?old_CODIGO_GIRO AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROVEEDORES_GIROS'
      
        '  (EMPRESA,PROVEEDOR,CODIGO_GIRO,ID_TIPO_GIRO,ID_PROVEEDOR,DEFEC' +
        'TO)'
      'VALUES'
      
        '  (?EMPRESA,?PROVEEDOR,?CODIGO_GIRO,?ID_TIPO_GIRO,?ID_PROVEEDOR,' +
        '?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROVEEDORES_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  P.*, T.TITULO'
      'FROM EMP_PROVEEDORES_GIROS P'
      'JOIN SYS_TIPO_GIRO T'
      'ON P.CODIGO_GIRO = T.CODIGO'
      'WHERE'
      '  P.EMPRESA=?EMPRESA AND'
      '  P.PROVEEDOR=?PROVEEDOR'
      'ORDER BY P.CODIGO_GIRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROVEEDORES_GIROS'
      'SET'
      '  ID_TIPO_GIRO=?ID_TIPO_GIRO '
      '  ,ID_PROVEEDOR=?ID_PROVEEDOR '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSProveedores
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterDelete = xTipoGiroAfterDelete
    AfterPost = xTipoGiroAfterPost
    OnNewRecord = xTipoGiroNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO_GIRO '
      'PROVEEDOR '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROVEEDORES_GIROS'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 488
    Top = 544
    object xTipoGiroEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTipoGiroPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
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
    Left = 592
    Top = 544
  end
  object xAvisos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      
        'TIPO_OBJETO, ID_OBJETO, ACTIVO_OFP, MENSAJE_OFP, ACTIVO_OCP, MEN' +
        'SAJE_OCP, ACTIVO_PEP, MENSAJE_PEP, ACTIVO_ALP, MENSAJE_ALP, ACTI' +
        'VO_FAP, MENSAJE_FAP)'
      'VALUES ('
      
        #39'PRO'#39', :ID_OBJETO, :ACTIVO_OFP, :MENSAJE_OFP, :ACTIVO_OCP, :MENS' +
        'AJE_OCP, :ACTIVO_PEP, :MENSAJE_PEP, :ACTIVO_ALP, :MENSAJE_ALP, :' +
        'ACTIVO_FAP, :MENSAJE_FAP)'
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
      'TIPO_OBJETO = '#39'PRO'#39' AND'
      'ID_OBJETO = :ID_PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      
        'TIPO_OBJETO, ID_OBJETO, ACTIVO_OFP, MENSAJE_OFP, ACTIVO_OCP, MEN' +
        'SAJE_OCP, ACTIVO_PEP, MENSAJE_PEP, ACTIVO_ALP, MENSAJE_ALP, ACTI' +
        'VO_FAP, MENSAJE_FAP)'
      'VALUES ('
      
        #39'PRO'#39', :ID_OBJETO, :ACTIVO_OFP, :MENSAJE_OFP, :ACTIVO_OCP, :MENS' +
        'AJE_OCP, :ACTIVO_PEP, :MENSAJE_PEP, :ACTIVO_ALP, :MENSAJE_ALP, :' +
        'ACTIVO_FAP, :MENSAJE_FAP)'
      'MATCHING (TIPO_OBJETO, ID_OBJETO)')
    DataSource = DSProveedores
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
    Left = 488
    Top = 592
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
    Left = 592
    Top = 592
  end
  object TEstadistica: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 728
    Top = 64
  end
  object QMProArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_COD_PROV'
      
        '  (PROVEEDOR,ID_A,EMPRESA,CODIGO_PROVEEDOR,NOMBRE_PROVEEDOR,TITU' +
        'LO_ART,ARTICULO)'
      'VALUES'
      
        '  (?PROVEEDOR,?ID_A,?EMPRESA,?CODIGO_PROVEEDOR,?NOMBRE_PROVEEDOR' +
        ',?TITULO_ART,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_COD_PROV'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'PROVEEDOR=?PROVEEDOR'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_COD_PROV'
      'SET'
      '  ,ID_A=?ID_A '
      '  ,CODIGO_PROVEEDOR=?CODIGO_PROVEEDOR '
      '  ,NOMBRE_PROVEEDOR=?NOMBRE_PROVEEDOR '
      '  ,TITULO_ART=?TITULO_ART '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  PROVEEDOR=?PROVEEDOR ')
    DataSource = DSProveedores
    Plan.Strings = (
      ' ')
    BeforePost = QMProArtBeforePost
    OnNewRecord = QMProArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_COD_PROV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 720
    Top = 144
    object QMProArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProArtARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMProArtARTICULOChange
      Size = 15
    end
    object QMProArtPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProArtCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref.Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object QMProArtNOMBRE_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Nombre Proveedor'
      FieldName = 'NOMBRE_PROVEEDOR'
      Size = 60
    end
    object QMProArtID_A: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_A'
    end
    object QMProArtTITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ART'
      Size = 256
    end
  end
  object DSQMProArt: TDataSource
    DataSet = QMProArt
    Left = 784
    Top = 144
  end
end
