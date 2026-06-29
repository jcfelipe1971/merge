object DMPropuestas: TDMPropuestas
  OldCreateOrder = False
  OnCreate = DMDocsPropProvCreate
  OnDestroy = DataModuleDestroy
  Left = 570
  Top = 170
  Height = 577
  Width = 734
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_OFP'
      'WHERE'
      '  ID_DETALLES_E=?old_ID_DETALLES_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_OFP'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ALMACEN,ARTICU' +
        'LO,TITULO,UNIDADES,'#13#10'PRECIO,DESCUENTO,DESCUENTO_2,DESCUENTO_3,P_' +
        'COSTE,PAIS,TIPO_IVA,P_IVA,P_RECARGO,BRUTO,'#13#10'I_DESCUENTO,B_IMPONI' +
        'BLE,ENTRADA,UNIDADES_EXT,'#13#10'NOTAS,ID_A,ID_C_A,ID_E,ID_DETALLES_E,' +
        'ORDEN,UNIDADES_SEC,APLICA_UNIDADES_SECUNDARIAS,PROYECTO,FECHA_PR' +
        'E_DET,'#13#10'PLAZO_ENTREGA_DET,NOTAS2,CRC_NOTAS,CRC_NOTAS2,TIPO_UNIDA' +
        'D_LOGISTICA,TITULO_UNIDAD_LOGISTICA,UNIDADES_LOGISTICAS,ALFA_1,A' +
        'LFA_2,ALFA_3,'#13#10'ALFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,INVERSION_SUJE' +
        'TO_PASIVO,DECIMALES_UNIDADES,TIPO_IMPUESTO_ADICIONAL,P_IMPUESTO_' +
        'ADICIONAL,PESO,'#13#10'PESO_TOTAL,PESO_REAL,PRO_NUM_PLANO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ALMACE' +
        'N,?ARTICULO,?TITULO,?UNIDADES,'#13#10'?PRECIO,?DESCUENTO,?DESCUENTO_2,' +
        '?DESCUENTO_3,?P_COSTE,?PAIS,?TIPO_IVA,?P_IVA,?P_RECARGO,?BRUTO,'#13 +
        #10'?I_DESCUENTO,?B_IMPONIBLE,?ENTRADA,?UNIDADES_EXT,'#13#10'?NOTAS,?ID_A' +
        ',?ID_C_A,?ID_E,?ID_DETALLES_E,?ORDEN,?UNIDADES_SEC,?APLICA_UNIDA' +
        'DES_SECUNDARIAS,?PROYECTO,?FECHA_PRE_DET,'#13#10'?PLAZO_ENTREGA_DET,?N' +
        'OTAS2,?CRC_NOTAS,?CRC_NOTAS2,?TIPO_UNIDAD_LOGISTICA,?TITULO_UNID' +
        'AD_LOGISTICA,?UNIDADES_LOGISTICAS,?ALFA_1,?ALFA_2,?ALFA_3,'#13#10'?ALF' +
        'A_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?INVERSION_SUJETO_PASIVO,?DE' +
        'CIMALES_UNIDADES,?TIPO_IMPUESTO_ADICIONAL,?P_IMPUESTO_ADICIONAL,' +
        '?PESO,'#13#10'?PESO_TOTAL,?PESO_REAL,?PRO_NUM_PLANO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_OFP'
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_OFP'
      'WHERE'
      'ID_E = ?ID_E'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_OFP'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,P_COSTE=?P_COSTE '
      '  ,PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,BRUTO=?BRUTO '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,NOTAS=?NOTAS '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_E=?ID_E '
      '  ,ORDEN=?ORDEN '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET '
      '  ,PLAZO_ENTREGA_DET=?PLAZO_ENTREGA_DET '
      '  ,NOTAS2=?NOTAS2 '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,DECIMALES_UNIDADES=?DECIMALES_UNIDADES '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,P_IMPUESTO_ADICIONAL=?P_IMPUESTO_ADICIONAL '
      '  ,PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,PESO_REAL=?PESO_REAL '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    DataSource = DSCabecera
    AfterDelete = Graba
    AfterOpen = QMDetalleAfterOpen
    AfterPost = Graba
    AfterScroll = QMDetalleAfterScroll
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_E ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_OFP'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_E'
      'GES_DETALLES_E_OFP')
    CamposBloqueo.Strings = (
      'ID_DETALLES_E'
      'ID_DETALLES_E')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 304
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
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      EditMask = '>ccccccccccccccc;0;_'
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
      OnChange = QMDetalleUNIDADESChange
      OnGetText = QMDetalleUNIDADESGetText
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Dto.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
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
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
      OnGetText = QMDetalleUNIDADES_EXTGetText
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'ID E'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det. E.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
      OnGetText = QMDetalleUNIDADES_SECGetText
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev. Entrega'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetallePLAZO_ENTREGA_DET: TIntegerField
      DisplayLabel = 'Plazo Entrega'
      FieldName = 'PLAZO_ENTREGA_DET'
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
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      OnChange = QMDetalleTIPO_UNIDAD_LOGISTICAChange
      Size = 5
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Titulo UL'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Unidades Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
      OnChange = QMDetalleUNIDADES_LOGISTICASChange
    end
    object QMDetalleALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMDetalleALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMDetalleALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMDetalleALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMDetalleALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMDetalleALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMDetalleALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMDetalleALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'ISP'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMDetalleDECIMALES_UNIDADES: TIntegerField
      DisplayLabel = 'Decimales Uds.'
      FieldName = 'DECIMALES_UNIDADES'
    end
    object QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adic.'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMDetalleP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Porc. Imp. Adic.'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
      OnGetText = QMDetallePESOGetText
    end
    object QMDetallePESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
      OnGetText = QMDetallePESO_TOTALGetText
    end
    object QMDetallePESO_REAL: TFloatField
      DisplayLabel = 'Peso Real'
      FieldName = 'PESO_REAL'
      OnChange = QMDetallePESO_REALChange
      OnGetText = QMDetallePESO_REALGetText
    end
    object QMDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Pro. Num. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 136
    Top = 304
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_OFP'
      'WHERE'
      '  ID_E=?old_ID_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_OFP'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',PROVEEDOR,TERCERO,'#13#10'DIRECCION,TITULO,NOTAS,ESTADO,BULTOS,LINEAS' +
        ',BRUTO,I_DTO_LINEAS,S_BASES,S_CUOTA_IVA,'#13#10'S_CUOTA_RE,DTO_PP,DTO_' +
        'CIAL,I_DTO_CIAL,I_DTO_PP,ENTRADA,NOMBRE_COMERCIAL,POR_FINANCIACI' +
        'ON,'#13#10'I_FINANCIACION,FORMA_DE_PAGO,SU_REFERENCIA,ID_E,TIPO_PORTES' +
        ',POR_PORTES,I_PORTES,I_PORTES_CANAL,CAMBIO_FIJO,VALOR_CAMB_FIJO,' +
        #13#10'PROYECTO,FECHA_PRE_CAB,PLAZO_ENTREGA,MODIFICA_DOC,PROCESO_AUTO' +
        ',INVERSION_SUJETO_PASIVO,IMPORTE_MINIMO_PORTE,IMPORTE_ICE_TOTAL,' +
        'S_CUOTA_IMPUESTO_ADICIONAL,'#13#10'S_CUOTA_IMP_ADICIONAL_CANAL,EMPAQUE' +
        'TADO_EMPRESA,DIR_RECOGIDA_MANUAL,DIR_ENTREGA_MANUAL,EQUIPO_RECOG' +
        'IDA,EQUIPO_ENTREGA,MATRICULA_RECOGIDA,MATRICULA_ENTREGA,FECHA_RE' +
        'COGIDA_MANUAL,FECHA_ENTREGA_MANUAL,'#13#10'IDIOMA,ACEPTA_ENTREGA_PARCI' +
        'AL,USUARIO_CREACION,OBSERVACIONES)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?PROVEEDOR,?TERCERO,'#13#10'?DIRECCION,?TITULO,?NOTAS,?ESTAD' +
        'O,?BULTOS,?LINEAS,?BRUTO,?I_DTO_LINEAS,?S_BASES,?S_CUOTA_IVA,'#13#10'?' +
        'S_CUOTA_RE,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?ENTRADA,?NOM' +
        'BRE_COMERCIAL,?POR_FINANCIACION,'#13#10'?I_FINANCIACION,?FORMA_DE_PAGO' +
        ',?SU_REFERENCIA,?ID_E,?TIPO_PORTES,?POR_PORTES,?I_PORTES,?I_PORT' +
        'ES_CANAL,?CAMBIO_FIJO,?VALOR_CAMB_FIJO,'#13#10'?PROYECTO,?FECHA_PRE_CA' +
        'B,?PLAZO_ENTREGA,?MODIFICA_DOC,?PROCESO_AUTO,?INVERSION_SUJETO_P' +
        'ASIVO,?IMPORTE_MINIMO_PORTE,?IMPORTE_ICE_TOTAL,?S_CUOTA_IMPUESTO' +
        '_ADICIONAL,'#13#10'?S_CUOTA_IMP_ADICIONAL_CANAL,?EMPAQUETADO_EMPRESA,?' +
        'DIR_RECOGIDA_MANUAL,?DIR_ENTREGA_MANUAL,?EQUIPO_RECOGIDA,?EQUIPO' +
        '_ENTREGA,?MATRICULA_RECOGIDA,?MATRICULA_ENTREGA,?FECHA_RECOGIDA_' +
        'MANUAL,?FECHA_ENTREGA_MANUAL,'#13#10'?IDIOMA,?ACEPTA_ENTREGA_PARCIAL,?' +
        'USUARIO_CREACION,?OBSERVACIONES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_OFP'
      'WHERE'
      '  ID_E=?ID_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_OFP'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = '#39'OFP'#39' AND '
      
        '(EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO' +
        ' = 0 OR ESTADO=3))) '
      'ORDER BY EJERCICIO, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_OFP'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,ALMACEN=?ALMACEN '
      '  ,MONEDA=?MONEDA '
      '  ,FECHA=?FECHA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,TERCERO=?TERCERO '
      '  ,DIRECCION=?DIRECCION '
      '  ,TITULO=?TITULO '
      '  ,NOTAS=?NOTAS '
      '  ,ESTADO=?ESTADO '
      '  ,BULTOS=?BULTOS '
      '  ,LINEAS=?LINEAS '
      '  ,BRUTO=?BRUTO '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,S_BASES=?S_BASES '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,ENTRADA=?ENTRADA '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,FORMA_DE_PAGO=?FORMA_DE_PAGO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,PROYECTO=?PROYECTO '
      '  ,FECHA_PRE_CAB=?FECHA_PRE_CAB '
      '  ,PLAZO_ENTREGA=?PLAZO_ENTREGA '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,PROCESO_AUTO=?PROCESO_AUTO '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,IMPORTE_MINIMO_PORTE=?IMPORTE_MINIMO_PORTE '
      '  ,IMPORTE_ICE_TOTAL=?IMPORTE_ICE_TOTAL '
      '  ,S_CUOTA_IMPUESTO_ADICIONAL=?S_CUOTA_IMPUESTO_ADICIONAL '
      '  ,S_CUOTA_IMP_ADICIONAL_CANAL=?S_CUOTA_IMP_ADICIONAL_CANAL '
      '  ,EMPAQUETADO_EMPRESA=?EMPAQUETADO_EMPRESA '
      '  ,DIR_RECOGIDA_MANUAL=?DIR_RECOGIDA_MANUAL '
      '  ,DIR_ENTREGA_MANUAL=?DIR_ENTREGA_MANUAL '
      '  ,EQUIPO_RECOGIDA=?EQUIPO_RECOGIDA '
      '  ,EQUIPO_ENTREGA=?EQUIPO_ENTREGA '
      '  ,MATRICULA_RECOGIDA=?MATRICULA_RECOGIDA '
      '  ,MATRICULA_ENTREGA=?MATRICULA_ENTREGA '
      '  ,FECHA_RECOGIDA_MANUAL=?FECHA_RECOGIDA_MANUAL '
      '  ,FECHA_ENTREGA_MANUAL=?FECHA_ENTREGA_MANUAL '
      '  ,IDIOMA=?IDIOMA '
      '  ,ACEPTA_ENTREGA_PARCIAL=?ACEPTA_ENTREGA_PARCIAL '
      '  ,USUARIO_CREACION=?USUARIO_CREACION '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      'WHERE'
      '  ID_E=?ID_E ')
    AfterDelete = Graba
    AfterInsert = QMCabeceraAfterInsert
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = QMCabeceraAfterPost
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    BeforeDelete = QMCabeceraBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforePost = QMCabeceraBeforePost
    OnCalcFields = QMCabeceraCalcFields
    OnNewRecord = QMCabeceraNewRecord
    OnPostError = QMCabeceraPostError
    ClavesPrimarias.Strings = (
      'ID_E ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_OFP'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_E'
      'GES_CABECERAS_E_OFP')
    CamposBloqueo.Strings = (
      'ID_E'
      'ID_E')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
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
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      OnChange = QMCabeceraALMACENChange
      Size = 3
    end
    object QMCabeceraMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMCabeceraMONEDAChange
      Size = 3
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      OnChange = QMCabeceraFECHAChange
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMCabeceraBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMCabeceraI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabeceraS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMCabeceraS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabeceraS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Cuota Rec.'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object QMCabeceraDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabeceraI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMCabeceraPROVEEDORChange
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnGetText = QMCabeceraTITULOGetText
      Size = 60
    end
    object QMCabeceraBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO'
      OnChange = QMCabeceraFORMA_DE_PAGOChange
      Size = 3
    end
    object QMCabeceraTOTAL_CANAL: TFloatField
      DisplayLabel = 'Total Canal'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMCabeceraTOTAL_CANALGetText
      Calculated = True
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabeceraID_E: TIntegerField
      DisplayLabel = 'ID E.'
      FieldName = 'ID_E'
    end
    object QMCabeceraTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object QMCabeceraPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMCabeceraI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object QMCabeceraI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMCabeceraCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
      OnChange = QMCabeceraCAMBIO_FIJOChange
    end
    object QMCabeceraVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
      OnChange = QMCabeceraVALOR_CAMB_FIJOChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField
      DisplayLabel = 'Valor Cambio Fijo Inv.'
      FieldName = 'VALOR_CAMB_FIJO_INV'
      OnChange = QMCabeceraVALOR_CAMB_FIJO_INVChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMCabeceraPROYECTOChange
    end
    object QMCabeceraFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fec. Prev. Entrega'
      FieldName = 'FECHA_PRE_CAB'
    end
    object QMCabeceraPLAZO_ENTREGA: TIntegerField
      DisplayLabel = 'Plazo Entrega'
      FieldName = 'PLAZO_ENTREGA'
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      DisplayLabel = 'T'#237'tulo Estado'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMCabeceraIMPORTE_MINIMO_PORTE: TFloatField
      DisplayLabel = 'Imp. Minimo Portes'
      FieldName = 'IMPORTE_MINIMO_PORTE'
    end
    object QMCabeceraIMPORTE_ICE_TOTAL: TFloatField
      DisplayLabel = 'Importe ICE'
      FieldName = 'IMPORTE_ICE_TOTAL'
    end
    object QMCabeceraS_CUOTA_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Impuesto Adicional'
      FieldName = 'S_CUOTA_IMPUESTO_ADICIONAL'
    end
    object QMCabeceraS_CUOTA_IMP_ADICIONAL_CANAL: TFloatField
      DisplayLabel = 'Impuesto Adicional Canal'
      FieldName = 'S_CUOTA_IMP_ADICIONAL_CANAL'
    end
    object QMCabeceraDIR_ENTREGA_MANUAL: TMemoField
      DisplayLabel = 'Dir. Entrega Manual'
      FieldName = 'DIR_ENTREGA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      OnChange = QMCabeceraDIRECCIONChange
    end
    object QMCabeceraACEPTA_ENTREGA_PARCIAL: TSmallintField
      DisplayLabel = 'Acepta Entrega Parcial'
      FieldName = 'ACEPTA_ENTREGA_PARCIAL'
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'MODIFICA_DOC'
    end
    object QMCabeceraOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 256
    end
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 136
    Top = 16
  end
  object xInfoActualizada: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT D.S_BASES, D.S_CUOTA_IVA, D.S_CUOTA_RE, D.LIQUIDO, D.I_FI' +
        'NANCIACION, D.B_DTO_LINEAS, D.I_DTO_LINEAS, D.ESTADO,'
      
        '       D.MODIFICA_DOC, D.IMPORTE_ICE_TOTAL, D.S_CUOTA_IMPUESTO_A' +
        'DICIONAL,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES,'
      '       (SELECT SUM(UNIDADES_SEC)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES_SEC,'
      '       (SELECT SUM(UNIDADES_LOGISTICAS)'
      '        FROM GES_DETALLES_E_OFP'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES_LOGISTICAS,'
      '       (SELECT SUM(PESO_REAL)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_PESO,'
      '       (SELECT COUNT(LINEA)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) COUNT_LINEA'
      'FROM VER_CABECERAS_OFP D'
      'WHERE'
      'D.ID_E = :ID_E')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSCabecera
    Left = 40
    Top = 208
    object xInfoActualizadaS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xInfoActualizadaS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xInfoActualizadaS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xInfoActualizadaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xInfoActualizadaI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xInfoActualizadaB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xInfoActualizadaI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Modif. Doc.'
      FieldName = 'MODIFICA_DOC'
    end
    object xInfoActualizadaTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = xInfoActualizadaTITULO_ESTADOGetText
      Size = 40
      Calculated = True
    end
    object xInfoActualizadaIMPORTE_ICE_TOTAL: TFloatField
      DisplayLabel = 'Importe ICE'
      FieldName = 'IMPORTE_ICE_TOTAL'
    end
    object xInfoActualizadaS_CUOTA_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Impuesto Adic.'
      FieldName = 'S_CUOTA_IMPUESTO_ADICIONAL'
    end
    object xInfoActualizadaSUM_UNIDADES: TFloatField
      DisplayLabel = 'Suma Unidades'
      FieldName = 'SUM_UNIDADES'
    end
    object xInfoActualizadaSUM_UNIDADES_SEC: TFloatField
      DisplayLabel = 'Suma Uds. Sec.'
      FieldName = 'SUM_UNIDADES_SEC'
    end
    object xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Suma Uds. Log.'
      FieldName = 'SUM_UNIDADES_LOGISTICAS'
    end
    object xInfoActualizadaSUM_PESO: TFloatField
      DisplayLabel = 'Suma Peso'
      FieldName = 'SUM_PESO'
    end
    object xInfoActualizadaCOUNT_LINEA: TIntegerField
      DisplayLabel = 'Cant. Lineas'
      FieldName = 'COUNT_LINEA'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 136
    Top = 208
  end
  object EntornoDoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 640
    Top = 112
  end
  object xAlmacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN'
      '')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 64
  end
  object DSxAlmacenes: TDataSource
    DataSet = xAlmacenes
    Left = 136
    Top = 64
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TERCERO, NOMBRE_R_SOCIAL, DESCUENTO_PP, DESCUENTO,'
      'FORMA_PAGO, TITULO, POR_FINANCIACION, DIAS_ENTREGA, MONEDA,'
      'PEDIDO_VALORADO, NOTAS, IMPORTE_MINIMO_PORTE,'
      'TRANSPORTISTA, TRANSPORTISTA_RAPIDO,'
      'DIAS_TRANSPORTE, DIAS_TRANSPORTE_RAPIDO, DIAS_ENTREGA,'
      'ID_PROVEEDOR, IDIOMA'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PROVEEDOR = :PROVEEDOR')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xProveedorAfterOpen
    BeforeClose = xProveedorBeforeClose
    Left = 40
    Top = 112
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 136
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 640
    Top = 16
  end
  object xArticulosTarifa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_POR_TARIFAS'
      ' (?EMP, ?EJE, ?CAN,?ALM, ?PROV, ?TAR)')
    UniDirectional = False
    AfterOpen = xArticulosTarifaAfterOpen
    Left = 232
    Top = 16
  end
  object DSxArticulosTarifa: TDataSource
    DataSet = xArticulosTarifa
    Left = 328
    Top = 16
  end
  object xtarifasProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_TARIFAS_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  TARIFA=?TARIFA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_TARIFAS_PROVEEDOR'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR'
      'AND TARIFA=?TARIFA')
    UniDirectional = False
    DataSource = DSxArticulosTarifa
    Left = 232
    Top = 64
  end
  object DSxtarifasProveedor: TDataSource
    DataSet = xtarifasProveedor
    Left = 328
    Top = 64
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT '
      
        'ARTICULO, ID_A, TITULO_LARGO AS TITULO, SERIALIZADO, LOTES, SERI' +
        'ALIZADO_KRI, ABIERTO,'
      'MULTIPLO_1, MULTIPLO_2, MULTIPLO_3, MULTIPLO_4,'
      'FACTOR_ESCALA, UD_MINIMO_COMPRA, UD_MINIMO_VENTA,'
      'UNIDADES, CONTROLA_MEDIDAS, PVP_POR_UD_SECUNDARIA, '
      'DEFECTO_UD_SECUNDARIA, FAMILIA'
      'FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO')
    SelectSQL.Strings = (
      'SELECT '
      
        'ARTICULO, ID_A, TITULO_LARGO AS TITULO, SERIALIZADO, LOTES, SERI' +
        'ALIZADO_KRI, ABIERTO,'
      'MULTIPLO_1, MULTIPLO_2, MULTIPLO_3, MULTIPLO_4,'
      'FACTOR_ESCALA, UD_MINIMO_COMPRA, UD_MINIMO_VENTA,'
      'UNIDADES, CONTROLA_MEDIDAS, PVP_POR_UD_SECUNDARIA, '
      'DEFECTO_UD_SECUNDARIA, FAMILIA'
      'FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 232
    Top = 112
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosCONTROLA_MEDIDAS: TIntegerField
      DisplayLabel = 'Ctrol. Medidas'
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object xArticulosSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object xArticulosLOTES: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES'
    end
    object xArticulosMULTIPLO_1: TFloatField
      DisplayLabel = 'Mult. 1'
      FieldName = 'MULTIPLO_1'
    end
    object xArticulosMULTIPLO_2: TFloatField
      DisplayLabel = 'Mult. 2'
      FieldName = 'MULTIPLO_2'
    end
    object xArticulosMULTIPLO_3: TFloatField
      DisplayLabel = 'Mult. 3'
      FieldName = 'MULTIPLO_3'
    end
    object xArticulosMULTIPLO_4: TFloatField
      DisplayLabel = 'Mult. 4'
      FieldName = 'MULTIPLO_4'
    end
    object xArticulosFACTOR_ESCALA: TFloatField
      DisplayLabel = 'Fact. Escala'
      FieldName = 'FACTOR_ESCALA'
    end
    object xArticulosUD_MINIMO_COMPRA: TFloatField
      DisplayLabel = 'Uds. Min. Compra'
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object xArticulosUD_MINIMO_VENTA: TFloatField
      DisplayLabel = 'Uds. Min. Venta'
      FieldName = 'UD_MINIMO_VENTA'
    end
    object xArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object xArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticulosPVP_POR_UD_SECUNDARIA: TIntegerField
      DisplayLabel = 'PVP. x Uds. Sec.'
      FieldName = 'PVP_POR_UD_SECUNDARIA'
    end
    object xArticulosDEFECTO_UD_SECUNDARIA: TFloatField
      DisplayLabel = 'Def. Uds. Sec.'
      FieldName = 'DEFECTO_UD_SECUNDARIA'
    end
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT TITULO, HEREDA_FINANCIACION FROM CON_CUENTAS_GES_FP'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND FORMA_PAGO=?FORMA_DE_PAGO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 160
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 136
    Top = 160
  end
  object QBorraLineaExt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM GES_DETALLES_E_UE'
      'WHERE EMPRESA =?EMPRESA AND'
      'EJERCICIO= ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO =?TIPO AND'
      'RIG =?RIG AND'
      'LINEA =?LINEA'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 160
  end
  object QUnidadesExt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM GES_DETALLES_E_UE WHERE'
      'EMPRESA  = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL       = ?CANAL AND'
      'SERIE       =  ?SERIE AND'
      'TIPO         =  ?TIPO AND'
      'RIG           =  ?RIG AND'
      'LINEA      =  ?LINEA')
    Transaction = TLocal
    AutoTrans = True
    Left = 520
    Top = 16
  end
  object QUptUnidadesExt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE GES_DETALLES_E_UE'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,MEDIDA1=?MEDIDA1 '
      '  ,MEDIDA2=?MEDIDA2 '
      '  ,MEDIDA3=?MEDIDA3 '
      '  ,MEDIDA4=?MEDIDA4 '
      '  ,PRECIO   =?PRECIO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 112
  end
  object QAnulaDocumento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_anula_documento_e(?empresa,?ejercicio,?canal' +
        ',?serie,?tipo,?rig,?id_e)')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 256
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 136
    Top = 400
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 400
    object xMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object SPCambiaMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure ut_refresca_detalle_e_moneda (?EMPRESA,?EJERCI' +
        'CIO,?CANAL,'
      ' ?SERIE,?TIPO,?RIG,?MONEDAOLD,?ID_E)')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 304
  end
  object SPTraspasarA: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure g_traspaso_ofp_prov_a_otro'
      '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,'
      '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_E,0,0,0)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 424
    Top = 16
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 352
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 136
    Top = 352
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 640
    Top = 64
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 136
    Top = 256
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_DIRECCIONES'
      'WHERE TERCERO=?TERCERO AND DIRECCION=?DIRECCION')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DIRECCIONES SD INDEX (PK_SYS_TERCEROS_DIRECCIONES' +
        '),VER_DIRECCIONES SL INDEX (ID_LOCALIDADES))')
    Left = 40
    Top = 256
  end
  object xAvisos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      'EMPRESA, TERCERO, CLIENTE, TITULO, TARIFA, AGENTE,'
      'DESCUENTO_PP, DESCUENTO_CIAL, FORMA_PAGO,'
      'TIPO_IRPF, NO_ALB_FAC, NO_VENTA_RIESGO,'
      'POR_FINANCIACION, RIESGO_AUT, RIESGO_ACT,'
      'TRANSPORTISTA, NOMBRE_COMERCIAL,'
      'TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE,'
      'IDIOMA, MONEDA, ALBARAN_VALORADO, NOTAS, '
      'NOTAS_FACTURACION_KRI, ZONA, '
      'TIPO_DOC_IDENT, NIF, DIAS_ENTREGA, '
      'PEDIDO_VALORADO, MODO_IVA, TIPO_NCF, RECC,'
      'GRUPO_CUENTAS, FECHA_ENTREGA_X_STOCK,'
      'SU_REFERENCIA, PAIS_C2, IMPORTE_MINIMO_PORTE'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL'
      'AND CLIENTE=?CLIENTE')
    SelectSQL.Strings = (
      'SELECT MENSAJE'
      'FROM EMP_AVISOS'
      'WHERE'
      'TIPO_OBJETO = '#39'PRO'#39' AND'
      'ID_OBJETO = :ID_PROVEEDOR AND'
      'TIPO_DOCUMENTO = '#39'OFP'#39' AND'
      'ACTIVO = 1')
    UniDirectional = False
    DataSource = DSxProveedor
    Left = 416
    Top = 352
  end
end
