object DMPersonalUlises: TDMPersonalUlises
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 536
  Top = 208
  Height = 398
  Width = 644
  object ADOUlises: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterke;Persist Security Info=True;' +
      'User ID=SYSDBA;Data Source=PULISES'
    DefaultDatabase = 'PULISES'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 40
    Top = 16
  end
  object QImpArticulos: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 40
    Top = 64
  end
  object QPeticionReposicion: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 40
    Top = 112
  end
  object QGeneral: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 120
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 592
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 552
    Top = 8
  end
  object QMPeticRepo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_PULISES_PETIC_REPO'
      'WHERE'
      '  N3=?old_N3 AND '
      '  DOCUMENTO=?old_DOCUMENTO AND '
      '  LINEA=?old_LINEA  AND'
      '  ARTICULO=?old_CULO '
      '')
    InsertSQL.Strings = (
      'INSERT INTO TMP_PULISES_PETIC_REPO'
      
        '  (UNIDADES_ENVIAR,ALMACEN,STOCK,ENVIADO,EMPRESA,CANAL,TIPO_ENTR' +
        'ADA,N3,DOCUMENTO,LINEA,ARTICULO,LOTE,UBICACION,CANTIDAD,ENTRADA)'
      'VALUES'
      
        '  (?UNIDADES_ENVIAR,?ALMACEN,?STOCK,?ENVIADO,?EMPRESA,?CANAL,?TI' +
        'PO_ENTRADA,?N3,?DOCUMENTO,?LINEA,?ARTICULO,?LOTE,?UBICACION,?CAN' +
        'TIDAD,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_PULISES_PETIC_REPO'
      'WHERE'
      '  N3=?N3 AND '
      '  DOCUMENTO=?DOCUMENTO AND '
      '  LINEA=?LINEA AND'
      '  ARTICULO=?ARTICULO '
      '')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_PULISES_PETIC_REPO'
      ' ORDER BY N3, DOCUMENTO, LINEA, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_PULISES_PETIC_REPO'
      'SET'
      '  UNIDADES_ENVIAR=?UNIDADES_ENVIAR '
      '  ,ALMACEN=?ALMACEN '
      '  ,STOCK=?STOCK '
      '  ,ENVIADO=?ENVIADO '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO_ENTRADA=?TIPO_ENTRADA '
      '  ,LOTE=?LOTE '
      '  ,UBICACION=?UBICACION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,ENTRADA=?ENTRADA '
      'WHERE'
      '  N3=?N3 AND '
      '  DOCUMENTO=?DOCUMENTO AND '
      '  LINEA=?LINEA AND'
      '  ARTICULO=?ARTICULO ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    ClavesPrimarias.Strings = (
      'N3 '
      'DOCUMENTO '
      'LINEA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PULISES_PETIC_REPO'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 62
    object QMPeticRepoTIPO_ENTRADA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ENTRADA'
    end
    object QMPeticRepoN3: TFIBStringField
      DisplayLabel = 'N3.'
      FieldName = 'N3'
      Size = 40
    end
    object QMPeticRepoDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object QMPeticRepoLINEA: TFIBStringField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPeticRepoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPeticRepoLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMPeticRepoUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 40
    end
    object QMPeticRepoCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMPeticRepoUNIDADES_ENVIAR: TFloatField
      DisplayLabel = 'Uds. Enviar'
      FieldName = 'UNIDADES_ENVIAR'
    end
    object QMPeticRepoENTRADA: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA'
    end
    object QMPeticRepoALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPeticRepoENVIADO: TIntegerField
      DisplayLabel = 'Enviado'
      FieldName = 'ENVIADO'
    end
    object QMPeticRepoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPeticRepoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPeticRepoSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMPeticRepoRECALCULA_STOCK: TIntegerField
      DisplayLabel = 'Recalc. Stock'
      FieldName = 'RECALCULA_STOCK'
    end
    object QMPeticRepoMOVIMIENTO: TIntegerField
      DisplayLabel = 'Mov. Stock'
      FieldName = 'MOVIMIENTO'
    end
  end
  object DSQMPeticRepo: TDataSource
    DataSet = QMPeticRepo
    Left = 352
    Top = 62
  end
  object QPUlisesCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PULISES_CABECERA'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PULISES_CABECERA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,FECHA,CLIENTE,TIT' +
        'ULO,SU_REFERENCIA,FORMA_PAGO,LIQUIDO,N3,PROCESAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?FECHA,?CL' +
        'IENTE,?TITULO,?SU_REFERENCIA,?FORMA_PAGO,?LIQUIDO,?N3,?PROCESAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PULISES_CABECERA'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PULISES_CABECERA'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL'
      'ORDER BY ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PULISES_CABECERA'
      'SET'
      '   N3=?N3 '
      '  ,PROCESAR=?PROCESAR '
      '  ,ENVIADO=?ENVIADO'
      'WHERE'
      '  ID_S=?ID_S ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterOpen = QPUlisesCabAfterOpen
    BeforeClose = QPUlisesCabBeforeClose
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PULISES_CABECERA'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 118
    object QPUlisesCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QPUlisesCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QPUlisesCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QPUlisesCabSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QPUlisesCabTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QPUlisesCabRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QPUlisesCabID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QPUlisesCabFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QPUlisesCabCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QPUlisesCabTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QPUlisesCabSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QPUlisesCabFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QPUlisesCabLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QPUlisesCabN3: TFIBStringField
      DisplayLabel = 'N3.'
      FieldName = 'N3'
      Size = 40
    end
    object QPUlisesCabPROCESAR: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'PROCESAR'
      OnChange = QPUlisesCabPROCESARChange
    end
    object QPUlisesCabENVIADO: TIntegerField
      DisplayLabel = 'Enviado'
      FieldName = 'ENVIADO'
    end
  end
  object DSQPUlisesCab: TDataSource
    DataSet = QPUlisesCab
    Left = 352
    Top = 118
  end
  object QPUlisesCabePed: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PULISES_CABE_PED'
      'WHERE'
      '  N3=?old_N3 ')
    InsertSQL.Strings = (
      'INSERT INTO PULISES_CABE_PED'
      
        '  (N3,N2,DOCUMENTO,TIPO_N3,PRIORIDAD,BULTOS,OBSERVACION_ALMACEN,' +
        'OBSERVACION_CLIENTE,OBSERVACION_TRANSPORTE,CLIENTE,NOMBRE_CLIENT' +
        'E,DIRECCION,POBLACION,PROVINCIA,CP,PAIS,TRANSPORTISTA,IMPRIMIR_A' +
        'LBARAN,ALB_VALORADO,PORTES,DATO1,DATO2,DATO3,FECHA_ENTREGA,TIPO_' +
        'BLOQUE,ID_S,PROCESAR)'
      'VALUES'
      
        '  (?N3,?N2,?DOCUMENTO,?TIPO_N3,?PRIORIDAD,?BULTOS,?OBSERVACION_A' +
        'LMACEN,?OBSERVACION_CLIENTE,?OBSERVACION_TRANSPORTE,?CLIENTE,?NO' +
        'MBRE_CLIENTE,?DIRECCION,?POBLACION,?PROVINCIA,?CP,?PAIS,?TRANSPO' +
        'RTISTA,?IMPRIMIR_ALBARAN,?ALB_VALORADO,?PORTES,?DATO1,?DATO2,?DA' +
        'TO3,?FECHA_ENTREGA,?TIPO_BLOQUE,?ID_S,?PROCESAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PULISES_CABE_PED'
      'WHERE'
      '  N3=?N3 ')
    SelectSQL.Strings = (
      'SELECT * FROM PULISES_CABE_PED'
      'WHERE N3=?N3'
      'ORDER BY N3')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PULISES_CABE_PED'
      'SET'
      '  N2=?N2 '
      '  ,DOCUMENTO=?DOCUMENTO '
      '  ,TIPO_N3=?TIPO_N3 '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,BULTOS=?BULTOS '
      '  ,OBSERVACION_ALMACEN=?OBSERVACION_ALMACEN '
      '  ,OBSERVACION_CLIENTE=?OBSERVACION_CLIENTE '
      '  ,OBSERVACION_TRANSPORTE=?OBSERVACION_TRANSPORTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_CLIENTE=?NOMBRE_CLIENTE '
      '  ,DIRECCION=?DIRECCION '
      '  ,POBLACION=?POBLACION '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,CP=?CP '
      '  ,PAIS=?PAIS '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,IMPRIMIR_ALBARAN=?IMPRIMIR_ALBARAN '
      '  ,ALB_VALORADO=?ALB_VALORADO '
      '  ,PORTES=?PORTES '
      '  ,DATO1=?DATO1 '
      '  ,DATO2=?DATO2 '
      '  ,DATO3=?DATO3 '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,TIPO_BLOQUE=?TIPO_BLOQUE '
      '  ,ID_S=?ID_S '
      '  ,PROCESAR=?PROCESAR '
      'WHERE'
      '  N3=?N3 ')
    DataSource = DSQPUlisesCab
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterOpen = QPUlisesCabePedAfterOpen
    BeforeClose = QPUlisesCabePedBeforeClose
    ClavesPrimarias.Strings = (
      'N3 ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PULISES_CABE_PED'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 174
    object QPUlisesCabePedN3: TFIBStringField
      DisplayLabel = 'N3.'
      FieldName = 'N3'
      Size = 40
    end
    object QPUlisesCabePedN2: TFIBStringField
      DisplayLabel = 'N2.'
      FieldName = 'N2'
      Size = 40
    end
    object QPUlisesCabePedDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object QPUlisesCabePedTIPO_N3: TFIBStringField
      DisplayLabel = 'Tipo N3'
      FieldName = 'TIPO_N3'
    end
    object QPUlisesCabePedPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QPUlisesCabePedBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QPUlisesCabePedOBSERVACION_ALMACEN: TFIBStringField
      DisplayLabel = 'Notas Alm.'
      FieldName = 'OBSERVACION_ALMACEN'
      Size = 100
    end
    object QPUlisesCabePedOBSERVACION_CLIENTE: TFIBStringField
      DisplayLabel = 'Notas Cli.'
      FieldName = 'OBSERVACION_CLIENTE'
      Size = 100
    end
    object QPUlisesCabePedOBSERVACION_TRANSPORTE: TFIBStringField
      DisplayLabel = 'Notas Transp.'
      FieldName = 'OBSERVACION_TRANSPORTE'
      Size = 100
    end
    object QPUlisesCabePedCLIENTE: TFIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QPUlisesCabePedNOMBRE_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object QPUlisesCabePedDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 100
    end
    object QPUlisesCabePedPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 100
    end
    object QPUlisesCabePedPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 100
    end
    object QPUlisesCabePedCP: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CP'
    end
    object QPUlisesCabePedPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 100
    end
    object QPUlisesCabePedTRANSPORTISTA: TFIBStringField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
      Size = 100
    end
    object QPUlisesCabePedIMPRIMIR_ALBARAN: TFIBStringField
      DisplayLabel = 'Imprimir Alb.'
      FieldName = 'IMPRIMIR_ALBARAN'
      Size = 1
    end
    object QPUlisesCabePedALB_VALORADO: TFIBStringField
      DisplayLabel = 'Alb. Valorado'
      FieldName = 'ALB_VALORADO'
      Size = 1
    end
    object QPUlisesCabePedPORTES: TFIBStringField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QPUlisesCabePedDATO1: TFIBStringField
      DisplayLabel = 'Dato 1'
      FieldName = 'DATO1'
      Size = 100
    end
    object QPUlisesCabePedDATO2: TFIBStringField
      DisplayLabel = 'Dato 2'
      FieldName = 'DATO2'
      Size = 100
    end
    object QPUlisesCabePedDATO3: TFIBStringField
      DisplayLabel = 'Dato 3'
      FieldName = 'DATO3'
      Size = 100
    end
    object QPUlisesCabePedFECHA_ENTREGA: TFIBStringField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object QPUlisesCabePedTIPO_BLOQUE: TFIBStringField
      DisplayLabel = 'Tipo Bloque'
      FieldName = 'TIPO_BLOQUE'
    end
    object QPUlisesCabePedID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QPUlisesCabePedPROCESAR: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'PROCESAR'
    end
    object QPUlisesCabePedENVIADO: TIntegerField
      DisplayLabel = 'Enviado'
      FieldName = 'ENVIADO'
    end
    object QPUlisesCabePedFECHA_SERVICIO: TDateTimeField
      DisplayLabel = 'Fec. Servicio'
      FieldName = 'FECHA_SERVICIO'
    end
    object QPUlisesCabePedBULTOS_SERVIDOS: TIntegerField
      DisplayLabel = 'Bultos Serv.'
      FieldName = 'BULTOS_SERVIDOS'
    end
    object QPUlisesCabePedKILOS: TFloatField
      DisplayLabel = 'Kilos'
      FieldName = 'KILOS'
    end
    object QPUlisesCabePedFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fecha Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object QPUlisesCabePedRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
  end
  object QPUlisesDetaPed: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PULISES_DETA_PED'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  N3=?old_N3 ')
    InsertSQL.Strings = (
      'INSERT INTO PULISES_DETA_PED'
      
        '  (N3,LINEA,ARTICULO,LOTE,CANTIDAD,DESCRIPCION,PRECIO,UBICACION,' +
        'DATO1,TIPO_BLOQUE,ID_DETALLES_S,PROCESAR)'
      'VALUES'
      
        '  (?N3,?LINEA,?ARTICULO,?LOTE,?CANTIDAD,?DESCRIPCION,?PRECIO,?UB' +
        'ICACION,?DATO1,?TIPO_BLOQUE,?ID_DETALLES_S,?PROCESAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PULISES_DETA_PED'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  N3=?N3 ')
    SelectSQL.Strings = (
      'SELECT * FROM PULISES_DETA_PED'
      'WHERE'
      'N3=?N3'
      'ORDER BY N3,LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PULISES_DETA_PED'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,LOTE=?LOTE '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,PRECIO=?PRECIO '
      '  ,UBICACION=?UBICACION '
      '  ,DATO1=?DATO1 '
      '  ,TIPO_BLOQUE=?TIPO_BLOQUE '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,PROCESAR=?PROCESAR '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  N3=?N3 ')
    DataSource = DSQPUlisesCabePed
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    ClavesPrimarias.Strings = (
      'LINEA '
      'N3 ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PULISES_DETA_PED'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 448
    Top = 174
    object QPUlisesDetaPedN3: TFIBStringField
      DisplayLabel = 'N3.'
      FieldName = 'N3'
      Size = 40
    end
    object QPUlisesDetaPedLINEA: TFIBStringField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QPUlisesDetaPedARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QPUlisesDetaPedLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QPUlisesDetaPedCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QPUlisesDetaPedDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object QPUlisesDetaPedPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QPUlisesDetaPedUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 40
    end
    object QPUlisesDetaPedDATO1: TFIBStringField
      DisplayLabel = 'Dato 1'
      FieldName = 'DATO1'
      Size = 100
    end
    object QPUlisesDetaPedTIPO_BLOQUE: TFIBStringField
      DisplayLabel = 'Tipo Bloque'
      FieldName = 'TIPO_BLOQUE'
    end
    object QPUlisesDetaPedID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QPUlisesDetaPedPROCESAR: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'PROCESAR'
    end
    object QPUlisesDetaPedCANTIDAD_CONFIRMADA: TFloatField
      DisplayLabel = 'Cant. Confirmada'
      FieldName = 'CANTIDAD_CONFIRMADA'
    end
    object QPUlisesDetaPedRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
  end
  object DSQPUlisesCabePed: TDataSource
    DataSet = QPUlisesCabePed
    Left = 352
    Top = 174
  end
  object QPUlisesCabServ: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PULISES_CABECERA_SERV'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PULISES_CABECERA_SERV'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,FECHA,CLIENTE,TIT' +
        'ULO,SU_REFERENCIA,FORMA_PAGO,LIQUIDO,N3,FECHA_SERVICIO,BULTOS_SE' +
        'RVIDOS,KILOS,FECHA_CREACION,PROCESAR)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?FECHA,?CL' +
        'IENTE,?TITULO,?SU_REFERENCIA,?FORMA_PAGO,?LIQUIDO,?N3,?FECHA_SER' +
        'VICIO,?BULTOS_SERVIDOS,?KILOS,?FECHA_CREACION,?PROCESAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PULISES_CABECERA_SERV'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PULISES_CABECERA_SERV'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL'
      ' ORDER BY ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PULISES_CABECERA_SERV'
      'SET'
      '  PROCESAR=?PROCESAR '
      'WHERE'
      '  ID_S=?ID_S ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterOpen = QPUlisesCabServAfterOpen
    BeforeClose = QPUlisesCabServBeforeClose
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PULISES_CABECERA_SERV'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 230
    object QPUlisesCabServEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QPUlisesCabServEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QPUlisesCabServCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QPUlisesCabServSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QPUlisesCabServTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QPUlisesCabServRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QPUlisesCabServID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QPUlisesCabServFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QPUlisesCabServCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QPUlisesCabServTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QPUlisesCabServSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QPUlisesCabServFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QPUlisesCabServLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QPUlisesCabServN3: TFIBStringField
      DisplayLabel = 'N3.'
      FieldName = 'N3'
      Size = 40
    end
    object QPUlisesCabServFECHA_SERVICIO: TDateTimeField
      DisplayLabel = 'Fec. Serv.'
      FieldName = 'FECHA_SERVICIO'
    end
    object QPUlisesCabServBULTOS_SERVIDOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS_SERVIDOS'
    end
    object QPUlisesCabServKILOS: TFloatField
      DisplayLabel = 'Kilos'
      FieldName = 'KILOS'
    end
    object QPUlisesCabServFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creaci'#243'n'
      FieldName = 'FECHA_CREACION'
    end
    object QPUlisesCabServPROCESAR: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'PROCESAR'
    end
  end
  object DSQPUlisesCabServ: TDataSource
    DataSet = QPUlisesCabServ
    Left = 344
    Top = 230
  end
  object QGeneral2: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 120
    Top = 64
  end
  object QGeneral3: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 120
    Top = 112
  end
  object DSQPUlisesDetaPed: TDataSource
    DataSet = QPUlisesDetaPed
    Left = 536
    Top = 174
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PULISES_DETALLE'
      'WHERE'
      '  ID_S=?old_ID_S AND '
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PULISES_DETALLE'
      
        '  (NOTAS,UNIDADES_EXT,ORDEN_PRODUCCION,UNIDADES_SEC,DIRECCION_EN' +
        'TREGA,ID_DETALLES_S,ID_S,ID_A,ID_C_A,COMISION_LINEAL,I_COMISION_' +
        'LINEAL,FECHA_ENTREGA_PREV,FECHA_REC_DET,TITULO_IDIOMA,MARGEN_KRI' +
        ',TIPO_LINEA_KRI,ORDEN,TIPO_LINEA,PROC_PROMOCION,ORIGEN,ID_P,APLI' +
        'CA_UNIDADES_SECUNDARIAS,PROYECTO,NOTAS2,CRC_NOTAS,CRC_NOTAS2,CAN' +
        'TIDAD,CANTIDAD_CONFIRMADA,EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG' +
        ',LINEA,ESTADO,CLIENTE,MONEDA,ALMACEN,ARTICULO,TITULO,UNIDADES,UN' +
        'IDADES_SERVIDAS,UNIDADES_PENDIENTES,UNIDADES_RESERVADAS,SERVIDO,' +
        'PRECIO,PIEZAS_X_BULTO,BULTOS,DESCUENTO,DESCUENTO_2,DESCUENTO_3,C' +
        'OMISION,P_COSTE,M_MOV_STOCK,TIPO_IVA,P_IVA,P_RECARGO,BRUTO,B_COM' +
        'ISION,I_DESCUENTO,B_IMPONIBLE,I_COMISION,ENTRADA,ENTRADA_AGRUPAC' +
        'ION)'
      'VALUES'
      
        '  (?NOTAS,?UNIDADES_EXT,?ORDEN_PRODUCCION,?UNIDADES_SEC,?DIRECCI' +
        'ON_ENTREGA,?ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?COMISION_LINEAL,?' +
        'I_COMISION_LINEAL,?FECHA_ENTREGA_PREV,?FECHA_REC_DET,?TITULO_IDI' +
        'OMA,?MARGEN_KRI,?TIPO_LINEA_KRI,?ORDEN,?TIPO_LINEA,?PROC_PROMOCI' +
        'ON,?ORIGEN,?ID_P,?APLICA_UNIDADES_SECUNDARIAS,?PROYECTO,?NOTAS2,' +
        '?CRC_NOTAS,?CRC_NOTAS2,?CANTIDAD,?CANTIDAD_CONFIRMADA,?EMPRESA,?' +
        'EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ESTADO,?CLIENTE,?MONE' +
        'DA,?ALMACEN,?ARTICULO,?TITULO,?UNIDADES,?UNIDADES_SERVIDAS,?UNID' +
        'ADES_PENDIENTES,?UNIDADES_RESERVADAS,?SERVIDO,?PRECIO,?PIEZAS_X_' +
        'BULTO,?BULTOS,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?COMISION,?P_' +
        'COSTE,?M_MOV_STOCK,?TIPO_IVA,?P_IVA,?P_RECARGO,?BRUTO,?B_COMISIO' +
        'N,?I_DESCUENTO,?B_IMPONIBLE,?I_COMISION,?ENTRADA,?ENTRADA_AGRUPA' +
        'CION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PULISES_DETALLE'
      'WHERE'
      '  ID_S=?ID_S AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PULISES_DETALLE'
      'WHERE ID_S=?ID_S'
      ' ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PULISES_DETALLE'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,ORDEN_PRODUCCION=?ORDEN_PRODUCCION '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,DIRECCION_ENTREGA=?DIRECCION_ENTREGA '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,FECHA_ENTREGA_PREV=?FECHA_ENTREGA_PREV '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,NOTAS2=?NOTAS2 '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,CANTIDAD_CONFIRMADA=?CANTIDAD_CONFIRMADA '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ESTADO=?ESTADO '
      '  ,CLIENTE=?CLIENTE '
      '  ,MONEDA=?MONEDA '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,UNIDADES_SERVIDAS=?UNIDADES_SERVIDAS '
      '  ,UNIDADES_PENDIENTES=?UNIDADES_PENDIENTES '
      '  ,UNIDADES_RESERVADAS=?UNIDADES_RESERVADAS '
      '  ,SERVIDO=?SERVIDO '
      '  ,PRECIO=?PRECIO '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,BULTOS=?BULTOS '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,COMISION=?COMISION '
      '  ,P_COSTE=?P_COSTE '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,BRUTO=?BRUTO '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_COMISION=?I_COMISION '
      '  ,ENTRADA=?ENTRADA '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      'WHERE'
      '  ID_S=?ID_S AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    DataSource = DSQPUlisesCab
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    ClavesPrimarias.Strings = (
      'ID_S '
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PULISES_DETALLE'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 448
    Top = 115
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
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetalleUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Serv.'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object QMDetalleUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
    end
    object QMDetalleUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reserv.'
      FieldName = 'UNIDADES_RESERVADAS'
    end
    object QMDetalleSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object QMDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = 'P. IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = 'P. Recargo'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'Cuota Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMDetalleORDEN_PRODUCCION: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMDetalleDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entr.'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Comision Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object QMDetalleMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'ORDEN'
    end
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Lin.'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object QMDetalleORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetalleID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object QMDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cant. Env.'
      FieldName = 'CANTIDAD'
    end
    object QMDetalleCANTIDAD_CONFIRMADA: TFloatField
      DisplayLabel = 'Cant. Conf.'
      FieldName = 'CANTIDAD_CONFIRMADA'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 536
    Top = 115
  end
  object QMPeticRepoResp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_PULISES_PETIC_REPO'
      'WHERE'
      '  N3=?old_N3 AND '
      '  DOCUMENTO=?old_DOCUMENTO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_PULISES_PETIC_REPO'
      
        '  (UNIDADES_ENVIAR,ALMACEN,STOCK,ENVIADO,EMPRESA,CANAL,TIPO_ENTR' +
        'ADA,N3,DOCUMENTO,LINEA,ARTICULO,LOTE,UBICACION,CANTIDAD,ENTRADA,' +
        'MOVIMIENTO)'
      'VALUES'
      
        '  (?UNIDADES_ENVIAR,?ALMACEN,?STOCK,?ENVIADO,?EMPRESA,?CANAL,?TI' +
        'PO_ENTRADA,?N3,?DOCUMENTO,?LINEA,?ARTICULO,?LOTE,?UBICACION,?CAN' +
        'TIDAD,?ENTRADA,?MOVIMIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_PULISES_PETIC_REPO'
      'WHERE'
      '  N3=?N3 AND '
      '  DOCUMENTO=?DOCUMENTO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_PULISES_PETIC_REPO'
      ' ORDER BY N3, DOCUMENTO, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_PULISES_PETIC_REPO'
      'SET'
      '  UNIDADES_ENVIAR=?UNIDADES_ENVIAR '
      '  ,ALMACEN=?ALMACEN '
      '  ,STOCK=?STOCK '
      '  ,ENVIADO=?ENVIADO '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO_ENTRADA=?TIPO_ENTRADA '
      '  ,ARTICULO=?ARTICULO '
      '  ,LOTE=?LOTE '
      '  ,UBICACION=?UBICACION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,ENTRADA=?ENTRADA '
      '  ,MOVIMIENTO=?MOVIMIENTO'
      'WHERE'
      '  N3=?N3 AND '
      '  DOCUMENTO=?DOCUMENTO AND '
      '  LINEA=?LINEA ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    ClavesPrimarias.Strings = (
      'N3 '
      'DOCUMENTO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PULISES_PETIC_REPO'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 448
    Top = 62
    object QMPeticRepoRespTIPO_ENTRADA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ENTRADA'
    end
    object QMPeticRepoRespN3: TFIBStringField
      DisplayLabel = 'N3.'
      FieldName = 'N3'
      Size = 40
    end
    object QMPeticRepoRespDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object QMPeticRepoRespLINEA: TFIBStringField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPeticRepoRespARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPeticRepoRespLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMPeticRepoRespUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 40
    end
    object QMPeticRepoRespCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMPeticRepoRespENTRADA: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA'
    end
    object QMPeticRepoRespUNIDADES_ENVIAR: TFloatField
      DisplayLabel = 'Uds. Enviar'
      FieldName = 'UNIDADES_ENVIAR'
    end
    object QMPeticRepoRespALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPeticRepoRespSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMPeticRepoRespENVIADO: TIntegerField
      DisplayLabel = 'Enviado'
      FieldName = 'ENVIADO'
    end
    object QMPeticRepoRespEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPeticRepoRespCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPeticRepoRespRECALCULA_STOCK: TIntegerField
      DisplayLabel = 'Recalc. Stock'
      FieldName = 'RECALCULA_STOCK'
    end
    object QMPeticRepoRespMOVIMIENTO: TIntegerField
      DisplayLabel = 'Mov. Stock'
      FieldName = 'MOVIMIENTO'
    end
    object QMPeticRepoRespCANTIDAD_ENTRADA: TFloatField
      DisplayLabel = 'Cant. Entrada'
      FieldName = 'CANTIDAD_ENTRADA'
    end
  end
  object DSQMPeticRepoResp: TDataSource
    DataSet = QMPeticRepoResp
    Left = 552
    Top = 62
  end
  object QPeticionRepoRespuesta: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 40
    Top = 160
  end
  object QPrueba: TADOQuery
    Connection = ADOUlises
    Parameters = <>
    Left = 40
    Top = 320
  end
  object DSQPrueba: TDataSource
    DataSet = QPrueba
    Left = 96
    Top = 320
  end
end
