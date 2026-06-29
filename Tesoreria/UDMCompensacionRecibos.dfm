object DMCompensacionRecibos: TDMCompensacionRecibos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 437
  Top = 233
  Height = 319
  Width = 410
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 8
  end
  object TUptade: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 8
  end
  object xRecibosProveedor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  ID_CARTERA_DETALLE=?old_ID_CARTERA_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_AGRUPACION_FAC'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,VENC' +
        'IMIENTO,CTA_PAGO,LIQUIDO,DOC_NUMERO,DOC_SERIE,DOC_FECHA,DOC_TIPO' +
        ',RECIBIDO,ENTRADA,EJERCICIO_AGRUPACION,LIQUIDO_CANAL,MONEDA,CAMB' +
        'IO,ID_CARTERA,ID_DOC,ID_CARTERA_DETALLE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI_P' +
        'RO,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,?DOC_NUMERO,?DOC_SERIE,?DOC_F' +
        'ECHA,?DOC_TIPO,?RECIBIDO,?ENTRADA,?EJERCICIO_AGRUPACION,?LIQUIDO' +
        '_CANAL,?MONEDA,?CAMBIO,?ID_CARTERA,?ID_DOC,?ID_CARTERA_DETALLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      
        'SELECT F.EMPRESA,F.EJERCICIO,F.CANAL,F.SIGNO,F.REGISTRO,F.LINEA,' +
        'F.COD_CLI_PRO,'
      
        'F.VENCIMIENTO, F.CTA_PAGO,F.LIQUIDO,F.DOC_NUMERO,F.DOC_SERIE,F.D' +
        'OC_FECHA,F.DOC_TIPO,'
      
        'F.RECIBIDO,F.ENTRADA,F.EJERCICIO_AGRUPACION,F.LIQUIDO_CANAL,F.MO' +
        'NEDA,F.CAMBIO,'
      
        'F.ID_CARTERA,F.ID_CARTERA_DETALLE,F.ID_DOC FROM VER_CARTERA_AGRU' +
        'PACION_FAC F'
      'JOIN EMP_PROVEEDORES P'
      'ON F.EMPRESA=P.EMPRESA AND F.COD_CLI_PRO=P.PROVEEDOR'
      'WHERE'
      'F.EMPRESA=?EMPRESA AND'
      'F.CANAL=?CANAL AND'
      'F.SIGNO='#39'P'#39' AND'
      'F.VENCIMIENTO <= ?VENCIMIENTO'
      'AND P.TERCERO=?TERCERO'
      'union'
      
        'SELECT F.EMPRESA,F.EJERCICIO,F.CANAL,F.SIGNO,F.REGISTRO,F.LINEA,' +
        'F.COD_CLI_PRO,'
      
        'F.VENCIMIENTO, F.CTA_PAGO,F.LIQUIDO,F.DOC_NUMERO,F.DOC_SERIE,F.D' +
        'OC_FECHA,F.DOC_TIPO,'
      
        'F.RECIBIDO,F.ENTRADA,F.EJERCICIO_AGRUPACION,F.LIQUIDO_CANAL,F.MO' +
        'NEDA,F.CAMBIO,'
      
        'F.ID_CARTERA,F.ID_CARTERA_DETALLE,F.ID_DOC FROM VER_CARTERA_AGRU' +
        'PACION_FAC F'
      'JOIN EMP_ACREEDORES A'
      'ON F.EMPRESA=A.EMPRESA AND F.COD_CLI_PRO=A.ACREEDOR'
      'WHERE'
      'F.EMPRESA=?EMPRESA AND'
      'F.CANAL=?CANAL AND'
      'F.SIGNO='#39'P'#39' AND'
      'F.VENCIMIENTO <= ?VENCIMIENTO'
      'AND A.TERCERO=?TERCERO'
      'ORDER BY 8')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_AGRUPACION_FAC'
      'SET'
      '  ENTRADA=?ENTRADA '
      '  ,EJERCICIO_AGRUPACION=?EJERCICIO_AGRUPACION '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    AfterPost = xRecibosAfterPost
    BeforeInsert = xRecibosBeforeInsert
    BeforePost = xRecibosBeforePost
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_AGRUPACION_FAC'
    BloqOpt = True
    UpdateTransaction = TUptade
    AutoCommit = True
    Left = 40
    Top = 64
    object xRecibosProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecibosProveedorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecibosProveedorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecibosProveedorSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xRecibosProveedorREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRecibosProveedorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRecibosProveedorCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xRecibosProveedorVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosProveedorCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xRecibosProveedorLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xRecibosProveedorDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xRecibosProveedorDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRecibosProveedorDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xRecibosProveedorDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xRecibosProveedorRECIBIDO: TIntegerField
      DisplayLabel = 'Rec.'
      FieldName = 'RECIBIDO'
    end
    object xRecibosProveedorENTRADA: TIntegerField
      DisplayLabel = 'Agr.'
      FieldName = 'ENTRADA'
      OnChange = xRecibosENTRADAChange
    end
    object xRecibosProveedorEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agrup.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object xRecibosProveedorLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xRecibosProveedorMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosProveedorCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xRecibosProveedorID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xRecibosProveedorID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Det. Cartera'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xRecibosProveedorID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
  end
  object xRecibosCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  ID_CARTERA_DETALLE=?old_ID_CARTERA_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_AGRUPACION_FAC'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,VENC' +
        'IMIENTO,CTA_PAGO,LIQUIDO,DOC_NUMERO,DOC_SERIE,DOC_FECHA,DOC_TIPO' +
        ',RECIBIDO,ENTRADA,EJERCICIO_AGRUPACION,LIQUIDO_CANAL,MONEDA,CAMB' +
        'IO,ID_CARTERA,ID_DOC,ID_CARTERA_DETALLE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI_P' +
        'RO,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,?DOC_NUMERO,?DOC_SERIE,?DOC_F' +
        'ECHA,?DOC_TIPO,?RECIBIDO,?ENTRADA,?EJERCICIO_AGRUPACION,?LIQUIDO' +
        '_CANAL,?MONEDA,?CAMBIO,?ID_CARTERA,?ID_DOC,?ID_CARTERA_DETALLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT F.* FROM VER_CARTERA_AGRUPACION_FAC F'
      'JOIN EMP_CLIENTES C'
      'ON F.EMPRESA=C.EMPRESA AND F.COD_CLI_PRO=C.CLIENTE'
      'WHERE'
      'F.EMPRESA=?EMPRESA AND'
      'F.CANAL=?CANAL AND'
      'F.SIGNO='#39'C'#39' AND'
      'F.VENCIMIENTO <= ?VENCIMIENTO'
      'AND C.TERCERO=?TERCERO'
      'ORDER BY F.VENCIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_AGRUPACION_FAC'
      'SET'
      '  ENTRADA=?ENTRADA '
      '  ,EJERCICIO_AGRUPACION=?EJERCICIO_AGRUPACION '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    AfterPost = xRecibosAfterPost
    BeforeInsert = xRecibosBeforeInsert
    BeforePost = xRecibosBeforePost
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_AGRUPACION_FAC'
    BloqOpt = True
    UpdateTransaction = TUptade
    AutoCommit = True
    Left = 40
    Top = 112
    object xRecibosClienteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecibosClienteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecibosClienteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecibosClienteSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xRecibosClienteREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRecibosClienteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRecibosClienteCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli.'
      FieldName = 'COD_CLI_PRO'
    end
    object xRecibosClienteVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosClienteCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xRecibosClienteLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xRecibosClienteDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xRecibosClienteDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRecibosClienteDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xRecibosClienteDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xRecibosClienteRECIBIDO: TIntegerField
      DisplayLabel = 'Rec.'
      FieldName = 'RECIBIDO'
    end
    object xRecibosClienteENTRADA: TIntegerField
      DisplayLabel = 'Agr.'
      FieldName = 'ENTRADA'
      OnChange = xRecibosENTRADAChange
    end
    object xRecibosClienteEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agrup.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object xRecibosClienteLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xRecibosClienteMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosClienteCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xRecibosClienteID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xRecibosClienteID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object xRecibosClienteID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Det. Cartera'
      FieldName = 'ID_CARTERA_DETALLE'
    end
  end
  object DSxRecibosProveedor: TDataSource
    DataSet = xRecibosProveedor
    Left = 152
    Top = 64
  end
  object DSxRecibosCliente: TDataSource
    DataSet = xRecibosCliente
    Left = 152
    Top = 112
  end
  object xTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT COALESCE((SELECT SUM(IMPORTE)'
      '                 FROM TMP_CARTERA_CP_REC_MARC T'
      '                 WHERE'
      '                 T.SIGNO = '#39'P'#39' AND'
      '                 T.ENTRADA = :ENTRADA), 0) AS PAGOS, --'
      '       COALESCE((SELECT SUM(IMPORTE)'
      '                 FROM TMP_CARTERA_CP_REC_MARC T'
      '                 WHERE'
      '                 T.SIGNO = '#39'C'#39' AND'
      '                 T.ENTRADA = :ENTRADA), 0) AS COBROS'
      'FROM RDB$DATABASE')
    SelectSQL.Strings = (
      'SELECT COALESCE((SELECT SUM(IMPORTE)'
      '                 FROM TMP_CARTERA_CP_REC_MARC T'
      '                 WHERE'
      '                 T.SIGNO = '#39'P'#39' AND'
      '                 T.ENTRADA = :ENTRADA), 0) AS PAGOS, --'
      '       COALESCE((SELECT SUM(IMPORTE)'
      '                 FROM TMP_CARTERA_CP_REC_MARC T'
      '                 WHERE'
      '                 T.SIGNO = '#39'C'#39' AND'
      '                 T.ENTRADA = :ENTRADA), 0) AS COBROS'
      'FROM RDB$DATABASE')
    UniDirectional = False
    OnCalcFields = xTotalesCalcFields
    Left = 40
    Top = 160
    object xTotalesCOBROS: TFloatField
      DisplayLabel = 'Cobros'
      FieldName = 'COBROS'
    end
    object xTotalesPAGOS: TFloatField
      DisplayLabel = 'Pagos'
      FieldName = 'PAGOS'
    end
    object xTotalesSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
  end
  object DSxTotales: TDataSource
    DataSet = xTotales
    Left = 152
    Top = 160
  end
end
