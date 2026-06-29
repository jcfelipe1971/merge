object DMCartera: TDMCartera
  OldCreateOrder = False
  OnCreate = DMCarteraCreate
  OnDestroy = DMCarteraDestroy
  Left = 531
  Top = 187
  Height = 324
  Width = 402
  object QMCartera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA'
      'WHERE'
      '  ID_CARTERA = ?OLD_ID_CARTERA')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,NOMBRE,FECHA_REGISTRO,' +
        'LINEAS,CUENTA,DOC_NUMERO,DOC_SERIE,DOC_FECHA,DOC_TIPO,VALOR,FORM' +
        'A_PAGO,BASES,LIQUIDO,PAGADO,RIC,RIVA,REG_IVA,ESTADO,DIA_PAGO_1,D' +
        'IA_PAGO_2,DIA_PAGO_3,COD_CLI_PRO,ORIGEN_IMPAGADO,ASIENTO,TIPO_AS' +
        'IENTO_KRI,OBSERVACIONES,DIA_SEMANA_PAGO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?NOMBRE,?FECHA_RE' +
        'GISTRO,?LINEAS,?CUENTA,?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?DOC_TI' +
        'PO,?VALOR,?FORMA_PAGO,?BASES,?LIQUIDO,?PAGADO,?RIC,?RIVA,?REG_IV' +
        'A,?ESTADO,?DIA_PAGO_1,?DIA_PAGO_2,?DIA_PAGO_3,?COD_CLI_PRO,?ORIG' +
        'EN_IMPAGADO,?ASIENTO,?TIPO_ASIENTO_KRI,?OBSERVACIONES,?DIA_SEMAN' +
        'A_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA'
      'WHERE'
      '  ID_CARTERA = ?ID_CARTERA')
    SelectSQL.Strings = (
      '/* Se establece en OnCreate */'
      'SELECT'
      '*'
      'FROM VER_CARTERA'
      'WHERE'
      '('
      '    ('
      '    EMPRESA = ?EMPRESA AND'
      '    CANAL = ?CANAL AND'
      '    SIGNO = ?SIGNO'
      '    )'
      '    AND'
      '    ('
      '        ('
      '            EJERCICIO = ?EJERCICIO AND'
      '            EJERCICIO_FINAL < ?EJERCICIO'
      '        )'
      '        OR'
      '        ('
      '            EJERCICIO <= ?EJERCICIO AND'
      '            EJERCICIO_FINAL >= ?EJERCICIO'
      '        )'
      '        OR'
      '        ('
      '            PAGADO <> 1'
      '        )'
      '    )'
      ')'
      'ORDER BY EJERCICIO, REGISTRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,FECHA_REGISTRO=?FECHA_REGISTRO '
      '  ,LINEAS=?LINEAS '
      '  ,CUENTA=?CUENTA '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,DOC_TIPO=?DOC_TIPO '
      '  ,VALOR=?VALOR '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,BASES=?BASES '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,PAGADO=?PAGADO '
      '  ,RIC=?RIC '
      '  ,RIVA=?RIVA '
      '  ,REG_IVA=?REG_IVA '
      '  ,ESTADO=?ESTADO '
      '  ,DIA_PAGO_1=?DIA_PAGO_1 '
      '  ,DIA_PAGO_2=?DIA_PAGO_2 '
      '  ,DIA_PAGO_3=?DIA_PAGO_3 '
      '  ,DIA_SEMANA_PAGO=?DIA_SEMANA_PAGO'
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,ORIGEN_IMPAGADO=?ORIGEN_IMPAGADO '
      '  ,ASIENTO=?ASIENTO '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI'
      '  ,OBSERVACIONES=?OBSERVACIONES'
      'WHERE'
      ' ID_CARTERA = ?ID_CARTERA')
    AfterDelete = BorraCartera
    AfterOpen = QMCarteraAfterOpen
    AfterPost = GrabaCartera
    BeforeClose = QMCarteraBeforeClose
    BeforePost = QMCarteraBeforePost
    OnNewRecord = QMCarteraNewRecord
    ClavesPrimarias.Strings = (
      'ID_CARTERA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 24
    object QMCarteraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCarteraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCarteraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCarteraSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCarteraREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMCarteraNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMCarteraFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_REGISTRO'
    end
    object QMCarteraLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMCarteraCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCarteraDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMCarteraDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMCarteraDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMCarteraDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMCarteraVALOR: TDateTimeField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QMCarteraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCarteraBASES: TFloatField
      DisplayLabel = 'Bases'
      FieldName = 'BASES'
    end
    object QMCarteraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCarteraPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMCarteraRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMCarteraRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object QMCarteraREG_IVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'REG_IVA'
    end
    object QMCarteraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCarteraDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMCarteraDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMCarteraDIA_PAGO_3: TIntegerField
      DisplayLabel = 'Dia Pago 3'
      FieldName = 'DIA_PAGO_3'
    end
    object QMCarteraCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMCarteraORIGEN_IMPAGADO: TIntegerField
      DisplayLabel = 'Orig. Imp.'
      FieldName = 'ORIGEN_IMPAGADO'
    end
    object QMCarteraASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMCarteraTIPO_FACTURA: TStringField
      DisplayLabel = 'Tipo Fra.'
      FieldKind = fkCalculated
      FieldName = 'TIPO_FACTURA'
      OnGetText = QMCarteraTIPO_FACTURAGetText
      Size = 25
      Calculated = True
    end
    object QMCarteraEJERCICIO_FINAL: TIntegerField
      DisplayLabel = 'Ejer. Fin.'
      FieldName = 'EJERCICIO_FINAL'
    end
    object QMCarteraMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCarteraLIQUIDO_MONEDA: TFloatField
      DisplayLabel = 'Liquido Mon.'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_MONEDA'
      OnGetText = QMCarteraLIQUIDO_MONEDAGetText
      Calculated = True
    end
    object QMCarteraC_PAGADA: TFloatField
      DisplayLabel = 'C. Pagada'
      FieldName = 'C_PAGADA'
    end
    object QMCarteraTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO_KRI'
      OnChange = QMCarteraTIPO_ASIENTO_KRIChange
      Size = 3
    end
    object QMCarteraCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMCarteraID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object QMCarteraID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMCarteraTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 60
    end
    object QMCarteraOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
    object QMCarteraDIA_SEMANA_PAGO: TFIBStringField
      DisplayLabel = 'Dia Semana Pago'
      FieldName = 'DIA_SEMANA_PAGO'
      Size = 1
    end
  end
  object DSQMCartera: TDataSource
    DataSet = QMCartera
    Left = 152
    Top = 24
  end
  object QMCarteraDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_CARTERA_DETALLE'
      'WHERE'
      '  ID_CARTERA_DETALLE=?old_ID_CARTERA_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_CARTERA_DETALLE'
      
        '  (VENCIMIENTO,LIQUIDO,ANTICIPADO,LIQUIDO_CANAL,FECHA_RECIBIDO,F' +
        'ECHA_VALOR,REGISTRO,LINEA,REMESA,ID_CARTERA,ID_CARTERA_DETALLE,I' +
        'D_REMESAS,CONFIRMING,ORD_PAGO,DOC_AUTOMATICO,EMPRESA,EJERCICIO,C' +
        'ANAL,PAGADO,REMESAR,RECIBIDO,EJERCICIO_CONFIRMING,EJERCICIO_ORD_' +
        'PAGO,RETENCION,TIPO_RETENCION,OBSERVACIONES,BANCO_CLIPRO,SIGNO,C' +
        'TA_PAGO,TIPO_EFECTO,DOCUMENTO,MONEDA,MONEDA_CANAL,FORMA_PAGO,RIC' +
        ',FECHA_CIERRE,RESPONSABLE,CARTA1,CARTA2,CARTA3,CARTA4,CARTA5)'
      'VALUES'
      
        '  (?VENCIMIENTO,?LIQUIDO,?ANTICIPADO,?LIQUIDO_CANAL,?FECHA_RECIB' +
        'IDO,?FECHA_VALOR,?REGISTRO,?LINEA,?REMESA,?ID_CARTERA,?ID_CARTER' +
        'A_DETALLE,?ID_REMESAS,?CONFIRMING,?ORD_PAGO,?DOC_AUTOMATICO,?EMP' +
        'RESA,?EJERCICIO,?CANAL,?PAGADO,?REMESAR,?RECIBIDO,?EJERCICIO_CON' +
        'FIRMING,?EJERCICIO_ORD_PAGO,?RETENCION,?TIPO_RETENCION,?OBSERVAC' +
        'IONES,?BANCO_CLIPRO,?SIGNO,?CTA_PAGO,?TIPO_EFECTO,?DOCUMENTO,?MO' +
        'NEDA,?MONEDA_CANAL,?FORMA_PAGO,?RIC,?FECHA_CIERRE,?RESPONSABLE,?' +
        'CARTA1,?CARTA2,?CARTA3,?CARTA4,?CARTA5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CARTERA_DETALLE'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CARTERA_DETALLE'
      'WHERE '
      'ID_CARTERA = ?ID_CARTERA'
      'ORDER BY VENCIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CARTERA_DETALLE'
      'SET'
      '  VENCIMIENTO=?VENCIMIENTO '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,ANTICIPADO=?ANTICIPADO '
      '  ,LIQUIDO_CANAL=?LIQUIDO_CANAL '
      '  ,FECHA_RECIBIDO=?FECHA_RECIBIDO '
      '  ,FECHA_VALOR=?FECHA_VALOR '
      '  ,REGISTRO=?REGISTRO '
      '  ,LINEA=?LINEA '
      '  ,REMESA=?REMESA '
      '  ,ID_CARTERA=?ID_CARTERA '
      '  ,ID_REMESAS=?ID_REMESAS '
      '  ,CONFIRMING=?CONFIRMING '
      '  ,ORD_PAGO=?ORD_PAGO '
      '  ,DOC_AUTOMATICO=?DOC_AUTOMATICO '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PAGADO=?PAGADO '
      '  ,REMESAR=?REMESAR '
      '  ,RECIBIDO=?RECIBIDO '
      '  ,EJERCICIO_CONFIRMING=?EJERCICIO_CONFIRMING '
      '  ,EJERCICIO_ORD_PAGO=?EJERCICIO_ORD_PAGO '
      '  ,RETENCION=?RETENCION '
      '  ,TIPO_RETENCION=?TIPO_RETENCION '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,BANCO_CLIPRO=?BANCO_CLIPRO '
      '  ,SIGNO=?SIGNO '
      '  ,CTA_PAGO=?CTA_PAGO '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,DOCUMENTO=?DOCUMENTO '
      '  ,MONEDA=?MONEDA '
      '  ,MONEDA_CANAL=?MONEDA_CANAL '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,RIC=?RIC '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,CARTA1=?CARTA1 '
      '  ,CARTA2=?CARTA2 '
      '  ,CARTA3=?CARTA3 '
      '  ,CARTA4=?CARTA4 '
      '  ,CARTA5=?CARTA5 '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    DataSource = DSQMCartera
    AfterDelete = GrabaDetalle
    AfterPost = GrabaDetalle
    BeforeEdit = QMCarteraDetalleBeforeEdit
    BeforePost = QMCarteraDetalleBeforePost
    OnNewRecord = QMCarteraDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CARTERA_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 72
    object QMCarteraDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCarteraDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCarteraDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCarteraDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCarteraDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMCarteraDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCarteraDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
      OnChange = QMCarteraDetalleVENCIMIENTOChange
    end
    object QMCarteraDetalleCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMCarteraDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCarteraDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMCarteraDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efe.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMCarteraDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMCarteraDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Rec.'
      FieldName = 'RECIBIDO'
    end
    object QMCarteraDetalleANTICIPADO: TFloatField
      DisplayLabel = 'Anticipado'
      FieldName = 'ANTICIPADO'
    end
    object QMCarteraDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMCarteraDetalleDOCUMENTO: TFIBStringField
      DisplayLabel = 'Doc.'
      FieldName = 'DOCUMENTO'
      OnGetText = QMCarteraDetalleDOCUMENTOGetText
      Size = 15
    end
    object QMCarteraDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCarteraDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMCarteraDetalleFECHA_RECIBIDO: TDateTimeField
      DisplayLabel = 'Fec. Recibido'
      FieldName = 'FECHA_RECIBIDO'
    end
    object QMCarteraDetalleTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMCarteraDetalleTITULOGetText
      Calculated = True
    end
    object QMCarteraDetalleMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMCarteraDetalleFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMCarteraDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMCarteraDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Det. Cartera'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMCarteraDetalleID_REMESAS: TIntegerField
      DisplayLabel = 'ID Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMCarteraDetalleEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Conf.'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object QMCarteraDetalleCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object QMCarteraDetalleEJERCICIO_ORD_PAGO: TIntegerField
      DisplayLabel = 'Ejer. Ord. Pago'
      FieldName = 'EJERCICIO_ORD_PAGO'
    end
    object QMCarteraDetalleORD_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORD_PAGO'
    end
    object QMCarteraDetalleDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Doc. Auto.'
      FieldName = 'DOC_AUTOMATICO'
    end
    object QMCarteraDetalleRETENCION: TIntegerField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object QMCarteraDetalleTIPO_RETENCION: TIntegerField
      DisplayLabel = 'Tipo Ret.'
      FieldName = 'TIPO_RETENCION'
    end
    object QMCarteraDetalleOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
    object QMCarteraDetalleBANCO_CLIPRO: TIntegerField
      DisplayLabel = 'Banco Cli./Prov.'
      FieldName = 'BANCO_CLIPRO'
    end
    object QMCarteraDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCarteraDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C. Cobro'
      DisplayWidth = 10
      FieldName = 'RIC'
    end
    object QMCarteraDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMCarteraDetalleRESPONSABLE: TIntegerField
      DisplayLabel = 'Repsonsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCarteraDetalleCARTA1: TIntegerField
      DisplayLabel = 'Carta 1'
      FieldName = 'CARTA1'
    end
    object QMCarteraDetalleCARTA2: TIntegerField
      DisplayLabel = 'Carta 2'
      FieldName = 'CARTA2'
    end
    object QMCarteraDetalleCARTA3: TIntegerField
      DisplayLabel = 'Carta 3'
      FieldName = 'CARTA3'
    end
    object QMCarteraDetalleCARTA4: TIntegerField
      DisplayLabel = 'Carta 4'
      FieldName = 'CARTA4'
    end
    object QMCarteraDetalleCARTA5: TIntegerField
      DisplayLabel = 'Carta 5'
      FieldName = 'CARTA5'
    end
  end
  object DSQMCarteraDetalle: TDataSource
    DataSet = QMCarteraDetalle
    Left = 152
    Top = 72
  end
  object QMCarteraIVA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_IVA'
      'WHERE'
      '  ID_CARTERA = ?ID_CARTERA AND'
      '  T_IVA=?OLD_T_IVA '
      '  ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_IVA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,T_IVA,P_IVA,BASE,P_REC' +
        'ARGO,I_IVA,I_RECARGO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?T_IVA,?P_IVA,?BA' +
        'SE,?P_RECARGO,?I_IVA,?I_RECARGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_IVA'
      'WHERE'
      '  ID_CARTERA = ?ID_CARTERA AND'
      '  T_IVA=?T_IVA '
      '  ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_IVA'
      'WHERE ID_CARTERA = ?ID_CARTERA'
      'ORDER BY T_IVA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_IVA'
      'SET'
      ' BASE = ?OLD_BASE'
      'WHERE'
      'ID_CARTERA = ?ID_CARTERA AND  '
      'T_IVA=?T_IVA'
      '  ')
    DataSource = DSQMCartera
    AfterPost = QMCarteraIVAAfterPost
    OnNewRecord = QMCarteraIVANewRecord
    ClavesPrimarias.Strings = (
      'ID_CARTERA '
      'T_IVA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_IVA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 120
    object QMCarteraIVAEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCarteraIVAEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCarteraIVACANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCarteraIVASIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCarteraIVAREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMCarteraIVAT_IVA: TIntegerField
      DisplayLabel = 'T. IVA'
      FieldName = 'T_IVA'
    end
    object QMCarteraIVABASE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
    object QMCarteraIVAP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMCarteraIVAP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMCarteraIVAI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMCarteraIVAI_RECARGO: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_RECARGO'
    end
  end
  object DSQMCarteraIVA: TDataSource
    DataSet = QMCarteraIVA
    Left = 152
    Top = 120
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 24
  end
  object DSxCarteraDet: TDataSource
    DataSet = xCarteraDet
    Left = 152
    Top = 168
  end
  object xCarteraDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT ecd.*,cc.titulo FROM EMP_CARTERA_DETALLE ecd'
      'left join emp_cartera vc on (vc.id_cartera=ecd.id_cartera)'
      
        'left join con_cuentas cc on ((vc.empresa=cc.empresa)and(vc.ejerc' +
        'icio=cc.ejercicio)and'
      
        '                             (vc.canal=cc.canal)and(vc.cuenta=cc' +
        '.cuenta)and(cc.pgc=vc.cuenta_pgc))')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    BeforeEdit = xCarteraDetBeforeEdit
    OnNewRecord = xCarteraDetNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 168
    object xCarteraDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCarteraDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCarteraDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCarteraDetSIGNO: TFIBStringField
      DisplayLabel = 'Sig.'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xCarteraDetREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xCarteraDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xCarteraDetVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xCarteraDetCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xCarteraDetLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xCarteraDetPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xCarteraDetMOD_MANUAL: TIntegerField
      DisplayLabel = 'Mod. Manual'
      FieldName = 'MOD_MANUAL'
    end
    object xCarteraDetTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efec.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xCarteraDetREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xCarteraDetESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xCarteraDetREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xCarteraDetBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xCarteraDetRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xCarteraDetIMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'IMPAGADO'
    end
    object xCarteraDetFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xCarteraDetESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xCarteraDetRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xCarteraDetVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xCarteraDetENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xCarteraDetAGRUPACION: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION'
    end
    object xCarteraDetCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xCarteraDetANTICIPADO: TFloatField
      DisplayLabel = 'Anticipado'
      FieldName = 'ANTICIPADO'
    end
    object xCarteraDetDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xCarteraDetDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Doc. Auto.'
      FieldName = 'DOC_AUTOMATICO'
    end
    object xCarteraDetEJERCICIO_REMESA: TIntegerField
      DisplayLabel = 'Ejer. Rem.'
      FieldName = 'EJERCICIO_REMESA'
    end
    object xCarteraDetEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agrup.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object xCarteraDetMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xCarteraDetLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'L'#237'q. Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xCarteraDetCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xCarteraDetRIC_RECIBIDO: TIntegerField
      DisplayLabel = 'RIC Recibido'
      FieldName = 'RIC_RECIBIDO'
    end
    object xCarteraDetFECHA_RECIBIDO: TDateTimeField
      DisplayLabel = 'Fec. Recibido'
      FieldName = 'FECHA_RECIBIDO'
    end
    object xCarteraDetMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Canal'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object xCarteraDetEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Confirming'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object xCarteraDetFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object xCarteraDetABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object xCarteraDetEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object xCarteraDetAGRUPACION_GENERAL: TIntegerField
      DisplayLabel = 'Agrup. Gen.'
      FieldName = 'AGRUPACION_GENERAL'
    end
    object xCarteraDetBANDERA: TIntegerField
      DisplayLabel = 'Bandera'
      FieldName = 'BANDERA'
    end
    object xCarteraDetID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xCarteraDetID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xCarteraDetID_REMESAS: TIntegerField
      DisplayLabel = 'ID Remesa'
      FieldName = 'ID_REMESAS'
    end
    object xCarteraDetTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
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
    Left = 336
    Top = 24
  end
end
