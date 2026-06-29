object DMDetallePagoFactura: TDMDetallePagoFactura
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 103
  Height = 212
  Width = 268
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
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
    Left = 216
    Top = 56
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 8
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_CARTERA_DETALLE ('
      
        'EMPRESA, EJERCICIO, CANAL, SIGNO, REGISTRO, LINEA, VENCIMIENTO, ' +
        'CTA_PAGO, LIQUIDO, PAGADO, TIPO_EFECTO, REMESAR, REMESA,'
      
        ' RECIBIDO, ANTICIPADO, DOCUMENTO, MONEDA, MONEDA_CANAL, LIQUIDO_' +
        'CANAL, FECHA_RECIBIDO, FECHA_VALOR, ID_CARTERA,'
      
        ' ID_CARTERA_DETALLE, ID_REMESAS, EJERCICIO_CONFIRMING, CONFIRMIN' +
        'G, EJERCICIO_ORD_PAGO, ORD_PAGO, DOC_AUTOMATICO,'
      ' RETENCION, TIPO_RETENCION, OBSERVACIONES)'
      
        'SELECT FIRST 1 EMPRESA, EJERCICIO, CANAL, SIGNO, REGISTRO, 0, VE' +
        'NCIMIENTO, CTA_PAGO, :LIQUIDO, 1, TIPO_EFECTO, REMESAR, 0,'
      
        '               0, 0, DOCUMENTO, MONEDA, MONEDA_CANAL, NULL, FECH' +
        'A_RECIBIDO, FECHA_VALOR, ID_CARTERA, 0, 0, 0, 0, 0, 0,'
      '               0, 0, 0, OBSERVACIONES'
      'FROM VER_EMP_CARTERA_DETALLE'
      'WHERE'
      'ID_CARTERA = :ID_CARTERA AND'
      'PAGADO = 0'
      'ORDER BY LINEA'
      '')
    RefreshSQL.Strings = (
      
        'SELECT C.FORMA_PAGO, P.PEDIR_DETALLE_PAGO, C.EMPRESA, C.EJERCICI' +
        'O, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.LIQUIDO,'
      '       F.IMPORTE_ANTICIPO, F.CAC, CC.ID_CARTERA, C.MONEDA, '
      '       (SELECT COALESCE(SUM(LIQUIDO), 0)'
      '        FROM EMP_CARTERA_DETALLE'
      '        WHERE'
      '        ID_CARTERA = CC.ID_CARTERA AND'
      '        PAGADO = 1) AS IMPORTE_PAGADO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S'
      
        'JOIN CON_CUENTAS_GES_FP P ON C.EMPRESA = P.EMPRESA AND C.EJERCIC' +
        'IO = P.EJERCICIO AND C.CANAL = P.CANAL AND C.FORMA_PAGO = P.FORM' +
        'A_PAGO'
      'JOIN EMP_CARTERA CC ON C.ID_S = CC.ID_DOC'
      'WHERE'
      'C.ID_S = :ID_S AND'
      'CC.SIGNO = '#39'C'#39' AND'
      'CC.DOC_TIPO = '#39'FAC'#39)
    SelectSQL.Strings = (
      
        'SELECT C.FORMA_PAGO, P.PEDIR_DETALLE_PAGO, C.EMPRESA, C.EJERCICI' +
        'O, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.LIQUIDO,'
      '       F.IMPORTE_ANTICIPO, F.CAC, CC.ID_CARTERA, C.MONEDA,  '
      '       (SELECT COALESCE(SUM(LIQUIDO), 0)'
      '        FROM EMP_CARTERA_DETALLE'
      '        WHERE'
      '        ID_CARTERA = CC.ID_CARTERA AND'
      '        PAGADO = 1) AS IMPORTE_PAGADO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S'
      
        'JOIN CON_CUENTAS_GES_FP P ON C.EMPRESA = P.EMPRESA AND C.EJERCIC' +
        'IO = P.EJERCICIO AND C.CANAL = P.CANAL AND C.FORMA_PAGO = P.FORM' +
        'A_PAGO'
      'JOIN EMP_CARTERA CC ON C.ID_S = CC.ID_DOC'
      'WHERE'
      'C.ID_S = :ID_S AND'
      'CC.SIGNO = '#39'C'#39' AND'
      'CC.DOC_TIPO = '#39'FAC'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CARTERA_DETALLE'
      'SET EMPRESA=:EMPRESA'
      'WHERE'
      'ID_CARTERA = -1'
      ''
      ''
      '')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    OnCalcFields = QMCabeceraCalcFields
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMCabeceraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabeceraPEDIR_DETALLE_PAGO: TIntegerField
      DisplayLabel = 'Pedir Det. Pago'
      FieldName = 'PEDIR_DETALLE_PAGO'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraIMPORTE_ANTICIPO: TFloatField
      DisplayLabel = 'Importe Antic.'
      FieldName = 'IMPORTE_ANTICIPO'
    end
    object QMCabeceraCAC: TIntegerField
      DisplayLabel = 'Registro Cartera'
      FieldName = 'CAC'
    end
    object QMCabeceraRESTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RESTO'
      Calculated = True
    end
    object QMCabeceraIMPORTE_PAGADO: TFloatField
      FieldName = 'IMPORTE_PAGADO'
      OnGetText = QMCabeceraIMPORTE_PAGADOGetText
      OnSetText = QMCabeceraIMPORTE_PAGADOSetText
    end
    object QMCabeceraID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMCabeceraMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object DSQMCarteraDetalle: TDataSource
    DataSet = QMCarteraDetalle
    Left = 128
    Top = 56
  end
  object QMCarteraDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_CARTERA_DETALLE'
      'WHERE'
      '  ID_CARTERA_DETALLE=?old_ID_CARTERA_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_CARTERA_DETALLE'
      
        '  (VENCIMIENTO,LIQUIDO,ANTICIPADO,LIQUIDO_CANAL,FECHA_RECIBIDO,F' +
        'ECHA_VALOR,DOC_AUTOMATICO,REGISTRO,LINEA,REMESA,ID_CARTERA,ID_CA' +
        'RTERA_DETALLE,ID_REMESAS,CONFIRMING,ORD_PAGO,RETENCION,TIPO_RETE' +
        'NCION,OBSERVACIONES,EMPRESA,EJERCICIO,CANAL,PAGADO,REMESAR,RECIB' +
        'IDO,EJERCICIO_CONFIRMING,EJERCICIO_ORD_PAGO,SIGNO,CTA_PAGO,TIPO_' +
        'EFECTO,DOCUMENTO,MONEDA,MONEDA_CANAL)'
      'VALUES'
      
        '  (?VENCIMIENTO,?LIQUIDO,?ANTICIPADO,?LIQUIDO_CANAL,?FECHA_RECIB' +
        'IDO,?FECHA_VALOR,?DOC_AUTOMATICO,?REGISTRO,?LINEA,?REMESA,?ID_CA' +
        'RTERA,?ID_CARTERA_DETALLE,?ID_REMESAS,?CONFIRMING,?ORD_PAGO,?RET' +
        'ENCION,?TIPO_RETENCION,?OBSERVACIONES,?EMPRESA,?EJERCICIO,?CANAL' +
        ',?PAGADO,?REMESAR,?RECIBIDO,?EJERCICIO_CONFIRMING,?EJERCICIO_ORD' +
        '_PAGO,?SIGNO,?CTA_PAGO,?TIPO_EFECTO,?DOCUMENTO,?MONEDA,?MONEDA_C' +
        'ANAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CARTERA_DETALLE'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMP_CARTERA_DETALLE'
      'WHERE'
      'ID_CARTERA = :ID_CARTERA'
      'ORDER BY PAGADO DESC, LINEA')
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
      '  ,DOC_AUTOMATICO=?DOC_AUTOMATICO '
      '  ,REGISTRO=?REGISTRO '
      '  ,LINEA=?LINEA '
      '  ,REMESA=?REMESA '
      '  ,ID_CARTERA=?ID_CARTERA '
      '  ,ID_REMESAS=?ID_REMESAS '
      '  ,CONFIRMING=?CONFIRMING '
      '  ,ORD_PAGO=?ORD_PAGO '
      '  ,RETENCION=?RETENCION '
      '  ,TIPO_RETENCION=?TIPO_RETENCION '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PAGADO=?PAGADO '
      '  ,REMESAR=?REMESAR '
      '  ,RECIBIDO=?RECIBIDO '
      '  ,EJERCICIO_CONFIRMING=?EJERCICIO_CONFIRMING '
      '  ,EJERCICIO_ORD_PAGO=?EJERCICIO_ORD_PAGO '
      '  ,SIGNO=?SIGNO '
      '  ,CTA_PAGO=?CTA_PAGO '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,DOCUMENTO=?DOCUMENTO '
      '  ,MONEDA=?MONEDA '
      '  ,MONEDA_CANAL=?MONEDA_CANAL '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    DataSource = DSQMCabecera
    OnCalcFields = QMCabeceraCalcFields
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CARTERA_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
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
      DisplayLabel = 'Tipo Efec.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMCarteraDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMCarteraDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMCarteraDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMCarteraDetalleANTICIPADO: TFloatField
      DisplayLabel = 'Antic.'
      FieldName = 'ANTICIPADO'
    end
    object QMCarteraDetalleDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object QMCarteraDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCarteraDetalleMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Moneda Can.'
      FieldName = 'MONEDA_CANAL'
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
    object QMCarteraDetalleFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMCarteraDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMCarteraDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMCarteraDetalleID_REMESAS: TIntegerField
      DisplayLabel = 'Id Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMCarteraDetalleEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Confirm.'
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
      DisplayLabel = 'Documento'
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
      DisplayLabel = 'Observ.'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
  end
end
