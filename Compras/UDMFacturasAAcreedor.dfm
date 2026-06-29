object DMFacturasAAcr: TDMFacturasAAcr
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 625
  Top = 223
  Height = 494
  Width = 723
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_FACTURA_ACR'
      'WHERE'
      '  ID_DETALLES_E=?old_ID_DETALLES_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_FACTURA_ACR'
      
        '  (SERIE,UNIDADES,PRECIO,P_COSTE,BRUTO,I_DESCUENTO,B_IMPONIBLE,N' +
        'OTAS,NOTAS2,RIG,LINEA,DESCUENTO,P_IVA,P_RECARGO,ENTRADA,TITULO_C' +
        'UENTA,ID_A,ID_C_A,ID_E,ID_DETALLES_E,ORDEN,PROYECTO,EMPRESA,EJER' +
        'CICIO,CANAL,TITULO,TIPO_IVA,SUPLIDO,CENTRO_COSTE,INVERSION_SUJET' +
        'O_PASIVO,TIPO,ALMACEN,ARTICULO,PAIS,CUENTA_GASTOS,CRC_NOTAS,CRC_' +
        'NOTAS2)'
      'VALUES'
      
        '  (?SERIE,?UNIDADES,?PRECIO,?P_COSTE,?BRUTO,?I_DESCUENTO,?B_IMPO' +
        'NIBLE,?NOTAS,?NOTAS2,?RIG,?LINEA,?DESCUENTO,?P_IVA,?P_RECARGO,?E' +
        'NTRADA,?TITULO_CUENTA,?ID_A,?ID_C_A,?ID_E,?ID_DETALLES_E,?ORDEN,' +
        '?PROYECTO,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?TIPO_IVA,?SUPLIDO,' +
        '?CENTRO_COSTE,?INVERSION_SUJETO_PASIVO,?TIPO,?ALMACEN,?ARTICULO,' +
        '?PAIS,?CUENTA_GASTOS,?CRC_NOTAS,?CRC_NOTAS2)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_FACTURA_ACR'
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA_ACR'
      'WHERE'
      '  ID_E = ?ID_E'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_FACTURA_ACR'
      'SET'
      '  SERIE=?SERIE '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,P_COSTE=?P_COSTE '
      '  ,BRUTO=?BRUTO '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,NOTAS=?NOTAS '
      '  ,NOTAS2=?NOTAS2 '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,ENTRADA=?ENTRADA '
      '  ,TITULO_CUENTA=?TITULO_CUENTA '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_E=?ID_E '
      '  ,ORDEN=?ORDEN '
      '  ,PROYECTO=?PROYECTO '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,TITULO=?TITULO '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,TIPO=?TIPO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,PAIS=?PAIS '
      '  ,CUENTA_GASTOS=?CUENTA_GASTOS '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    AfterScroll = QMDetalleAfterScroll
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
    TableName = 'VER_DETALLE_FACTURA_ACR'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_E'
      'GES_DETALLES_E_FCR')
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
      DisplayLabel = 'Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      EditMask = '>ccccccccccccccc;0;_'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleCUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cuenta Gastos'
      FieldName = 'CUENTA_GASTOS'
      OnChange = QMDetalleCUENTA_GASTOSChange
      Size = 15
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
      DisplayLabel = 'Imp. Dto.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto L'#237'nea'
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
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
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
    object QMDetalleTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo Cuenta'
      DisplayWidth = 150
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
    object QMDetalleSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object QMDetalleCENTRO_COSTE: TIntegerField
      DisplayLabel = 'C. Coste'
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
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'ISP'
      FieldName = 'INVERSION_SUJETO_PASIVO'
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
      'DELETE FROM VER_CABECERAS_FACTURA_ACR'
      'WHERE'
      '  ID_E=?old_ID_E ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_FACTURA_ACR'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',ACREEDOR,TERCERO,'#13#10'DIRECCION,TITULO,NOTAS,ESTADO,BULTOS,LINEAS,' +
        'BRUTO,I_DTO_LINEAS,S_BASES,S_CUOTA_IVA,'#13#10'S_CUOTA_RE,DTO_PP,DTO_C' +
        'IAL,I_DTO_CIAL,I_DTO_PP,ENTRADA,P_IRPF,I_IRPF,'#13#10'A_IRPF,TOTAL_FAC' +
        'TURA,NUM_FACTURA,FORMA_DE_PAGO,TIPO_IRPF,DEVOLUCION,ASIENTO,NOMB' +
        'RE_COMERCIAL,REGISTRO,POR_FINANCIACION,'#13#10'I_FINANCIACION,FECHA_CO' +
        'N,FECHA_SII,SIN_RECIBOS,ARRENDAMIENTO,FUERZA_VENCIMIENTOS,I_FINA' +
        'NCIACION_CANAL,CENTRO_COSTE,TIPO_ASIENTO_KRI,LEASING,'#13#10'GASTOS_LE' +
        'ASING,ID_E,FECHA_ENTREGA,RECT,ID_RECT,CAMBIO_FIJO,VALOR_CAMB_FIJ' +
        'O,SU_REFERENCIA,PROYECTO,'#13#10'OBLIGA_AUTOFACTURA,FUERZA_MODO_IVA,MO' +
        'DO_IVA,Z_TIPO_BIENES,Z_TIPO_NCF,Z_PREFIJO_NCF,Z_CONTADOR_NCF,MOD' +
        'IFICA_DOC,RECC,INVERSION_SUJETO_PASIVO,'#13#10'ID_TIPO_GIRO_PRO_ACR,CO' +
        'DIGO_GIRO_PRO_ACR,ID_TIPO_GIRO_EMPRESA,CODIGO_GIRO_EMPRESA,TIPO_' +
        'COMPRA,CODIGO_RESPUESTA_SII,FOLIO,IDIOMA,'#13#10'USUARIO_CREACION,OBSE' +
        'RVACIONES)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?ACREEDOR,?TERCERO,'#13#10'?DIRECCION,?TITULO,?NOTAS,?ESTADO' +
        ',?BULTOS,?LINEAS,?BRUTO,?I_DTO_LINEAS,?S_BASES,?S_CUOTA_IVA,'#13#10'?S' +
        '_CUOTA_RE,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?ENTRADA,?P_IR' +
        'PF,?I_IRPF,'#13#10'?A_IRPF,?TOTAL_FACTURA,?NUM_FACTURA,?FORMA_DE_PAGO,' +
        '?TIPO_IRPF,?DEVOLUCION,?ASIENTO,?NOMBRE_COMERCIAL,?REGISTRO,?POR' +
        '_FINANCIACION,'#13#10'?I_FINANCIACION,?FECHA_CON,?FECHA_SII,?SIN_RECIB' +
        'OS,?ARRENDAMIENTO,?FUERZA_VENCIMIENTOS,?I_FINANCIACION_CANAL,?CE' +
        'NTRO_COSTE,?TIPO_ASIENTO_KRI,?LEASING,'#13#10'?GASTOS_LEASING,?ID_E,?F' +
        'ECHA_ENTREGA,?RECT,?ID_RECT,?CAMBIO_FIJO,?VALOR_CAMB_FIJO,?SU_RE' +
        'FERENCIA,?PROYECTO,'#13#10'?OBLIGA_AUTOFACTURA,?FUERZA_MODO_IVA,?MODO_' +
        'IVA,?Z_TIPO_BIENES,?Z_TIPO_NCF,?Z_PREFIJO_NCF,?Z_CONTADOR_NCF,?M' +
        'ODIFICA_DOC,?RECC,?INVERSION_SUJETO_PASIVO,'#13#10'?ID_TIPO_GIRO_PRO_A' +
        'CR,?CODIGO_GIRO_PRO_ACR,?ID_TIPO_GIRO_EMPRESA,?CODIGO_GIRO_EMPRE' +
        'SA,?TIPO_COMPRA,?CODIGO_RESPUESTA_SII,?FOLIO,?IDIOMA,'#13#10'?USUARIO_' +
        'CREACION,?OBSERVACIONES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA_ACR'
      'WHERE'
      '  ID_E=?ID_E ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_ACR'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = '#39'FCR'#39' AND '
      
        '(EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO' +
        ' = 0)))'
      'ORDER BY EJERCICIO,RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_FACTURA_ACR'
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
      '  ,ACREEDOR=?ACREEDOR '
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
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,ASIENTO=?ASIENTO '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,REGISTRO=?REGISTRO '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,FECHA_CON=?FECHA_CON '
      '  ,FECHA_SII=?FECHA_SII '
      '  ,SIN_RECIBOS=?SIN_RECIBOS '
      '  ,ARRENDAMIENTO=?ARRENDAMIENTO '
      '  ,FUERZA_VENCIMIENTOS=?FUERZA_VENCIMIENTOS '
      '  ,I_FINANCIACION_CANAL=?I_FINANCIACION_CANAL '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI '
      '  ,LEASING=?LEASING '
      '  ,GASTOS_LEASING=?GASTOS_LEASING '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,RECT=?RECT '
      '  ,ID_RECT=?ID_RECT '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
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
      '  ,ID_TIPO_GIRO_PRO_ACR=?ID_TIPO_GIRO_PRO_ACR '
      '  ,CODIGO_GIRO_PRO_ACR=?CODIGO_GIRO_PRO_ACR '
      '  ,ID_TIPO_GIRO_EMPRESA=?ID_TIPO_GIRO_EMPRESA '
      '  ,CODIGO_GIRO_EMPRESA=?CODIGO_GIRO_EMPRESA '
      '  ,TIPO_COMPRA=?TIPO_COMPRA '
      '  ,CODIGO_RESPUESTA_SII=?CODIGO_RESPUESTA_SII '
      '  ,FOLIO=?FOLIO '
      '  ,IDIOMA=?IDIOMA '
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
    TableName = 'VER_CABECERAS_FACTURA_ACR'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_E'
      'GES_CABECERAS_E_FCR')
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
      DisplayLabel = 'Factura'
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
    object QMCabeceraACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
      OnChange = QMCabeceraACREEDORChange
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnGetText = QMCabeceraTITULOGetText
      Size = 60
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
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
      DisplayLabel = 'Imp. Dto. P.P.'
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
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
      DisplayLabel = 'N'#250'm. Factura'
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
    object QMCabeceraDEVOLUCION: TIntegerField
      DisplayLabel = 'Devoluci'#243'n'
      FieldName = 'DEVOLUCION'
    end
    object QMCabeceraASIENTO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
      OnGetText = QMCabeceraRICGetText
    end
    object QMCabeceraRIC_FAC: TStringField
      DisplayLabel = 'RIC Fact.'
      FieldKind = fkCalculated
      FieldName = 'RIC_FAC'
      Size = 8
      Calculated = True
    end
    object QMCabeceraAPLICA_IRPF: TStringField
      DisplayLabel = 'Aplica IRPF'
      FieldKind = fkCalculated
      FieldName = 'APLICA_IRPF'
      OnGetText = QMCabeceraAPLICA_IRPFGetText
      Size = 45
      Calculated = True
    end
    object QMCabeceraREGISTRO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      OnGetText = QMCabeceraREGISTROGetText
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraFECHA_CON: TDateTimeField
      DisplayLabel = 'Fecha Con.'
      FieldName = 'FECHA_CON'
    end
    object QMCabeceraSIN_RECIBOS: TIntegerField
      DisplayLabel = 'Sin Recibos'
      FieldName = 'SIN_RECIBOS'
    end
    object QMCabeceraARRENDAMIENTO: TIntegerField
      DisplayLabel = 'Arrendamiento'
      FieldName = 'ARRENDAMIENTO'
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
    object QMCabeceraI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Canal'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object QMCabeceraLEASING: TIntegerField
      DisplayLabel = 'Leasing'
      FieldName = 'LEASING'
    end
    object QMCabeceraGASTOS_LEASING: TFloatField
      DisplayLabel = 'Gastos Leasing'
      FieldName = 'GASTOS_LEASING'
    end
    object QMCabeceraTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento KRI'
      FieldName = 'TIPO_ASIENTO_KRI'
      OnChange = QMCabeceraTIPO_ASIENTO_KRIChange
      Size = 3
    end
    object QMCabeceraCENTRO_COSTE: TIntegerField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMCabeceraID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMCabeceraFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
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
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
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
      DisplayLabel = 'Rect.'
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
    object QMCabeceraDESC_RECTIFICACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_RECTIFICACION'
      Size = 60
      Calculated = True
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
    object QMCabeceraRECIBO_PAGADO: TIntegerField
      DisplayLabel = 'Recibo Pagado'
      FieldName = 'RECIBO_PAGADO'
    end
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraVENCIMIENTO: TDateTimeField
      DisplayLabel = '1er Vencimiento'
      FieldName = 'VENCIMIENTO'
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
    RefreshSQL.Strings = (
      'SELECT S_BASES,S_CUOTA_IVA,S_CUOTA_RE,I_IRPF,LIQUIDO,'
      'TOTAL_FACTURA,I_FINANCIACION,B_DTO_LINEAS,I_DTO_LINEAS,'
      'ESTADO FROM VER_CABECERAS_FACTURA_ACR'
      'WHERE '
      'ID_E = ?ID_E')
    SelectSQL.Strings = (
      'SELECT S_BASES,S_CUOTA_IVA,S_CUOTA_RE,I_IRPF,LIQUIDO,'
      'TOTAL_FACTURA,I_FINANCIACION,B_DTO_LINEAS,I_DTO_LINEAS,'
      'ESTADO,MODIFICA_DOC '
      'FROM VER_CABECERAS_FACTURA_ACR'
      'WHERE '
      'ID_E = ?ID_E')
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
    Left = 352
    Top = 112
  end
  object xAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TERCERO, TITULO, NOMBRE_R_SOCIAL, MODO_IVA, DESCUENTO_PP,'
      'FORMA_PAGO,TIPO, CUENTA_GASTOS,TIPO_IRPF,POR_FINANCIACION,'
      'MONEDA, TIPO_NCF, RECC, NOTAS, ID_ACREEDOR, IDIOMA,'
      'PAIS_TERCERO, TIPO_DOC_IDENT, NIF'
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'ACREEDOR=?ACREEDOR')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = xAcreedorAfterOpen
    BeforeClose = xAcreedorBeforeClose
    Left = 40
    Top = 208
  end
  object DSxAcreedor: TDataSource
    DataSet = xAcreedor
    Left = 136
    Top = 208
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
      
        'SELECT TITULO, HEREDA_FINANCIACION, SIN_RECIBOS FROM CON_CUENTAS' +
        '_GES_FP'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'FORMA_PAGO=?FORMA_DE_PAGO')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 352
    Top = 16
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
    Left = 40
    Top = 112
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
    Top = 112
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
      '               TIPO='#39'FCR'#39' AND'
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
    Left = 248
    Top = 16
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
      '               TIPO='#39'FCR'#39' AND'
      '               RIG=?RIG AND'
      #9'LINEA=?LINEA')
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
    Left = 248
    Top = 64
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
      'SELECT CENTRO_COSTE FROM CON_CUENTAS '
      
        '  WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CAN' +
        'AL AND CUENTA=?CUENTA_GASTOS AND PGC=?PGC')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 248
    Top = 112
    object xCuentaArticuloCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
    end
  end
  object DSxTipoIRPF: TDataSource
    DataSet = xTipoIRPF
    Left = 136
    Top = 400
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
    Left = 40
    Top = 400
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 352
    Top = 64
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
    Left = 40
    Top = 304
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
    Top = 304
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 136
    Top = 352
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
    Top = 352
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
      'TIPO_OBJETO = '#39'ACR'#39' AND'
      'ID_OBJETO = :ID_ACREEDOR AND'
      'TIPO_DOCUMENTO = '#39'FCR'#39' AND'
      'ACTIVO = 1')
    UniDirectional = False
    DataSource = DSxAcreedor
    Left = 248
    Top = 160
  end
end
