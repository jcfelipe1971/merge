object DMAlquiler: TDMAlquiler
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 205
  Top = 106
  Height = 411
  Width = 687
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 608
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
    Left = 608
    Top = 64
  end
  object QMAqluiler: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ALQUILER'
      'WHERE'
      '  ID_ALQ=?old_ID_ALQ ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ALQUILER'
      
        '  (EMPRESA,CANAL,ID_ALQ,ID_S_PEC,CLIENTE,NOMBRE_R_SOCIAL,ESTADO_' +
        'PEDIDO,ALMACEN_DEPOSITO)'
      'VALUES'
      
        '  (?EMPRESA,?CANAL,?ID_ALQ,?ID_S_PEC,?CLIENTE,?NOMBRE_R_SOCIAL,?' +
        'ESTADO_PEDIDO,?ALMACEN_DEPOSITO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ALQUILER'
      '        WHERE'
      '  ID_ALQ=?ID_ALQ ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ALQUILER'
      '        WHERE'
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL'
      '/* No agregar orden */')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ALQUILER'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,ID_S_PEC=?ID_S_PEC '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,ESTADO_PEDIDO=?ESTADO_PEDIDO'
      '  ,ALMACEN_DEPOSITO=?ALMACEN_DEPOSITO'
      'WHERE'
      '  ID_ALQ=?ID_ALQ ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))')
    AfterOpen = QMAqluilerAfterOpen
    AfterScroll = QMAqluilerAfterScroll
    BeforeClose = QMAqluilerBeforeClose
    ClavesPrimarias.Strings = (
      'ID_ALQ ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ALQUILER'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_PED')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMAqluilerEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAqluilerCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAqluilerID_ALQ: TIntegerField
      DisplayLabel = 'Id Alq.'
      FieldName = 'ID_ALQ'
    end
    object QMAqluilerID_S_PEC: TIntegerField
      DisplayLabel = 'Id Pedido'
      FieldName = 'ID_S_PEC'
    end
    object QMAqluilerPEDIDO: TFIBStringField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      Size = 29
    end
    object QMAqluilerESTADO_PEDIDO: TIntegerField
      DisplayLabel = 'Estado Ped.'
      FieldName = 'ESTADO_PEDIDO'
    end
    object QMAqluilerALBARAN: TFIBStringField
      DisplayLabel = 'Albaran'
      FieldName = 'ALBARAN'
      Size = 29
    end
    object QMAqluilerESTADO_ALBARAN: TIntegerField
      DisplayLabel = 'Estado Alb.'
      FieldName = 'ESTADO_ALBARAN'
    end
    object QMAqluilerID_S_ALB: TIntegerField
      DisplayLabel = 'Id Albaran'
      FieldName = 'ID_S_ALB'
    end
    object QMAqluilerEJERCICIO_ALBARAN: TIntegerField
      DisplayLabel = 'Ejer. Alb.'
      FieldName = 'EJERCICIO_ALBARAN'
    end
    object QMAqluilerSERIE_ALBARAN: TFIBStringField
      DisplayLabel = 'Serie Alb.'
      FieldName = 'SERIE_ALBARAN'
      Size = 10
    end
    object QMAqluilerUNIDADES_SERIALIZADAS: TFloatField
      DisplayLabel = 'Uds. Serializadas'
      FieldName = 'UNIDADES_SERIALIZADAS'
    end
    object QMAqluilerFECHA_FIN_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. Ultima Cuota'
      FieldName = 'FECHA_FIN_CUOTA'
    end
    object QMAqluilerCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAqluilerNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMAqluilerALMACEN_DEPOSITO: TFIBStringField
      DisplayLabel = 'Alm. Deposito'
      FieldName = 'ALMACEN_DEPOSITO'
      Size = 3
    end
    object QMAqluilerFECHA_PROX_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. Proxima Cuota'
      FieldName = 'FECHA_PROX_CUOTA'
    end
  end
  object DSQMAqluiler: TDataSource
    DataSet = QMAqluiler
    Left = 144
    Top = 8
  end
  object xCuotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_CUOTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  CUOTA=?old_CUOTA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_CUOTAS'
      
        '  (FECHA_FIN_CUOTA,FECHA_PROX_CUOTA,FECHA_ULT_CUOTA,IMPORTE,NOTA' +
        'S,UNIDADES,ID_A,RIG_DOC,SERIE_ULT_CUOTA,DIAS,TERCERO,ID_S_D,ID_S' +
        ',CLIENTE,CANAL,AGRUPADA,PERIODICIDAD,DESCUENTO,SUPLIDO,DESCRIPCI' +
        'ON,CUOTA,EMPRESA,TIPO_DOC,ARTICULO,ID_ORIGEN,TIPO_ORIGEN)'
      'VALUES'
      
        '  (?FECHA_FIN_CUOTA,?FECHA_PROX_CUOTA,?FECHA_ULT_CUOTA,?IMPORTE,' +
        '?NOTAS,?UNIDADES,?ID_A,?RIG_DOC,?SERIE_ULT_CUOTA,?DIAS,?TERCERO,' +
        '?ID_S_D,?ID_S,?CLIENTE,?CANAL,?AGRUPADA,?PERIODICIDAD,?DESCUENTO' +
        ',?SUPLIDO,?DESCRIPCION,?CUOTA,?EMPRESA,?TIPO_DOC,?ARTICULO,?ID_O' +
        'RIGEN,?TIPO_ORIGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_CUOTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA = :CUOTA'
      '')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_CUOTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  TIPO_ORIGEN = '#39'PEC'#39' AND'
      '  ID_ORIGEN = ?ID_S_PEC'
      'ORDER BY CUOTA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_CUOTAS'
      'SET'
      '  FECHA_FIN_CUOTA=?FECHA_FIN_CUOTA '
      '  ,FECHA_PROX_CUOTA=?FECHA_PROX_CUOTA '
      '  ,FECHA_ULT_CUOTA=?FECHA_ULT_CUOTA '
      '  ,IMPORTE=?IMPORTE '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDADES=?UNIDADES '
      '  ,ID_A=?ID_A '
      '  ,RIG_DOC=?RIG_DOC '
      '  ,SERIE_ULT_CUOTA=?SERIE_ULT_CUOTA '
      '  ,DIAS=?DIAS '
      '  ,TERCERO=?TERCERO '
      '  ,ID_S_D=?ID_S_D '
      '  ,ID_S=?ID_S '
      '  ,AGRUPADA=?AGRUPADA '
      '  ,PERIODICIDAD=?PERIODICIDAD '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,TIPO_DOC=?TIPO_DOC '
      '  ,ARTICULO=?ARTICULO '
      '  ,ID_ORIGEN=?ID_ORIGEN '
      '  ,TIPO_ORIGEN=?TIPO_ORIGEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA=?CUOTA ')
    DataSource = DSQMAqluiler
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_CUOTAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_PED')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object xCuotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCuotasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCuotasCUOTA: TIntegerField
      DisplayLabel = 'Cuota'
      FieldName = 'CUOTA'
    end
    object xCuotasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCuotasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCuotasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xCuotasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xCuotasIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xCuotasSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object xCuotasDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object xCuotasPERIODICIDAD: TIntegerField
      DisplayLabel = 'Periodicidad'
      FieldName = 'PERIODICIDAD'
    end
    object xCuotasDIAS: TIntegerField
      DisplayLabel = 'Dias'
      FieldName = 'DIAS'
    end
    object xCuotasFECHA_ULT_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Cuota'
      FieldName = 'FECHA_ULT_CUOTA'
    end
    object xCuotasFECHA_PROX_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. Prox. Cuota'
      FieldName = 'FECHA_PROX_CUOTA'
    end
    object xCuotasSERIE_ULT_CUOTA: TFIBStringField
      DisplayLabel = 'Serie Ult. Cuota'
      FieldName = 'SERIE_ULT_CUOTA'
      Size = 10
    end
    object xCuotasTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object xCuotasAGRUPADA: TIntegerField
      DisplayLabel = 'Agrupada'
      FieldName = 'AGRUPADA'
    end
    object xCuotasRIG_DOC: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_DOC'
    end
    object xCuotasID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xCuotasID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xCuotasID_S_D: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_S_D'
    end
    object xCuotasFECHA_FIN_CUOTA: TDateTimeField
      DisplayLabel = 'Fec. Fin Cuota'
      FieldName = 'FECHA_FIN_CUOTA'
    end
    object xCuotasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xCuotasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCuotasID_ORIGEN: TIntegerField
      DisplayLabel = 'Id Doc. Orig.'
      FieldName = 'ID_ORIGEN'
    end
    object xCuotasTIPO_ORIGEN: TFIBStringField
      DisplayLabel = 'Tipo Orig.'
      FieldName = 'TIPO_ORIGEN'
      Size = 3
    end
  end
  object DSCuotas: TDataSource
    DataSet = xCuotas
    Left = 144
    Top = 56
  end
  object xCuotaDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  CUOTA=?old_CUOTA AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_CUOTAS_DETALLE_DOC'
      
        '  (FECHA,IMPORTE,UNIDADES,ID_S_D,ID_S,ID_A,TERCERO,LINEA,CLIENTE' +
        ',CANAL,PROCESADA,AGRUPADA,SUPLIDO,DESCUENTO,DESCRIPCION,CUOTA,EM' +
        'PRESA,TIPO_DOC,ARTICULO)'
      'VALUES'
      
        '  (?FECHA,?IMPORTE,?UNIDADES,?ID_S_D,?ID_S,?ID_A,?TERCERO,?LINEA' +
        ',?CLIENTE,?CANAL,?PROCESADA,?AGRUPADA,?SUPLIDO,?DESCUENTO,?DESCR' +
        'IPCION,?CUOTA,?EMPRESA,?TIPO_DOC,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT D.*'
      'FROM EMP_CLIENTES_CUOTAS C'
      
        'JOIN EMP_CLIENTES_CUOTAS_DETALLE_DOC D ON C.EMPRESA = D.EMPRESA ' +
        'AND C.CANAL = D.CANAL AND C.CLIENTE = D.CLIENTE AND C.CUOTA = D.' +
        'CUOTA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.CLIENTE=?CLIENTE AND '
      'C.CUOTA=?CUOTA AND '
      'D.LINEA=?LINEA '
      'ORDER BY D.LINEA DESC')
    SelectSQL.Strings = (
      'SELECT D.*'
      'FROM EMP_CLIENTES_CUOTAS C'
      
        'JOIN EMP_CLIENTES_CUOTAS_DETALLE_DOC D ON C.EMPRESA = D.EMPRESA ' +
        'AND C.CANAL = D.CANAL AND C.CLIENTE = D.CLIENTE AND C.CUOTA = D.' +
        'CUOTA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO_ORIGEN = '#39'PEC'#39' AND'
      'C.ID_ORIGEN = :ID_S_PEC'
      'ORDER BY D.LINEA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_CUOTAS_DETALLE_DOC'
      'SET'
      '  FECHA=?FECHA '
      '  ,IMPORTE=?IMPORTE '
      '  ,UNIDADES=?UNIDADES '
      '  ,ID_S_D=?ID_S_D '
      '  ,ID_S=?ID_S '
      '  ,ID_A=?ID_A '
      '  ,TERCERO=?TERCERO '
      '  ,PROCESADA=?PROCESADA '
      '  ,AGRUPADA=?AGRUPADA '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,TIPO_DOC=?TIPO_DOC '
      '  ,ARTICULO=?ARTICULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA=?CUOTA AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMAqluiler
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))')
    ClavesPrimarias.Strings = (
      'CLIENTE '
      'CUOTA '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_CUOTAS_DETALLE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_PED')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object xCuotaDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCuotaDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCuotaDetalleCUOTA: TIntegerField
      DisplayLabel = 'Cuota'
      FieldName = 'CUOTA'
    end
    object xCuotaDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCuotaDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCuotaDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCuotaDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object xCuotaDetalleIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xCuotaDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object xCuotaDetalleSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object xCuotaDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xCuotaDetalleTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object xCuotaDetalleAGRUPADA: TIntegerField
      DisplayLabel = 'Agrupa'
      FieldName = 'AGRUPADA'
    end
    object xCuotaDetallePROCESADA: TIntegerField
      DisplayLabel = 'Procesada'
      FieldName = 'PROCESADA'
    end
    object xCuotaDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xCuotaDetalleID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xCuotaDetalleID_S_D: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_S_D'
    end
    object xCuotaDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xCuotaDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSCuotaDetalle: TDataSource
    DataSet = xCuotaDetalle
    Left = 144
    Top = 104
  end
  object xAlquilerRevision: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_ALQUILER_REV'
      'WHERE'
      '  ID_S_ALB=?old_ID_S_ALB AND '
      '  ID_ALQ=?old_ID_ALQ ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_ALQUILER_REV'
      '  (ID_ALQ,ID_S_ALB)'
      'VALUES'
      '  (?ID_ALQ,?ID_S_ALB)')
    RefreshSQL.Strings = (
      'SELECT R.ID_ALQ, R.ID_S_ALB, R.DEVOLUCION, '
      '       (SELECT EJERCICIO || '#39'-'#39' || SERIE || '#39'/'#39' || RIG'
      '        FROM GES_CABECERAS_S'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) ALBARAN,'
      '       (SELECT FECHA'
      '        FROM GES_CABECERAS_S'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) FECHA,'
      '       (SELECT NUM_MOV_DEPOSITO'
      '        FROM GES_CABECERAS_S_ALB'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) NUM_MOV_DEPOSITO,'
      '       (SELECT ALMACEN_DEPOSITO'
      '        FROM GES_CABECERAS_S_ALB'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) ALMACEN_DEPOSITO'
      'FROM EMP_ALQUILER_REV R'
      'WHERE'
      '  R.ID_S_ALB=?ID_S_ALB AND'
      '  R.ID_ALQ=?ID_ALQ'
      '')
    SelectSQL.Strings = (
      'SELECT R.ID_ALQ, R.ID_S_ALB, R.DEVOLUCION, '
      '       (SELECT EJERCICIO || '#39'-'#39' || SERIE || '#39'/'#39' || RIG'
      '        FROM GES_CABECERAS_S'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) ALBARAN,'
      '       (SELECT FECHA'
      '        FROM GES_CABECERAS_S'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) FECHA,'
      '       (SELECT NUM_MOV_DEPOSITO'
      '        FROM GES_CABECERAS_S_ALB'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) NUM_MOV_DEPOSITO,'
      '       (SELECT ALMACEN_DEPOSITO'
      '        FROM GES_CABECERAS_S_ALB'
      '        WHERE'
      '        ID_S = R.ID_S_ALB) ALMACEN_DEPOSITO'
      'FROM EMP_ALQUILER_REV R'
      'WHERE'
      '  R.ID_ALQ=?ID_ALQ'
      'ORDER BY R.ID_S_ALB DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_ALQUILER_REV'
      'WHERE'
      '  ID_S_ALB=?ID_S_ALB AND '
      '  ID_ALQ=?ID_ALQ ')
    DataSource = DSQMAqluiler
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))')
    ClavesPrimarias.Strings = (
      'ID_S_ALB '
      'ID_ALQ'#13)
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_ALQUILER_REV'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_PED')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 152
    object xAlquilerRevisionID_ALQ: TIntegerField
      DisplayLabel = 'Id Alq.'
      FieldName = 'ID_ALQ'
    end
    object xAlquilerRevisionID_S_ALB: TIntegerField
      DisplayLabel = 'Id Alb.'
      FieldName = 'ID_S_ALB'
    end
    object xAlquilerRevisionALBARAN: TFIBStringField
      DisplayLabel = 'Albaran'
      FieldName = 'ALBARAN'
      Size = 29
    end
    object xAlquilerRevisionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAlquilerRevisionDEVOLUCION: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'DEVOLUCION'
    end
    object xAlquilerRevisionNUM_MOV_DEPOSITO: TIntegerField
      DisplayLabel = 'N. Mov. Deposito'
      FieldName = 'NUM_MOV_DEPOSITO'
    end
    object xAlquilerRevisionALMACEN_DEPOSITO: TFIBStringField
      DisplayLabel = 'Alm. Deposito'
      FieldName = 'ALMACEN_DEPOSITO'
      Size = 3
    end
  end
  object DSAlquilerRevision: TDataSource
    DataSet = xAlquilerRevision
    Left = 144
    Top = 152
  end
  object xNrosSerie: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  CODIGO=?old_CODIGO AND '
      '  ALMACEN=?old_ALMACEN ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_SERIALIZACION'
      
        '  (FECHA_CADUCIDAD,FECHA_GARANTIA_CLIENTE,FECHA_GARANTIA_PROVEED' +
        'OR,NOTAS,CONTADOR,CODIGO,CLIENTE_REPARACION,DEVUELTO_PROV,EMPRES' +
        'A,CANAL,ESTADO,ACTIVO,NSERIE,ARTICULO,ALMACEN)'
      'VALUES'
      
        '  (?FECHA_CADUCIDAD,?FECHA_GARANTIA_CLIENTE,?FECHA_GARANTIA_PROV' +
        'EEDOR,?NOTAS,?CONTADOR,?CODIGO,?CLIENTE_REPARACION,?DEVUELTO_PRO' +
        'V,?EMPRESA,?CANAL,?ESTADO,?ACTIVO,?NSERIE,?ARTICULO,?ALMACEN)')
    RefreshSQL.Strings = (
      'SELECT SS.*, S.*'
      'FROM EMP_ALQUILER A'
      'JOIN EMP_ALQUILER_REV R ON A.ID_ALQ = R.ID_ALQ'
      'JOIN GES_CABECERAS_S C ON R.ID_S_ALB = C.ID_S'
      'JOIN GES_CABECERAS_S_ALB CA ON C.ID_S = CA.ID_S'
      
        'JOIN GES_CABECERAS_ST CS ON CA.EMPRESA = CS.EMPRESA AND CA.EJERC' +
        'ICIO = CS.EJERCICIO AND CA.SERIE = CS.SERIE AND CA.NUM_MOV_DEPOS' +
        'ITO = CS.RIG'
      
        'JOIN GES_DETALLES_SERIALIZACION S ON S.EMPRESA = CS.EMPRESA AND ' +
        'S.EJERCICIO = CS.EJERCICIO AND S.SERIE = CS.SERIE AND S.RIG = CA' +
        '.NUM_MOV_DEPOSITO AND ((S.TIPO = '#39'MVE'#39') OR (S.TIPO = '#39'MVT'#39'))'
      
        'JOIN ART_ARTICULOS_SERIALIZACION SS ON S.EMPRESA = SS.EMPRESA AN' +
        'D S.CANAL = SS.CANAL AND S.ALMACEN = SS.ALMACEN AND S.CODIGO = S' +
        'S.CODIGO'
      'WHERE'
      'A.ID_ALQ = :ID_ALQ AND'
      'SS.S.LINEA = :LINEA'
      'ORDER BY S.FECHA DESC')
    SelectSQL.Strings = (
      'SELECT SS.*, S.*'
      'FROM EMP_ALQUILER A'
      'JOIN EMP_ALQUILER_REV R ON A.ID_ALQ = R.ID_ALQ'
      'JOIN GES_CABECERAS_S C ON R.ID_S_ALB = C.ID_S'
      'JOIN GES_CABECERAS_S_ALB CA ON C.ID_S = CA.ID_S'
      
        'JOIN GES_CABECERAS_ST CS ON CA.EMPRESA = CS.EMPRESA AND CA.EJERC' +
        'ICIO = CS.EJERCICIO AND CA.SERIE = CS.SERIE AND CA.NUM_MOV_DEPOS' +
        'ITO = CS.RIG'
      
        'JOIN GES_DETALLES_SERIALIZACION S ON S.EMPRESA = CS.EMPRESA AND ' +
        'S.EJERCICIO = CS.EJERCICIO AND S.SERIE = CS.SERIE AND S.RIG = CA' +
        '.NUM_MOV_DEPOSITO AND ((S.TIPO = '#39'MVE'#39') OR (S.TIPO = '#39'MVS'#39'))'
      
        'JOIN ART_ARTICULOS_SERIALIZACION SS ON S.EMPRESA = SS.EMPRESA AN' +
        'D S.CANAL = SS.CANAL AND S.ALMACEN = SS.ALMACEN AND S.CODIGO = S' +
        'S.CODIGO'
      'WHERE'
      'A.ID_ALQ = :ID_ALQ'
      'ORDER BY S.FECHA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_SERIALIZACION'
      'SET'
      '  FECHA_CADUCIDAD=?FECHA_CADUCIDAD '
      '  ,FECHA_GARANTIA_CLIENTE=?FECHA_GARANTIA_CLIENTE '
      '  ,FECHA_GARANTIA_PROVEEDOR=?FECHA_GARANTIA_PROVEEDOR '
      '  ,NOTAS=?NOTAS '
      '  ,CONTADOR=?CONTADOR '
      '  ,CLIENTE_REPARACION=?CLIENTE_REPARACION '
      '  ,DEVUELTO_PROV=?DEVUELTO_PROV '
      '  ,ESTADO=?ESTADO '
      '  ,ACTIVO=?ACTIVO '
      '  ,NSERIE=?NSERIE '
      '  ,ARTICULO=?ARTICULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    DataSource = DSQMAqluiler
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_SERIALIZACION'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_PED')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 200
    object xNrosSerieEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xNrosSerieCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xNrosSerieCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xNrosSerieNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xNrosSerieARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xNrosSerieALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xNrosSerieESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xNrosSerieFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object xNrosSerieFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Garantia'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object xNrosSerieFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Garantia Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object xNrosSerieNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xNrosSerieDEVUELTO_PROV: TIntegerField
      DisplayLabel = 'Devuelvo a Prov.'
      FieldName = 'DEVUELTO_PROV'
    end
    object xNrosSerieCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xNrosSerieACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xNrosSerieCLIENTE_REPARACION: TIntegerField
      DisplayLabel = 'Cliente Repar.'
      FieldName = 'CLIENTE_REPARACION'
    end
    object xNrosSerieEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object xNrosSerieEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xNrosSerieCANAL1: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL1'
    end
    object xNrosSerieSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xNrosSerieTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xNrosSerieRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object xNrosSerieLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xNrosSerieCODIGO1: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO1'
    end
    object xNrosSerieALMACEN1: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1'
      Size = 3
    end
    object xNrosSerieFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xNrosSerieSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object xNrosSerieTRASPASADO: TIntegerField
      DisplayLabel = 'Traspasado'
      FieldName = 'TRASPASADO'
    end
    object xNrosSerieID_GDS: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_GDS'
    end
    object xNrosSerieTIPO_MOV: TFIBStringField
      DisplayLabel = 'Tipo Mov.'
      FieldName = 'TIPO_MOV'
      Size = 1
    end
    object xNrosSerieID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
  end
  object DSNrosSerie: TDataSource
    DataSet = xNrosSerie
    Left = 144
    Top = 200
  end
  object TmpNrosSerie: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 248
    object TmpNrosSerieEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TmpNrosSerieCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object TmpNrosSerieCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object TmpNrosSerieALMACEN: TStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object TmpNrosSerieARTICULO: TStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object TmpNrosSerieNSERIE: TStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object TmpNrosSerieSELECCIONADO: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'SELECCIONADO'
    end
    object TmpNrosSerieUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSTmpNroSerie: TDataSource
    DataSet = TmpNrosSerie
    Left = 144
    Top = 248
  end
end
