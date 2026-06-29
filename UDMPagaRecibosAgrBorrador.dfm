object DMPagaRecibosAgrBorrador: TDMPagaRecibosAgrBorrador
  OldCreateOrder = False
  OnCreate = DMPagaRecibosAgrupCreate
  Left = 641
  Top = 97
  Height = 347
  Width = 468
  object QMRecibos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_AGRUPACION_FAC'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,VENC' +
        'IMIENTO,LIQUIDO,DOC_NUMERO,DOC_SERIE,DOC_FECHA,DOC_TIPO,RECIBIDO' +
        ',ENTRADA,EJERCICIO_AGRUPACION)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI_P' +
        'RO,?VENCIMIENTO,?LIQUIDO,?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?DOC_' +
        'TIPO,?RECIBIDO,?ENTRADA,?EJERCICIO_AGRUPACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO <= :EJERCICIO AND'
      'CANAL = :CANAL AND'
      
        '((DOC_TIPO = :TIPO) OR (DOC_TIPO = :TIPOAGRUPADO) OR (DOC_TIPO =' +
        ' :TIPONUEVO) OR (DOC_TIPO = :TIPOASIENTO)) AND'
      'COD_CLI_PRO = :COD_CLI_PRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_AGRUPACION_FAC'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,VENCIMIENTO=?VENCIMIENTO '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,DOC_TIPO=?DOC_TIPO '
      '  ,RECIBIDO=?RECIBIDO '
      '  ,ENTRADA=?ENTRADA '
      '  ,EJERCICIO_AGRUPACION=?EJERCICIO_AGRUPACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    AfterPost = QMRecibosAfterPost
    BeforeInsert = QMRecibosBeforeInsert
    BeforePost = QMRecibosBeforePost
    OnCalcFields = QMRecibosCalcFields
    OnNewRecord = QMRecibosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_AGRUPACION_FAC'
    UpdateTransaction = TLocal
    Left = 40
    Top = 24
    object QMRecibosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRecibosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRecibosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRecibosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMRecibosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMRecibosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMRecibosCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMRecibosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMRecibosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMRecibosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMRecibosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMRecibosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMRecibosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMRecibosENTRADA: TIntegerField
      DisplayLabel = 'Pagar'
      FieldName = 'ENTRADA'
      OnChange = QMRecibosENTRADAChange
    end
    object QMRecibosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMRecibosEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agrup.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object QMRecibosliquido_moneda: TFloatField
      DisplayLabel = 'Liquido Mon.'
      FieldKind = fkCalculated
      FieldName = 'liquido_moneda'
      OnGetText = QMRecibosliquido_monedaGetText
      Calculated = True
    end
    object QMRecibosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMRecibosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMRecibosID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMRecibosID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMRecibosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMRecibosNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMRecibosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMRecibosSU_REFERENCIA: TStringField
      DisplayLabel = 'Su Referencia'
      FieldKind = fkCalculated
      FieldName = 'SU_REFERENCIA'
      Size = 40
      Calculated = True
    end
    object QMRecibosFOLIO: TFIBStringField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
      Size = 40
    end
    object QMRecibosOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
  end
  object DSQMRecibos: TDataSource
    DataSet = QMRecibos
    Left = 160
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 24
  end
  object SPPaga: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure e_cartera_pago_rec_agrup_borr (?EMPRESA,?EJERC' +
        'ICIO,'
      ' ?CANAL,?FECHA,?ENTRADA,?CUENTAUNIFICADA,?RIB,?TITULO,0)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 72
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo, forma_pago FROM VER_CLIENTES'
      'WHERE'
      '  empresa=?empresa and'
      '  ejercicio=?ejercicio and'
      '  canal=?canal and'
      '  cliente=?cliente')
    UniDirectional = False
    Left = 40
    Top = 120
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo, forma_pago FROM VER_PROVEEDORES'
      'WHERE'
      '  empresa=?empresa and'
      '  ejercicio=?ejercicio and'
      '  canal=?canal and'
      '  proveedor=?proveedor')
    UniDirectional = False
    Left = 40
    Top = 168
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo, forma_pago FROM VER_ACREEDORES'
      'WHERE'
      '  empresa=?empresa and'
      '  ejercicio=?ejercicio and'
      '  canal=?canal and'
      '  acreedor=?acreedor')
    UniDirectional = False
    Left = 40
    Top = 216
  end
  object DSQMCPRecMarcados: TDataSource
    DataSet = QMCPRecMarcados
    Left = 160
    Top = 72
  end
  object QMCPRecMarcados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_CARTERA_CP_REC_MARC_BORR'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  COD_CLI_PRO=?old_COD_CLI_PRO AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_CARTERA_CP_REC_MARC_BORR'
      
        '  (COD_CLI_PRO,SIGNO,CUENTA,CANTIDAD,TIPO,IMPORTE,RECIBOS,ENTRAD' +
        'A)'
      'VALUES'
      
        '  (?COD_CLI_PRO,?SIGNO,?CUENTA,?CANTIDAD,?TIPO,?IMPORTE,?RECIBOS' +
        ',?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_CARTERA_CP_REC_MARC_BORR'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SIGNO=?SIGNO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_CARTERA_CP_REC_MARC_BORR'
      'WHERE ENTRADA = ?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_CARTERA_CP_REC_MARC_BORR'
      'SET'
      '  CUENTA=?CUENTA '
      '  ,CANTIDAD=?CANTIDAD '
      'WHERE'
      '  TIPO=?TIPO AND'
      '  SIGNO=?SIGNO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '')
    AfterOpen = QMCPRecMarcadosAfterOpen
    ClavesPrimarias.Strings = (
      'TIPO '
      'SIGNO '
      'COD_CLI_PRO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CARTERA_CP_REC_MARC_BORR'
    UpdateTransaction = TLocal
    Left = 40
    Top = 72
    object QMCPRecMarcadosCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMCPRecMarcadosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCPRecMarcadosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta Cobro/Pago'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCPRecMarcadosCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMCPRecMarcadosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCPRecMarcadosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMCPRecMarcadosRECIBOS: TIntegerField
      DisplayLabel = 'Nro. Recibos'
      FieldName = 'RECIBOS'
    end
    object QMCPRecMarcadosENTRADA: TIntegerField
      DisplayLabel = 'Pagar'
      FieldName = 'ENTRADA'
    end
  end
end
