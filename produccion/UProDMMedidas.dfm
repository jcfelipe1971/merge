object ProDMMedidas: TProDMMedidas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 421
  Top = 163
  Height = 555
  Width = 649
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 196
    Top = 28
  end
  object QMMedidas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MEDIDAS'
      'WHERE'
      '  ID_MEDIDA=?old_ID_MEDIDA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MEDIDAS'
      
        '  (NOTAS,MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,ID_MEDIDA,ID_ESCAND' +
        'ALLO,TRASPASAR_NOTAS_PEDIDO,TIPO,ARTICULO,ALMACEN,UNIDADES_PED,U' +
        'NIDADES_OP,UNIDADES_OPTIMO_ESC,UNIDADES_STOCK,UNIDADES_ASIGNADAS' +
        '_LOTE,UNIDADES_FABRICAR_LIBRE)'
      'VALUES'
      
        '  (?NOTAS,?MEDIDA_1,?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?ID_MEDIDA,?ID' +
        '_ESCANDALLO,?TRASPASAR_NOTAS_PEDIDO,?TIPO,?ARTICULO,?ALMACEN,?UN' +
        'IDADES_PED,?UNIDADES_OP,?UNIDADES_OPTIMO_ESC,?UNIDADES_STOCK,?UN' +
        'IDADES_ASIGNADAS_LOTE,?UNIDADES_FABRICAR_LIBRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MEDIDAS'
      'WHERE'
      '  ID_MEDIDA=?ID_MEDIDA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MEDIDAS'
      'where id_medida=?id_medida')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MEDIDAS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,ID_ESCANDALLO=?ID_ESCANDALLO '
      '  ,TRASPASAR_NOTAS_PEDIDO=?TRASPASAR_NOTAS_PEDIDO '
      '  ,TIPO=?TIPO '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN=?ALMACEN '
      '  ,UNIDADES_PED=?UNIDADES_PED '
      '  ,UNIDADES_OP=?UNIDADES_OP '
      '  ,UNIDADES_OPTIMO_ESC=?UNIDADES_OPTIMO_ESC '
      '  ,UNIDADES_STOCK=?UNIDADES_STOCK '
      '  ,UNIDADES_ASIGNADAS_LOTE=?UNIDADES_ASIGNADAS_LOTE '
      '  ,UNIDADES_FABRICAR_LIBRE=?UNIDADES_FABRICAR_LIBRE '
      'WHERE'
      '  ID_MEDIDA=?ID_MEDIDA ')
    AfterOpen = QMMedidasAfterOpen
    AfterPost = Graba
    BeforePost = QMMedidasBeforePost
    OnNewRecord = QMMedidasNewRecord
    ClavesPrimarias.Strings = (
      'ID_MEDIDA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MEDIDAS'
    UpdateTransaction = TLocal
    Left = 48
    Top = 32
    object QMMedidasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMMedidasMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMMedidasMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMMedidasMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMMedidasMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMMedidasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMMedidasARTICULOChange
      Size = 15
    end
    object QMMedidasDescArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMMedidasDescArticuloGetText
      Size = 60
      Calculated = True
    end
    object QMMedidasID_ESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ID_ESCANDALLO'
    end
    object QMMedidasNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMMedidasTRASPASAR_NOTAS_PEDIDO: TIntegerField
      DisplayLabel = 'Trapasar Notas Ped.'
      FieldName = 'TRASPASAR_NOTAS_PEDIDO'
    end
    object QMMedidasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMMedidasUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNIDADES_PED'
    end
    object QMMedidasUNIDADES_OP: TFloatField
      DisplayLabel = 'Uds. Op.'
      FieldName = 'UNIDADES_OP'
    end
    object QMMedidasUNIDADES_OPTIMO_ESC: TFloatField
      DisplayLabel = 'Uds. Optimo Esc.'
      FieldName = 'UNIDADES_OPTIMO_ESC'
    end
    object QMMedidasdescalmacen: TStringField
      FieldKind = fkCalculated
      FieldName = 'descalmacen'
      OnGetText = QMMedidasdescalmacenGetText
      Size = 40
      Calculated = True
    end
    object QMMedidasUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'UNIDADES_STOCK'
    end
    object QMMedidasUNIDADES_ASIGNADAS_LOTE: TFloatField
      DisplayLabel = 'Uds. Asignadas'
      FieldName = 'UNIDADES_ASIGNADAS_LOTE'
    end
    object QMMedidasUNIDADES_FABRICAR_LIBRE: TFloatField
      DisplayLabel = 'Uds. Fabricar Lin.'
      FieldName = 'UNIDADES_FABRICAR_LIBRE'
    end
    object QMMedidasID_MEDIDA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_MEDIDA'
    end
  end
  object DSMedidas: TDataSource
    DataSet = QMMedidas
    Left = 116
    Top = 28
  end
  object DSDetMedidas: TDataSource
    DataSet = QMDetMedidas
    Left = 136
    Top = 176
  end
  object QMDetMedidas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TAREA_ESC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  LINEA_TAREA=?old_LINEA_TAREA AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TAREA_ESC'
      
        '  (TIEMPO,TOTAL,PRECIO_FIJO,TOTAL_VAR,PRE_COS_UNI,CANTIDAD,COMEN' +
        'TARIO,OPERACIONES_TIEMPO,OPERACIONES_NUM,ID_ESC,ID_UTILLAJES,ENT' +
        'RADA,ESCANDALLO,FORMULA,DESC_UTILLAJE,ORDEN,TAREA,LINEA_TAREA,LI' +
        'NEA_FASE,EMPRESA,ACTUALIZA_REC,TIPO,RECURSO,TIPOTAREA,ID_TAREA,R' +
        'ESULTADO_FORMULA,UNIDADES,TIEMPO_UNITARIO)'
      'VALUES'
      
        '  (?TIEMPO,?TOTAL,?PRECIO_FIJO,?TOTAL_VAR,?PRE_COS_UNI,?CANTIDAD' +
        ',?COMENTARIO,?OPERACIONES_TIEMPO,?OPERACIONES_NUM,?ID_ESC,?ID_UT' +
        'ILLAJES,?ENTRADA,?ESCANDALLO,?FORMULA,?DESC_UTILLAJE,?ORDEN,?TAR' +
        'EA,?LINEA_TAREA,?LINEA_FASE,?EMPRESA,?ACTUALIZA_REC,?TIPO,?RECUR' +
        'SO,?TIPOTAREA,?ID_TAREA,?RESULTADO_FORMULA,?UNIDADES,?TIEMPO_UNI' +
        'TARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TAREA_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TAREA_ESC'
      'where id_esc=?id_escandallo'
      'order by linea_fase')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TAREA_ESC'
      'SET'
      '  TIEMPO=?TIEMPO '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL=?TOTAL '
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO '
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_UTILLAJES=?ID_UTILLAJES '
      '  ,ID_ESC=?ID_ESC '
      '  ,ACTUALIZA_REC=?ACTUALIZA_REC '
      '  ,TAREA=?TAREA '
      '  ,ORDEN=?ORDEN '
      '  ,DESC_UTILLAJE=?DESC_UTILLAJE '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,RECURSO=?RECURSO '
      '  ,UNIDADES=?UNIDADES '
      '  ,TIEMPO_UNITARIO=?TIEMPO_UNITARIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  TIPO=?TIPO ')
    AfterEdit = QMDetMedidasAfterEdit
    AfterOpen = QMDetMedidasAfterOpen
    OnCalcFields = QMDetMedidasCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'LINEA_FASE '
      'LINEA_TAREA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TAREA_ESC'
    UpdateTransaction = TLocal
    Left = 56
    Top = 180
    object QMDetMedidasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetMedidasESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMDetMedidasLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMDetMedidasLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMDetMedidasTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object QMDetMedidasORDEN: TIntegerField
      DisplayLabel = 'Oren'
      FieldName = 'ORDEN'
    end
    object QMDetMedidasTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMDetMedidasCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMDetMedidasRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMDetMedidasCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetMedidasPRE_COS_UNI: TFloatField
      DisplayLabel = 'Pre. Cos. Uni.'
      FieldName = 'PRE_COS_UNI'
    end
    object QMDetMedidasTOTAL_VAR: TFloatField
      DisplayLabel = 'Total Var'
      FieldName = 'TOTAL_VAR'
    end
    object QMDetMedidasPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
    end
    object QMDetMedidasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMDetMedidasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetMedidasACTUALIZA_REC: TIntegerField
      DisplayLabel = 'Actualiza Rec.'
      FieldName = 'ACTUALIZA_REC'
    end
    object QMDetMedidasID_UTILLAJES: TFIBStringField
      DisplayLabel = 'ID Utillajes'
      FieldName = 'ID_UTILLAJES'
      Size = 10
    end
    object QMDetMedidasDESC_UTILLAJE: TFIBStringField
      DisplayLabel = 'Desc. Utillaje'
      FieldName = 'DESC_UTILLAJE'
      Size = 40
    end
    object QMDetMedidasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetMedidasID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMDetMedidasTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMDetMedidasOPERACIONES_NUM: TIntegerField
      DisplayLabel = 'Operaciones N'#250'm.'
      FieldName = 'OPERACIONES_NUM'
    end
    object QMDetMedidasOPERACIONES_TIEMPO: TIntegerField
      DisplayLabel = 'Operaciones Tiempo'
      FieldName = 'OPERACIONES_TIEMPO'
    end
    object QMDetMedidasTRASPASAR: TSmallintField
      DisplayLabel = 'Traspasar'
      FieldKind = fkCalculated
      FieldName = 'TRASPASAR'
      OnChange = QMDetMedidasTraspasarChange
      Calculated = True
    end
    object QMDetMedidasFORMULA: TIntegerField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
    end
    object QMDetMedidasID_TAREA: TIntegerField
      DisplayLabel = 'ID Tarea'
      FieldName = 'ID_TAREA'
    end
    object QMDetMedidasRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Resultado Form.'
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMDetMedidasUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMDetMedidasUNIDADESChange
    end
    object QMDetMedidasTIEMPO_UNITARIO: TFloatField
      DisplayLabel = 'Tiempo Unit.'
      FieldName = 'TIEMPO_UNITARIO'
      OnChange = QMDetMedidasUNIDADESChange
    end
    object QMDetMedidasDescripTarea: TStringField
      DisplayLabel = 'Descrip. Tarea'
      FieldKind = fkCalculated
      FieldName = 'DescripTarea'
      OnGetText = QMDetMedidasDescripTareaGetText
      Size = 40
      Calculated = True
    end
  end
  object QInsertarTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into pro_tareas_medidas (id_detalles_ped,id_esc_ped,empre' +
        'sa_tar,escandallo_tar,linea_fase_tar,linea_tarea_tar,tarea,tipo_' +
        'tar,traspasada)'
      
        'values (?id_detalles_ped,?id_esc_ped,?empresa_tar,?escandallo_ta' +
        'r,?linea_fase_tar,?linea_tarea_tar,?tarea,?tipo_tar,?traspasada)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 96
  end
  object QExisteixTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select count(*) from pro_tareas_medidas'
      'where id_detalles_ped=?id_detalles and id_esc_ped=?id_esc '
      'and linea_tarea_tar=?linea_tarea')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 160
  end
  object QBorrarTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from pro_tareas_medidas'
      'where id_detalles_ped=?id_detalles and id_esc_ped=?id_esc '
      'and linea_tarea_tar=?linea_tarea')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 224
  end
  object QModificarTras: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update pro_tareas_medidas'
      ' set traspasada=1'
      'where id_detalles_ped=?id_detalles'
      ''
      ' /*and id_esc_ped=?id_esc '
      'and linea_fase_tar=?linea_fase*/')
    Transaction = TLocal
    AutoTrans = True
    Left = 144
    Top = 240
  end
  object QBuscarMarcats: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select tarea from pro_tareas_medidas'
      'where id_detalles_ped=?id_detalles and id_esc_ped=?id_esc')
    UniDirectional = False
    Left = 280
    Top = 284
    object QBuscarMarcatsTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
  end
  object DSEscandallo: TDataSource
    DataSet = QEscandallo
    Left = 140
    Top = 312
  end
  object QEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ESCANDALLO'
      
        '  (ID_DETALLES_PEDIDOS_V,RESPONSABLE,DIBUJO,NOTAS,FECHA_CREAC,CO' +
        'STE_TOTAL,COSTE_VAR,COSTE_TEXTE,COSTE_MAQUI,COSTE_MOBRA,COSTE_MA' +
        'TER,COSTE_FIJO,MEDIDA_3,MEDIDA_2,MEDIDA_1,UNIDADES,MEDIDA_4,CLIE' +
        'NTE,ID_DETALLES_OFERTAS_V,ID_ESC,ENTRADA,UNIDAD,ESCANDALLO,ISO_V' +
        'ALIDADO,ISO_VERIFICADO,ISO_APROBADO,MARGEN_TRAB,MARGEN_VAR,MARGE' +
        'N_OPE,MARGEN_MATER,MARGEN_MAQUI,USA_P_OPTIMO,DEFECTO,ACTUALIZA_M' +
        'AT,ACTUALIZA_REC,ESTADO,EMPRESA,AUTO_ENTRADA,TIPO_PRECIO,AUTO_CA' +
        'LC,GENERA_OF,DESCRIPCION,TIPO,ALMACEN_LAN,ALMACEN_ENT,COMPUESTO,' +
        'ALMACEN_SAL,UNIDADES_PORCENT,TIPO_CONTROL)'
      'VALUES'
      
        '  (?ID_DETALLES_PEDIDOS_V,?RESPONSABLE,?DIBUJO,?NOTAS,?FECHA_CRE' +
        'AC,?COSTE_TOTAL,?COSTE_VAR,?COSTE_TEXTE,?COSTE_MAQUI,?COSTE_MOBR' +
        'A,?COSTE_MATER,?COSTE_FIJO,?MEDIDA_3,?MEDIDA_2,?MEDIDA_1,?UNIDAD' +
        'ES,?MEDIDA_4,?CLIENTE,?ID_DETALLES_OFERTAS_V,?ID_ESC,?ENTRADA,?U' +
        'NIDAD,?ESCANDALLO,?ISO_VALIDADO,?ISO_VERIFICADO,?ISO_APROBADO,?M' +
        'ARGEN_TRAB,?MARGEN_VAR,?MARGEN_OPE,?MARGEN_MATER,?MARGEN_MAQUI,?' +
        'USA_P_OPTIMO,?DEFECTO,?ACTUALIZA_MAT,?ACTUALIZA_REC,?ESTADO,?EMP' +
        'RESA,?AUTO_ENTRADA,?TIPO_PRECIO,?AUTO_CALC,?GENERA_OF,?DESCRIPCI' +
        'ON,?TIPO,?ALMACEN_LAN,?ALMACEN_ENT,?COMPUESTO,?ALMACEN_SAL,?UNID' +
        'ADES_PORCENT,?TIPO_CONTROL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ESCANDALLO'
      'where id_esc=?id_escandallo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ESCANDALLO'
      'SET'
      '  ID_DETALLES_PEDIDOS_V=?ID_DETALLES_PEDIDOS_V '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,DIBUJO=?DIBUJO '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA_CREAC=?FECHA_CREAC '
      '  ,COSTE_TOTAL=?COSTE_TOTAL '
      '  ,COSTE_VAR=?COSTE_VAR '
      '  ,COSTE_TEXTE=?COSTE_TEXTE '
      '  ,COSTE_MAQUI=?COSTE_MAQUI '
      '  ,COSTE_MOBRA=?COSTE_MOBRA '
      '  ,COSTE_MATER=?COSTE_MATER '
      '  ,COSTE_FIJO=?COSTE_FIJO '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,UNIDADES=?UNIDADES '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,CLIENTE=?CLIENTE '
      '  ,ID_DETALLES_OFERTAS_V=?ID_DETALLES_OFERTAS_V '
      '  ,ID_ESC=?ID_ESC '
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDAD=?UNIDAD '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,MARGEN_TRAB=?MARGEN_TRAB '
      '  ,MARGEN_VAR=?MARGEN_VAR '
      '  ,MARGEN_OPE=?MARGEN_OPE '
      '  ,MARGEN_MATER=?MARGEN_MATER '
      '  ,MARGEN_MAQUI=?MARGEN_MAQUI '
      '  ,USA_P_OPTIMO=?USA_P_OPTIMO '
      '  ,DEFECTO=?DEFECTO '
      '  ,ACTUALIZA_MAT=?ACTUALIZA_MAT '
      '  ,ACTUALIZA_REC=?ACTUALIZA_REC '
      '  ,ESTADO=?ESTADO '
      '  ,AUTO_ENTRADA=?AUTO_ENTRADA '
      '  ,TIPO_PRECIO=?TIPO_PRECIO '
      '  ,AUTO_CALC=?AUTO_CALC '
      '  ,GENERA_OF=?GENERA_OF '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,UNIDADES_PORCENT=?UNIDADES_PORCENT '
      '  ,TIPO_CONTROL=?TIPO_CONTROL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO ')
    AfterEdit = QMDetMedidasAfterEdit
    OnCalcFields = QMDetMedidasCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ESCANDALLO'
    UpdateTransaction = TLocal
    Left = 56
    Top = 312
    object QEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QEscandalloESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QEscandalloCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QEscandalloUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QEscandalloUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QEscandalloMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QEscandalloMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QEscandalloMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QEscandalloCOSTE_FIJO: TFloatField
      DisplayLabel = 'Coste Fijo'
      FieldName = 'COSTE_FIJO'
    end
    object QEscandalloCOSTE_MATER: TFloatField
      DisplayLabel = 'Coste Mat.'
      FieldName = 'COSTE_MATER'
    end
    object QEscandalloCOSTE_MOBRA: TFloatField
      DisplayLabel = 'Coste Mo.'
      FieldName = 'COSTE_MOBRA'
    end
    object QEscandalloCOSTE_MAQUI: TFloatField
      DisplayLabel = 'Coste Maq.'
      FieldName = 'COSTE_MAQUI'
    end
    object QEscandalloCOSTE_TEXTE: TFloatField
      DisplayLabel = 'Coste Tex.'
      FieldName = 'COSTE_TEXTE'
    end
    object QEscandalloCOSTE_VAR: TFloatField
      DisplayLabel = 'Coste Var.'
      FieldName = 'COSTE_VAR'
    end
    object QEscandalloCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object QEscandalloFECHA_CREAC: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREAC'
    end
    object QEscandalloESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QEscandalloNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QEscandalloDIBUJO: TMemoField
      FieldName = 'DIBUJO'
      BlobType = ftMemo
      Size = 8
    end
    object QEscandalloACTUALIZA_REC: TIntegerField
      DisplayLabel = 'Actualiza Rec.'
      FieldName = 'ACTUALIZA_REC'
    end
    object QEscandalloACTUALIZA_MAT: TIntegerField
      DisplayLabel = 'Actualiza Mat.'
      FieldName = 'ACTUALIZA_MAT'
    end
    object QEscandalloDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QEscandalloALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QEscandalloALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QEscandalloENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QEscandalloAUTO_CALC: TIntegerField
      DisplayLabel = 'Auto Calc.'
      FieldName = 'AUTO_CALC'
    end
    object QEscandalloTIPO_PRECIO: TIntegerField
      DisplayLabel = 'Tipo Precio'
      FieldName = 'TIPO_PRECIO'
    end
    object QEscandalloAUTO_ENTRADA: TIntegerField
      DisplayLabel = 'Auto Entrada'
      FieldName = 'AUTO_ENTRADA'
    end
    object QEscandalloGENERA_OF: TIntegerField
      DisplayLabel = 'Genera Of.'
      FieldName = 'GENERA_OF'
    end
    object QEscandalloISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QEscandalloISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QEscandalloISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QEscandalloALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QEscandalloTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QEscandalloID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QEscandalloID_DETALLES_OFERTAS_V: TIntegerField
      DisplayLabel = 'ID Det. Ofe. V.'
      FieldName = 'ID_DETALLES_OFERTAS_V'
    end
    object QEscandalloMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QEscandalloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QEscandalloMARGEN_MAQUI: TFloatField
      DisplayLabel = 'Margen Maq.'
      FieldName = 'MARGEN_MAQUI'
    end
    object QEscandalloMARGEN_MATER: TFloatField
      DisplayLabel = 'Margen Mat.'
      FieldName = 'MARGEN_MATER'
    end
    object QEscandalloMARGEN_OPE: TFloatField
      DisplayLabel = 'Margen Oper.'
      FieldName = 'MARGEN_OPE'
    end
    object QEscandalloMARGEN_VAR: TFloatField
      DisplayLabel = 'Margen Var.'
      FieldName = 'MARGEN_VAR'
    end
    object QEscandalloMARGEN_TRAB: TFloatField
      DisplayLabel = 'Margen Trab.'
      FieldName = 'MARGEN_TRAB'
    end
    object QEscandalloCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QEscandalloUSA_P_OPTIMO: TIntegerField
      DisplayLabel = 'Usa P. Optimo'
      FieldName = 'USA_P_OPTIMO'
    end
    object QEscandalloTIPO_CONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPO_CONTROL'
    end
    object QEscandalloUNIDADES_PORCENT: TFloatField
      DisplayLabel = 'Uds. Porcent.'
      FieldName = 'UNIDADES_PORCENT'
    end
    object QEscandalloID_DETALLES_PEDIDOS_V: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_DETALLES_PEDIDOS_V'
    end
    object QEscandalloRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
  end
  object xComponentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MAT_ESC'
      
        'Where  empresa=?empresa and ESCANDALLO=?ESCANDALLO and Tipo='#39'EPR' +
        #39
      'order by orden')
    UniDirectional = False
    Left = 280
    Top = 364
    object xComponentesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xComponentesESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xComponentesLINEA_COMP: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA_COMP'
    end
    object xComponentesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xComponentesCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object xComponentesORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xComponentesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xComponentesPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object xComponentesLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xComponentesPRE_COS_UNI: TFloatField
      DisplayLabel = 'Pre. Cos. Uni.'
      FieldName = 'PRE_COS_UNI'
    end
    object xComponentesTOTAL_VAR: TFloatField
      DisplayLabel = 'Total Var.'
      FieldName = 'TOTAL_VAR'
    end
    object xComponentesPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
    end
    object xComponentesTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xComponentesMATESC: TIntegerField
      DisplayLabel = 'Mat. Esc.'
      FieldName = 'MATESC'
    end
    object xComponentesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xComponentesACTUALIZA_MAT: TIntegerField
      DisplayLabel = 'Actualiza Mat.'
      FieldName = 'ACTUALIZA_MAT'
    end
    object xComponentesTIPO_PRECIO: TIntegerField
      DisplayLabel = 'Tipo Precio'
      FieldName = 'TIPO_PRECIO'
    end
    object xComponentesNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xComponentesMEDIDAS: TFIBStringField
      DisplayLabel = 'Medidas'
      FieldName = 'MEDIDAS'
      Size = 60
    end
    object xComponentesTIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Tipo Pieza'
      FieldName = 'TIPO_PIEZA'
      Size = 60
    end
    object xComponentesNUM_PIEZAS: TFIBStringField
      DisplayLabel = 'N'#250'm. Piezas'
      FieldName = 'NUM_PIEZAS'
      Size = 60
    end
    object xComponentesUNIDAD_ART: TFIBStringField
      DisplayLabel = 'Unid. Art.'
      FieldName = 'UNIDAD_ART'
      Size = 2
    end
    object xComponentesUNIDAD_FAB: TFIBStringField
      DisplayLabel = 'Unid. Fab.'
      FieldName = 'UNIDAD_FAB'
      Size = 2
    end
    object xComponentesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xComponentesID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object xComponentesID_EQUIVAL: TIntegerField
      DisplayLabel = 'ID Equiv.'
      FieldName = 'ID_EQUIVAL'
    end
    object xComponentesDES_TIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Desc. Tipo Pieza'
      FieldName = 'DES_TIPO_PIEZA'
      Size = 3
    end
    object xComponentesDES_CANTIDAD_TPIEZA: TFloatField
      DisplayLabel = 'Desc. Cantidad Tipo Pieza'
      FieldName = 'DES_CANTIDAD_TPIEZA'
    end
    object xComponentesDES_ALTO: TFloatField
      DisplayLabel = 'Desc. Alto'
      FieldName = 'DES_ALTO'
    end
    object xComponentesDES_ANCHO: TFloatField
      DisplayLabel = 'Desc. Ancho'
      FieldName = 'DES_ANCHO'
    end
    object xComponentesDES_GRUESO: TFloatField
      DisplayLabel = 'Desc. Grueso'
      FieldName = 'DES_GRUESO'
    end
    object xComponentesDES_METROS_DESCONTAR: TFloatField
      DisplayLabel = 'Desc. Metros Descontar'
      FieldName = 'DES_METROS_DESCONTAR'
    end
    object xComponentesDES_TIPO_MATERIAL: TFIBStringField
      DisplayLabel = 'Desc. Tipo Material'
      FieldName = 'DES_TIPO_MATERIAL'
      Size = 3
    end
    object xComponentesMINI_NOTA: TFIBStringField
      DisplayLabel = 'Mini Nota'
      FieldName = 'MINI_NOTA'
      Size = 60
    end
    object xComponentesPORCENT_SN: TIntegerField
      DisplayLabel = 'Porcent. SN'
      FieldName = 'PORCENT_SN'
    end
    object xComponentesDENSIDAD: TFloatField
      DisplayLabel = 'Densidad'
      FieldName = 'DENSIDAD'
    end
    object xComponentesUNIDADES_DENSIDAD: TFloatField
      DisplayLabel = 'Unid. Densidad'
      FieldName = 'UNIDADES_DENSIDAD'
    end
    object xComponentesLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xComponentesMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object xComponentesRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Resultado F'#243'rmula'
      FieldName = 'RESULTADO_FORMULA'
    end
    object xComponentesFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
    object xComponentesDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desactiva Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
  end
  object DSxComponentes: TDataSource
    DataSet = xComponentes
    Left = 388
    Top = 364
  end
  object xBorrarMarcados: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update art_articulos_lotes'
      ' set marcado_medidas=0'
      'where marcado_medidas=?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 276
    Top = 420
  end
  object xStockTotalLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select sum(sof.stock) as total_stock'
      'from SOF_ARTICULOS_LOTES (?empresa,?articulo,?canal)  sof'
      
        'left join art_articulos_lotes art on (art.empresa=sof.empresa an' +
        'd art.articulo=sof.articulo'
      '                                       and art.lote=sof.lote)'
      'where sof.stock>0 and marcado_medidas=?entrada')
    UniDirectional = False
    Left = 412
    Top = 204
    object xStockTotalLoteTOTAL_STOCK: TFloatField
      DisplayLabel = 'Total Stock'
      FieldName = 'TOTAL_STOCK'
    end
  end
  object DSxStockLote: TDataSource
    DataSet = xStockTotalLote
    Left = 516
    Top = 208
  end
  object QMMedidasLotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MEDIDAS_LOTES'
      'WHERE'
      '  ID_LOTE=?old_ID_LOTE AND '
      '  ID_MEDIDA=?old_ID_MEDIDA AND '
      '  ID_PEDIDO=?old_ID_PEDIDO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MEDIDAS_LOTES'
      '  (ID_PEDIDO,ID_MEDIDA,ID_LOTE,LOTE,LINEA,STOCK)'
      'VALUES'
      '  (?ID_PEDIDO,?ID_MEDIDA,?ID_LOTE,?LOTE,?LINEA,?STOCK)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MEDIDAS_LOTES'
      'WHERE'
      '  ID_LOTE=?ID_LOTE AND '
      '  ID_MEDIDA=?ID_MEDIDA AND '
      '  ID_PEDIDO=?ID_PEDIDO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MEDIDAS_LOTES'
      'where id_pedido=?id_pedido and id_medida=?id_medida'
      'order by id_pedido,id_medida,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MEDIDAS_LOTES'
      'SET'
      '  LOTE=?LOTE '
      '  ,LINEA=?LINEA '
      '  ,STOCK=?STOCK '
      'WHERE'
      '  ID_LOTE=?ID_LOTE AND '
      '  ID_MEDIDA=?ID_MEDIDA AND '
      '  ID_PEDIDO=?ID_PEDIDO ')
    AfterDelete = Graba
    AfterInsert = QMMedidasLotesAfterInsert
    AfterPost = Graba
    OnNewRecord = QMMedidasLotesNewRecord
    ClavesPrimarias.Strings = (
      'ID_LOTE '
      'ID_MEDIDA '
      'ID_PEDIDO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MEDIDAS_LOTES'
    UpdateTransaction = TLocal
    Left = 380
    Top = 48
    object QMMedidasLotesID_PEDIDO: TIntegerField
      DisplayLabel = 'ID Pedido'
      FieldName = 'ID_PEDIDO'
    end
    object QMMedidasLotesID_MEDIDA: TIntegerField
      DisplayLabel = 'ID Medida'
      FieldName = 'ID_MEDIDA'
    end
    object QMMedidasLotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
      OnChange = QMMedidasLotesID_LOTEChange
    end
    object QMMedidasLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMMedidasLotesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMMedidasLotesSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
  end
  object DSMedidasLotes: TDataSource
    DataSet = QMMedidasLotes
    Left = 492
    Top = 52
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO, CONTROLA_MEDIDAS, SERIALIZADO, ID_A,LOTES,'
      'UBICABLE'
      'FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 452
    Top = 122
  end
end
