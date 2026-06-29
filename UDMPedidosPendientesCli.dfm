object DMPedidosPendientesCli: TDMPedidosPendientesCli
  OldCreateOrder = False
  OnCreate = DMPedidosPendientesCliCreate
  OnDestroy = DataModuleDestroy
  Left = 827
  Top = 336
  Height = 444
  Width = 470
  object QMPedidosPendientesCli: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'select art.articulo, art.titulo_largo as titulo, cab2.rig, cab.c' +
        'liente, ter.nombre_r_social, det2.unidades, det2.almacen,'
      
        '       det.u_servidas, det.u_pendientes, det.u_reservadas, det.s' +
        'ervido, det2.precio, det2.descuento, det.u_preparadas,'
      
        '       det.fecha_entrega_prev, det.fecha_rec_det, det.fecha_conf' +
        '_det, det.entrada_agrupacion, det.id_detalles_s,'
      
        '       det.id_s, ter.email correo, det2.empresa, det2.ejercicio,' +
        ' det2.canal, det2.serie, det2.tipo, det2.linea,'
      
        '       cab.modifica_doc, cab.fecha, art.control_stock, coalesce(' +
        'pro.id_orden, 0) as id_orden,'
      
        '       ord.estado as estado_orden, det2.canal, det2.serie, det2.' +
        'tipo, det2.linea, art.control_stock,'
      
        '       est.titulo as titulo_estado, cab.direccion, dir.dir_nombr' +
        'e, dir.dir_nombre_2, cab.PEDIDO_CLIENTE as nro_pedido,'
      
        '       ord.uni_total, ord.uni_fabricadas, ord.fecha_ord, det2.ma' +
        'nipulacion, art.preparable, art.familia, '
      
        '       ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ART.ALFA_4, ART.ALFA_' +
        '5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_8,'
      '       (select first 1 p.fecha_pre_cab'
      '        from ges_detalles_relaciones r'
      
        '        join ges_cabeceras_e c on r.d_empresa = c.empresa and r.' +
        'd_ejercicio = c.ejercicio and r.d_canal = c.canal and r.d_serie ' +
        '= c.serie and r.d_tipo = c.tipo and r.d_rig = c.rig'
      '        join ges_cabeceras_e_ped p on c.id_e = p.id_e'
      '        where'
      '        r.o_id_detalles_s = det.id_detalles_s'
      '        order by p.fecha_pre_cab) fecha_pre_prov'
      'from ges_detalles_s_ped det'
      
        'join ges_detalles_s det2 on (det.id_detalles_s = det2.id_detalle' +
        's_s)'
      
        'join art_articulos art on (det2.empresa = art.empresa and det2.a' +
        'rticulo = art.articulo)'
      'join ges_cabeceras_s cab on (det.id_s = cab.id_s)'
      'join ges_cabeceras_s_ped cab2 on (cab.id_s = cab2.id_s)'
      'join sys_terceros ter on (cab.tercero = ter.tercero)'
      
        'join sys_terceros_direcciones dir on (dir.tercero = cab.tercero ' +
        'and dir.direccion = cab.direccion)'
      
        'left join pro_pedidos_ord pro on (pro.empresa = det2.empresa and' +
        ' pro.ejercicio = det2.ejercicio and pro.canal = det2.canal and p' +
        'ro.serie = det2.serie and pro.tipo = det2.tipo and pro.rig = det' +
        '2.rig and pro.linea = det2.linea)'
      'left join pro_ord ord on (ord.id_orden = pro.id_orden)'
      'left join pro_sys_estado est on (ord.situacion = est.estado)'
      'where'
      'det.id_detalles_s = :id_detalles_s')
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      
        'SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, DET2.TITULO AS ' +
        'TITULO_LINEA, CAB2.RIG, CAB.CLIENTE, TER.NOMBRE_R_SOCIAL, DET2.U' +
        'NIDADES, DET2.ALMACEN,'
      
        '       DET.U_SERVIDAS, DET.U_PENDIENTES, DET.U_RESERVADAS, DET.S' +
        'ERVIDO, DET2.PRECIO, DET2.DESCUENTO, DET.U_PREPARADAS,'
      
        '       DET.FECHA_ENTREGA_PREV, DET.FECHA_REC_DET, DET.FECHA_CONF' +
        '_DET, DET.ENTRADA_AGRUPACION, DET.ID_DETALLES_S,'
      
        '       DET.ID_S, TER.EMAIL CORREO, DET2.EMPRESA, DET2.EJERCICIO,' +
        ' DET2.CANAL, DET2.SERIE, DET2.TIPO, DET2.LINEA,'
      
        '       CAB.MODIFICA_DOC, CAB.FECHA, ART.CONTROL_STOCK, COALESCE(' +
        'PRO.ID_ORDEN, 0) AS ID_ORDEN,'
      
        '       ORD.SITUACION AS ESTADO_ORDEN, DET2.CANAL, DET2.SERIE, DE' +
        'T2.TIPO, DET2.LINEA, ART.CONTROL_STOCK,'
      
        '       EST.TITULO AS TITULO_ESTADO, CAB.DIRECCION, DIR.DIR_NOMBR' +
        'E, DIR.DIR_NOMBRE_2, CAB.PEDIDO_CLIENTE AS NRO_PEDIDO,'
      
        '       ORD.UNI_TOTAL, ORD.UNI_FABRICADAS, ORD.FECHA_ORD, DET2.MA' +
        'NIPULACION, ART.PREPARABLE, ART.FAMILIA, '
      
        '       ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ART.ALFA_4, ART.ALFA_' +
        '5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_8, DET2.PEDIR,'
      '       (SELECT FIRST 1 P.FECHA_PRE_CAB'
      '        FROM GES_DETALLES_RELACIONES R'
      
        '        JOIN GES_CABECERAS_E C ON R.D_EMPRESA = C.EMPRESA AND R.' +
        'D_EJERCICIO = C.EJERCICIO AND R.D_CANAL = C.CANAL AND R.D_SERIE ' +
        '= C.SERIE AND R.D_TIPO = C.TIPO AND R.D_RIG = C.RIG'
      '        JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      '        WHERE'
      '        R.O_ID_DETALLES_S = DET.ID_DETALLES_S'
      '        ORDER BY P.FECHA_PRE_CAB) FECHA_PRE_PROV'
      'FROM GES_DETALLES_S_PED DET'
      
        'JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLE' +
        'S_S)'
      
        'JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.A' +
        'RTICULO = ART.ARTICULO)'
      'JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S)'
      'JOIN GES_CABECERAS_S_PED CAB2 ON (CAB.ID_S = CAB2.ID_S)'
      'JOIN SYS_TERCEROS TER ON (CAB.TERCERO = TER.TERCERO)'
      
        'JOIN SYS_TERCEROS_DIRECCIONES DIR ON (DIR.TERCERO = CAB.TERCERO ' +
        'AND DIR.DIRECCION = CAB.DIRECCION)'
      
        'LEFT JOIN PRO_PEDIDOS_ORD PRO ON (PRO.EMPRESA = DET2.EMPRESA AND' +
        ' PRO.EJERCICIO = DET2.EJERCICIO AND PRO.CANAL = DET2.CANAL AND P' +
        'RO.SERIE = DET2.SERIE AND PRO.TIPO = DET2.TIPO AND PRO.RIG = DET' +
        '2.RIG AND PRO.LINEA = DET2.LINEA)'
      'LEFT JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = PRO.ID_ORDEN)'
      'LEFT JOIN PRO_SYS_ESTADO EST ON (ORD.SITUACION = EST.ESTADO)'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA AND'
      'CAB.EJERCICIO <= :EJERCICIO AND'
      'CAB.CANAL = :CANAL AND'
      '/*'
      'IF (SERIE <> '#39#39') THEN'
      '    CAB.SERIE = :SERIE AND'
      'IF (CLIENTE <> 0) THEN'
      '    CAB.CLIENTE = :CLIENTE AND'
      'IF (FAMILIA <> '#39#39') THEN'
      '    ART.FAMILIA = :FAMILIA AND'
      '*/'
      'CAB.TIPO = :TIPO AND'
      'CAB.ESTADO = 0 AND'
      'DET.U_SERVIDAS < DET2.UNIDADES AND'
      'DET.SERVIDO = 0'
      'ORDER BY DET.ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PED'
      'SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION'
      'WHERE ID_DETALLES_S = :ID_DETALLES_S')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    AfterClose = QMPedidosPendientesCliAfterClose
    AfterOpen = QMPedidosPendientesCliAfterOpen
    OnCalcFields = QMPedidosPendientesCliCalcFields
    OnNewRecord = QMLineasPedidosclienteNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMPedidosPendientesCliSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock M'#237'n.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_MINIMO'
      OnGetText = QMPedidosPendientesCliSTOCK_MINIMOGetText
      Calculated = True
    end
    object QMPedidosPendientesCliARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPedidosPendientesCliTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMPedidosPendientesCliRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMPedidosPendientesCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMPedidosPendientesCliNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMPedidosPendientesCliUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMPedidosPendientesCliALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPedidosPendientesCliU_SERVIDAS: TFloatField
      DisplayLabel = 'Uni. Servidas'
      FieldName = 'U_SERVIDAS'
    end
    object QMPedidosPendientesCliU_PENDIENTES: TFloatField
      DisplayLabel = 'Uni. Pendientes'
      FieldName = 'U_PENDIENTES'
    end
    object QMPedidosPendientesCliSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMPedidosPendientesCliPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMPedidosPendientesCliDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMPedidosPendientesCliU_PREPARADAS: TFloatField
      DisplayLabel = 'Uni. Preparadas'
      FieldName = 'U_PREPARADAS'
    end
    object QMPedidosPendientesCliFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMPedidosPendientesCliFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMPedidosPendientesCliFECHA_CONF_DET: TDateTimeField
      DisplayLabel = 'Fec. Confirm.'
      FieldName = 'FECHA_CONF_DET'
    end
    object QMPedidosPendientesCliENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMPedidosPendientesCliID_DETALLES_S: TIntegerField
      FieldName = 'ID_DETALLES_S'
    end
    object QMPedidosPendientesCliID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMPedidosPendientesCliCORREO: TFIBStringField
      DisplayLabel = 'E-mail'
      FieldName = 'CORREO'
      Size = 100
    end
    object QMPedidosPendientesCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosPendientesCliEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosPendientesCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPedidosPendientesCliSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPedidosPendientesCliTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPedidosPendientesCliLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPedidosPendientesCliMODIFICA_DOC: TIntegerField
      DisplayLabel = 'List.'
      FieldName = 'MODIFICA_DOC'
    end
    object QMPedidosPendientesCliFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosPendientesCliCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Control Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMPedidosPendientesCliID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMPedidosPendientesCliESTADO_ORDEN: TIntegerField
      DisplayLabel = 'Est. OF'
      FieldName = 'ESTADO_ORDEN'
    end
    object QMPedidosPendientesCliSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMPedidosPendientesCliPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. Prov.'
      FieldKind = fkCalculated
      FieldName = 'PEDIDOS_A_PRO'
      Calculated = True
    end
    object QMPedidosPendientesCliTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Tit. Estado OF'
      FieldName = 'TITULO_ESTADO'
      Size = 25
    end
    object QMPedidosPendientesCliDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object QMPedidosPendientesCliDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'T'#237'tulo direcci'#243'n'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMPedidosPendientesCliNRO_PEDIDO: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'NRO_PEDIDO'
    end
    object QMPedidosPendientesCliUNI_TOTAL: TFloatField
      DisplayLabel = 'Uni. Total OF'
      FieldName = 'UNI_TOTAL'
    end
    object QMPedidosPendientesCliUNI_FABRICADAS: TFloatField
      DisplayLabel = 'Uni. Fab. OF'
      FieldName = 'UNI_FABRICADAS'
    end
    object QMPedidosPendientesCliFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORD'
    end
    object QMPedidosPendientesCliDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. Cabecera'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMPedidosPendientesCliU_RESERVADAS: TFloatField
      DisplayLabel = 'Unid. Reserv.'
      FieldName = 'U_RESERVADAS'
    end
    object QMPedidosPendientesCliMANIPULACION: TIntegerField
      DisplayLabel = 'Man.'
      FieldName = 'MANIPULACION'
    end
    object QMPedidosPendientesCliPREPARABLE: TIntegerField
      DisplayLabel = 'Prep.'
      FieldName = 'PREPARABLE'
    end
    object QMPedidosPendientesCliFECHA_PRE_PROV: TDateTimeField
      DisplayLabel = 'Fec. Prev. Proveedor'
      FieldName = 'FECHA_PRE_PROV'
    end
    object QMPedidosPendientesCliFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMPedidosPendientesCliALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMPedidosPendientesCliALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMPedidosPendientesCliPEDIR: TIntegerField
      DisplayLabel = 'Pedir a Prov.'
      FieldName = 'PEDIR'
    end
    object QMPedidosPendientesCliTITULO_LINEA: TFIBStringField
      DisplayLabel = 'Titulo Linea'
      FieldName = 'TITULO_LINEA'
      Size = 256
    end
  end
  object DSPedidosPendientesCli: TDataSource
    DataSet = QMPedidosPendientesCli
    Left = 200
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 56
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
    Left = 200
    Top = 8
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      'SELECT *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      'ID_S IN'
      '(SELECT distinct CAB.ID_S'
      'FROM GES_DETALLES_S_PED DET'
      
        'JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLE' +
        'S_S)'
      'JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S)'
      'WHERE '
      'DET.EMPRESA = :EMPRESA AND '
      'DET.EJERCICIO <= :EJERCICIO AND '
      'DET.CANAL = :CANAL AND '
      '/* DET.SERIE = SERIE AND */'
      'DET.TIPO = :TIPO AND '
      'CAB.ESTADO = 0 AND '
      'DET.SERVIDO = 0 AND'
      'DET.ENTRADA_AGRUPACION = :ENTRADA_RECEPCION)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PED'
      'SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION'
      'WHERE ID_DETALLES_S = :ID_DETALLES_S')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    OnNewRecord = QMLineasPedidosclienteNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 200
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 200
    Top = 200
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO'
      'where ID_S = :ID_S'
      'order by orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PED'
      'SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION'
      'WHERE ID_DETALLES_S = :ID_DETALLES_S')
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    OnNewRecord = QMLineasPedidosclienteNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 248
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 200
    Top = 248
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    OnBeforePrint = frListadoBeforePrint
    OnEnterRect = frListadoBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 320
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 320
    Top = 200
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9723134954
    ReportOptions.LastChange = 38691.9723134954
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxListadoBeforePrint
    OnGetValue = frxListadoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 376
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 320
    Top = 248
  end
  object xCliConPedidosPend: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      'SELECT distinct CAB.EMPRESA, CAB.TERCERO, CAB.CLIENTE'
      'FROM GES_DETALLES_S_PED DET'
      
        'JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLE' +
        'S_S)'
      'JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S)'
      'WHERE'
      'DET.EMPRESA = :EMPRESA AND '
      'DET.EJERCICIO <= :EJERCICIO AND '
      'DET.CANAL = :CANAL AND '
      '/* DET.SERIE = SERIE AND */'
      'DET.TIPO = :TIPO AND '
      'CAB.ESTADO = 0 AND '
      'DET.SERVIDO = 0 AND'
      'DET.ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION'
      'ORDER BY DET.ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_PED'
      'SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION'
      'WHERE ID_DETALLES_S = :ID_DETALLES_S')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    OnNewRecord = QMLineasPedidosclienteNewRecord
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 152
    object xCliConPedidosPendEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCliConPedidosPendTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCliConPedidosPendCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
  end
  object DSCliConPedidosPen: TDataSource
    DataSet = xCliConPedidosPend
    Left = 200
    Top = 152
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from DAME_DATOS_CLIENTE(?EMPRESA,?EJERCICIO,?CLIENTE,?C' +
        'ANAL,?ID_S)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 56
    Top = 296
  end
  object DSxClientes: TDataSource
    Left = 200
    Top = 296
  end
  object xDireccionClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT FIRST (1) * FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIE' +
        'NTE, :ID_S, 0)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 56
    Top = 344
  end
  object DSxDireccion_Clientes: TDataSource
    DataSet = xDireccionClientes
    Left = 200
    Top = 344
  end
  object xRelacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.ID_E, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA , C.SU_REFERENCIA, P.PROVEEDOR, T.NOMBRE_R_SOCIA' +
        'L, P.FECHA_PRE_CAB, D.ARTICULO, D.TITULO, D.ID_DETALLES_E'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_CABECERAS_E C ON R.D_EMPRESA = C.EMPRESA AND R.D_EJERCI' +
        'CIO = C.EJERCICIO AND R.D_CANAL = C.CANAL AND R.D_SERIE = C.SERI' +
        'E AND R.D_TIPO = C.TIPO AND R.D_RIG = C.RIG'
      'JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      
        'JOIN GES_DETALLES_E D ON R.D_EMPRESA = D.EMPRESA AND R.D_EJERCIC' +
        'IO = D.EJERCICIO AND R.D_CANAL = D.CANAL AND R.D_SERIE = D.SERIE' +
        ' AND R.D_TIPO = D.TIPO AND R.D_RIG = D.RIG AND R.D_LINEA = D.LIN' +
        'EA'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'R.O_EMPRESA = :EMPRESA AND'
      'R.O_EJERCICIO = :EJERCICIO AND'
      'R.O_CANAL = :CANAL AND'
      'R.O_SERIE = :SERIE AND'
      'R.O_TIPO = :TIPO AND'
      'R.O_RIG = :RIG AND'
      'R.O_LINEA = :LINEA')
    SelectSQL.Strings = (
      
        'SELECT C.ID_E, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,' +
        ' C.RIG, C.FECHA , C.SU_REFERENCIA, P.PROVEEDOR, T.NOMBRE_R_SOCIA' +
        'L, P.FECHA_PRE_CAB, D.ARTICULO, D.TITULO, D.ID_DETALLES_E'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_CABECERAS_E C ON R.D_EMPRESA = C.EMPRESA AND R.D_EJERCI' +
        'CIO = C.EJERCICIO AND R.D_CANAL = C.CANAL AND R.D_SERIE = C.SERI' +
        'E AND R.D_TIPO = C.TIPO AND R.D_RIG = C.RIG'
      'JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      
        'JOIN GES_DETALLES_E D ON R.D_EMPRESA = D.EMPRESA AND R.D_EJERCIC' +
        'IO = D.EJERCICIO AND R.D_CANAL = D.CANAL AND R.D_SERIE = D.SERIE' +
        ' AND R.D_TIPO = D.TIPO AND R.D_RIG = D.RIG AND R.D_LINEA = D.LIN' +
        'EA'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'R.O_EMPRESA = :EMPRESA AND'
      'R.O_EJERCICIO = :EJERCICIO AND'
      'R.O_CANAL = :CANAL AND'
      'R.O_SERIE = :SERIE AND'
      'R.O_TIPO = :TIPO AND'
      'R.O_RIG = :RIG AND'
      'R.O_LINEA = :LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSPedidosPendientesCli
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 56
    Top = 104
    object xRelacionID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xRelacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRelacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRelacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRelacionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xRelacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRelacionRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object xRelacionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xRelacionSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xRelacionPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xRelacionNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xRelacionFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fec. Prevista'
      FieldName = 'FECHA_PRE_CAB'
    end
    object xRelacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xRelacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xRelacionID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Detalle Doc'
      FieldName = 'ID_DETALLES_E'
    end
  end
  object DSxRelacion: TDataSource
    DataSet = xRelacion
    Left = 200
    Top = 104
  end
  object frDBPedidosPend: TfrDBDataSet
    DataSource = DSPedidosPendientesCli
    Left = 320
    Top = 56
  end
  object frDBRelacion: TfrDBDataSet
    DataSource = DSxRelacion
    Left = 320
    Top = 104
  end
end
