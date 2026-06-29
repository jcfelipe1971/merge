object DMPagares: TDMPagares
  OldCreateOrder = False
  OnCreate = DMPagaresCreate
  OnDestroy = DMPagaresDestroy
  Left = 457
  Top = 186
  Height = 376
  Width = 510
  object QMPagares: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PAGARES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PAGARE=?old_PAGARE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PAGARES'
      
        '  (EMPRESA,EJERCICIO,CANAL,PAGARE,COD_CLI_PRO,TIPO_TERCERO,DESCR' +
        'IPCION,LUGAR_LIBRAMIENTO,FECHA_LIBRAMIENTO,FECHA_VENCIMIENTO,BAN' +
        'CO,IMPORTE,CONTABILIZADO,PAGADO,RIC_CONTABILIZADO,ASIENTO_CONTAB' +
        'ILIZADO,RIC_PAGADO,ASIENTO_PAGADO,TIPO_ASIENTO_KRI)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PAGARE,?COD_CLI_PRO,?TIPO_TERCERO' +
        ',?DESCRIPCION,?LUGAR_LIBRAMIENTO,?FECHA_LIBRAMIENTO,?FECHA_VENCI' +
        'MIENTO,?BANCO,?IMPORTE,?CONTABILIZADO,?PAGADO,?RIC_CONTABILIZADO' +
        ',?ASIENTO_CONTABILIZADO,?RIC_PAGADO,?ASIENTO_PAGADO,?TIPO_ASIENT' +
        'O_KRI)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PAGARES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PAGARE=?PAGARE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PAGARES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  CANAL=?CANAL AND'
      
        '  (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (CONTAB' +
        'ILIZADO=0 OR PAGADO=0)))'
      ' ORDER BY EMPRESA, EJERCICIO, CANAL, PAGARE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PAGARES'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,TIPO_TERCERO=?TIPO_TERCERO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LUGAR_LIBRAMIENTO=?LUGAR_LIBRAMIENTO '
      '  ,FECHA_LIBRAMIENTO=?FECHA_LIBRAMIENTO '
      '  ,FECHA_VENCIMIENTO=?FECHA_VENCIMIENTO '
      '  ,BANCO=?BANCO '
      '  ,IMPORTE=?IMPORTE '
      '  ,CONTABILIZADO=?CONTABILIZADO '
      '  ,PAGADO=?PAGADO '
      '  ,RIC_CONTABILIZADO=?RIC_CONTABILIZADO '
      '  ,ASIENTO_CONTABILIZADO=?ASIENTO_CONTABILIZADO '
      '  ,RIC_PAGADO=?RIC_PAGADO '
      '  ,ASIENTO_PAGADO=?ASIENTO_PAGADO '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PAGARE=?PAGARE ')
    AfterOpen = QMPagaresAfterOpen
    AfterScroll = QMPagaresAfterScroll
    BeforePost = QMPagaresBeforePost
    BeforeScroll = QMPagaresBeforeScroll
    OnCalcFields = QMPagaresCalcFields
    OnNewRecord = QMPagaresNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PAGARE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PAGARES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMPagaresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPagaresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPagaresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPagaresPAGARE: TFIBStringField
      DisplayLabel = 'Pagare'
      FieldName = 'PAGARE'
      Size = 15
    end
    object QMPagaresCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
      OnChange = QMPagaresCOD_CLI_PROChange
    end
    object QMPagaresTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMPagaresDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMPagaresLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar Libramiento'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object QMPagaresFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Libramiento'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object QMPagaresFECHA_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Vencimiento'
      FieldName = 'FECHA_VENCIMIENTO'
    end
    object QMPagaresBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      OnChange = QMPagaresBANCOChange
    end
    object QMPagaresIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMPagaresCONTABILIZADO: TIntegerField
      DisplayLabel = 'Contabilizado'
      FieldName = 'CONTABILIZADO'
    end
    object QMPagaresPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMPagaresRIC_CONTABILIZADO: TIntegerField
      DisplayLabel = 'RIC Cont.'
      FieldName = 'RIC_CONTABILIZADO'
    end
    object QMPagaresASIENTO_CONTABILIZADO: TIntegerField
      DisplayLabel = 'Asiento Cont.'
      FieldName = 'ASIENTO_CONTABILIZADO'
    end
    object QMPagaresRIC_PAGADO: TIntegerField
      DisplayLabel = 'RIC Pago'
      FieldName = 'RIC_PAGADO'
    end
    object QMPagaresASIENTO_PAGADO: TIntegerField
      DisplayLabel = 'Asiento Pago'
      FieldName = 'ASIENTO_PAGADO'
    end
    object QMPagaresTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO_KRI'
      OnChange = QMPagaresTIPO_ASIENTO_KRIChange
      Size = 3
    end
    object QMPagaresSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEUDOR'
      Calculated = True
    end
    object QMPagaresSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_ACREEDOR'
      Calculated = True
    end
    object QMPagaresSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
  end
  object DSQMPagares: TDataSource
    DataSet = QMPagares
    Left = 128
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_PAGARES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_PAGARES'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,VE' +
        'NCIMIENTO,CTA_PAGO,LIQUIDO,LIQUIDO_CANAL,'#13#10'PAGADO,IMPAGADO,FORMA' +
        '_PAGO,TIPO_EFECTO,ACEPTADO,REMESAR,ESTADO,REMESA,DOC_NUMERO,DOC_' +
        'SERIE,'#13#10'DOC_FECHA,DOC_TIPO,RIC,RIVA,FECHA_CIERRE,ESTADO_RECIBO,R' +
        'ECIBIDO,CONFIRMING,PAGARE,PAGARE_AUTOMATICO,'#13#10'MONEDA,CAMBIO,ID_C' +
        'ARTERA,ID_CARTERA_DETALLE,ID_DOC,PAGO_AUTORIZADO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI' +
        '_PRO,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,?LIQUIDO_CANAL,'#13#10'?PAGADO,?I' +
        'MPAGADO,?FORMA_PAGO,?TIPO_EFECTO,?ACEPTADO,?REMESAR,?ESTADO,?REM' +
        'ESA,?DOC_NUMERO,?DOC_SERIE,'#13#10'?DOC_FECHA,?DOC_TIPO,?RIC,?RIVA,?FE' +
        'CHA_CIERRE,?ESTADO_RECIBO,?RECIBIDO,?CONFIRMING,?PAGARE,?PAGARE_' +
        'AUTOMATICO,'#13#10'?MONEDA,?CAMBIO,?ID_CARTERA,?ID_CARTERA_DETALLE,?ID' +
        '_DOC,?PAGO_AUTORIZADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_PAGARES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_PAGARES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGARE=?PAGARE AND'
      '  PAGARE_AUTOMATICO=2'
      'ORDER BY VENCIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_PAGARES'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,VENCIMIENTO=?VENCIMIENTO '
      '  ,CTA_PAGO=?CTA_PAGO '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,LIQUIDO_CANAL=?LIQUIDO_CANAL '
      '  ,PAGADO=?PAGADO '
      '  ,IMPAGADO=?IMPAGADO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,ACEPTADO=?ACEPTADO '
      '  ,REMESAR=?REMESAR '
      '  ,ESTADO=?ESTADO '
      '  ,REMESA=?REMESA '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,DOC_TIPO=?DOC_TIPO '
      '  ,RIC=?RIC '
      '  ,RIVA=?RIVA '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,ESTADO_RECIBO=?ESTADO_RECIBO '
      '  ,RECIBIDO=?RECIBIDO '
      '  ,CONFIRMING=?CONFIRMING '
      '  ,PAGARE=?PAGARE '
      '  ,PAGARE_AUTOMATICO=?PAGARE_AUTOMATICO '
      '  ,MONEDA=?MONEDA '
      '  ,CAMBIO=?CAMBIO '
      '  ,ID_CARTERA=?ID_CARTERA '
      '  ,ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE '
      '  ,ID_DOC=?ID_DOC '
      '  ,PAGO_AUTORIZADO=?PAGO_AUTORIZADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMPagares
    AfterPost = QMDetalleAfterPost
    BeforeEdit = QMDetalleBeforeEdit
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_PAGARES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMDetalleCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'L'#237'quido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMDetalleIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object QMDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMDetalleACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object QMDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMDetalleDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDetalleRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object QMDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMDetalleESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMDetalleCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object QMDetallePAGARE: TFIBStringField
      DisplayLabel = 'Pagare'
      FieldName = 'PAGARE'
      Size = 15
    end
    object QMDetallePAGARE_AUTOMATICO: TIntegerField
      DisplayLabel = 'Pagare Autom.'
      FieldName = 'PAGARE_AUTOMATICO'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleliquido_moneda: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'liquido_moneda'
      OnGetText = QMDetalleLIQUIDO_MONEDAGetText
      Calculated = True
    end
    object QMDetallePAGO_AUTORIZADO: TIntegerField
      DisplayLabel = 'Pago Autorizado'
      FieldName = 'PAGO_AUTORIZADO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 56
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 128
    Top = 104
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT IMPORTE,PAGADO'
      'FROM EMP_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    SelectSQL.Strings = (
      'SELECT IMPORTE,CONTABILIZADO,PAGADO FROM EMP_CARTERA_PAGARES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGARE=?PAGARE')
    UniDirectional = False
    DataSource = DSQMPagares
    Left = 32
    Top = 104
    object xInfoActualizadaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xInfoActualizadaPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xInfoActualizadaCONTABILIZADO: TIntegerField
      DisplayLabel = 'Contabilizado'
      FieldName = 'CONTABILIZADO'
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
    Left = 232
    Top = 56
  end
end
