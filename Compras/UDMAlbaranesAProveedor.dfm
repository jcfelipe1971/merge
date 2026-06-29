object DMAlbaranesAProveedor: TDMAlbaranesAProveedor
  OldCreateOrder = False
  OnCreate = DMDocsAlbaranAProvCreate
  OnDestroy = DMAlbaranesAProveedorDestroy
  Left = 468
  Top = 153
  Height = 677
  Width = 727
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_ALBARAN_PROV'
      'WHERE'
      '  ID_DETALLES_E=?old_ID_DETALLES_E AND '
      '  ID_E=?old_ID_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ALBARAN_PROV'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ALMACEN,ARTICU' +
        'LO,TITULO,UNIDADES,'#13#10'UNIDADES_PENDIENTES,PRECIO,DESCUENTO,DESCUE' +
        'NTO_2,DESCUENTO_3,P_COSTE,COSTE_ADICIONAL,PAIS,TIPO_IVA,P_IVA,'#13#10 +
        'P_RECARGO,BRUTO,I_DESCUENTO,B_IMPONIBLE,ENTRADA,M_MOV_STOCK,UNID' +
        'ADES_EXT,NOTAS,NOTAS2,ID_A,ID_C_A,ID_E,ID_DETALLES_E,'#13#10'FECHA_PRE' +
        '_DET,FECHA_REC_DET,SUPLIDO,NSERIE,BULTOS,ORDEN,UNIDADES_SEC,APLI' +
        'CA_UNIDADES_SECUNDARIAS,PROYECTO,CRC_NOTAS,'#13#10'CRC_NOTAS2,ID_UBICA' +
        'CION,COMPOSICION,ID_A_UBICACION,UNIDADES_UB,ALMACEN_UB,CALLE,EST' +
        'ANTERIA,REPISA,POSICION,'#13#10'ID_LOTE,LOTE,UNIDADES_LOT,TIPO_UNIDAD_' +
        'LOGISTICA,TITULO_UNIDAD_LOGISTICA,UNIDADES_LOGISTICAS,LOTEABLE,A' +
        'LFA_1,ALFA_2,'#13#10'ALFA_3,ALFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,INVERSI' +
        'ON_SUJETO_PASIVO,DECIMALES_UNIDADES,TIPO_IMPUESTO_ADICIONAL,P_IM' +
        'PUESTO_ADICIONAL,'#13#10'PESO,PESO_TOTAL,PESO_REAL,PRO_NUM_PLANO,CONTR' +
        'OL_STOCK)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ALMACE' +
        'N,?ARTICULO,?TITULO,?UNIDADES,'#13#10'?UNIDADES_PENDIENTES,?PRECIO,?DE' +
        'SCUENTO,?DESCUENTO_2,?DESCUENTO_3,?P_COSTE,?COSTE_ADICIONAL,?PAI' +
        'S,?TIPO_IVA,?P_IVA,'#13#10'?P_RECARGO,?BRUTO,?I_DESCUENTO,?B_IMPONIBLE' +
        ',?ENTRADA,?M_MOV_STOCK,?UNIDADES_EXT,?NOTAS,?NOTAS2,?ID_A,?ID_C_' +
        'A,?ID_E,?ID_DETALLES_E,'#13#10'?FECHA_PRE_DET,?FECHA_REC_DET,?SUPLIDO,' +
        '?NSERIE,?BULTOS,?ORDEN,?UNIDADES_SEC,?APLICA_UNIDADES_SECUNDARIA' +
        'S,?PROYECTO,?CRC_NOTAS,'#13#10'?CRC_NOTAS2,?ID_UBICACION,?COMPOSICION,' +
        '?ID_A_UBICACION,?UNIDADES_UB,?ALMACEN_UB,?CALLE,?ESTANTERIA,?REP' +
        'ISA,?POSICION,'#13#10'?ID_LOTE,?LOTE,?UNIDADES_LOT,?TIPO_UNIDAD_LOGIST' +
        'ICA,?TITULO_UNIDAD_LOGISTICA,?UNIDADES_LOGISTICAS,?LOTEABLE,?ALF' +
        'A_1,?ALFA_2,'#13#10'?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?I' +
        'NVERSION_SUJETO_PASIVO,?DECIMALES_UNIDADES,?TIPO_IMPUESTO_ADICIO' +
        'NAL,?P_IMPUESTO_ADICIONAL,'#13#10'?PESO,?PESO_TOTAL,?PESO_REAL,?PRO_NU' +
        'M_PLANO,?CONTROL_STOCK)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ALBARAN_PROV'
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E AND '
      '  ID_E=?ID_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_PROV'
      'WHERE'
      'ID_E = :ID_E'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ALBARAN_PROV'
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
      '  ,UNIDADES_PENDIENTES=?UNIDADES_PENDIENTES '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,P_COSTE=?P_COSTE '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,BRUTO=?BRUTO '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,ENTRADA=?ENTRADA '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,NOTAS=?NOTAS '
      '  ,NOTAS2=?NOTAS2 '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,NSERIE=?NSERIE '
      '  ,BULTOS=?BULTOS '
      '  ,ORDEN=?ORDEN '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,COMPOSICION=?COMPOSICION '
      '  ,ID_A_UBICACION=?ID_A_UBICACION '
      '  ,UNIDADES_UB=?UNIDADES_UB '
      '  ,ALMACEN_UB=?ALMACEN_UB '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,LOTE=?LOTE '
      '  ,UNIDADES_LOT=?UNIDADES_LOT '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,LOTEABLE=?LOTEABLE '
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
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E AND '
      '  ID_E=?ID_E ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_ALBARAN_PROV DET INDEX (GES_DETALLES_E_CA' +
        'B_ID),'
      
        '           VER_DETALLE_ALBARAN_PROV ALB INDEX (GES_DETALLES_E_AL' +
        'B_ID))')
    AfterDelete = QMDetalleAfterDelete
    AfterOpen = QMDetalleAfterOpen
    AfterPost = GrabaDetalle
    AfterScroll = QMDetalleAfterScroll
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_E '
      'ID_E ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_ALBARAN_PROV'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_E'
      'GES_DETALLES_E_ALB')
    CamposBloqueo.Strings = (
      'ID_DETALLES_E'
      'ID_DETALLES_E')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
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
      DisplayLabel = 'Alm.'
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
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'T. IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMDetalleTIPO_IVAChange
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Recargo'
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
      DisplayLabel = 'C. Recargo'
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
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
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
    object QMDetalleUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
      OnGetText = QMDetalleUNIDADES_PENDIENTESGetText
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Cta. Art.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'ID E'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det. E'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Rec.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleSUPLIDO: TIntegerField
      DisplayLabel = 'Supl.'
      FieldName = 'SUPLIDO'
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
      OnGetText = QMDetalleUNIDADES_SECGetText
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
      DisplayLabel = 'Notas 2'
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
    object QMDetalleID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMDetalleCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
    end
    object QMDetalleID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art. Ubic.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetalleUNIDADES_UB: TFloatField
      DisplayLabel = 'Uds. Ubic.'
      FieldName = 'UNIDADES_UB'
      OnGetText = QMDetalleUNIDADES_UBGetText
    end
    object QMDetalleALMACEN_UB: TFIBStringField
      DisplayLabel = 'Alm. Ubic.'
      FieldName = 'ALMACEN_UB'
      Size = 3
    end
    object QMDetalleCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleESTANTERIA: TFIBStringField
      DisplayLabel = 'Est.'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleREPISA: TFIBStringField
      DisplayLabel = 'Rep.'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetallePOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetalleUNIDADES_LOT: TFloatField
      DisplayLabel = 'Uds. Lote'
      FieldName = 'UNIDADES_LOT'
      OnGetText = QMDetalleUNIDADES_LOTGetText
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
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
      ReadOnly = True
    end
    object QMDetalleCANT_LOTE: TFloatField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
      ReadOnly = True
      OnGetText = QMDetalleCANT_LOTEGetText
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
    object QMDetalleTOTAL_UNIDADES_EXT: TFloatField
      DisplayLabel = 'Tot. Unid. Ext.'
      FieldName = 'TOTAL_UNIDADES_EXT'
      ReadOnly = True
      OnGetText = QMDetalleTOTAL_UNIDADES_EXTGetText
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
    object QMDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object QMDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Pro. Num. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMDetalleSTOCK_ALM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM3'
      Calculated = True
    end
    object QMDetalleCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrl. Stock'
      FieldName = 'CONTROL_STOCK'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 136
    Top = 64
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_ALBARAN_PROV'
      'WHERE'
      '  ID_E=?old_ID_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_ALBARAN_PROV'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',PROVEEDOR,TERCERO,'#13#10'DIRECCION,TITULO,NOTAS,ESTADO,BULTOS,LINEAS' +
        ',BRUTO,I_DTO_LINEAS,S_BASES,S_CUOTA_IVA,'#13#10'S_CUOTA_RE,DTO_PP,DTO_' +
        'CIAL,I_DTO_CIAL,I_DTO_PP,ENTRADA,ENTRADA_FACTURACION,FECHA_ALBAR' +
        'AN,'#13#10'NUM_ALBARAN,NOMBRE_COMERCIAL,POR_FINANCIACION,I_FINANCIACIO' +
        'N,FORMA_DE_PAGO,ID_E,P_IRPF,I_IRPF,A_IRPF,TIPO_IRPF,'#13#10'BASE_IRPF,' +
        'TOTAL_ALBARAN,SU_REFERENCIA,TIPO_PORTES,POR_PORTES,I_PORTES,I_PO' +
        'RTES_CANAL,CAMBIO_FIJO,VALOR_CAMB_FIJO,PROYECTO,MODIFICA_DOC,ALB' +
        'ARAN_VALORADO,DEVOLUCION,INVERSION_SUJETO_PASIVO,IMPORTE_MINIMO_' +
        'PORTE,IMPORTE_ICE_TOTAL,S_CUOTA_IMPUESTO_ADICIONAL,S_CUOTA_IMP_A' +
        'DICIONAL_CANAL,EMPAQUETADO_EMPRESA,'#13#10'DIR_RECOGIDA_MANUAL,DIR_ENT' +
        'REGA_MANUAL,EQUIPO_RECOGIDA,EQUIPO_ENTREGA,MATRICULA_RECOGIDA,MA' +
        'TRICULA_ENTREGA,FECHA_RECOGIDA_MANUAL,FECHA_ENTREGA_MANUAL,IDIOM' +
        'A,USUARIO_CREACION,'#13#10'COD_MOTIVO_ABONO,ENTREGA_DIRECTA,OBSERVACIO' +
        'NES)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?PROVEEDOR,?TERCERO,'#13#10'?DIRECCION,?TITULO,?NOTAS,?ESTAD' +
        'O,?BULTOS,?LINEAS,?BRUTO,?I_DTO_LINEAS,?S_BASES,?S_CUOTA_IVA,'#13#10'?' +
        'S_CUOTA_RE,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?ENTRADA,?ENT' +
        'RADA_FACTURACION,?FECHA_ALBARAN,'#13#10'?NUM_ALBARAN,?NOMBRE_COMERCIAL' +
        ',?POR_FINANCIACION,?I_FINANCIACION,?FORMA_DE_PAGO,?ID_E,?P_IRPF,' +
        '?I_IRPF,?A_IRPF,?TIPO_IRPF,'#13#10'?BASE_IRPF,?TOTAL_ALBARAN,?SU_REFER' +
        'ENCIA,?TIPO_PORTES,?POR_PORTES,?I_PORTES,?I_PORTES_CANAL,?CAMBIO' +
        '_FIJO,?VALOR_CAMB_FIJO,?PROYECTO,?MODIFICA_DOC,?ALBARAN_VALORADO' +
        ',?DEVOLUCION,?INVERSION_SUJETO_PASIVO,?IMPORTE_MINIMO_PORTE,?IMP' +
        'ORTE_ICE_TOTAL,?S_CUOTA_IMPUESTO_ADICIONAL,?S_CUOTA_IMP_ADICIONA' +
        'L_CANAL,?EMPAQUETADO_EMPRESA,'#13#10'?DIR_RECOGIDA_MANUAL,?DIR_ENTREGA' +
        '_MANUAL,?EQUIPO_RECOGIDA,?EQUIPO_ENTREGA,?MATRICULA_RECOGIDA,?MA' +
        'TRICULA_ENTREGA,?FECHA_RECOGIDA_MANUAL,?FECHA_ENTREGA_MANUAL,?ID' +
        'IOMA,?USUARIO_CREACION,'#13#10'?COD_MOTIVO_ABONO,?ENTREGA_DIRECTA,?OBS' +
        'ERVACIONES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_ALBARAN_PROV'
      'WHERE'
      '  ID_E=?ID_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_PROV'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = '#39'ALP'#39' AND '
      
        '(EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO' +
        ' = 0)))'
      'ORDER BY EJERCICIO,RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_ALBARAN_PROV'
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
      '  ,ENTRADA_FACTURACION=?ENTRADA_FACTURACION '
      '  ,FECHA_ALBARAN=?FECHA_ALBARAN '
      '  ,NUM_ALBARAN=?NUM_ALBARAN '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,FORMA_DE_PAGO=?FORMA_DE_PAGO '
      '  ,P_IRPF=?P_IRPF '
      '  ,I_IRPF=?I_IRPF '
      '  ,A_IRPF=?A_IRPF '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,BASE_IRPF=?BASE_IRPF '
      '  ,TOTAL_ALBARAN=?TOTAL_ALBARAN '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,PROYECTO=?PROYECTO '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,ALBARAN_VALORADO=?ALBARAN_VALORADO '
      '  ,DEVOLUCION=?DEVOLUCION '
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
      '  ,USUARIO_CREACION=?USUARIO_CREACION '
      '  ,COD_MOTIVO_ABONO=?COD_MOTIVO_ABONO '
      '  ,ENTREGA_DIRECTA=?ENTREGA_DIRECTA '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      'WHERE'
      '  ID_E=?ID_E ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN_PROV CAB INDEX (PK_GES_CA' +
        'BECERAS_E),'
      
        '                 VER_CABECERAS_ALBARAN_PROV ALB INDEX (GES_CABEC' +
        'ERAS_E_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN_PROV TER INDEX (PK_SYS_TE' +
        'RCEROS)))'
      ' ')
    AfterDelete = Graba
    AfterInsert = QMCabeceraAfterInsert
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = QMCabeceraAfterPost
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    BeforeDelete = QMCabeceraBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMCabeceraBeforeInsert
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
    TableName = 'VER_CABECERAS_ALBARAN_PROV'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_E'
      'GES_CABECERAS_E_ALB')
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
      DisplayLabel = 'Imp. Dto. Lin.'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabeceraS_BASES: TFloatField
      DisplayLabel = 'Suma Bases'
      FieldName = 'S_BASES'
    end
    object QMCabeceraS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Suma C. IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabeceraS_CUOTA_RE: TFloatField
      DisplayLabel = 'Suma C. RE'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'Base Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
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
    object QMCabeceraNUM_ALBARAN: TFIBStringField
      DisplayLabel = 'Num. Albaran'
      FieldName = 'NUM_ALBARAN'
      Size = 40
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Finan.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Finan.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO'
      OnChange = QMCabeceraFORMA_DE_PAGOChange
      Size = 3
    end
    object QMCabeceraTOTAL_CANAL: TFloatField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMCabeceraTOTAL_CANALGetText
      Calculated = True
    end
    object QMCabeceraENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Ent. Fact.'
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Com.'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraID_E: TIntegerField
      DisplayLabel = 'ID E'
      FieldName = 'ID_E'
    end
    object QMCabeceraP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object QMCabeceraI_IRPF: TFloatField
      DisplayLabel = 'Imp. IRPF'
      FieldName = 'I_IRPF'
    end
    object QMCabeceraA_IRPF: TIntegerField
      DisplayLabel = 'A IRPF'
      FieldName = 'A_IRPF'
    end
    object QMCabeceraTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
      OnChange = QMCabeceraTIPO_IRPFChange
    end
    object QMCabeceraBASE_IRPF: TFloatField
      DisplayLabel = 'Base IRPF'
      FieldName = 'BASE_IRPF'
    end
    object QMCabeceraTOTAL_ALBARAN: TFloatField
      DisplayLabel = 'Total Alb.'
      FieldName = 'TOTAL_ALBARAN'
    end
    object QMCabeceraAPLICA_IRPF: TStringField
      DisplayLabel = 'Aplica IRPF'
      FieldKind = fkCalculated
      FieldName = 'APLICA_IRPF'
      OnGetText = QMCabeceraAPLICA_IRPFGetText
      Size = 25
      Calculated = True
    end
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
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
      DisplayLabel = 'Imp. Portes Can.'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMCabeceraCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
      OnChange = QMCabeceraCAMBIO_FIJOChange
    end
    object QMCabeceraVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Camb. Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
      OnChange = QMCabeceraVALOR_CAMB_FIJOChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField
      DisplayLabel = 'Val. Cambio Fijo Inv.'
      FieldName = 'VALOR_CAMB_FIJO_INV'
      OnChange = QMCabeceraVALOR_CAMB_FIJO_INVChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMCabeceraPROYECTOChange
    end
    object QMCabeceraID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldKind = fkCalculated
      FieldName = 'ID_ORDEN'
      OnGetText = QMCabeceraID_ORDENGetText
      Calculated = True
    end
    object QMCabeceraALBARAN_VALORADO: TIntegerField
      DisplayLabel = 'Valorar'
      FieldName = 'ALBARAN_VALORADO'
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      DisplayLabel = 'T'#237'tulo Estado'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMCabeceraDEVOLUCION: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'DEVOLUCION'
    end
    object QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMCabeceraIMPORTE_MINIMO_PORTE: TFloatField
      DisplayLabel = 'Imp. Minimo Portes'
      FieldName = 'IMPORTE_MINIMO_PORTE'
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
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraCOD_MOTIVO_ABONO: TIntegerField
      DisplayLabel = 'Motivo Abono'
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object QMCabeceraENTREGA_DIRECTA: TIntegerField
      DisplayLabel = 'Entrega Directa'
      FieldName = 'ENTREGA_DIRECTA'
    end
    object QMCabeceraFECHA_ALBARAN: TDateTimeField
      DisplayLabel = 'Fec. Alb.'
      FieldName = 'FECHA_ALBARAN'
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
  object DSQMCabecera: TDataSource
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
      
        '       D.POR_FINANCIACION, D.I_IRPF, D.TOTAL_ALBARAN, D.I_PORTES' +
        ', D.MODIFICA_DOC, IMPORTE_ICE_TOTAL,'
      '       S_CUOTA_IMPUESTO_ADICIONAL,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES,'
      '       (SELECT SUM(UNIDADES_SEC)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES_SEC,'
      '       (SELECT SUM(UNIDADES_LOGISTICAS)'
      '        FROM GES_DETALLES_E_ALB'
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
      'FROM VER_CABECERAS_ALBARAN_PROV D'
      'WHERE'
      'D.ID_E = :ID_E')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    Left = 40
    Top = 256
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
    object xInfoActualizadaPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xInfoActualizadaI_IRPF: TFloatField
      DisplayLabel = 'Imp. IRPF'
      FieldName = 'I_IRPF'
    end
    object xInfoActualizadaTOTAL_ALBARAN: TFloatField
      DisplayLabel = 'Total Alb.'
      FieldName = 'TOTAL_ALBARAN'
    end
    object xInfoActualizadaI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xInfoActualizadaSUM_UNIDADES: TFloatField
      DisplayLabel = 'Suma Uds.'
      FieldName = 'SUM_UNIDADES'
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
    Top = 256
  end
  object EntornoDoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 520
    Top = 16
  end
  object xAlmacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO, CTROL_UBICACION FROM ART_ALMACENES'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'ALMACEN = ?ALMACEN')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 112
  end
  object DSxAlmacenes: TDataSource
    DataSet = xAlmacenes
    Left = 136
    Top = 112
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TERCERO, NOMBRE_R_SOCIAL,DESCUENTO_PP,DESCUENTO,'
      'FORMA_PAGO,TITULO,POR_FINANCIACION,TIPO_IRPF, MONEDA,'
      'TIPO_PORTES, POR_PORTES, I_PORTES, ALBARAN_VALORADO,'
      'NOTAS, IMPORTE_MINIMO_PORTE, ID_PROVEEDOR, IDIOMA'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = xProveedorAfterOpen
    BeforeClose = xProveedorBeforeClose
    Left = 40
    Top = 160
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 136
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 520
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
      'DEFECTO_UD_SECUNDARIA, FAMILIA, CONTROL_STOCK'
      'FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 232
    Top = 112
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
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
      'SELECT TITULO,HEREDA_FINANCIACION FROM CON_CUENTAS_GES_FP'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'FORMA_PAGO=?FORMA_DE_PAGO')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 208
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 136
    Top = 208
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
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 424
    Top = 16
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
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 424
    Top = 160
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
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 424
    Top = 64
  end
  object SPTraspasarAFacturaMul: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure g_traspaso_albaran_prov_mul'
      '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,'
      '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,'
      '?ID_E,0,0,0,0,0)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 424
    Top = 112
  end
  object xTipoIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,P_IRPF,BASE FROM SYS_TIPO_IRPF'
      'WHERE '
      'TIPO = ?TIPO_IRPF AND'
      'PAIS = ?PAIS')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 304
  end
  object DSxTipoIRPF: TDataSource
    DataSet = xTipoIRPF
    Left = 136
    Top = 304
  end
  object QMNIF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_E_FAC_NIF'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_E_FAC_NIF'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,NOMBRE,NIF,DIRECCION' +
        ',C_POSTAL,PROVINCIA,'#13#10'ID_E,PAIS,LOCALIDAD,TELEFONO01,TELEFONO02,' +
        'TELEFAX,EMAIL,NOTAS,COLONIA,TERCERO,'#13#10'NOMBRE_CONTACTO,TIPO_DOC_I' +
        'DENT,PAIS_DOC_IDENT)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?NOMBRE,?NIF,?' +
        'DIRECCION,?C_POSTAL,?PROVINCIA,'#13#10'?ID_E,?PAIS,?LOCALIDAD,?TELEFON' +
        'O01,?TELEFONO02,?TELEFAX,?EMAIL,?NOTAS,?COLONIA,?TERCERO,'#13#10'?NOMB' +
        'RE_CONTACTO,?TIPO_DOC_IDENT,?PAIS_DOC_IDENT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_E_FAC_NIF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_FAC_NIF'
      'WHERE'
      '  TIPO = ?TIPO AND /*Para evitar colisiones con ticket*/'
      '  ID_E = ?ID_E')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_E_FAC_NIF'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,NIF=?NIF '
      '  ,DIRECCION=?DIRECCION '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,ID_E=?ID_E '
      '  ,PAIS=?PAIS '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,EMAIL=?EMAIL '
      '  ,NOTAS=?NOTAS '
      '  ,COLONIA=?COLONIA '
      '  ,TERCERO=?TERCERO '
      '  ,NOMBRE_CONTACTO=?NOMBRE_CONTACTO '
      '  ,TIPO_DOC_IDENT=?TIPO_DOC_IDENT '
      '  ,PAIS_DOC_IDENT=?PAIS_DOC_IDENT '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    DataSource = DSQMCabecera
    AfterPost = Graba
    OnNewRecord = QMNIFNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_E_FAC_NIF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 352
    object QMNIFEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNIFEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNIFCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNIFSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNIFTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMNIFRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMNIFNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMNIFNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMNIFDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 60
    end
    object QMNIFC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object QMNIFPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMNIFPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMNIFID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMNIFLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMNIFTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object QMNIFTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object QMNIFTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object QMNIFEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMNIFNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMNIFCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMNIFTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNIFNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object QMNIFTIPO_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object QMNIFPAIS_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Pais Doc.'
      FieldName = 'PAIS_DOC_IDENT'
      Size = 3
    end
  end
  object DSQMNIF: TDataSource
    DataSet = QMNIF
    Left = 136
    Top = 352
  end
  object QSPProcedencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 232
    Top = 16
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 328
    Top = 16
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 232
    Top = 64
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 328
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 520
    Top = 112
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 136
    Top = 400
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_DIRECCIONES'
      'WHERE '
      'TERCERO=?TERCERO AND '
      'DIRECCION=?DIRECCION')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DIRECCIONES SD INDEX (PK_SYS_TERCEROS_DIRECCIONES' +
        '),VER_DIRECCIONES SL INDEX (ID_LOCALIDADES))')
    Left = 40
    Top = 400
    object xDireccionesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnGetText = xDireccionesTITULOGetText
      Size = 109
    end
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
      'TIPO_DOCUMENTO = '#39'ALP'#39' AND'
      'ACTIVO = 1')
    UniDirectional = False
    DataSource = DSxProveedor
    Left = 416
    Top = 208
  end
end
