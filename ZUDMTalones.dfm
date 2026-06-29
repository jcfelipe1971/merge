object ZDMTalones: TZDMTalones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 526
  Top = 108
  Height = 564
  Width = 333
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 22
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 252
    Top = 92
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from z_talones_cab where id=?id')
    InsertSQL.Strings = (
      
        'insert into z_talones_cab(ID,EMPRESA,EJERCICIO ,CANAL ,TERCERO ,' +
        'TALON ,'
      
        '                          DESCRIPCION ,BANCO ,FECHA ,LUGAR,CUENT' +
        'A,IMPORTE,CUENTA_COBRO)'
      
        '                   values (?ID,?EMPRESA,?EJERCICIO ,?CANAL ,?TER' +
        'CERO  ,?TALON ,'
      
        '                          ?DESCRIPCION ,?BANCO ,?FECHA ,?LUGAR,?' +
        'CUENTA,?IMPORTE,?CUENTA_COBRO)')
    RefreshSQL.Strings = (
      'SELECT * FROM Z_TALONES_CAB'
      'where'
      'empresa=?empresa'
      'and canal=?canal'
      'and ejercicio=?ejercicio'
      'and id=?id')
    SelectSQL.Strings = (
      'SELECT * FROM Z_TALONES_CAB'
      'where'
      'empresa=?empresa and '
      'ejercicio=?ejercicio and '
      'canal=?canal')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update z_talones_cab'
      'set TERCERO=?tercero,'
      '    TALON=?talon,'
      '    DESCRIPCION=?descripcion,'
      '    BANCO=?banco,'
      '    FECHA=?fecha,'
      '    LUGAR=?lugar,'
      '    CUENTA =?cuenta,'
      '    IMPORTE=?importe,'
      '    CUENTA_COBRO =?cuenta_cobro'
      'where id=?id')
    AfterDelete = Graba
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = Graba
    AfterScroll = QMCabeceraAfterScroll
    BeforeDelete = QMCabeceraBeforeDelete
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'empresa'#13
      'canal'#13
      'ejercicio'#13
      'id'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_TALONES_CAB'
    UpdateTransaction = TLocal
    Left = 31
    Top = 20
    object QMCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ReadOnly = True
      OnChange = QMCabeceraIDChange
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
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMCabeceraTERCEROChange
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCabeceraBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      OnChange = QMCabeceraBANCOChange
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraLUGAR: TFIBStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR'
      Size = 60
    end
    object QMCabeceraIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMCabeceraCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMCabeceraCUENTAChange
      Size = 15
    end
    object QMCabeceraDIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldKind = fkCalculated
      FieldName = 'DIFERENCIA'
      Calculated = True
    end
    object QMCabeceraCUENTA_COBRO: TFIBStringField
      DisplayLabel = 'Cta. Cobro'
      FieldName = 'CUENTA_COBRO'
      OnChange = QMCabeceraCUENTA_COBROChange
      Size = 15
    end
    object QMCabeceraZ_CONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'Z_CONTADOR'
    end
  end
  object QMCobros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_DETALLE'
      
        '  (VENCIMIENTO,LIQUIDO,FECHA_CIERRE,ANTICIPADO,CAMBIO,FECHA_RECI' +
        'BIDO,LIQUIDO_CANAL,FECHA_VALOR,DOC_AUTOMATICO,AGRUPACION,ENTRADA' +
        ',RIC,BANCO,REMESA,REGISTRO,CONFIRMING,RIC_RECIBIDO,ABONO,AGRUPAC' +
        'ION_GENERAL,ID_CARTERA_DETALLE,ID_CARTERA,ID_REMESAS,LINEA,MOD_M' +
        'ANUAL,IMPAGADO,ESTADO,EMPRESA,EJERCICIO,CANAL,PAGADO,REMESAR,REC' +
        'IBIDO,VISIBLE,EJERCICIO_REMESA,EJERCICIO_AGRUPACION,EJERCICIO_CO' +
        'NFIRMING,EJERCICIO_ABONO,BANDERA,DOCUMENTO,SIGNO,CTA_PAGO,TIPO_E' +
        'FECTO,ESTADO_RECIBO,MONEDA,MONEDA_CANAL,ID_CAB_Z_TALONES,MARCADO' +
        ')'
      'VALUES'
      
        '  (?VENCIMIENTO,?LIQUIDO,?FECHA_CIERRE,?ANTICIPADO,?CAMBIO,?FECH' +
        'A_RECIBIDO,?LIQUIDO_CANAL,?FECHA_VALOR,?DOC_AUTOMATICO,?AGRUPACI' +
        'ON,?ENTRADA,?RIC,?BANCO,?REMESA,?REGISTRO,?CONFIRMING,?RIC_RECIB' +
        'IDO,?ABONO,?AGRUPACION_GENERAL,?ID_CARTERA_DETALLE,?ID_CARTERA,?' +
        'ID_REMESAS,?LINEA,?MOD_MANUAL,?IMPAGADO,?ESTADO,?EMPRESA,?EJERCI' +
        'CIO,?CANAL,?PAGADO,?REMESAR,?RECIBIDO,?VISIBLE,?EJERCICIO_REMESA' +
        ',?EJERCICIO_AGRUPACION,?EJERCICIO_CONFIRMING,?EJERCICIO_ABONO,?B' +
        'ANDERA,?DOCUMENTO,?SIGNO,?CTA_PAGO,?TIPO_EFECTO,?ESTADO_RECIBO,?' +
        'MONEDA,?MONEDA_CANAL,?ID_CAB_Z_TALONES,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_DETALLE'
      'where id_cartera_detalle=?id_cartera_detalle'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE'
      'SET'
      '  MARCADO=?MARCADO,'
      '  ID_CAB_Z_TALONES=?ID_CAB_Z_TALONES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    AfterOpen = QMCobrosAfterOpen
    AfterPost = QMCobrosAfterPost
    AfterScroll = QMCobrosAfterScroll
    BeforeOpen = QMCobrosBeforeOpen
    BeforePost = BeforePostGeneral
    ClavesPrimarias.Strings = (
      'id_cartera_detalle'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_DETALLE'
    UpdateTransaction = TLocal
    Left = 32
    Top = 76
    object QMCobrosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCobrosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCobrosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCobrosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCobrosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMCobrosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCobrosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vecim.'
      FieldName = 'VENCIMIENTO'
    end
    object QMCobrosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMCobrosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCobrosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMCobrosMOD_MANUAL: TIntegerField
      DisplayLabel = 'Mod. Manual'
      FieldName = 'MOD_MANUAL'
    end
    object QMCobrosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efe.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMCobrosREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMCobrosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCobrosREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMCobrosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCobrosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMCobrosIMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'IMPAGADO'
    end
    object QMCobrosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMCobrosESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMCobrosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBIDO'
    end
    object QMCobrosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMCobrosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCobrosAGRUPACION: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION'
    end
    object QMCobrosCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object QMCobrosANTICIPADO: TFloatField
      DisplayLabel = 'Anticipado'
      FieldName = 'ANTICIPADO'
    end
    object QMCobrosDOCUMENTO: TFIBStringField
      DisplayLabel = 'Docum.'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object QMCobrosDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Doc. Auto.'
      FieldName = 'DOC_AUTOMATICO'
    end
    object QMCobrosEJERCICIO_REMESA: TIntegerField
      DisplayLabel = 'Ejer. Rem.'
      FieldName = 'EJERCICIO_REMESA'
    end
    object QMCobrosEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agr.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object QMCobrosMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCobrosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMCobrosCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMCobrosRIC_RECIBIDO: TIntegerField
      DisplayLabel = 'RIC Recib.'
      FieldName = 'RIC_RECIBIDO'
    end
    object QMCobrosFECHA_RECIBIDO: TDateTimeField
      DisplayLabel = 'Fec. Recib.'
      FieldName = 'FECHA_RECIBIDO'
    end
    object QMCobrosMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Moneda Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMCobrosEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Conf.'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object QMCobrosFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMCobrosABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object QMCobrosEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object QMCobrosAGRUPACION_GENERAL: TIntegerField
      DisplayLabel = 'Agr. Gen.'
      FieldName = 'AGRUPACION_GENERAL'
    end
    object QMCobrosBANDERA: TIntegerField
      DisplayLabel = 'Bandera'
      FieldName = 'BANDERA'
    end
    object QMCobrosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMCobrosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMCobrosID_REMESAS: TIntegerField
      DisplayLabel = 'ID Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMCobrosID_CAB_Z_TALONES: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_TALONES'
    end
    object QMCobrosMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMCobrosC_Pendientes: TFloatField
      DisplayLabel = 'C. Pend.'
      FieldKind = fkCalculated
      FieldName = 'C_Pendientes'
      Calculated = True
    end
    object QMCobrosAbrirCartera: TIntegerField
      DisplayLabel = 'Abrir Cart.'
      FieldKind = fkCalculated
      FieldName = 'Abrir Cartera'
      OnChange = QMCobrosAbrirCarteraChange
      Calculated = True
    end
  end
  object QMAnticipos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ANTICIPO=?old_ANTICIPO AND '
      '  TIPO_TERCERO=?old_TIPO_TERCERO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_ANTICIPOS'
      
        '  (CANTIDAD,FECHA,ANTICIPO,COD_CLI_PRO,REGISTRO,ASIENTO,EMPRESA,' +
        'EJERCICIO,CANAL,CONTABILIZAR,TIPO_TERCERO,CUENTA_CLI_PRO,C_CONTR' +
        'APARTIDA)'
      'VALUES'
      
        '  (?CANTIDAD,?FECHA,?ANTICIPO,?COD_CLI_PRO,?REGISTRO,?ASIENTO,?E' +
        'MPRESA,?EJERCICIO,?CANAL,?CONTABILIZAR,?TIPO_TERCERO,?CUENTA_CLI' +
        '_PRO,?C_CONTRAPARTIDA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  TIPO_TERCERO=?TIPO_TERCERO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_ANTICIPOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_ANTICIPOS'
      'SET'
      '  MARCADO=?MARCADO,'
      '  ID_CAB_Z_TALONES=?ID_CAB_Z_TALONES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  TIPO_TERCERO=?TIPO_TERCERO ')
    DataSource = DSCabecera
    AfterPost = Graba
    AfterScroll = QMAnticiposAfterScroll
    BeforeOpen = QMAnticiposBeforeOpen
    BeforePost = BeforePostGeneral
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ANTICIPO '
      'TIPO_TERCERO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_ANTICIPOS'
    UpdateTransaction = TLocal
    Left = 30
    Top = 128
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
    object QMAnticiposANTICIPO: TIntegerField
      DisplayLabel = 'Antic.'
      FieldName = 'ANTICIPO'
    end
    object QMAnticiposTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Ter.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMAnticiposCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Pro.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMAnticiposCUENTA_CLI_PRO: TFIBStringField
      DisplayLabel = 'Cta. Cli./Pro.'
      FieldName = 'CUENTA_CLI_PRO'
      Size = 15
    end
    object QMAnticiposC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA'
      Size = 15
    end
    object QMAnticiposCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMAnticiposCONTABILIZAR: TIntegerField
      DisplayLabel = 'Cont.'
      FieldName = 'CONTABILIZAR'
    end
    object QMAnticiposREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMAnticiposASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMAnticiposFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAnticiposID_CAB_Z_TALONES: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_TALONES'
    end
    object QMAnticiposMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMAnticiposP_anticipos: TFloatField
      DisplayLabel = 'P. Antic.'
      FieldKind = fkCalculated
      FieldName = 'P_anticipos'
      Calculated = True
    end
  end
  object QMPagos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_DETALLE'
      
        '  (VENCIMIENTO,LIQUIDO,FECHA_CIERRE,ANTICIPADO,CAMBIO,FECHA_RECI' +
        'BIDO,LIQUIDO_CANAL,FECHA_VALOR,DOC_AUTOMATICO,AGRUPACION,ENTRADA' +
        ',RIC,BANCO,REMESA,REGISTRO,CONFIRMING,RIC_RECIBIDO,ABONO,AGRUPAC' +
        'ION_GENERAL,ID_CARTERA_DETALLE,ID_CARTERA,ID_REMESAS,LINEA,MOD_M' +
        'ANUAL,IMPAGADO,ESTADO,EMPRESA,EJERCICIO,CANAL,PAGADO,REMESAR,REC' +
        'IBIDO,VISIBLE,EJERCICIO_REMESA,EJERCICIO_AGRUPACION,EJERCICIO_CO' +
        'NFIRMING,EJERCICIO_ABONO,BANDERA,DOCUMENTO,SIGNO,CTA_PAGO,TIPO_E' +
        'FECTO,ESTADO_RECIBO,MONEDA,MONEDA_CANAL,ID_CAB_Z_TALONES,MARCADO' +
        ')'
      'VALUES'
      
        '  (?VENCIMIENTO,?LIQUIDO,?FECHA_CIERRE,?ANTICIPADO,?CAMBIO,?FECH' +
        'A_RECIBIDO,?LIQUIDO_CANAL,?FECHA_VALOR,?DOC_AUTOMATICO,?AGRUPACI' +
        'ON,?ENTRADA,?RIC,?BANCO,?REMESA,?REGISTRO,?CONFIRMING,?RIC_RECIB' +
        'IDO,?ABONO,?AGRUPACION_GENERAL,?ID_CARTERA_DETALLE,?ID_CARTERA,?' +
        'ID_REMESAS,?LINEA,?MOD_MANUAL,?IMPAGADO,?ESTADO,?EMPRESA,?EJERCI' +
        'CIO,?CANAL,?PAGADO,?REMESAR,?RECIBIDO,?VISIBLE,?EJERCICIO_REMESA' +
        ',?EJERCICIO_AGRUPACION,?EJERCICIO_CONFIRMING,?EJERCICIO_ABONO,?B' +
        'ANDERA,?DOCUMENTO,?SIGNO,?CTA_PAGO,?TIPO_EFECTO,?ESTADO_RECIBO,?' +
        'MONEDA,?MONEDA_CANAL,?ID_CAB_Z_TALONES,?MARCADO)')
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
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE'
      'SET'
      '  MARCADO=?MARCADO,'
      '  ID_CAB_Z_TALONES=?ID_CAB_Z_TALONES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    AfterOpen = QMPagosAfterOpen
    AfterPost = QMPagosAfterPost
    AfterScroll = QMPagosAfterScroll
    BeforeOpen = QMPagosBeforeOpen
    BeforePost = BeforePostGeneral
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_DETALLE'
    UpdateTransaction = TLocal
    Left = 33
    Top = 180
    object QMPagosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPagosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPagosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPagosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMPagosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMPagosLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object QMPagosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object QMPagosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMPagosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMPagosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMPagosMOD_MANUAL: TIntegerField
      DisplayLabel = 'Mod. Manual'
      FieldName = 'MOD_MANUAL'
    end
    object QMPagosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efe.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMPagosREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMPagosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMPagosREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMPagosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMPagosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMPagosIMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'IMPAGADO'
    end
    object QMPagosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMPagosESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMPagosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMPagosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMPagosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMPagosAGRUPACION: TIntegerField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
    end
    object QMPagosCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object QMPagosANTICIPADO: TFloatField
      DisplayLabel = 'Anticipado'
      FieldName = 'ANTICIPADO'
    end
    object QMPagosDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object QMPagosDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Doc. Auto.'
      FieldName = 'DOC_AUTOMATICO'
    end
    object QMPagosEJERCICIO_REMESA: TIntegerField
      DisplayLabel = 'Ejer. Remesa'
      FieldName = 'EJERCICIO_REMESA'
    end
    object QMPagosEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agr.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object QMPagosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMPagosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Cant.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMPagosCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMPagosRIC_RECIBIDO: TIntegerField
      DisplayLabel = 'RIC Recib.'
      FieldName = 'RIC_RECIBIDO'
    end
    object QMPagosFECHA_RECIBIDO: TDateTimeField
      DisplayLabel = 'Fec. Recibido'
      FieldName = 'FECHA_RECIBIDO'
    end
    object QMPagosMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Moneda Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMPagosEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Conf.'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object QMPagosFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMPagosABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object QMPagosEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object QMPagosAGRUPACION_GENERAL: TIntegerField
      DisplayLabel = 'Agr. Gen.'
      FieldName = 'AGRUPACION_GENERAL'
    end
    object QMPagosBANDERA: TIntegerField
      DisplayLabel = 'Bandera'
      FieldName = 'BANDERA'
    end
    object QMPagosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMPagosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMPagosID_REMESAS: TIntegerField
      DisplayLabel = 'ID Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMPagosID_CAB_Z_TALONES: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_TALONES'
    end
    object QMPagosMARCADO: TIntegerField
      DisplayLabel = 'MArcado'
      FieldName = 'MARCADO'
    end
    object QMPagosP_Pendientes: TFloatField
      DisplayLabel = 'P. Pendientes'
      FieldKind = fkCalculated
      FieldName = 'P_Pendientes'
      Calculated = True
    end
    object QMPagosAbrir_Cartera: TIntegerField
      DisplayLabel = 'Abrir Cart.'
      FieldKind = fkCalculated
      FieldName = 'Abrir_Cartera'
      OnChange = QMPagosAbrir_CarteraChange
      Calculated = True
    end
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 104
    Top = 20
  end
  object DsCobros: TDataSource
    DataSet = QMCobros
    Left = 105
    Top = 76
  end
  object DsAnticipos: TDataSource
    DataSet = QMAnticipos
    Left = 106
    Top = 128
  end
  object DsPagos: TDataSource
    DataSet = QMPagos
    Left = 107
    Top = 181
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT BANCO,TITULO FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSCabecera
    BeforeOpen = xBancosBeforeOpen
    Left = 27
    Top = 265
    object xBancosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 111
    Top = 265
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 112
    Top = 317
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL FROM VER_TERCEROS'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_TERCEROS DI INDEX (PK_SYS_TERCEROS_DIRECCIONES),V' +
        'ER_TERCEROS TE INDEX (PK_SYS_TERCEROS))')
    BeforeOpen = xTercerosBeforeOpen
    Left = 28
    Top = 317
    object xTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxEstado: TDataSource
    DataSet = xEstado
    Left = 111
    Top = 370
  end
  object xEstado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GES_ESTADOS'
      'WHERE ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 28
    Top = 371
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT CUENTA,TITULO FROM CON_CUENTAS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CUENTA=?CUENTA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 27
    Top = 425
    object xCuentaCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCuentaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 111
    Top = 424
  end
  object XCuentaCobro: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT CUENTA,TITULO FROM CON_CUENTAS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CUENTA=?CUENTA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 28
    Top = 477
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxCuentaCobro: TDataSource
    DataSet = XCuentaCobro
    Left = 111
    Top = 475
  end
end
