object DMDespiece: TDMDespiece
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 595
  Top = 228
  Height = 484
  Width = 461
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 288
    Top = 8
  end
  object QMDespieceCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DESPIECE_CAB'
      'WHERE'
      '  ID_DESPIECE_CAB=?old_ID_DESPIECE_CAB ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DESPIECE_CAB'
      '  (ID_DESPIECE_CAB,'
      
        'MODELO,LONA_LAMA,MOTOR,ENTRADA,TOTAL_COMPONENTES,TOTAL_TAREAS,TO' +
        'TAL_COSTE,PRECIO_VENTA,MARGEN,COLOR,'
      
        'ESCANDALLO,TOTAL_VENTA,TOTAL,ESTADO,EMPRESA,EJERCICIO,CANAL,SERI' +
        'ES,ID_ORDEN,ID_ORIGEN,'
      
        'ID_DETALLE,TIPO_ORIGEN,TIPO_MOTOR,TIPO_MEDIDA,CAJON,GUIA,CANTIDA' +
        'D,NOTAS,TIPO_LONA,ARTICULO,'
      
        'TITULO,FECHA,USUARIO,ENTRADA_AGRUPACION,MEDIDA_1,MEDIDA_2,MEDIDA' +
        '_3,MEDIDA_4,MEDIDA_1_MODELO,MEDIDA_2_MODELO,'
      
        'SU_REFERENCIA,MANIVELA,P_MARGEN_MAT,P_MARGEN_TAR,TITULO_LONA_LAM' +
        'A,CANTIDAD_DESPIECE,ID_IMAGEN,LONA_ATRAVESADA,'
      
        'TITULO_MODELO,TOTAL_PESO,TOTAL_HORAS,INC_CORTE_LONA,DESCUENTO,P_' +
        'MARGEN_P_COSTE,CLIENTE,TARIFA_TYC,TIPO_RULINAS,'
      
        'LINEA_PALILLOS_CON_TAPAS,PORTERIA_CON_JUEGO_CODOS,LADO_INCLINACI' +
        'ON,TIPO_MOTORIZACION,TERCERA_GUIA,'
      
        'SEGUNDO_TIRO_CUERDA,CORTINA_PARTIDA,BAMBALINA_ADICIONAL,VENTANA,' +
        'TIPO_CRISTAL_VENTANA,TIPO_CONFECCION_LONA,'
      'UBICACION_ETIQUETA,TIPO_GAJO_EXTENDIDO,REGULACION_COFRE)'
      'VALUES'
      
        '  (?ID_DESPIECE_CAB,?MODELO,?LONA_LAMA,?MOTOR,?ENTRADA,?TOTAL_CO' +
        'MPONENTES,?TOTAL_TAREAS,?TOTAL_COSTE,?PRECIO_VENTA,'
      
        '?MARGEN,?COLOR,?ESCANDALLO,?TOTAL_VENTA,?TOTAL,?ESTADO,?EMPRESA,' +
        '?EJERCICIO,?CANAL,?SERIES,?ID_ORDEN,?ID_ORIGEN,'
      
        '?ID_DETALLE,?TIPO_ORIGEN,?TIPO_MOTOR,?TIPO_MEDIDA,?CAJON,?GUIA,?' +
        'CANTIDAD,?NOTAS,?TIPO_LONA,?ARTICULO,?TITULO,'
      
        '?FECHA,?USUARIO,?ENTRADA_AGRUPACION,?MEDIDA_1,?MEDIDA_2,?MEDIDA_' +
        '3,?MEDIDA_4,?MEDIDA_1_MODELO,?MEDIDA_2_MODELO,'
      
        '?SU_REFERENCIA,?MANIVELA,?P_MARGEN_MAT,?P_MARGEN_TAR,?TITULO_LON' +
        'A_LAMA,?CANTIDAD_DESPIECE,?ID_IMAGEN,?LONA_ATRAVESADA,'
      
        '?TITULO_MODELO,?TOTAL_PESO,?TOTAL_HORAS,?INC_CORTE_LONA,?DESCUEN' +
        'TO,?P_MARGEN_P_COSTE,?CLIENTE,?TARIFA_TYC,?TIPO_RULINAS,'
      
        '?LINEA_PALILLOS_CON_TAPAS,?PORTERIA_CON_JUEGO_CODOS,?LADO_INCLIN' +
        'ACION,?TIPO_MOTORIZACION,?TERCERA_GUIA,'
      
        '?SEGUNDO_TIRO_CUERDA,?CORTINA_PARTIDA,?BAMBALINA_ADICIONAL,?VENT' +
        'ANA,?TIPO_CRISTAL_VENTANA,?TIPO_CONFECCION_LONA,'
      '?UBICACION_ETIQUETA,?TIPO_GAJO_EXTENDIDO,?REGULACION_COFRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DESPIECE_CAB'
      'WHERE'
      '  ID_DESPIECE_CAB=?ID_DESPIECE_CAB ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DESPIECE_CAB'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID_DESPIECE_CAB')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DESPIECE_CAB  '
      'SET  '
      '  MODELO=?MODELO  '
      '  ,LONA_LAMA=?LONA_LAMA  '
      '  ,MOTOR=?MOTOR  '
      '  ,ENTRADA=?ENTRADA  '
      '  ,TOTAL_COMPONENTES=?TOTAL_COMPONENTES  '
      '  ,TOTAL_TAREAS=?TOTAL_TAREAS  '
      '  ,TOTAL_COSTE=?TOTAL_COSTE  '
      '  ,PRECIO_VENTA=?PRECIO_VENTA  '
      '  ,MARGEN=?MARGEN  '
      '  ,COLOR=?COLOR  '
      '  ,ESCANDALLO=?ESCANDALLO  '
      '  ,TOTAL_VENTA=?TOTAL_VENTA  '
      '  ,TOTAL=?TOTAL  '
      '  ,ESTADO=?ESTADO  '
      '  ,EMPRESA=?EMPRESA  '
      '  ,EJERCICIO=?EJERCICIO  '
      '  ,CANAL=?CANAL  '
      '  ,SERIES=?SERIES  '
      '  ,ID_ORDEN=?ID_ORDEN  '
      '  ,ID_ORIGEN=?ID_ORIGEN  '
      '  ,ID_DETALLE=?ID_DETALLE  '
      '  ,TIPO_ORIGEN=?TIPO_ORIGEN  '
      '  ,TIPO_MOTOR=?TIPO_MOTOR  '
      '  ,TIPO_MEDIDA=?TIPO_MEDIDA  '
      '  ,CAJON=?CAJON  '
      '  ,GUIA=?GUIA  '
      '  ,CANTIDAD=?CANTIDAD  '
      '  ,NOTAS=?NOTAS  '
      '  ,TIPO_LONA=?TIPO_LONA  '
      '  ,ARTICULO=?ARTICULO  '
      '  ,TITULO=?TITULO  '
      '  ,FECHA=?FECHA  '
      '  ,USUARIO=?USUARIO  '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION  '
      '  ,MEDIDA_1=?MEDIDA_1  '
      '  ,MEDIDA_2=?MEDIDA_2  '
      '  ,MEDIDA_3=?MEDIDA_3  '
      '  ,MEDIDA_4=?MEDIDA_4  '
      '  ,MEDIDA_1_MODELO=?MEDIDA_1_MODELO  '
      '  ,MEDIDA_2_MODELO=?MEDIDA_2_MODELO  '
      '  ,SU_REFERENCIA=?SU_REFERENCIA  '
      '  ,MANIVELA=?MANIVELA  '
      '  ,P_MARGEN_MAT=?P_MARGEN_MAT  '
      '  ,P_MARGEN_TAR=?P_MARGEN_TAR  '
      '  ,TITULO_LONA_LAMA=?TITULO_LONA_LAMA  '
      '  ,CANTIDAD_DESPIECE=?CANTIDAD_DESPIECE  '
      '  ,ID_IMAGEN=?ID_IMAGEN  '
      '  ,LONA_ATRAVESADA=?LONA_ATRAVESADA  '
      '  ,TITULO_MODELO=?TITULO_MODELO  '
      '  ,TOTAL_PESO=?TOTAL_PESO  '
      '  ,TOTAL_HORAS=?TOTAL_HORAS  '
      '  ,INC_CORTE_LONA=?INC_CORTE_LONA  '
      '  ,DESCUENTO=?DESCUENTO  '
      '  ,P_MARGEN_P_COSTE=?P_MARGEN_P_COSTE  '
      '  ,CLIENTE=?CLIENTE  '
      '  ,TARIFA_TYC=?TARIFA_TYC  '
      '  ,TIPO_RULINAS=?TIPO_RULINAS  '
      '  ,LINEA_PALILLOS_CON_TAPAS=?LINEA_PALILLOS_CON_TAPAS  '
      '  ,PORTERIA_CON_JUEGO_CODOS=?PORTERIA_CON_JUEGO_CODOS  '
      '  ,LADO_INCLINACION=?LADO_INCLINACION  '
      '  ,TIPO_MOTORIZACION=?TIPO_MOTORIZACION  '
      '  ,TERCERA_GUIA=?TERCERA_GUIA  '
      '  ,SEGUNDO_TIRO_CUERDA=?SEGUNDO_TIRO_CUERDA  '
      '  ,CORTINA_PARTIDA=?CORTINA_PARTIDA  '
      ' ,BAMBALINA_ADICIONAL=?BAMBALINA_ADICIONAL'
      ' ,VENTANA=?VENTANA'
      ' ,TIPO_CRISTAL_VENTANA=?TIPO_CRISTAL_VENTANA'
      ' ,TIPO_CONFECCION_LONA=?TIPO_CONFECCION_LONA'
      ' ,UBICACION_ETIQUETA=?UBICACION_ETIQUETA'
      ' ,TIPO_GAJO_EXTENDIDO=?TIPO_GAJO_EXTENDIDO'
      ' ,REGULACION_COFRE=?REGULACION_COFRE '
      'WHERE  '
      '  ID_DESPIECE_CAB=?ID_DESPIECE_CAB  ')
    AutoCalcFields = False
    AfterOpen = QMDespieceCabAfterOpen
    AfterPost = QMDespieceCabAfterPost
    BeforeClose = QMDespieceCabBeforeClose
    BeforeEdit = AntesDeEditar
    BeforePost = QMDespieceCabBeforePost
    OnCalcFields = QMDespieceCabCalcFields
    OnNewRecord = QMDespieceCabNewRecord
    ClavesPrimarias.Strings = (
      'ID_DESPIECE_CAB ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DESPIECE_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMDespieceCabID_DESPIECE_CAB: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_DESPIECE_CAB'
    end
    object QMDespieceCabMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      OnChange = QMDespieceCabMODELOChange
      Size = 5
    end
    object QMDespieceCabMEDIDA_1: TFloatField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'MEDIDA_1'
      OnChange = QMDespieceCabMEDIDA_1Change
    end
    object QMDespieceCabMEDIDA_2: TFloatField
      DisplayLabel = 'Salida'
      FieldName = 'MEDIDA_2'
      OnChange = QMDespieceCabMEDIDA_2Change
    end
    object QMDespieceCabENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDespieceCabTOTAL_COMPONENTES: TFloatField
      DisplayLabel = 'Total Comp.'
      FieldName = 'TOTAL_COMPONENTES'
    end
    object QMDespieceCabTOTAL_TAREAS: TFloatField
      DisplayLabel = 'Total Tareas'
      FieldName = 'TOTAL_TAREAS'
    end
    object QMDespieceCabTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMDespieceCabPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMDespieceCabMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMDespieceCabLONA_LAMA: TFIBStringField
      DisplayLabel = 'Lona/Lama'
      FieldName = 'LONA_LAMA'
      Size = 15
    end
    object QMDespieceCabCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 2
    end
    object QMDespieceCabMOTOR: TIntegerField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
    end
    object QMDespieceCabESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMDespieceCabMEDIDA_1_MODELO: TFloatField
      DisplayLabel = 'L'#237'n. Modelo'
      FieldName = 'MEDIDA_1_MODELO'
    end
    object QMDespieceCabMEDIDA_2_MODELO: TFloatField
      DisplayLabel = 'Salida Mod.'
      FieldName = 'MEDIDA_2_MODELO'
    end
    object QMDespieceCabTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object QMDespieceCabTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMDespieceCabESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDespieceCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDespieceCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDespieceCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDespieceCabSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMDespieceCabID_ORDEN: TIntegerField
      DisplayLabel = 'Id. Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDespieceCabID_ORIGEN: TIntegerField
      DisplayLabel = 'Id. Origen'
      FieldName = 'ID_ORIGEN'
    end
    object QMDespieceCabID_DETALLE: TIntegerField
      DisplayLabel = 'Id. Detalle'
      FieldName = 'ID_DETALLE'
    end
    object QMDespieceCabTIPO_ORIGEN: TFIBStringField
      DisplayLabel = 'Tipo Orden'
      FieldName = 'TIPO_ORIGEN'
      Size = 3
    end
    object QMDespieceCabTIPO_MOTOR: TFIBStringField
      DisplayLabel = 'Tipo Motor'
      FieldName = 'TIPO_MOTOR'
      Size = 15
    end
    object QMDespieceCabTIPO_MEDIDA: TIntegerField
      DisplayLabel = 'Tipo Medida'
      FieldName = 'TIPO_MEDIDA'
    end
    object QMDespieceCabCAJON: TFIBStringField
      DisplayLabel = 'Cajon'
      FieldName = 'CAJON'
      Size = 15
    end
    object QMDespieceCabGUIA: TFIBStringField
      DisplayLabel = 'Guia'
      FieldName = 'GUIA'
      Size = 15
    end
    object QMDespieceCabCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      OnChange = QMDespieceCabCANTIDADChange
    end
    object QMDespieceCabDESC_ESCANDALLO: TStringField
      DisplayLabel = 'Desc. Esc.'
      FieldKind = fkCalculated
      FieldName = 'DESC_ESCANDALLO'
      Size = 60
      Calculated = True
    end
    object QMDespieceCabNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDespieceCabTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMDespieceCabDOC_ORIGEN: TStringField
      FieldKind = fkCalculated
      FieldName = 'DOC_ORIGEN'
      Size = 30
      Calculated = True
    end
    object QMDespieceCabTIPO_LONA: TFIBStringField
      DisplayLabel = 'Tipo Lona'
      FieldName = 'TIPO_LONA'
      OnChange = QMDespieceCabTIPO_LONAChange
      Size = 3
    end
    object QMDespieceCabTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnChange = QMDespieceCabTITULOChange
      Size = 60
    end
    object QMDespieceCabARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMDespieceCabARTICULO_SEGUN_MEDIDASChange
      Size = 15
    end
    object QMDespieceCabFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QMDespieceCabUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object QMDespieceCabENTRADA_AGRUPACION: TIntegerField
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMDespieceCabMEDIDA_3: TFloatField
      FieldName = 'MEDIDA_3'
    end
    object QMDespieceCabMEDIDA_4: TFloatField
      FieldName = 'MEDIDA_4'
    end
    object QMDespieceCabSU_REFERENCIA: TFIBStringField
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMDespieceCabMANIVELA: TFIBStringField
      FieldName = 'MANIVELA'
      Size = 15
    end
    object QMDespieceCabP_MARGEN_MAT: TFloatField
      DisplayLabel = '% Margen Materiales'
      FieldName = 'P_MARGEN_MAT'
    end
    object QMDespieceCabP_MARGEN_TAR: TFloatField
      DisplayLabel = '% Margen Tareas'
      FieldName = 'P_MARGEN_TAR'
    end
    object QMDespieceCabID_IMAGEN: TIntegerField
      DisplayLabel = 'ID Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object QMDespieceCabTOTAL_PESO: TFloatField
      DisplayLabel = 'Total Peso'
      FieldName = 'TOTAL_PESO'
    end
    object QMDespieceCabTOTAL_HORAS: TFloatField
      DisplayLabel = 'Total Horas'
      FieldName = 'TOTAL_HORAS'
    end
    object QMDespieceCabPRECIO_UNITARIO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRECIO_UNITARIO'
      DisplayFormat = 'Precio Unit.'
      Calculated = True
    end
    object QMDespieceCabP_MARGEN_P_COSTE: TFloatField
      DisplayLabel = 'Margen Total Costo'
      FieldName = 'P_MARGEN_P_COSTE'
    end
    object QMDespieceCabTITULO_LONA_LAMA: TFIBStringField
      DisplayLabel = 'T'#237'tulo lona lama'
      FieldName = 'TITULO_LONA_LAMA'
      Size = 256
    end
    object QMDespieceCabCANTIDAD_DESPIECE: TFloatField
      DisplayLabel = 'Cantidad despiece'
      FieldName = 'CANTIDAD_DESPIECE'
    end
    object QMDespieceCabLONA_ATRAVESADA: TIntegerField
      DisplayLabel = 'Lona atravesada'
      FieldName = 'LONA_ATRAVESADA'
    end
    object QMDespieceCabTITULO_MODELO: TFIBStringField
      DisplayLabel = 'T'#237'tulo modelo'
      FieldName = 'TITULO_MODELO'
      Size = 60
    end
    object QMDespieceCabINC_CORTE_LONA: TFloatField
      DisplayLabel = 'INC corte lona'
      FieldName = 'INC_CORTE_LONA'
    end
    object QMDespieceCabDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object QMDespieceCabCLIENTE: TIntegerField
      DisplayLabel = 'CLiente'
      FieldName = 'CLIENTE'
    end
    object QMDespieceCabTARIFA_TYC: TFIBStringField
      DisplayLabel = 'Tarifa TYC'
      FieldName = 'TARIFA_TYC'
      Size = 3
    end
    object QMDespieceCabLINEA_PALILLOS_CON_TAPAS: TFloatField
      DisplayLabel = 'Linea palillos con tapa'
      FieldName = 'LINEA_PALILLOS_CON_TAPAS'
    end
    object QMDespieceCabPORTERIA_CON_JUEGO_CODOS: TIntegerField
      DisplayLabel = 'Porteria con juego codos'
      FieldName = 'PORTERIA_CON_JUEGO_CODOS'
    end
    object QMDespieceCabLADO_INCLINACION: TFIBStringField
      DisplayLabel = 'Lado Inclinacion'
      FieldName = 'LADO_INCLINACION'
      Size = 3
    end
    object QMDespieceCabTIPO_MOTORIZACION: TFIBStringField
      DisplayLabel = 'Tipo Motorizacion'
      FieldName = 'TIPO_MOTORIZACION'
      Size = 3
    end
    object QMDespieceCabTERCERA_GUIA: TIntegerField
      DisplayLabel = 'Tercera guia'
      FieldName = 'TERCERA_GUIA'
    end
    object QMDespieceCabSEGUNDO_TIRO_CUERDA: TIntegerField
      DisplayLabel = 'Segundo Tiro cuerda'
      FieldName = 'SEGUNDO_TIRO_CUERDA'
    end
    object QMDespieceCabTIPO_RULINAS: TFIBStringField
      DisplayLabel = 'Tipo Rulinas'
      FieldName = 'TIPO_RULINAS'
      Size = 3
    end
    object QMDespieceCabCORTINA_PARTIDA: TIntegerField
      DisplayLabel = 'Cortina Partida'
      FieldName = 'CORTINA_PARTIDA'
    end
    object QMDespieceCabBAMBALINA_ADICIONAL: TIntegerField
      DisplayLabel = 'Bambaliona Adicional'
      FieldName = 'BAMBALINA_ADICIONAL'
    end
    object QMDespieceCabVENTANA: TIntegerField
      DisplayLabel = 'Ventana'
      FieldName = 'VENTANA'
    end
    object QMDespieceCabTIPO_CRISTAL_VENTANA: TFIBStringField
      DisplayLabel = 'Tipo Cristal Ventana'
      FieldName = 'TIPO_CRISTAL_VENTANA'
      Size = 3
    end
    object QMDespieceCabTIPO_CONFECCION_LONA: TFIBStringField
      DisplayLabel = 'Tipo Confeccion Lona'
      FieldName = 'TIPO_CONFECCION_LONA'
      Size = 3
    end
    object QMDespieceCabUBICACION_ETIQUETA: TFIBStringField
      DisplayLabel = 'Ubicacion Etiqueta'
      FieldName = 'UBICACION_ETIQUETA'
      Size = 3
    end
    object QMDespieceCabTIPO_GAJO_EXTENDIDO: TFIBStringField
      DisplayLabel = 'Tipo Gajo Extendido'
      FieldName = 'TIPO_GAJO_EXTENDIDO'
      Size = 3
    end
    object QMDespieceCabREGULACION_COFRE: TFIBStringField
      FieldName = 'REGULACION_COFRE'
      Size = 3
    end
  end
  object QMDespieceCom: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DESPIECE_DET_COMPONENTE'
      'WHERE'
      '  ID_DESPIECE_DET=?old_ID_DESPIECE_DET ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DESPIECE_DET_COMPONENTE'
      
        '  (UNIDADES_ART,CANTIDAD,PRECIO,TOTAL,CORTE_MEDIDA1,CORTE_MEDIDA' +
        '2,CORTE_MEDIDA3,CORTE_MEDIDA4,NOTAS,TOTAL_FABRICACION,CANTIDAD_F' +
        'ABRICACION,ID_DESPIECE_CAB,ID_DESPIECE_DET,FORMULA,FASE,LACADO,C' +
        'ORTE,LINEA_FASE,TITULO,ASIGNAR_A_ORDEN,COMPONENTE,TIPO_FASE,FACT' +
        'OR,NO_MULTIPLICAR_CABECERA)'
      'VALUES'
      
        '  (?UNIDADES_ART,?CANTIDAD,?PRECIO,?TOTAL,?CORTE_MEDIDA1,?CORTE_' +
        'MEDIDA2,?CORTE_MEDIDA3,?CORTE_MEDIDA4,?NOTAS,?TOTAL_FABRICACION,' +
        '?CANTIDAD_FABRICACION,?ID_DESPIECE_CAB,?ID_DESPIECE_DET,?FORMULA' +
        ',?FASE,?LACADO,?CORTE,?LINEA_FASE,?TITULO,?ASIGNAR_A_ORDEN,?COMP' +
        'ONENTE,?TIPO_FASE,?FACTOR,?NO_MULTIPLICAR_CABECERA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DESPIECE_DET_COMPONENTE'
      'WHERE'
      '  ID_DESPIECE_DET=?ID_DESPIECE_DET ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DESPIECE_DET_COMPONENTE'
      'WHERE'
      'ID_DESPIECE_CAB = ?ID_DESPIECE_CAB'
      'ORDER BY ID_DESPIECE_CAB, ID_DESPIECE_DET')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DESPIECE_DET_COMPONENTE'
      'SET'
      '  UNIDADES_ART=?UNIDADES_ART '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRECIO=?PRECIO '
      '  ,TOTAL=?TOTAL '
      '  ,CORTE_MEDIDA1=?CORTE_MEDIDA1 '
      '  ,CORTE_MEDIDA2=?CORTE_MEDIDA2 '
      '  ,CORTE_MEDIDA3=?CORTE_MEDIDA3 '
      '  ,CORTE_MEDIDA4=?CORTE_MEDIDA4 '
      '  ,NOTAS=?NOTAS '
      '  ,TOTAL_FABRICACION=?TOTAL_FABRICACION '
      '  ,CANTIDAD_FABRICACION=?CANTIDAD_FABRICACION '
      '  ,ID_DESPIECE_CAB=?ID_DESPIECE_CAB '
      '  ,FORMULA=?FORMULA '
      '  ,FASE=?FASE '
      '  ,LACADO=?LACADO '
      '  ,CORTE=?CORTE '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,TITULO=?TITULO '
      '  ,ASIGNAR_A_ORDEN=?ASIGNAR_A_ORDEN '
      '  ,COMPONENTE=?COMPONENTE '
      '  ,TIPO_FASE=?TIPO_FASE '
      '  ,FACTOR=?FACTOR '
      '  ,NO_MULTIPLICAR_CABECERA=?NO_MULTIPLICAR_CABECERA'
      'WHERE'
      '  ID_DESPIECE_DET=?ID_DESPIECE_DET ')
    DataSource = DSDespieceCab
    AfterPost = QMDespieceComAfterPost
    BeforeDelete = AntesDeEditar
    BeforeEdit = AntesDeEditar
    BeforeInsert = AntesDeEditar
    BeforePost = QMDespieceComBeforePost
    OnNewRecord = QMDespieceComNewRecord
    ClavesPrimarias.Strings = (
      'ID_DESPIECE_DET ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DESPIECE_DET_COMPONENTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMDespieceComID_DESPIECE_CAB: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_DESPIECE_CAB'
    end
    object QMDespieceComID_DESPIECE_DET: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID_DESPIECE_DET'
    end
    object QMDespieceComFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      OnGetText = QMDespieceComFASEGetText
      Size = 60
    end
    object QMDespieceComCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMDespieceComCOMPONENTEChange
      Size = 15
    end
    object QMDespieceComUNIDADES_ART: TFIBStringField
      DisplayLabel = 'Ud. Art.'
      FieldName = 'UNIDADES_ART'
      Size = 2
    end
    object QMDespieceComCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDespieceComPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDespieceComTOTAL: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'TOTAL'
    end
    object QMDespieceComLACADO: TFIBStringField
      DisplayLabel = 'Lacado'
      FieldName = 'LACADO'
      Size = 2
    end
    object QMDespieceComFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
    object QMDespieceComLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea fase'
      FieldName = 'LINEA_FASE'
    end
    object QMDespieceComTIPO_FASE: TFIBStringField
      DisplayLabel = 'Tipo fase'
      FieldName = 'TIPO_FASE'
      OnChange = QMDespieceComTIPO_FASEChange
      Size = 3
    end
    object QMDespieceComCORTE: TIntegerField
      DisplayLabel = 'Corte'
      FieldName = 'CORTE'
    end
    object QMDespieceComCORTE_MEDIDA1: TFloatField
      DisplayLabel = 'Corte Med. 1'
      FieldName = 'CORTE_MEDIDA1'
    end
    object QMDespieceComCORTE_MEDIDA2: TFloatField
      DisplayLabel = 'Corte Med. 2'
      FieldName = 'CORTE_MEDIDA2'
    end
    object QMDespieceComCORTE_MEDIDA3: TFloatField
      DisplayLabel = 'Corte Med. 3'
      FieldName = 'CORTE_MEDIDA3'
    end
    object QMDespieceComCORTE_MEDIDA4: TFloatField
      DisplayLabel = 'Corte Med. 4'
      FieldName = 'CORTE_MEDIDA4'
    end
    object QMDespieceComDescFormula: TStringField
      DisplayLabel = 'Desc. Formula'
      FieldKind = fkCalculated
      FieldName = 'DescFormula'
      OnGetText = QMDespieceComDescFormulaGetText
      Size = 25
      Calculated = True
    end
    object QMDespieceComNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDespieceComTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDespieceComTOTAL_FABRICACION: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'TOTAL_FABRICACION'
    end
    object QMDespieceComCANTIDAD_FABRICACION: TFloatField
      DisplayLabel = 'Cant. Total'
      FieldName = 'CANTIDAD_FABRICACION'
    end
    object QMDespieceComASIGNAR_A_ORDEN: TIntegerField
      DisplayLabel = 'Asignar a Orden'
      FieldName = 'ASIGNAR_A_ORDEN'
    end
    object QMDespieceComFACTOR: TFloatField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
    end
    object QMDespieceComNO_MULTIPLICAR_CABECERA: TIntegerField
      DisplayLabel = 'No Multiplicar'
      FieldName = 'NO_MULTIPLICAR_CABECERA'
    end
  end
  object QMDespieceTar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DESPIECE_DET_TAREA'
      'WHERE'
      '  ID_DESPIECE_TAREA=?old_ID_DESPIECE_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DESPIECE_DET_TAREA'
      
        '  (ID_DESPIECE_CAB,ID_DESPIECE_TAREA,FASE,TIPO_TAREA,RECURSO,FOR' +
        'MULA,TIEMPO,PRECIO_RECURSO,TOTAL,TIPO_FASE,NOTAS,SECCION)'
      'VALUES'
      
        '  (?ID_DESPIECE_CAB,?ID_DESPIECE_TAREA,?FASE,?TIPO_TAREA,?RECURS' +
        'O,?FORMULA,?TIEMPO,?PRECIO_RECURSO,?TOTAL,?TIPO_FASE,?NOTAS,?SEC' +
        'CION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DESPIECE_DET_TAREA'
      'WHERE'
      '  ID_DESPIECE_TAREA=?ID_DESPIECE_TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DESPIECE_DET_TAREA'
      'WHERE'
      'ID_DESPIECE_CAB = ?ID_DESPIECE_CAB'
      'ORDER BY ID_DESPIECE_CAB, ID_DESPIECE_TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DESPIECE_DET_TAREA'
      'SET'
      '  ID_DESPIECE_CAB=?ID_DESPIECE_CAB '
      '  ,FASE=?FASE '
      '  ,TIPO_TAREA=?TIPO_TAREA '
      '  ,RECURSO=?RECURSO '
      '  ,FORMULA=?FORMULA '
      '  ,TIEMPO=?TIEMPO '
      '  ,PRECIO_RECURSO=?PRECIO_RECURSO '
      '  ,TOTAL=?TOTAL '
      '  ,TIPO_FASE=?TIPO_FASE'
      '  ,NOTAS=?NOTAS'
      '  ,SECCION=?SECCION'
      'WHERE'
      '  ID_DESPIECE_TAREA=?ID_DESPIECE_TAREA ')
    DataSource = DSDespieceCab
    AfterPost = QMDespieceTarAfterPost
    BeforeDelete = AntesDeEditar
    BeforeEdit = AntesDeEditar
    BeforeInsert = AntesDeEditar
    BeforePost = QMDespieceTarBeforePost
    OnNewRecord = QMDespieceTarNewRecord
    ClavesPrimarias.Strings = (
      'ID_DESPIECE_TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DESPIECE_DET_TAREA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMDespieceTarID_DESPIECE_CAB: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_DESPIECE_CAB'
      Visible = False
    end
    object QMDespieceTarID_DESPIECE_TAREA: TIntegerField
      DisplayLabel = 'Id Tarea'
      FieldName = 'ID_DESPIECE_TAREA'
      Visible = False
    end
    object QMDespieceTarTIPO_FASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPO_FASE'
      OnChange = QMDespieceTarTIPO_FASEChange
      Size = 3
    end
    object QMDespieceTarFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object QMDespieceTarTIPO_TAREA: TFIBStringField
      DisplayLabel = 'Tipo tarea'
      FieldName = 'TIPO_TAREA'
      Size = 3
    end
    object QMDespieceTarRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMDespieceTarFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
    object QMDespieceTarTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMDespieceTarPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO_RECURSO'
    end
    object QMDespieceTarTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMDespieceTarLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea fase'
      FieldName = 'LINEA_FASE'
    end
    object QMDespieceTarDescFormula: TStringField
      DisplayLabel = 'Desc. Formula'
      FieldKind = fkCalculated
      FieldName = 'DescFormula'
      OnGetText = QMDespieceTarDescFormulaGetText
      Size = 25
      Calculated = True
    end
    object QMDespieceTarDescTarea: TStringField
      DisplayLabel = 'Desc. Tarea'
      FieldKind = fkCalculated
      FieldName = 'DescTarea'
      OnGetText = QMDespieceTarDescTareaGetText
      Size = 40
      Calculated = True
    end
    object QMDespieceTarDescRecurso: TStringField
      DisplayLabel = 'Desc. Recurso'
      FieldKind = fkCalculated
      FieldName = 'DescRecurso'
      OnGetText = QMDespieceTarDescRecursoGetText
      Size = 40
      Calculated = True
    end
    object QMDespieceTarNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDespieceTarSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMDespieceTarTOTAL_FABRICACION: TFloatField
      DisplayLabel = 'Total Fab.'
      FieldName = 'TOTAL_FABRICACION'
    end
    object QMDespieceTarTIEMPO_FABRICACION: TFloatField
      DisplayLabel = 'Tiempo Fab.'
      FieldName = 'TIEMPO_FABRICACION'
    end
  end
  object DSDespieceCab: TDataSource
    DataSet = QMDespieceCab
    Left = 176
    Top = 8
  end
  object DSDespieceCom: TDataSource
    DataSet = QMDespieceCom
    Left = 176
    Top = 56
  end
  object DSDespieceTar: TDataSource
    DataSet = QMDespieceTar
    Left = 176
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 288
    Top = 56
  end
  object QMDespieceSFGDatos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DESPIECE_CFG_DATOS'
      'WHERE'
      '  CAMPO=?old_CAMPO AND '
      '  SUBTIPO=?old_SUBTIPO AND '
      '  TIPO=?old_TIPO AND '
      '  ID_DESPIECE_CAB=?old_ID_DESPIECE_CAB ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DESPIECE_CFG_DATOS'
      
        '  (ID_DESPIECE_CAB,TIPO,SUBTIPO,CAMPO,VISIBLE,ORDEN,VALOR_STR,VA' +
        'LOR_FLOAT,VALOR_INT)'
      'VALUES'
      
        '  (?ID_DESPIECE_CAB,?TIPO,?SUBTIPO,?CAMPO,?VISIBLE,?ORDEN,?VALOR' +
        '_STR,?VALOR_FLOAT,?VALOR_INT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DESPIECE_CFG_DATOS'
      'WHERE'
      '  CAMPO=?CAMPO AND '
      '  SUBTIPO=?SUBTIPO AND '
      '  TIPO=?TIPO AND '
      '  ID_DESPIECE_CAB=?ID_DESPIECE_CAB ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DESPIECE_CFG_DATOS'
      'WHERE'
      '  ID_DESPIECE_CAB=?ID_DESPIECE_CAB AND'
      '  VISIBLE = 1'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DESPIECE_CFG_DATOS'
      'SET'
      '  VISIBLE=?VISIBLE '
      '  ,ORDEN=?ORDEN '
      '  ,VALOR_STR=?VALOR_STR '
      '  ,VALOR_FLOAT=?VALOR_FLOAT '
      '  ,VALOR_INT=?VALOR_INT '
      'WHERE'
      '  CAMPO=?CAMPO AND '
      '  SUBTIPO=?SUBTIPO AND '
      '  TIPO=?TIPO AND '
      '  ID_DESPIECE_CAB=?ID_DESPIECE_CAB ')
    DataSource = DSDespieceCab
    ClavesPrimarias.Strings = (
      'CAMPO '
      'SUBTIPO '
      'TIPO '
      'ID_DESPIECE_CAB ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DESPIECE_CFG_DATOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object QMDespieceSFGDatosID_DESPIECE_CAB: TIntegerField
      DisplayLabel = 'Id Despiece'
      FieldName = 'ID_DESPIECE_CAB'
    end
    object QMDespieceSFGDatosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMDespieceSFGDatosSUBTIPO: TIntegerField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO'
    end
    object QMDespieceSFGDatosCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 31
    end
    object QMDespieceSFGDatosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMDespieceSFGDatosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDespieceSFGDatosVALOR_STR: TFIBStringField
      DisplayLabel = 'Valor Txt'
      FieldName = 'VALOR_STR'
      Size = 100
    end
    object QMDespieceSFGDatosVALOR_FLOAT: TFloatField
      DisplayLabel = 'Valor Dec.'
      FieldName = 'VALOR_FLOAT'
    end
    object QMDespieceSFGDatosVALOR_INT: TIntegerField
      DisplayLabel = 'Valor Num.'
      FieldName = 'VALOR_INT'
    end
  end
  object DSQMDespieceSFGDatos: TDataSource
    DataSet = QMDespieceSFGDatos
    Left = 176
    Top = 152
  end
end
