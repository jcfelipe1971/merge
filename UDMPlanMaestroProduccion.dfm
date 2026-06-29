object DMPlanMaestroProduccion: TDMPlanMaestroProduccion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 504
  Top = 149
  Height = 618
  Width = 414
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 176
    Top = 16
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_PMP_CAB'
      'WHERE'
      '  PLANIFICACION=?old_PLANIFICACION AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA')
    InsertSQL.Strings = (
      'INSERT INTO PRO_PMP_CAB'
      
        '  (ID_PLANIFICACION,EMPRESA,CANAL,PLANIFICACION,COMENTARIO,TIPO,' +
        'FECHA_CREACION,FECHA_LANZAMIENTO,RESPONSABLE,AGRUPA_COMPUESTOS,E' +
        'STADO,CALCULA_STOCK_COMPONENTE,ALMACEN_COMPONENTES,EJERCICIO,SER' +
        'IE,ALMACEN_NECESIDADES)'
      'VALUES'
      
        '  (?ID_PLANIFICACION,?EMPRESA,?CANAL,?PLANIFICACION,?COMENTARIO,' +
        '?TIPO,?FECHA_CREACION,?FECHA_LANZAMIENTO,?RESPONSABLE,?AGRUPA_CO' +
        'MPUESTOS,?ESTADO,?CALCULA_STOCK_COMPONENTE,?ALMACEN_COMPONENTES,' +
        '?EJERCICIO,?SERIE,?ALMACEN_NECESIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_PMP_CAB'
      'WHERE'
      '  PLANIFICACION=?PLANIFICACION AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_PMP_CAB'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_PMP_CAB'
      'SET'
      '  ID_PLANIFICACION=?ID_PLANIFICACION '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,TIPO=?TIPO '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_LANZAMIENTO=?FECHA_LANZAMIENTO '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,AGRUPA_COMPUESTOS=?AGRUPA_COMPUESTOS '
      '  ,ESTADO=?ESTADO '
      '  ,CALCULA_STOCK_COMPONENTE=?CALCULA_STOCK_COMPONENTE '
      '  ,ALMACEN_COMPONENTES=?ALMACEN_COMPONENTES'
      '  ,SERIE=?SERIE '
      '  ,ALMACEN_NECESIDADES=?ALMACEN_NECESIDADES'
      'WHERE'
      '  PLANIFICACION=?PLANIFICACION AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    BeforeEdit = QMCabeceraBeforeEdit
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'PLANIFICACION '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_PMP_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMCabeceraID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planificaci'#243'n'
      FieldName = 'ID_PLANIFICACION'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraPLANIFICACION: TIntegerField
      DisplayLabel = 'Planificaci'#243'n'
      FieldName = 'PLANIFICACION'
    end
    object QMCabeceraCOMENTARIO: TBlobField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 8
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fecha Creaci'#243'n'
      FieldName = 'FECHA_CREACION'
    end
    object QMCabeceraFECHA_LANZAMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Lanzamiento'
      FieldName = 'FECHA_LANZAMIENTO'
    end
    object QMCabeceraRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCabeceraAGRUPA_COMPUESTOS: TIntegerField
      DisplayLabel = 'Agrupa Compuestos'
      FieldName = 'AGRUPA_COMPUESTOS'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraCALCULA_STOCK_COMPONENTE: TIntegerField
      DisplayLabel = 'Calcula Stock'
      FieldName = 'CALCULA_STOCK_COMPONENTE'
    end
    object QMCabeceraALMACEN_COMPONENTES: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN_COMPONENTES'
      Size = 3
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraALMACEN_NECESIDADES: TFIBStringField
      DisplayLabel = 'Alm. Necesidades'
      FieldName = 'ALMACEN_NECESIDADES'
      Size = 3
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_PMP_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  PLANIFICACION=?old_PLANIFICACION AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_PMP_DET'
      
        '  (COMPUESTO,ID_ESCANDALLO,TIPO_ESCANDALLO,CANTIDAD_CALCULADA,UN' +
        'IDADES_STOCK,CANTIDAD_FABRICAR,FABRICAR,OP,PRIORIDAD,ORDEN_CREAC' +
        'ION,ID_PLANIFICACION,ID_PLANIFICACION_DET,EMPRESA,CANAL,PLANIFIC' +
        'ACION,LINEA,FECHA_CREACION_OP,FECHA_FINALIZACION,ID_PEDIDO,COD_M' +
        'ODELO,ID_ESCANDALLO_FABRICAR)'
      'VALUES'
      
        '  (?COMPUESTO,?ID_ESCANDALLO,?TIPO_ESCANDALLO,?CANTIDAD_CALCULAD' +
        'A,?UNIDADES_STOCK,?CANTIDAD_FABRICAR,?FABRICAR,?OP,?PRIORIDAD,?O' +
        'RDEN_CREACION,?ID_PLANIFICACION,?ID_PLANIFICACION_DET,?EMPRESA,?' +
        'CANAL,?PLANIFICACION,?LINEA,?FECHA_CREACION_OP,?FECHA_FINALIZACI' +
        'ON,?ID_PEDIDO,?COD_MODELO,?ID_ESCANDALLO_FABRICAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_PMP_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  PLANIFICACION=?PLANIFICACION AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_PMP_DET'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND '
      'PLANIFICACION = ?PLANIFICACION  AND'
      'ID_ORDEN=0 OR ID_ORDEN IS NULL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_PMP_DET'
      'SET'
      '  CANTIDAD_FABRICAR=?CANTIDAD_FABRICAR '
      '  ,FABRICAR=?FABRICAR '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,ID_ESCANDALLO_FABRICAR=?ID_ESCANDALLO_FABRICAR'
      '  ,COMPUESTO=?COMPUESTO'
      '  ,ORDEN_CREACION=?ORDEN_CREACION'
      'WHERE'
      'ID_PLANIFICACION_DET = ?ID_PLANIFICACION_DET ')
    DataSource = DSQMCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    BeforeClose = QMDetalleBeforeClose
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'PLANIFICACION '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_PMP_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMDetalleID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planificaci'#243'n'
      FieldName = 'ID_PLANIFICACION'
    end
    object QMDetalleID_PLANIFICACION_DET: TIntegerField
      DisplayLabel = 'ID Planificaci'#243'n Detalle'
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePLANIFICACION: TIntegerField
      DisplayLabel = 'Planificaci'#243'n'
      FieldName = 'PLANIFICACION'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      OnChange = QMDetalleCOMPUESTOChange
      Size = 15
    end
    object QMDetalleID_ESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ID_ESCANDALLO'
    end
    object QMDetalleTIPO_ESCANDALLO: TFIBStringField
      DisplayLabel = 'Tipo Escandallo'
      FieldName = 'TIPO_ESCANDALLO'
      Size = 3
    end
    object QMDetalleCANTIDAD_CALCULADA: TFloatField
      DisplayLabel = 'Cantidad Calculada'
      FieldName = 'CANTIDAD_CALCULADA'
      OnChange = QMDetalleCANTIDAD_CALCULADAChange
    end
    object QMDetalleUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Unidades Stock'
      FieldName = 'UNIDADES_STOCK'
    end
    object QMDetalleCANTIDAD_FABRICAR: TFloatField
      DisplayLabel = 'Cantidad Fabricar'
      FieldName = 'CANTIDAD_FABRICAR'
    end
    object QMDetalleFABRICAR: TIntegerField
      DisplayLabel = 'Fabricar'
      FieldName = 'FABRICAR'
    end
    object QMDetalleOP: TIntegerField
      DisplayLabel = 'Orden Producci'#243'n'
      FieldName = 'OP'
    end
    object QMDetallePRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMDetalleORDEN_CREACION: TIntegerField
      DisplayLabel = 'Orden Creaci'#243'n'
      FieldName = 'ORDEN_CREACION'
    end
    object QMDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetalleFECHA_FINALIZACION: TDateTimeField
      DisplayLabel = 'Fecha Finalizaci'#243'n'
      FieldName = 'FECHA_FINALIZACION'
    end
    object QMDetalleFECHA_CREACION_OP: TDateTimeField
      DisplayLabel = 'Fecha Creaci'#243'n'
      FieldName = 'FECHA_CREACION_OP'
    end
    object QMDetalleID_PEDIDO: TIntegerField
      DisplayLabel = 'ID Pedido'
      FieldName = 'ID_PEDIDO'
    end
    object QMDetalleCOD_MODELO: TFIBStringField
      DisplayLabel = 'Cod. Modelo'
      FieldName = 'COD_MODELO'
      Size = 25
    end
    object QMDetalleID_ESCANDALLO_FABRICAR: TIntegerField
      DisplayLabel = 'Escadallo Fabricar'
      FieldName = 'ID_ESCANDALLO_FABRICAR'
    end
    object QMDetalleLINEA_PED: TIntegerField
      DisplayLabel = 'L'#237'nea Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMDetalleID_DETALLES_S_PED: TIntegerField
      DisplayLabel = 'ID Det. Ped.'
      FieldName = 'ID_DETALLES_S_PED'
    end
    object QMDetalleDescCompuesto: TStringField
      DisplayLabel = 'Desc. Compuesto'
      FieldKind = fkCalculated
      FieldName = 'DescCompuesto'
      Size = 60
      Calculated = True
    end
    object QMDetalleUNI_PENDIENTES_OP: TFloatField
      DisplayLabel = 'Uds. Pend. OP'
      FieldName = 'UNI_PENDIENTES_OP'
    end
    object QMDetalleUNI_PEDIDOS_PEND: TFloatField
      DisplayLabel = 'Uds Ped. Pend.'
      FieldName = 'UNI_PEDIDOS_PEND'
    end
    object QMDetalleSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object QMDetalleLOTE_OPTIMO: TFloatField
      DisplayLabel = 'Lote '#211'ptimo'
      FieldName = 'LOTE_OPTIMO'
    end
    object QMDetalleRIG_PEDIDO: TIntegerField
      DisplayLabel = 'Ped.'
      FieldName = 'RIG_PEDIDO'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 176
    Top = 64
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 176
    Top = 112
  end
  object QMNecesidades: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_PMP_NECESIDADES'
      'WHERE'
      '  ID_PLANIFICACION_CAB=?old_ID_PLANIFICACION_CAB AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_PMP_NECESIDADES'
      
        '  (CANTIDAD_DIF,STOCK,CANTIDAD,LINEA,ID_PLANIFICACION_CAB,COMPON' +
        'ENTE,PROVEEDOR,COMPRAR,REFERENCIA)'
      'VALUES'
      
        '  (?CANTIDAD_DIF,?STOCK,?CANTIDAD,?LINEA,?ID_PLANIFICACION_CAB,?' +
        'COMPONENTE,?PROVEEDOR,?COMPRAR,?REFERENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_PMP_NECESIDADES'
      'WHERE'
      '  ID_PLANIFICACION_CAB=?ID_PLANIFICACION_CAB AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_PMP_NECESIDADES'
      'WHERE'
      'ID_PLANIFICACION_CAB = :ID_PLANIFICACION'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_PMP_NECESIDADES'
      'SET'
      '  CANTIDAD_DIF=?CANTIDAD_DIF '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,COMPRAR=?COMPRAR '
      '  ,REFERENCIA=?REFERENCIA '
      'WHERE'
      '  ID_PLANIFICACION_CAB=?ID_PLANIFICACION_CAB AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMCabecera
    OnCalcFields = QMNecesidadesCalcFields
    OnNewRecord = QMNecesidadesNewRecord
    ClavesPrimarias.Strings = (
      'ID_PLANIFICACION_CAB '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_PMP_NECESIDADES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 160
    object QMNecesidadesID_PLANIFICACION_CAB: TIntegerField
      DisplayLabel = 'ID Planificaci'#243'n'
      FieldName = 'ID_PLANIFICACION_CAB'
    end
    object QMNecesidadesCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMNecesidadesCOMPONENTEChange
      Size = 15
    end
    object QMNecesidadesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMNecesidadesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMNecesidadesSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMNecesidadesCANTIDAD_DIF: TFloatField
      DisplayLabel = 'Cantidad a Comprar'
      FieldName = 'CANTIDAD_DIF'
    end
    object QMNecesidadesPROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
      OnChange = QMNecesidadesPROVEEDORChange
    end
    object QMNecesidadesCOMPRAR: TIntegerField
      DisplayLabel = 'Comprar'
      FieldName = 'COMPRAR'
    end
    object QMNecesidadesREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMNecesidadesDescProveedor: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescProveedor'
      Size = 60
      Calculated = True
    end
    object QMNecesidadesDescComponente: TStringField
      DisplayLabel = 'Desc. Componente'
      FieldKind = fkCalculated
      FieldName = 'DescComponente'
      Size = 60
      Calculated = True
    end
    object QMNecesidadesID_E_PEDIDO: TIntegerField
      DisplayLabel = 'ID Ped.'
      FieldName = 'ID_E_PEDIDO'
    end
    object QMNecesidadesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMNecesidadesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNecesidadesUNI_PEND_RECIBIR: TFloatField
      DisplayLabel = 'Un. Pend. Recibir'
      FieldName = 'UNI_PEND_RECIBIR'
    end
    object QMNecesidadesUNI_PEND_FABRICAR: TFloatField
      DisplayLabel = 'Un. Pend. Fabricar'
      FieldName = 'UNI_PEND_FABRICAR'
    end
  end
  object DSQMNecesidades: TDataSource
    DataSet = QMNecesidades
    Left = 176
    Top = 160
  end
  object QMSuborden: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_PMP_SUBORDEN'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_PLANIFICACION_DET=?old_ID_PLANIFICACION_DET AND '
      '  ID_PLANIFICACION=?old_ID_PLANIFICACION ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_PMP_SUBORDEN'
      
        '  (ID_PLANIFICACION,ID_PLANIFICACION_DET,LINEA,ID_ESCANDALLO,ID_' +
        'ESCANDALLO_PADRE,COMPONENTE)'
      'VALUES'
      
        '  (?ID_PLANIFICACION,?ID_PLANIFICACION_DET,?LINEA,?ID_ESCANDALLO' +
        ',?ID_ESCANDALLO_PADRE,?COMPONENTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_PMP_SUBORDEN'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_PLANIFICACION_DET=?ID_PLANIFICACION_DET AND '
      '  ID_PLANIFICACION=?ID_PLANIFICACION ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_PMP_SUBORDEN'
      'WHERE'
      'ID_PLANIFICACION=?ID_PLANIFICACION '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_PMP_SUBORDEN'
      'SET'
      '  ID_ESCANDALLO=?ID_ESCANDALLO '
      '  ,ID_ESCANDALLO_PADRE=?ID_ESCANDALLO_PADRE '
      '  ,COMPONENTE=?COMPONENTE '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_PLANIFICACION_DET=?ID_PLANIFICACION_DET AND '
      '  ID_PLANIFICACION=?ID_PLANIFICACION ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_PLANIFICACION_DET '
      'ID_PLANIFICACION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_PMP_SUBORDEN'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 40
    Top = 256
    object QMSubordenID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planificaci'#243'n'
      FieldName = 'ID_PLANIFICACION'
    end
    object QMSubordenID_PLANIFICACION_DET: TIntegerField
      DisplayLabel = 'ID Planificaci'#243'n Det.'
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object QMSubordenLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMSubordenID_ESCANDALLO: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESCANDALLO'
    end
    object QMSubordenID_ESCANDALLO_PADRE: TIntegerField
      DisplayLabel = 'ID Esc. Padre'
      FieldName = 'ID_ESCANDALLO_PADRE'
    end
    object QMSubordenCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMSubordenCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSQMSubOrden: TDataSource
    DataSet = QMSuborden
    Left = 176
    Top = 256
  end
  object xModelo_: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select a.id_a_m_c_t,c.id_a_m,mod.cod_mod,a.articulo from art_art' +
        'iculos a'
      'join art_articulos_m_c_tallas t'
      'on a.id_a_m_c_t = t.id_a_m_c_t'
      'join art_articulos_mod_color c'
      'on t.id_a_m_c = c.id_a_m_c'
      'join art_articulos_modelos mod'
      'on c.id_a_m=mod.id_a_m'
      'where a.empresa=?empresa and a.articulo=?compuesto')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 304
    object xModelo_ID_A_M_C_T: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C_T'
    end
    object xModelo_ID_A_M: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M'
    end
    object xModelo_COD_MOD: TFIBStringField
      DisplayLabel = 'Cod. Modelo'
      FieldName = 'COD_MOD'
      Size = 7
    end
    object xModelo_ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSxModelo_: TDataSource
    DataSet = xModelo_
    Left = 176
    Top = 304
  end
  object QMOPLanzadas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD'
      'WHERE'
      '  ID_ORDEN=?old_ID_ORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD'
      
        '  (FECHA_ORD,FECHA_PED,UNI_PEDID,UNI_MANUAL,UNI_TOTAL,UNI_PRODUC' +
        ',UNI_PENDIENTES,FECHA_ENTREGA,FECHA_INI,FECHA_FIN,COSTE_FIJO_PRE' +
        ',COSTE_VAR_PRE,COSTE_MAT_PRE,COSTE_MO_PRE,COSTE_MAQ_PRE,COSTE_TE' +
        'X_PRE,COSTE_TOT_PRE,COSTE_FIJO_REAL,COSTE_VAR_REAL,COSTE_MAT_REA' +
        'L,COSTE_MO_REAL,COSTE_MAQ_REAL,COSTE_TEX_REAL,COSTE_TOT_REAL,COS' +
        'TE_UNITARIO,PRECIO_VENTA,HORAS_TOTALES,MARGEN_UNI,MARGEN_TOTAL,O' +
        'BSERVACIONES,MARGEN_UNI_CIEN,COSTE_COMPRAS,HORAS_OPERARIO,HORAS_' +
        'MAQUINA,MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,COSTE_COMPRAS_PRE,MA' +
        'RGEN_TOTAL_PRE,MARGEN_UNI_CIEN_PRE,COSTE_UNITARIO_PRE,MARGEN_UNI' +
        '_PRE,PRECIO_VENTA_PRE,PRECIO_VENTA_TOT_PRE,PRECIO_VENTA_TOT_REAL' +
        ',HORAS_OPERARIO_PRE,HORAS_MAQUINA_PRE,UNI_FABRICADAS,COSTE_MERMA' +
        '_PRE,COSTE_MERMA_REAL,DIF_COSTE_MERMA,SERIES,RIG_OF,SUBORDEN,CLI' +
        'ENTE,ESCANDALLO,PEDIDO,MERMA,ENTRADA,ID_ORDEN,ID_ORDEN_MAT,ID_MO' +
        'V_STOCK,ISO_APROBADO,ISO_VERIFICADO,ISO_VALIDADO,ID_A,PADRE_SUBO' +
        'RDEN,CONT_SUBORDEN,ID_DESPIECE,ID_ORDEN_SUBORDEN,RESPONSABLE,PLA' +
        'NIFICACION,LINEA_PLANIFICACION,ID_PLANIFICACION,ID_PLANIFICACION' +
        '_DET,ID_LOTE,ID_UBICACION,ID_MOV_STOCK_RESERVA,UNIDAD,COPIAS_PMP' +
        ',EMPRESA,EJERCICIO,CANAL,TITULO,ESTADO,LINEA_PED,PRIORIDAD,VISTO' +
        'BUENO1,VISTOBUENO2,VISTOBUENO3,SITUACION,TIPO_LANZAMIENTO,TIPO_R' +
        'ESERVA,REFERENCIA,SELECCIONADA,PREVALECE_ALM_ORDEN,CERRAR_SUBORD' +
        'ENES,IMPORTAR_OP,CASO_OP,RESERVA_STOCK_OP,DESACTIVA_TRIGGER,COMP' +
        'UESTOS_VIRTUALES,SEGUIR_SIN_STOCK,RECUPERADO_MARCAJE,DESC_LOTE,A' +
        'LMACEN_SAL,ALMACEN_LAN,ALMACEN_ENT,COMPUESTO,VERSION_ORDEN)'
      'VALUES'
      
        '  (?FECHA_ORD,?FECHA_PED,?UNI_PEDID,?UNI_MANUAL,?UNI_TOTAL,?UNI_' +
        'PRODUC,?UNI_PENDIENTES,?FECHA_ENTREGA,?FECHA_INI,?FECHA_FIN,?COS' +
        'TE_FIJO_PRE,?COSTE_VAR_PRE,?COSTE_MAT_PRE,?COSTE_MO_PRE,?COSTE_M' +
        'AQ_PRE,?COSTE_TEX_PRE,?COSTE_TOT_PRE,?COSTE_FIJO_REAL,?COSTE_VAR' +
        '_REAL,?COSTE_MAT_REAL,?COSTE_MO_REAL,?COSTE_MAQ_REAL,?COSTE_TEX_' +
        'REAL,?COSTE_TOT_REAL,?COSTE_UNITARIO,?PRECIO_VENTA,?HORAS_TOTALE' +
        'S,?MARGEN_UNI,?MARGEN_TOTAL,?OBSERVACIONES,?MARGEN_UNI_CIEN,?COS' +
        'TE_COMPRAS,?HORAS_OPERARIO,?HORAS_MAQUINA,?MEDIDA_1,?MEDIDA_2,?M' +
        'EDIDA_3,?MEDIDA_4,?COSTE_COMPRAS_PRE,?MARGEN_TOTAL_PRE,?MARGEN_U' +
        'NI_CIEN_PRE,?COSTE_UNITARIO_PRE,?MARGEN_UNI_PRE,?PRECIO_VENTA_PR' +
        'E,?PRECIO_VENTA_TOT_PRE,?PRECIO_VENTA_TOT_REAL,?HORAS_OPERARIO_P' +
        'RE,?HORAS_MAQUINA_PRE,?UNI_FABRICADAS,?COSTE_MERMA_PRE,?COSTE_ME' +
        'RMA_REAL,?DIF_COSTE_MERMA,?SERIES,?RIG_OF,?SUBORDEN,?CLIENTE,?ES' +
        'CANDALLO,?PEDIDO,?MERMA,?ENTRADA,?ID_ORDEN,?ID_ORDEN_MAT,?ID_MOV' +
        '_STOCK,?ISO_APROBADO,?ISO_VERIFICADO,?ISO_VALIDADO,?ID_A,?PADRE_' +
        'SUBORDEN,?CONT_SUBORDEN,?ID_DESPIECE,?ID_ORDEN_SUBORDEN,?RESPONS' +
        'ABLE,?PLANIFICACION,?LINEA_PLANIFICACION,?ID_PLANIFICACION,?ID_P' +
        'LANIFICACION_DET,?ID_LOTE,?ID_UBICACION,?ID_MOV_STOCK_RESERVA,?U' +
        'NIDAD,?COPIAS_PMP,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?ESTADO,?LI' +
        'NEA_PED,?PRIORIDAD,?VISTOBUENO1,?VISTOBUENO2,?VISTOBUENO3,?SITUA' +
        'CION,?TIPO_LANZAMIENTO,?TIPO_RESERVA,?REFERENCIA,?SELECCIONADA,?' +
        'PREVALECE_ALM_ORDEN,?CERRAR_SUBORDENES,?IMPORTAR_OP,?CASO_OP,?RE' +
        'SERVA_STOCK_OP,?DESACTIVA_TRIGGER,?COMPUESTOS_VIRTUALES,?SEGUIR_' +
        'SIN_STOCK,?RECUPERADO_MARCAJE,?DESC_LOTE,?ALMACEN_SAL,?ALMACEN_L' +
        'AN,?ALMACEN_ENT,?COMPUESTO,?VERSION_ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD'
      'WHERE'
      '  ID_ORDEN=?ID_ORDEN ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRO_ORD'
      'WHERE'
      'ID_PLANIFICACION = ?ID_PLANIFICACION'
      'ORDER BY ID_ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD'
      'SET'
      '  COPIAS_PMP=?COPIAS_PMP '
      'WHERE'
      '  ID_ORDEN=?ID_ORDEN ')
    DataSource = DSQMCabecera
    BeforeDelete = QMOPLanzadasBeforeDelete
    ClavesPrimarias.Strings = (
      'ID_ORDEN ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 208
    object QMOPLanzadasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOPLanzadasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMOPLanzadasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOPLanzadasSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMOPLanzadasRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMOPLanzadasSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMOPLanzadasALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMOPLanzadasALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm . Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMOPLanzadasALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMOPLanzadasFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ORD'
    end
    object QMOPLanzadasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMOPLanzadasCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMOPLanzadasESCANDALLO: TIntegerField
      DisplayLabel = 'Esc.'
      FieldName = 'ESCANDALLO'
    end
    object QMOPLanzadasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMOPLanzadasPEDIDO: TIntegerField
      DisplayLabel = 'Ped.'
      FieldName = 'PEDIDO'
    end
    object QMOPLanzadasLINEA_PED: TIntegerField
      DisplayLabel = 'Lin. Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMOPLanzadasFECHA_PED: TDateTimeField
      DisplayLabel = 'Fecha Ped.'
      FieldName = 'FECHA_PED'
    end
    object QMOPLanzadasUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QMOPLanzadasUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Man.'
      FieldName = 'UNI_MANUAL'
    end
    object QMOPLanzadasUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QMOPLanzadasPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMOPLanzadasMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMOPLanzadasUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Produc.'
      FieldName = 'UNI_PRODUC'
    end
    object QMOPLanzadasUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QMOPLanzadasFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entr.'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMOPLanzadasFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMOPLanzadasFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMOPLanzadasCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QMOPLanzadasCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object QMOPLanzadasCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object QMOPLanzadasCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre.'
      FieldName = 'COSTE_MO_PRE'
    end
    object QMOPLanzadasCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QMOPLanzadasCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre.'
      FieldName = 'COSTE_TEX_PRE'
    end
    object QMOPLanzadasCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object QMOPLanzadasCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMOPLanzadasCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object QMOPLanzadasCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object QMOPLanzadasCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object QMOPLanzadasCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QMOPLanzadasCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object QMOPLanzadasCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object QMOPLanzadasCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'COSTE_UNITARIO'
    end
    object QMOPLanzadasPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMOPLanzadasHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object QMOPLanzadasMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Uni.'
      FieldName = 'MARGEN_UNI'
    end
    object QMOPLanzadasMARGEN_TOTAL: TFloatField
      DisplayLabel = 'Margen Total'
      FieldName = 'MARGEN_TOTAL'
    end
    object QMOPLanzadasOBSERVACIONES: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMOPLanzadasVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Bueno 1'
      FieldName = 'VISTOBUENO1'
    end
    object QMOPLanzadasVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Bueno 2'
      FieldName = 'VISTOBUENO2'
    end
    object QMOPLanzadasVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Bueno 3'
      FieldName = 'VISTOBUENO3'
    end
    object QMOPLanzadasSITUACION: TIntegerField
      DisplayLabel = 'Situaci'#243'n'
      FieldName = 'SITUACION'
    end
    object QMOPLanzadasMARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Margen Uni/100'
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object QMOPLanzadasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMOPLanzadasID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMOPLanzadasTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanz.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMOPLanzadasID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Orden Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMOPLanzadasTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object QMOPLanzadasID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMOPLanzadasISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QMOPLanzadasISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMOPLanzadasISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMOPLanzadasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMOPLanzadasPADRE_SUBORDEN: TIntegerField
      DisplayLabel = 'Padre Suborden'
      FieldName = 'PADRE_SUBORDEN'
    end
    object QMOPLanzadasCONT_SUBORDEN: TIntegerField
      DisplayLabel = 'Cont. Suborden'
      FieldName = 'CONT_SUBORDEN'
    end
    object QMOPLanzadasREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMOPLanzadasCOSTE_COMPRAS: TFloatField
      DisplayLabel = 'Coste Compras'
      FieldName = 'COSTE_COMPRAS'
    end
    object QMOPLanzadasHORAS_OPERARIO: TFloatField
      DisplayLabel = 'Horas Oper.'
      FieldName = 'HORAS_OPERARIO'
    end
    object QMOPLanzadasHORAS_MAQUINA: TFloatField
      DisplayLabel = 'Horas Maq.'
      FieldName = 'HORAS_MAQUINA'
    end
    object QMOPLanzadasID_DESPIECE: TIntegerField
      DisplayLabel = 'ID Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMOPLanzadasID_ORDEN_SUBORDEN: TIntegerField
      DisplayLabel = 'ID Orden SubOrd.'
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object QMOPLanzadasSELECCIONADA: TIntegerField
      DisplayLabel = 'Seleccionada'
      FieldName = 'SELECCIONADA'
    end
    object QMOPLanzadasPREVALECE_ALM_ORDEN: TIntegerField
      DisplayLabel = 'Prevalece Alm. Ord.'
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object QMOPLanzadasCERRAR_SUBORDENES: TIntegerField
      DisplayLabel = 'Cerrar Subord.'
      FieldName = 'CERRAR_SUBORDENES'
    end
    object QMOPLanzadasIMPORTAR_OP: TIntegerField
      DisplayLabel = 'Importar OP'
      FieldName = 'IMPORTAR_OP'
    end
    object QMOPLanzadasCASO_OP: TIntegerField
      DisplayLabel = 'Caso OP'
      FieldName = 'CASO_OP'
    end
    object QMOPLanzadasRESERVA_STOCK_OP: TIntegerField
      DisplayLabel = 'Reserva Stock OP'
      FieldName = 'RESERVA_STOCK_OP'
    end
    object QMOPLanzadasMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMOPLanzadasMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMOPLanzadasMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMOPLanzadasMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMOPLanzadasDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMOPLanzadasRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMOPLanzadasDIF_COSTE_FIJO: TFloatField
      DisplayLabel = 'Dif. Coste Fijo'
      FieldName = 'DIF_COSTE_FIJO'
    end
    object QMOPLanzadasDIF_COSTE_MAT: TFloatField
      DisplayLabel = 'Dif. Coste Mat.'
      FieldName = 'DIF_COSTE_MAT'
    end
    object QMOPLanzadasDIF_COSTE_MO: TFloatField
      DisplayLabel = 'Dif. Coste MO'
      FieldName = 'DIF_COSTE_MO'
    end
    object QMOPLanzadasDIF_COSTE_MAQ: TFloatField
      DisplayLabel = 'Dif. Coste Maq.'
      FieldName = 'DIF_COSTE_MAQ'
    end
    object QMOPLanzadasDIF_COSTE_TEXT: TFloatField
      DisplayLabel = 'Dif. Coste Text'
      FieldName = 'DIF_COSTE_TEXT'
    end
    object QMOPLanzadasDIF_COSTE_VAR: TFloatField
      DisplayLabel = 'Dif. Coste Var.'
      FieldName = 'DIF_COSTE_VAR'
    end
    object QMOPLanzadasCOSTE_COMPRAS_PRE: TFloatField
      DisplayLabel = 'Coste Compras Pre.'
      FieldName = 'COSTE_COMPRAS_PRE'
    end
    object QMOPLanzadasDIF_COSTE_COMPRAS: TFloatField
      DisplayLabel = 'Dif. Coste Compras'
      FieldName = 'DIF_COSTE_COMPRAS'
    end
    object QMOPLanzadasDIF_COSTE_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Total'
      FieldName = 'DIF_COSTE_TOTAL'
    end
    object QMOPLanzadasCOMPUESTOS_VIRTUALES: TIntegerField
      DisplayLabel = 'Comp. Virt.'
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object QMOPLanzadasSEGUIR_SIN_STOCK: TIntegerField
      DisplayLabel = 'Seguir sin stock'
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object QMOPLanzadasMARGEN_TOTAL_PRE: TFloatField
      DisplayLabel = 'Margen Total Pre.'
      FieldName = 'MARGEN_TOTAL_PRE'
    end
    object QMOPLanzadasMARGEN_UNI_CIEN_PRE: TFloatField
      DisplayLabel = 'Margen Uni/100 Pre'
      FieldName = 'MARGEN_UNI_CIEN_PRE'
    end
    object QMOPLanzadasCOSTE_UNITARIO_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Pre.'
      FieldName = 'COSTE_UNITARIO_PRE'
    end
    object QMOPLanzadasMARGEN_UNI_PRE: TFloatField
      DisplayLabel = 'Marge Unit. Pre.'
      FieldName = 'MARGEN_UNI_PRE'
    end
    object QMOPLanzadasPRECIO_VENTA_PRE: TFloatField
      DisplayLabel = 'Precio Venta Pre.'
      FieldName = 'PRECIO_VENTA_PRE'
    end
    object QMOPLanzadasPRECIO_VENTA_TOT_PRE: TFloatField
      DisplayLabel = 'Precio Venta Tot. Pre'
      FieldName = 'PRECIO_VENTA_TOT_PRE'
    end
    object QMOPLanzadasPRECIO_VENTA_TOT_REAL: TFloatField
      DisplayLabel = 'Precio Venta Tot. Real'
      FieldName = 'PRECIO_VENTA_TOT_REAL'
    end
    object QMOPLanzadasDIF_COSTE_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Marg. Tot.'
      FieldName = 'DIF_COSTE_MARGEN_TOTAL'
    end
    object QMOPLanzadasDIF_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif. Margen Total'
      FieldName = 'DIF_MARGEN_TOTAL'
    end
    object QMOPLanzadasDIF_MARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Dif. Margen Uni/100'
      FieldName = 'DIF_MARGEN_UNI_CIEN'
    end
    object QMOPLanzadasDIF_PRECIO_VENTA_UNI: TFloatField
      DisplayLabel = 'Dif. Precio Venta Unit.'
      FieldName = 'DIF_PRECIO_VENTA_UNI'
    end
    object QMOPLanzadasDIF_COSTE_UNI: TFloatField
      DisplayLabel = 'Dif. Coste Unit.'
      FieldName = 'DIF_COSTE_UNI'
    end
    object QMOPLanzadasDIF_MARGEN_UNI: TFloatField
      DisplayLabel = 'Dif. Margen Unit.'
      FieldName = 'DIF_MARGEN_UNI'
    end
    object QMOPLanzadasDIF_PRECIO_VENTA_TOT: TFloatField
      DisplayLabel = 'Dif. Precio Venta Tot.'
      FieldName = 'DIF_PRECIO_VENTA_TOT'
    end
    object QMOPLanzadasHORAS_OPERARIO_PRE: TFloatField
      DisplayLabel = 'Horas Operario Pre.'
      FieldName = 'HORAS_OPERARIO_PRE'
    end
    object QMOPLanzadasHORAS_MAQUINA_PRE: TFloatField
      DisplayLabel = 'Horas M'#225'quina Pre.'
      FieldName = 'HORAS_MAQUINA_PRE'
    end
    object QMOPLanzadasDIF_HORAS_MAQUINA: TFloatField
      DisplayLabel = 'Dif. Horas M'#225'q.'
      FieldName = 'DIF_HORAS_MAQUINA'
    end
    object QMOPLanzadasDIF_HORAS_OPERARIO: TFloatField
      DisplayLabel = 'Dif. Horas Oper.'
      FieldName = 'DIF_HORAS_OPERARIO'
    end
    object QMOPLanzadasRECUPERADO_MARCAJE: TIntegerField
      DisplayLabel = 'Recup. Marcaje'
      FieldName = 'RECUPERADO_MARCAJE'
    end
    object QMOPLanzadasUNI_FABRICADAS: TFloatField
      DisplayLabel = 'Uds. Fabric.'
      FieldName = 'UNI_FABRICADAS'
    end
    object QMOPLanzadasPLANIFICACION: TIntegerField
      DisplayLabel = 'Planif.'
      FieldName = 'PLANIFICACION'
    end
    object QMOPLanzadasLINEA_PLANIFICACION: TIntegerField
      DisplayLabel = 'L'#237'nea Planif.'
      FieldName = 'LINEA_PLANIFICACION'
    end
    object QMOPLanzadasID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planif.'
      FieldName = 'ID_PLANIFICACION'
    end
    object QMOPLanzadasID_PLANIFICACION_DET: TIntegerField
      DisplayLabel = 'ID Planif. Det.'
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object QMOPLanzadasID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMOPLanzadasID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMOPLanzadasID_MOV_STOCK_RESERVA: TIntegerField
      DisplayLabel = 'ID Mov. Stock Reserva'
      FieldName = 'ID_MOV_STOCK_RESERVA'
    end
    object QMOPLanzadasDESC_LOTE: TFIBStringField
      DisplayLabel = 'Desc. Lote'
      FieldName = 'DESC_LOTE'
    end
    object QMOPLanzadasUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMOPLanzadasCOSTE_MERMA_PRE: TFloatField
      DisplayLabel = 'Coste Merma Pre.'
      FieldName = 'COSTE_MERMA_PRE'
    end
    object QMOPLanzadasCOSTE_MERMA_REAL: TFloatField
      DisplayLabel = 'Coste Merma Real'
      FieldName = 'COSTE_MERMA_REAL'
    end
    object QMOPLanzadasDIF_COSTE_MERMA: TFloatField
      DisplayLabel = 'Dif. Coste Merma'
      FieldName = 'DIF_COSTE_MERMA'
    end
    object QMOPLanzadasCOPIAS_PMP: TIntegerField
      DisplayLabel = 'Copias PMP'
      FieldName = 'COPIAS_PMP'
    end
    object QMOPLanzadasDescSituacion: TStringField
      DisplayLabel = 'Desc. Situacion'
      FieldKind = fkCalculated
      FieldName = 'DescSituacion'
      OnGetText = QMOPLanzadasDescSituacionGetText
      Size = 60
      Calculated = True
    end
    object QMOPLanzadasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMOPLanzadasVERSION_ORDEN: TFIBStringField
      DisplayLabel = 'Version'
      FieldName = 'VERSION_ORDEN'
      Size = 15
    end
    object QMOPLanzadasTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Desc. Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
  end
  object DSQMOPLanzadas: TDataSource
    DataSet = QMOPLanzadas
    Left = 176
    Top = 208
  end
end
