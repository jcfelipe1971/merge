object DMFacturasAProveedor: TDMFacturasAProveedor
  OldCreateOrder = False
  OnCreate = DMFacturasAProveedorCreate
  OnDestroy = DMFacturasAProveedorDestroy
  Left = 403
  Top = 121
  Height = 586
  Width = 678
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_FACTURA_PROV'
      'WHERE'
      '  ID_DETALLES_E=?old_ID_DETALLES_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_FACTURA_PROV'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ALMACEN,ARTICU' +
        'LO,TITULO,UNIDADES,'#13#10'PRECIO,DESCUENTO,DESCUENTO_2,DESCUENTO_3,P_' +
        'COSTE,COSTE_ADICIONAL,PAIS,TIPO_IVA,P_IVA,P_RECARGO,'#13#10'BRUTO,I_DE' +
        'SCUENTO,B_IMPONIBLE,ENTRADA,'#13#10'UNIDADES_EXT,NOTAS,NOTAS2,NSERIE,S' +
        'UPLIDO,CENTRO_COSTE,ID_A,ID_C_A,ID_E,ID_DETALLES_E,'#13#10'FECHA_PRE_D' +
        'ET,FECHA_REC_DET,ORDEN,UNIDADES_SEC,APLICA_UNIDADES_SECUNDARIAS,' +
        'PROYECTO,CRC_NOTAS,CRC_NOTAS2,CUENTA,TIPO_UNIDAD_LOGISTICA,'#13#10'TIT' +
        'ULO_UNIDAD_LOGISTICA,UNIDADES_LOGISTICAS,ALFA_1,ALFA_2,ALFA_3,AL' +
        'FA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,'#13#10'IMPORTE_ICE,INVERSION_SUJETO_' +
        'PASIVO,DECIMALES_UNIDADES,TIPO_IMPUESTO_ADICIONAL,P_IMPUESTO_ADI' +
        'CIONAL,I_IMPUESTO_ADICIONAL,PESO,PESO_TOTAL,PESO_REAL,PRO_NUM_PL' +
        'ANO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ALMACE' +
        'N,?ARTICULO,?TITULO,?UNIDADES,'#13#10'?PRECIO,?DESCUENTO,?DESCUENTO_2,' +
        '?DESCUENTO_3,?P_COSTE,?COSTE_ADICIONAL,?PAIS,?TIPO_IVA,?P_IVA,?P' +
        '_RECARGO,'#13#10'?BRUTO,?I_DESCUENTO,?B_IMPONIBLE,?ENTRADA,'#13#10'?UNIDADES' +
        '_EXT,?NOTAS,?NOTAS2,?NSERIE,?SUPLIDO,?CENTRO_COSTE,?ID_A,?ID_C_A' +
        ',?ID_E,?ID_DETALLES_E,'#13#10'?FECHA_PRE_DET,?FECHA_REC_DET,?ORDEN,?UN' +
        'IDADES_SEC,?APLICA_UNIDADES_SECUNDARIAS,?PROYECTO,?CRC_NOTAS,?CR' +
        'C_NOTAS2,?CUENTA,?TIPO_UNIDAD_LOGISTICA,'#13#10'?TITULO_UNIDAD_LOGISTI' +
        'CA,?UNIDADES_LOGISTICAS,?ALFA_1,?ALFA_2,?ALFA_3,?ALFA_4,?ALFA_5,' +
        '?ALFA_6,?ALFA_7,?ALFA_8,'#13#10'?IMPORTE_ICE,?INVERSION_SUJETO_PASIVO,' +
        '?DECIMALES_UNIDADES,?TIPO_IMPUESTO_ADICIONAL,?P_IMPUESTO_ADICION' +
        'AL,?I_IMPUESTO_ADICIONAL,?PESO,?PESO_TOTAL,?PESO_REAL,?PRO_NUM_P' +
        'LANO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_FACTURA_PROV'
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA_PROV'
      'WHERE'
      'ID_E = ?ID_E'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_FACTURA_PROV'
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
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
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
      '  ,NOTAS2=?NOTAS2 '
      '  ,NSERIE=?NSERIE '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_E=?ID_E '
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,ORDEN=?ORDEN '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,CUENTA=?CUENTA '
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
      '  ,IMPORTE_ICE=?IMPORTE_ICE '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,DECIMALES_UNIDADES=?DECIMALES_UNIDADES '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,P_IMPUESTO_ADICIONAL=?P_IMPUESTO_ADICIONAL '
      '  ,I_IMPUESTO_ADICIONAL=?I_IMPUESTO_ADICIONAL '
      '  ,PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,PESO_REAL=?PESO_REAL '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_FACTURA_PROV DET INDEX (GES_DETALLES_E_CA' +
        'B_ID),'
      
        '           VER_DETALLE_FACTURA_PROV FAC INDEX (GES_DETALLES_E_FA' +
        'C_ID))')
    AfterDelete = QMDetalleAfterDelete
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    BeforeScroll = QMDetalleBeforeScroll
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_E ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_FACTURA_PROV'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_E'
      'GES_DETALLES_E_FAC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_E'
      'ID_DETALLES_E')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
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
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMDetalleUNIDADESChange
      OnGetText = QMDetalleUNIDADESGetText
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMDetalleTIPO_IVAChange
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
      DisplayLabel = 'Imp. Descuento'
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
      DisplayLabel = 'Sel.'
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
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleIMPORTE_ICE: TFloatField
      DisplayLabel = 'Importe ICE'
      FieldName = 'IMPORTE_ICE'
    end
    object QMDetalleSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object QMDetalleCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
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
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
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
    object QMDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta Gastos'
      FieldName = 'CUENTA'
      OnChange = QMDetalleCUENTAChange
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
      DisplayLabel = 'Tipo Imp Adic'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
      OnChange = QMDetalleTIPO_IMPUESTO_ADICIONALChange
    end
    object QMDetalleP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'P Imp Adic'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object QMDetalleI_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Imp. Impuesto. Adic'
      FieldName = 'I_IMPUESTO_ADICIONAL'
    end
    object QMDetalleTITULO_CUENTA: TStringField
      DisplayLabel = 'T'#237'tulo Cuenta'
      FieldKind = fkCalculated
      FieldName = 'TITULO_CUENTA'
      OnGetText = QMDetalleTITULO_CUENTAGetText
      Size = 150
      Calculated = True
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
      'DELETE FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE'
      '  ID_E=?old_ID_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_FACTURA_PROV'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',PROVEEDOR,TERCERO,'#13#10'DIRECCION,TITULO,NOTAS,ESTADO,BULTOS,LINEAS' +
        ',BRUTO,I_DTO_LINEAS,S_BASES,S_CUOTA_IVA,'#13#10'S_CUOTA_RE,DTO_PP,DTO_' +
        'CIAL,I_DTO_CIAL,I_DTO_PP,ENTRADA,P_IRPF,I_IRPF,'#13#10'A_IRPF,TOTAL_FA' +
        'CTURA,NUM_FACTURA,FORMA_DE_PAGO,TIPO_IRPF,BASE_IRPF,DEVOLUCION,S' +
        'IN_DETALLE,ASIENTO,NOMBRE_COMERCIAL,'#13#10'REGISTRO,POR_FINANCIACION,' +
        'I_FINANCIACION,FECHA_CON,FECHA_SII,SIN_RECIBOS,FUERZA_VENCIMIENT' +
        'OS,I_FINANCIACION_CANAL,CENTRO_COSTE,ID_E,'#13#10'FECHA_ENTREGA,SU_REF' +
        'ERENCIA,RECT,ID_RECT,TIPO_PORTES,POR_PORTES,I_PORTES,I_PORTES_CA' +
        'NAL,CAMBIO_FIJO,VALOR_CAMB_FIJO,'#13#10'PROYECTO,OBLIGA_AUTOFACTURA,FU' +
        'ERZA_MODO_IVA,MODO_IVA,Z_TIPO_BIENES,Z_TIPO_NCF,Z_PREFIJO_NCF,Z_' +
        'CONTADOR_NCF,MODIFICA_DOC,'#13#10'RECC,INVERSION_SUJETO_PASIVO,SFV_AUT' +
        'ORIZACION,SFV_CODIGO_CONTROL,SFV_CODIGO_RESPUESTA_RAPIDA,IMPORTE' +
        '_ICE_TOTAL,ID_TIPO_GIRO_PRO_ACR,CODIGO_GIRO_PRO_ACR,'#13#10'ID_TIPO_GI' +
        'RO_EMPRESA,CODIGO_GIRO_EMPRESA,TIPO_COMPRA,CODIGO_RESPUESTA_SII,' +
        'FOLIO,IMPORTE_MINIMO_PORTE,TIPO_DOC_TRIBUTARIO,S_CUOTA_IMPUESTO_' +
        'ADICIONAL,S_CUOTA_IMP_ADICIONAL_CANAL,EMPAQUETADO_EMPRESA,'#13#10'DIR_' +
        'RECOGIDA_MANUAL,DIR_ENTREGA_MANUAL,EQUIPO_RECOGIDA,EQUIPO_ENTREG' +
        'A,MATRICULA_RECOGIDA,MATRICULA_ENTREGA,FECHA_RECOGIDA_MANUAL,FEC' +
        'HA_ENTREGA_MANUAL,IDIOMA,USUARIO_CREACION,COD_MOTIVO_ABONO,NIF,O' +
        'RIGEN_DOCUMENTO,OBSERVACIONES,DOM_ID_TIPO_RETENCION,DOM_RET_POR_' +
        'ITBIS,DOM_RET_POR_ISR)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?PROVEEDOR,?TERCERO,'#13#10'?DIRECCION,?TITULO,?NOTAS,?ESTAD' +
        'O,?BULTOS,?LINEAS,?BRUTO,?I_DTO_LINEAS,?S_BASES,?S_CUOTA_IVA,'#13#10'?' +
        'S_CUOTA_RE,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?ENTRADA,?P_I' +
        'RPF,?I_IRPF,'#13#10'?A_IRPF,?TOTAL_FACTURA,?NUM_FACTURA,?FORMA_DE_PAGO' +
        ',?TIPO_IRPF,?BASE_IRPF,?DEVOLUCION,?SIN_DETALLE,?ASIENTO,?NOMBRE' +
        '_COMERCIAL,'#13#10'?REGISTRO,?POR_FINANCIACION,?I_FINANCIACION,?FECHA_' +
        'CON,?FECHA_SII,?SIN_RECIBOS,?FUERZA_VENCIMIENTOS,?I_FINANCIACION' +
        '_CANAL,?CENTRO_COSTE,?ID_E,'#13#10'?FECHA_ENTREGA,?SU_REFERENCIA,?RECT' +
        ',?ID_RECT,?TIPO_PORTES,?POR_PORTES,?I_PORTES,?I_PORTES_CANAL,?CA' +
        'MBIO_FIJO,?VALOR_CAMB_FIJO,'#13#10'?PROYECTO,?OBLIGA_AUTOFACTURA,?FUER' +
        'ZA_MODO_IVA,?MODO_IVA,?Z_TIPO_BIENES,?Z_TIPO_NCF,?Z_PREFIJO_NCF,' +
        '?Z_CONTADOR_NCF,?MODIFICA_DOC,'#13#10'?RECC,?INVERSION_SUJETO_PASIVO,?' +
        'SFV_AUTORIZACION,?SFV_CODIGO_CONTROL,?SFV_CODIGO_RESPUESTA_RAPID' +
        'A,?IMPORTE_ICE_TOTAL,?ID_TIPO_GIRO_PRO_ACR,?CODIGO_GIRO_PRO_ACR,' +
        #13#10'?ID_TIPO_GIRO_EMPRESA,?CODIGO_GIRO_EMPRESA,?TIPO_COMPRA,?CODIG' +
        'O_RESPUESTA_SII,?FOLIO,?IMPORTE_MINIMO_PORTE,?TIPO_DOC_TRIBUTARI' +
        'O,?S_CUOTA_IMPUESTO_ADICIONAL,?S_CUOTA_IMP_ADICIONAL_CANAL,?EMPA' +
        'QUETADO_EMPRESA,'#13#10'?DIR_RECOGIDA_MANUAL,?DIR_ENTREGA_MANUAL,?EQUI' +
        'PO_RECOGIDA,?EQUIPO_ENTREGA,?MATRICULA_RECOGIDA,?MATRICULA_ENTRE' +
        'GA,?FECHA_RECOGIDA_MANUAL,?FECHA_ENTREGA_MANUAL,?IDIOMA,?USUARIO' +
        '_CREACION,?COD_MOTIVO_ABONO,?NIF,?ORIGEN_DOCUMENTO,?OBSERVACIONE' +
        'S,?DOM_ID_TIPO_RETENCION,?DOM_RET_POR_ITBIS,?DOM_RET_POR_ISR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE'
      '  ID_E=?ID_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = '#39'FAP'#39' AND '
      
        '(EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO' +
        ' = 0)))'
      'ORDER BY EJERCICIO,RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_FACTURA_PROV'
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
      '  ,P_IRPF=?P_IRPF '
      '  ,I_IRPF=?I_IRPF '
      '  ,A_IRPF=?A_IRPF '
      '  ,TOTAL_FACTURA=?TOTAL_FACTURA '
      '  ,NUM_FACTURA=?NUM_FACTURA '
      '  ,FORMA_DE_PAGO=?FORMA_DE_PAGO '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,BASE_IRPF=?BASE_IRPF '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,SIN_DETALLE=?SIN_DETALLE '
      '  ,ASIENTO=?ASIENTO '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,REGISTRO=?REGISTRO '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,FECHA_CON=?FECHA_CON '
      '  ,FECHA_SII=?FECHA_SII '
      '  ,SIN_RECIBOS=?SIN_RECIBOS '
      '  ,FUERZA_VENCIMIENTOS=?FUERZA_VENCIMIENTOS '
      '  ,I_FINANCIACION_CANAL=?I_FINANCIACION_CANAL '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,RECT=?RECT '
      '  ,ID_RECT=?ID_RECT '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,PROYECTO=?PROYECTO '
      '  ,OBLIGA_AUTOFACTURA=?OBLIGA_AUTOFACTURA '
      '  ,FUERZA_MODO_IVA=?FUERZA_MODO_IVA '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,Z_TIPO_BIENES=?Z_TIPO_BIENES '
      '  ,Z_TIPO_NCF=?Z_TIPO_NCF '
      '  ,Z_PREFIJO_NCF=?Z_PREFIJO_NCF '
      '  ,Z_CONTADOR_NCF=?Z_CONTADOR_NCF '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,RECC=?RECC '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,SFV_AUTORIZACION=?SFV_AUTORIZACION '
      '  ,SFV_CODIGO_CONTROL=?SFV_CODIGO_CONTROL '
      '  ,SFV_CODIGO_RESPUESTA_RAPIDA=?SFV_CODIGO_RESPUESTA_RAPIDA '
      '  ,IMPORTE_ICE_TOTAL=?IMPORTE_ICE_TOTAL '
      '  ,ID_TIPO_GIRO_PRO_ACR=?ID_TIPO_GIRO_PRO_ACR '
      '  ,CODIGO_GIRO_PRO_ACR=?CODIGO_GIRO_PRO_ACR '
      '  ,ID_TIPO_GIRO_EMPRESA=?ID_TIPO_GIRO_EMPRESA '
      '  ,CODIGO_GIRO_EMPRESA=?CODIGO_GIRO_EMPRESA '
      '  ,TIPO_COMPRA=?TIPO_COMPRA '
      '  ,CODIGO_RESPUESTA_SII=?CODIGO_RESPUESTA_SII '
      '  ,FOLIO=?FOLIO '
      '  ,IMPORTE_MINIMO_PORTE=?IMPORTE_MINIMO_PORTE '
      '  ,TIPO_DOC_TRIBUTARIO=?TIPO_DOC_TRIBUTARIO '
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
      '  ,NIF=?NIF '
      '  ,ORIGEN_DOCUMENTO=?ORIGEN_DOCUMENTO '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,DOM_ID_TIPO_RETENCION=?DOM_ID_TIPO_RETENCION '
      '  ,DOM_RET_POR_ITBIS=?DOM_RET_POR_ITBIS '
      '  ,DOM_RET_POR_ISR=?DOM_RET_POR_ISR '
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
    TableName = 'VER_CABECERAS_FACTURA_PROV'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_E'
      'GES_CABECERAS_E_FAC')
    CamposBloqueo.Strings = (
      'ID_E'
      'ID_E')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
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
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object QMCabeceraDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
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
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMCabeceraPROVEEDORChange
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      OnGetText = QMCabeceraTITULOGetText
      Size = 60
    end
    object QMCabeceraBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
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
      DisplayLabel = 'A. IRPF'
      FieldName = 'A_IRPF'
    end
    object QMCabeceraTOTAL_FACTURA: TFloatField
      DisplayLabel = 'Total Factura'
      FieldName = 'TOTAL_FACTURA'
    end
    object QMCabeceraNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Num. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMCabeceraFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO'
      OnChange = QMCabeceraFORMA_DE_PAGOChange
      Size = 3
    end
    object QMCabeceraTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
      OnChange = QMCabeceraTIPO_IRPFChange
    end
    object QMCabeceraAPLICA_IRPF: TStringField
      FieldKind = fkCalculated
      FieldName = 'APLICA_IRPF'
      OnGetText = QMCabeceraAPLICA_IRPFGetText
      Size = 25
      Calculated = True
    end
    object QMCabeceraBASE_IRPF: TFloatField
      DisplayLabel = 'Base IRPF'
      FieldName = 'BASE_IRPF'
    end
    object QMCabeceraDEVOLUCION: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'DEVOLUCION'
    end
    object QMCabeceraSIN_DETALLE: TIntegerField
      DisplayLabel = 'Sin Det.'
      FieldName = 'SIN_DETALLE'
    end
    object QMCabeceraRIC_FAC: TStringField
      FieldKind = fkCalculated
      FieldName = 'RIC_FAC'
      OnGetText = QMCabeceraRIC_FACGetText
      Size = 8
      Calculated = True
    end
    object QMCabeceraASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMCabeceraREGISTRO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      OnGetText = QMCabeceraREGISTROGetText
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraFECHA_CON: TDateTimeField
      DisplayLabel = 'Fec. Con.'
      FieldName = 'FECHA_CON'
    end
    object QMCabeceraSIN_RECIBOS: TIntegerField
      DisplayLabel = 'Sin Recibos'
      FieldName = 'SIN_RECIBOS'
    end
    object QMCabeceraFUERZA_VENCIMIENTOS: TIntegerField
      DisplayLabel = 'Fuerza Venc.'
      FieldName = 'FUERZA_VENCIMIENTOS'
    end
    object QMCabeceraTOTAL_CANAL: TFloatField
      DisplayLabel = 'Total Canal'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMCabeceraTOTAL_CANALGetText
      Calculated = True
    end
    object QMCabeceraCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMCabeceraI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Can.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object QMCabeceraID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMCabeceraFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
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
      DisplayLabel = 'Val. Cambio Fijo Inv.'
      FieldName = 'VALOR_CAMB_FIJO_INV'
      OnChange = QMCabeceraVALOR_CAMB_FIJO_INVChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMCabeceraOBLIGA_AUTOFACTURA: TIntegerField
      DisplayLabel = 'Obliga Autof.'
      FieldName = 'OBLIGA_AUTOFACTURA'
    end
    object QMCabeceraFUERZA_MODO_IVA: TIntegerField
      DisplayLabel = 'Fuerza M. IVA'
      FieldName = 'FUERZA_MODO_IVA'
      OnChange = QMCabeceraFUERZA_MODO_IVAChange
    end
    object QMCabeceraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCabeceraZ_TIPO_BIENES: TFIBStringField
      DisplayLabel = 'Tipo Bienes'
      FieldName = 'Z_TIPO_BIENES'
      Size = 2
    end
    object QMCabeceraRECT: TIntegerField
      DisplayLabel = 'Rectificativa'
      FieldName = 'RECT'
    end
    object QMCabeceraID_RECT: TIntegerField
      DisplayLabel = 'ID Rect.'
      FieldName = 'ID_RECT'
    end
    object QMCabeceraZ_TIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'Z_TIPO_NCF'
    end
    object QMCabeceraZ_PREFIJO_NCF: TFIBStringField
      DisplayLabel = 'Prefijo NCF'
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object QMCabeceraZ_CONTADOR_NCF: TFIBStringField
      DisplayLabel = 'Contador NCF'
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object QMCabeceraRECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Criterio de Caja'
      FieldName = 'RECC'
    end
    object QMCabeceraFECHA_SII: TDateTimeField
      DisplayLabel = 'Fecha SII'
      FieldName = 'FECHA_SII'
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
    object QMCabeceraREGISTRO_CARTERA: TIntegerField
      DisplayLabel = 'Registro Cartera'
      FieldName = 'REGISTRO_CARTERA'
    end
    object QMCabeceraSFV_AUTORIZACION: TFIBStringField
      DisplayLabel = 'Num Autorizaci'#243'n'
      FieldName = 'SFV_AUTORIZACION'
    end
    object QMCabeceraSFV_CODIGO_CONTROL: TFIBStringField
      DisplayLabel = 'Cod. control'
      FieldName = 'SFV_CODIGO_CONTROL'
    end
    object QMCabeceraIMPORTE_ICE_TOTAL: TFloatField
      DisplayLabel = 'Importe ICE'
      FieldName = 'IMPORTE_ICE_TOTAL'
    end
    object QMCabeceraSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField
      DisplayLabel = 'Cod. Respuesta Rapida'
      FieldName = 'SFV_CODIGO_RESPUESTA_RAPIDA'
      Size = 256
    end
    object QMCabeceraIMPORTE_MINIMO_PORTE: TFloatField
      DisplayLabel = 'Imp. Minimo Portes'
      FieldName = 'IMPORTE_MINIMO_PORTE'
    end
    object QMCabeceraDESC_RECTIFICACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_RECTIFICACION'
      Size = 60
      Calculated = True
    end
    object QMCabeceraS_CUOTA_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Cuota Imp Adic'
      FieldName = 'S_CUOTA_IMPUESTO_ADICIONAL'
    end
    object QMCabeceraS_CUOTA_IMP_ADICIONAL_CANAL: TFloatField
      DisplayLabel = 'Cuota Imp Adic canal'
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
    object QMCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMCabeceraFOLIO: TFIBStringField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
      Size = 40
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraRECIBO_PAGADO: TIntegerField
      DisplayLabel = 'Recibo Pagado'
      FieldName = 'RECIBO_PAGADO'
    end
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraCOD_MOTIVO_ABONO: TIntegerField
      DisplayLabel = 'Motivo Abono'
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object QMCabeceraVENCIMIENTO: TDateTimeField
      DisplayLabel = '1er Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMCabeceraNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMCabeceraMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'MODIFICA_DOC'
    end
    object QMCabeceraORIGEN_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN_DOCUMENTO'
      Size = 3
    end
    object QMCabeceraOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 256
    end
    object QMCabeceraDOM_ID_TIPO_RETENCION: TIntegerField
      DisplayLabel = 'ID Tipo Retencion'
      FieldName = 'DOM_ID_TIPO_RETENCION'
    end
    object QMCabeceraDOM_RET_POR_ITBIS: TFloatField
      DisplayLabel = 'Porc. Ret. ITBIS'
      FieldName = 'DOM_RET_POR_ITBIS'
    end
    object QMCabeceraDOM_RET_POR_ISR: TFloatField
      DisplayLabel = 'Porc. Ret. ISR'
      FieldName = 'DOM_RET_POR_ISR'
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
    RefreshSQL.Strings = (
      'SELECT S_BASES,S_CUOTA_IVA,S_CUOTA_RE,I_IRPF,LIQUIDO,'
      'TOTAL_FACTURA,I_FINANCIACION,B_DTO_LINEAS,I_DTO_LINEAS,'
      'ESTADO FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE '
      'ID_E = ?ID_E'
      '')
    SelectSQL.Strings = (
      
        'SELECT D.S_BASES, D.S_CUOTA_IVA, D.S_CUOTA_RE, D.I_IRPF, D.LIQUI' +
        'DO, D.TOTAL_FACTURA, D.I_FINANCIACION, D.B_DTO_LINEAS,'
      
        '       D.I_DTO_LINEAS, D.ESTADO, D.I_PORTES, D.MODIFICA_DOC, D.I' +
        'MPORTE_ICE_TOTAL, D.S_CUOTA_IMPUESTO_ADICIONAL,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES,'
      '       (SELECT SUM(UNIDADES_SEC)'
      '        FROM GES_DETALLES_E'
      '        WHERE'
      '        ID_E = D.ID_E) SUM_UNIDADES_SEC,'
      '       (SELECT SUM(UNIDADES_LOGISTICAS)'
      '        FROM GES_DETALLES_E_FAC'
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
      'FROM VER_CABECERAS_FACTURA_PROV D'
      'WHERE'
      'D.ID_E = :ID_E')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA_PROV FAC INDEX (GES_CABECERAS_E' +
        '_FAC_ID),VER_CABECERAS_FACTURA_PROV TER INDEX (PK_SYS_TERCEROS),' +
        'VER_CABECERAS_FACTURA_PROV CAB INDEX (GES_CABECERAS_E_ID))')
    Left = 32
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
    object xInfoActualizadaI_IRPF: TFloatField
      DisplayLabel = 'Imp. IRPF'
      FieldName = 'I_IRPF'
    end
    object xInfoActualizadaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xInfoActualizadaTOTAL_FACTURA: TFloatField
      DisplayLabel = 'Total Factura'
      FieldName = 'TOTAL_FACTURA'
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
    object xInfoActualizadaI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
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
    Left = 448
    Top = 16
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT '
      'TERCERO, NOMBRE_R_SOCIAL, DESCUENTO_PP, FORMA_PAGO,'
      'DESCUENTO, MODO_IVA, TITULO, TIPO_IRPF,'
      'POR_FINANCIACION, MONEDA,'
      'TIPO_PORTES, POR_PORTES, I_PORTES, TIPO_NCF,'
      'RECC, NOTAS, GRUPO_CUENTAS, IMPORTE_MINIMO_PORTE,'
      'ID_PROVEEDOR, PAIS_TERCERO, TIPO_DOC_IDENT, NIF, '
      'CUENTA_GASTOS, IDIOMA, PROVEEDOR'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = xProveedorAfterOpen
    BeforeClose = xProveedorBeforeClose
    Left = 32
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
      'read_committed'
      'read')
    Left = 240
    Top = 16
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
    DataSource = DSQMDetalle
    Left = 240
    Top = 256
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
    Left = 560
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
    Left = 560
    Top = 64
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
    Left = 560
    Top = 256
  end
  object QLimpiaProcAuto: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM TMP_PROCESOS_AUTO'
      'WHERE ENTRADA=?ENTRADA AND TIPO='#39'FAP'#39)
    Transaction = TLocal
    AutoTrans = True
    Left = 560
    Top = 112
  end
  object QRegistroIva: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT RIS FROM GES_CABECERAS_E_FAC'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO='#39'FAP'#39
      'AND RIG=?RIG')
    Transaction = TLocal
    AutoTrans = True
    Left = 560
    Top = 304
  end
  object QAsiento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT RIC FROM GES_CABECERAS_E_FAC'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO='#39'FAP'#39
      'AND RIG=?RIG')
    Transaction = TLocal
    AutoTrans = True
    Left = 560
    Top = 352
  end
  object QMNIF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
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
      'TIPO = ?TIPO AND /*Para evitar colisiones con ticket*/'
      'ID_E = ?ID_E')
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
    Left = 32
    Top = 400
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
    Top = 400
  end
  object QSPProcedencia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMDetalle
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 304
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 136
    Top = 304
  end
  object QMCabecerasCostes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_COSTES'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_COSTES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,DIGITO_1,DIGITO_2,DIGI' +
        'TO_3,DIGITO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?DIGITO_1,?DIGIT' +
        'O_2,?DIGITO_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_COSTES'
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_COSTES'
      '  WHERE'
      '               EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               SERIE=?SERIE AND'
      '               TIPO='#39'FAP'#39' AND'
      '               RIG=?RIG ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_COSTES'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_COSTES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 240
    Top = 112
    object QMCabecerasCostesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabecerasCostesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabecerasCostesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabecerasCostesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabecerasCostesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabecerasCostesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabecerasCostesDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
  end
  object QMDetallesCostes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_COSTES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_COSTES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,DIGITO_1,DIGITO_' +
        '2,DIGITO_3,DIGITO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?DIGITO_1' +
        ',?DIGITO_2,?DIGITO_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_COSTES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_COSTES'
      '  WHERE'
      '               EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               SERIE=?SERIE AND'
      '               TIPO='#39'FAP'#39' AND'
      '               RIG=?RIG AND'
      '               LINEA=?LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_COSTES'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDetalle
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_COSTES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 240
    Top = 160
    object QMDetallesCostesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallesCostesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetallesCostesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallesCostesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetallesCostesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallesCostesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallesCostesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallesCostesDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMDetallesCostesDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMDetallesCostesDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMDetallesCostesDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMDetallesCostesDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
  end
  object xCuentaArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ART.CTA_COMPRAS, CON.CENTRO_COSTE'
      'FROM CON_CUENTAS_GES_ART ART'
      'JOIN CON_CUENTAS CON'
      'ON'
      'ART.EMPRESA = CON.EMPRESA AND'
      'ART.EJERCICIO = CON.EJERCICIO AND'
      'ART.CANAL = CON.CANAL AND'
      'ART.CTA_COMPRAS = CON.CUENTA AND'
      'ART.CTA_COMPRAS_PGC = CON.PGC'
      'WHERE'
      'ART.EMPRESA = ?EMPRESA AND'
      'ART.EJERCICIO = ?EJERCICIO AND'
      'ART.CANAL = ?CANAL AND'
      'ART.ARTICULO = ?ARTICULO'
      '')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 240
    Top = 208
    object xCuentaArticuloCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object xCuentaArticuloCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
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
    Left = 560
    Top = 400
  end
  object DSxTipoIRPF: TDataSource
    DataSet = xTipoIRPF
    Left = 136
    Top = 352
  end
  object xTipoIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,P_IRPF,BASE FROM SYS_TIPO_IRPF'
      'WHERE TIPO = ?TIPO_IRPF AND'
      'PAIS = ?PAIS')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 352
  end
  object QPortes: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TIPO_PORTES,POR_PORTES,I_PORTES'
      'FROM CON_CUENTAS_GES_PRO'
      'WHERE ((EMPRESA=?EMPRESA) AND'
      '                (EJERCICIO=?EJERCICIO)AND'
      '                (CANAL=?CANAL)AND'
      '               (PROVEEDOR=?PROVEEDOR))')
    Transaction = TLocal
    AutoTrans = True
    Left = 448
    Top = 160
  end
  object QCreaRectificacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_crea_factura_rectificacion_e (?EMPRESA,?D_EJ' +
        'ERCICIO,?D_CANAL,'
      '?D_SERIE,?D_FECHA,?O_EJERCICIO,?O_SERIE,?O_RIG,?ENTRADA,?TIPO)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 560
    Top = 208
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 336
    Top = 16
  end
  object xTipoNCF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF'
      'WHERE'
      'TIPO_NCF=?TIPO_NCF')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF '
      'WHERE TIPO_DOCUMENTO IN (0, 1)'
      'ORDER BY TIPO_NCF')
    UniDirectional = False
    Left = 32
    Top = 256
    object xTipoNCFTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object xTipoNCFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTipoNCF: TDataSource
    DataSet = xTipoNCF
    Left = 136
    Top = 256
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 136
    Top = 160
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
    Left = 32
    Top = 160
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
      'TIPO_DOCUMENTO = '#39'FAP'#39' AND'
      'ACTIVO = 1')
    UniDirectional = False
    DataSource = DSxProveedor
    Left = 448
    Top = 208
  end
  object QMSIIDteReferencia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_DTE_REFERENCIA_COMPRAS'
      'WHERE'
      '  NROLINREF=?old_NROLINREF AND '
      '  ID_E=?old_ID_E ')
    InsertSQL.Strings = (
      'INSERT INTO SII_DTE_REFERENCIA_COMPRAS'
      
        '  (ID_E,NROLINREF,ID_E_REF,TPODOCREF,FOLIOREF,FCHREF,CODREF,RAZO' +
        'NREF,RUTOTR)'
      'VALUES'
      
        '  (?ID_E,?NROLINREF,?ID_E_REF,?TPODOCREF,?FOLIOREF,?FCHREF,?CODR' +
        'EF,?RAZONREF,?RUTOTR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_DTE_REFERENCIA_COMPRAS'
      'WHERE'
      '  NROLINREF=?NROLINREF AND '
      '  ID_E=?ID_E ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_DTE_REFERENCIA_COMPRAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_DTE_REFERENCIA_COMPRAS'
      'SET'
      '  ID_E_REF=?ID_E_REF '
      '  ,TPODOCREF=?TPODOCREF '
      '  ,FOLIOREF=?FOLIOREF '
      '  ,FCHREF=?FCHREF '
      '  ,CODREF=?CODREF '
      '  ,RAZONREF=?RAZONREF '
      '  ,RUTOTR=?RUTOTR '
      'WHERE'
      '  NROLINREF=?NROLINREF AND '
      '  ID_E=?ID_E ')
    DataSource = DSQMCabecera
    AfterPost = QMSIIDteReferenciaAfterPost
    OnNewRecord = QMSIIDteReferenciaNewRecord
    ClavesPrimarias.Strings = (
      'NROLINREF '
      'ID_E ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_DTE_REFERENCIA_COMPRAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 480
    object QMSIIDteReferenciaID_E: TIntegerField
      FieldName = 'ID_E'
    end
    object QMSIIDteReferenciaNROLINREF: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'NROLINREF'
    end
    object QMSIIDteReferenciaID_E_REF: TIntegerField
      DisplayLabel = 'ID_E Ref'
      FieldName = 'ID_E_REF'
    end
    object QMSIIDteReferenciaTPODOCREF: TFIBStringField
      DisplayLabel = 'Tipo Doc Ref'
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object QMSIIDteReferenciaFOLIOREF: TFIBStringField
      DisplayLabel = 'Folio Ref'
      FieldName = 'FOLIOREF'
    end
    object QMSIIDteReferenciaFCHREF: TDateTimeField
      DisplayLabel = 'Fecha Ref'
      FieldName = 'FCHREF'
    end
    object QMSIIDteReferenciaCODREF: TIntegerField
      DisplayLabel = 'Cod Ref'
      FieldName = 'CODREF'
    end
    object QMSIIDteReferenciaRAZONREF: TFIBStringField
      DisplayLabel = 'Razon Ref'
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMSIIDteReferenciaRUTOTR: TFIBStringField
      DisplayLabel = 'Rut Otro'
      FieldName = 'RUTOTR'
    end
  end
  object DSQMSIIDteReferencia: TDataSource
    DataSet = QMSIIDteReferencia
    Left = 144
    Top = 480
  end
  object xFacturaCompraDGII: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT ID_E, ID_ENVIO, STAMP_DATE, STATUS, SECURITY_CODE, SEQUEN' +
        'CE_CONSUMED,'
      '       ENCF, URL_XML, URL_PDF, DOCUMENT_STAMP_URL, TRACK_ID, '
      
        '       GOVERMENT_RESPONSE, MENSAJE_ERROR_ENVIO_ECF, STATUS_CONSU' +
        'LTA, '
      '       LEGAL_STATUS_CONSULTA, MENSAJE_ERROR_CONSULTA_ECF'
      'FROM GES_CABECERAS_E_FAC_DGII'
      'WHERE'
      'ID_E = :ID_E')
    SelectSQL.Strings = (
      
        'SELECT ID_E, ID_ENVIO, STAMP_DATE, STATUS, SECURITY_CODE, SEQUEN' +
        'CE_CONSUMED,'
      '       ENCF, URL_XML, URL_PDF, DOCUMENT_STAMP_URL, TRACK_ID, '
      
        '       GOVERMENT_RESPONSE, MENSAJE_ERROR_ENVIO_ECF, STATUS_CONSU' +
        'LTA, '
      
        '       LEGAL_STATUS_CONSULTA, MENSAJE_ERROR_CONSULTA_ECF,CODIGO_' +
        'ERROR_ENVIO'
      'FROM GES_CABECERAS_E_FAC_DGII'
      'WHERE'
      'ID_E = :ID_E')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 240
    Top = 304
    object xFacturaCompraDGIIID_E: TIntegerField
      FieldName = 'ID_E'
    end
    object xFacturaCompraDGIIID_ENVIO: TFIBStringField
      FieldName = 'ID_ENVIO'
      Size = 40
    end
    object xFacturaCompraDGIISTAMP_DATE: TFIBStringField
      FieldName = 'STAMP_DATE'
    end
    object xFacturaCompraDGIISTATUS: TFIBStringField
      FieldName = 'STATUS'
    end
    object xFacturaCompraDGIISECURITY_CODE: TFIBStringField
      FieldName = 'SECURITY_CODE'
    end
    object xFacturaCompraDGIISEQUENCE_CONSUMED: TIntegerField
      FieldName = 'SEQUENCE_CONSUMED'
    end
    object xFacturaCompraDGIIENCF: TFIBStringField
      FieldName = 'ENCF'
    end
    object xFacturaCompraDGIIURL_XML: TFIBStringField
      FieldName = 'URL_XML'
      Size = 500
    end
    object xFacturaCompraDGIIURL_PDF: TFIBStringField
      FieldName = 'URL_PDF'
      Size = 500
    end
    object xFacturaCompraDGIIDOCUMENT_STAMP_URL: TFIBStringField
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object xFacturaCompraDGIITRACK_ID: TFIBStringField
      FieldName = 'TRACK_ID'
      Size = 40
    end
    object xFacturaCompraDGIIGOVERMENT_RESPONSE: TFIBStringField
      FieldName = 'GOVERMENT_RESPONSE'
      Size = 256
    end
    object xFacturaCompraDGIIMENSAJE_ERROR_ENVIO_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_ENVIO_ECF'
      Size = 500
    end
    object xFacturaCompraDGIISTATUS_CONSULTA: TFIBStringField
      FieldName = 'STATUS_CONSULTA'
    end
    object xFacturaCompraDGIILEGAL_STATUS_CONSULTA: TFIBStringField
      FieldName = 'LEGAL_STATUS_CONSULTA'
    end
    object xFacturaCompraDGIIMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_CONSULTA_ECF'
      Size = 500
    end
    object xFacturaCompraDGIICODIGO_ERROR_ENVIO: TFIBStringField
      DisplayLabel = 'Cod Error Envio'
      FieldName = 'CODIGO_ERROR_ENVIO'
    end
  end
  object DSxFacturaCompraDGII: TDataSource
    DataSet = xFacturaCompraDGII
    Left = 344
    Top = 304
  end
end
