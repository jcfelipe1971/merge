object ProDMMedidasOFC: TProDMMedidasOFC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 471
  Top = 127
  Height = 505
  Width = 502
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 216
    Top = 32
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
      
        '  (ID_MEDIDA,TIPO,MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,ARTICULO,I' +
        'D_ESCANDALLO,NOTAS,TRASPASAR_NOTAS_PEDIDO,ID_ESC_GENERADO)'
      'VALUES'
      
        '  (?ID_MEDIDA,?TIPO,?MEDIDA_1,?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?ART' +
        'ICULO,?ID_ESCANDALLO,?NOTAS,?TRASPASAR_NOTAS_PEDIDO,?ID_ESC_GENE' +
        'RADO)')
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
      '  TIPO=?TIPO '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,ARTICULO=?ARTICULO '
      '  ,ID_ESCANDALLO=?ID_ESCANDALLO '
      '  ,NOTAS=?NOTAS'
      '  ,TRASPASAR_NOTAS_PEDIDO=?TRASPASAR_NOTAS_PEDIDO'
      ' ,ID_ESC_GENERADO=?ID_ESC_GENERADO'
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
    Left = 32
    Top = 32
    object QMMedidasID_MEDIDA: TIntegerField
      DisplayLabel = 'ID Medida'
      FieldName = 'ID_MEDIDA'
    end
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
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMMedidasDescArticuloGetText
      Size = 60
      Calculated = True
    end
    object QMMedidasID_ESCANDALLO: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESCANDALLO'
    end
    object QMMedidasNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMMedidasTRASPASAR_NOTAS_PEDIDO: TIntegerField
      DisplayLabel = 'Traspasar Notas'
      FieldName = 'TRASPASAR_NOTAS_PEDIDO'
    end
    object QMMedidasID_ESC_GENERADO: TIntegerField
      DisplayLabel = 'Esc. Generado'
      FieldName = 'ID_ESC_GENERADO'
    end
  end
  object DSMedidas: TDataSource
    DataSet = QMMedidas
    Left = 120
    Top = 32
  end
  object DSDetMedidas: TDataSource
    DataSet = QMDetMedidas
    Left = 120
    Top = 80
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
      
        '  (COMENTARIO,CANTIDAD,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO,TOTAL,T' +
        'IEMPO,RESULTADO_FORMULA,UNIDADES,TIEMPO_UNITARIO,ESCANDALLO,ENTR' +
        'ADA,ID_UTILLAJES,ID_ESC,OPERACIONES_NUM,OPERACIONES_TIEMPO,FORMU' +
        'LA,ID_TAREA,ACTUALIZA_REC,EMPRESA,LINEA_FASE,LINEA_TAREA,TAREA,O' +
        'RDEN,DESC_UTILLAJE,TIPOTAREA,RECURSO,TIPO)'
      'VALUES'
      
        '  (?COMENTARIO,?CANTIDAD,?PRE_COS_UNI,?TOTAL_VAR,?PRECIO_FIJO,?T' +
        'OTAL,?TIEMPO,?RESULTADO_FORMULA,?UNIDADES,?TIEMPO_UNITARIO,?ESCA' +
        'NDALLO,?ENTRADA,?ID_UTILLAJES,?ID_ESC,?OPERACIONES_NUM,?OPERACIO' +
        'NES_TIEMPO,?FORMULA,?ID_TAREA,?ACTUALIZA_REC,?EMPRESA,?LINEA_FAS' +
        'E,?LINEA_TAREA,?TAREA,?ORDEN,?DESC_UTILLAJE,?TIPOTAREA,?RECURSO,' +
        '?TIPO)')
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
      'where id_esc=?id_escandallo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TAREA_ESC'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL=?TOTAL '
      '  ,TIEMPO=?TIEMPO '
      '  ,RESULTADO_FORMULA=?RESULTADO_FORMULA '
      '  ,UNIDADES=?UNIDADES '
      '  ,TIEMPO_UNITARIO=?TIEMPO_UNITARIO '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_UTILLAJES=?ID_UTILLAJES '
      '  ,ID_ESC=?ID_ESC '
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM '
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO '
      '  ,FORMULA=?FORMULA '
      '  ,ID_TAREA=?ID_TAREA '
      '  ,ACTUALIZA_REC=?ACTUALIZA_REC '
      '  ,TAREA=?TAREA '
      '  ,ORDEN=?ORDEN '
      '  ,DESC_UTILLAJE=?DESC_UTILLAJE '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,RECURSO=?RECURSO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  TIPO=?TIPO ')
    AfterEdit = QMDetMedidasAfterEdit
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
    Left = 32
    Top = 80
    object QMDetMedidasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetMedidasESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMDetMedidasLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMDetMedidasLINEA_TAREA: TIntegerField
      DisplayLabel = 'Lin. Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMDetMedidasTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      OnGetText = QMDetMedidasTAREAGetText
      Size = 60
    end
    object QMDetMedidasORDEN: TIntegerField
      DisplayLabel = 'Orden'
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
      DisplayLabel = 'Cant.'
      FieldName = 'CANTIDAD'
    end
    object QMDetMedidasPRE_COS_UNI: TFloatField
      DisplayLabel = 'Pre. Cos. Unit.'
      FieldName = 'PRE_COS_UNI'
    end
    object QMDetMedidasTOTAL_VAR: TFloatField
      DisplayLabel = 'Total Var.'
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
      DisplayLabel = 'Act. Rec.'
      FieldName = 'ACTUALIZA_REC'
    end
    object QMDetMedidasID_UTILLAJES: TFIBStringField
      DisplayLabel = 'ID Utillajes'
      FieldName = 'ID_UTILLAJES'
      Size = 10
    end
    object QMDetMedidasDESC_UTILLAJE: TFIBStringField
      DisplayLabel = 'Descripcion Utillajes'
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
      DisplayLabel = 'Oper. Num.'
      FieldName = 'OPERACIONES_NUM'
    end
    object QMDetMedidasOPERACIONES_TIEMPO: TIntegerField
      DisplayLabel = 'Oper. Tiempo'
      FieldName = 'OPERACIONES_TIEMPO'
    end
    object QMDetMedidasTraspasar: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Traspasar'
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
      DisplayLabel = 'Result. Form.'
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
    end
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
    Left = 32
    Top = 176
    object QBuscarMarcatsTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
  end
  object DSEscandallo: TDataSource
    DataSet = QEscandallo
    Left = 120
    Top = 128
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
    Left = 32
    Top = 128
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
end
