object DMTicketVenta: TDMTicketVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 509
  Top = 279
  Height = 489
  Width = 722
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 360
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
    Left = 360
    Top = 56
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_CABECERA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_CABECERA'
      
        '(Z_CONTADOR_NCF,DTO_CIAL,S_BASES,I_DTO_PP,DTO_PP,I_DTO_CIAL,S_CU' +
        'OTA_RE,S_CUOTA_IVA,'
      
        'I_DTO_LINEAS,BRUTO,NOTAS,FECHA,A_DEVOLVER,A_DEVOLVER_CANAL,S_BAS' +
        'ES_CANAL,'
      
        'S_CUOTA_RE_CANAL,S_CUOTA_IVA_CANAL,ID_FAMILIA,ID_TICKET_DEVOLUCI' +
        'ON,ID_TICKET,'
      
        'FACTURACION,AGENTE,TIPO_GASTO,ACREEDOR,ENTRADA,CLIENTE,TERCERO,R' +
        'VT,RIT,SERIE,CAJA,'
      
        'SESION,ENTRADA_FAC,LINEAS,Z_TIPO_NCF,TURNO,CONTROL_STOCK,MODO_IV' +
        'A,ESTADO,DESCRIPCION,'
      
        'USUARIO,CANAL,EJERCICIO,EMPRESA,DEVOLUCION,CHG_MONEDA,CANAL_A_FA' +
        'CTURAR,FECHA_HORA,'
      
        'Z_PREFIJO_NCF,TARIFA,FORMA_PAGO,MONEDA,ALMACEN,TIPO,TIPO_RELACIO' +
        'N,SFV_AUTORIZACION,SFV_CODIGO_CONTROL,'
      'SFV_NUM_DOSIFICACION)'
      'VALUES'
      
        '  (?Z_CONTADOR_NCF,?DTO_CIAL,?S_BASES,?I_DTO_PP,?DTO_PP,?I_DTO_C' +
        'IAL,?S_CUOTA_RE,?S_CUOTA_IVA,'
      
        '  ?I_DTO_LINEAS,?BRUTO,?NOTAS,?FECHA,?A_DEVOLVER,?A_DEVOLVER_CAN' +
        'AL,?S_BASES_CANAL,?S_CUOTA_RE_CANAL,'
      
        '  ?S_CUOTA_IVA_CANAL,?ID_FAMILIA,?ID_TICKET_DEVOLUCION,?ID_TICKE' +
        'T,?FACTURACION,?AGENTE,?TIPO_GASTO,'
      
        '  ?ACREEDOR,?ENTRADA,?CLIENTE,?TERCERO,?RVT,?RIT,?SERIE,?CAJA,?S' +
        'ESION,?ENTRADA_FAC,?LINEAS,'
      
        '  ?Z_TIPO_NCF,?TURNO,?CONTROL_STOCK,?MODO_IVA,?ESTADO,?DESCRIPCI' +
        'ON,?USUARIO,?CANAL,'
      
        '  ?EJERCICIO,?EMPRESA,?DEVOLUCION,?CHG_MONEDA,?CANAL_A_FACTURAR,' +
        '?FECHA_HORA,?Z_PREFIJO_NCF,'
      
        '  ?TARIFA,?FORMA_PAGO,?MONEDA,?ALMACEN,?TIPO,?TIPO_RELACION,?SFV' +
        '_AUTORIZACION,?SFV_CODIGO_CONTROL,'
      '  ?SFV_NUM_DOSIFICACION)'
      ' '
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_CABECERA'
      'WHERE'
      '  ID_TICKET=?ID_TICKET')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_CABECERA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_CABECERA'
      'SET'
      '  Z_CONTADOR_NCF=?Z_CONTADOR_NCF '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,S_BASES=?S_BASES '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,DTO_PP=?DTO_PP'
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,BRUTO=?BRUTO '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA=?FECHA '
      '  ,A_DEVOLVER=?A_DEVOLVER '
      '  ,A_DEVOLVER_CANAL=?A_DEVOLVER_CANAL '
      '  ,S_BASES_CANAL=?S_BASES_CANAL '
      '  ,S_CUOTA_RE_CANAL=?S_CUOTA_RE_CANAL '
      '  ,S_CUOTA_IVA_CANAL=?S_CUOTA_IVA_CANAL '
      '  ,ID_FAMILIA=?ID_FAMILIA '
      '  ,ID_TICKET_DEVOLUCION=?ID_TICKET_DEVOLUCION '
      '  ,ID_TICKET=?ID_TICKET '
      '  ,FACTURACION=?FACTURACION '
      '  ,AGENTE=?AGENTE '
      '  ,TIPO_GASTO=?TIPO_GASTO '
      '  ,ACREEDOR=?ACREEDOR '
      '  ,ENTRADA=?ENTRADA '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,RVT=?RVT '
      '  ,CAJA=?CAJA'
      '  ,SESION=?SESION '
      '  ,ENTRADA_FAC=?ENTRADA_FAC '
      '  ,LINEAS=?LINEAS '
      '  ,Z_TIPO_NCF=?Z_TIPO_NCF '
      '  ,TURNO=?TURNO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ESTADO=?ESTADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,USUARIO=?USUARIO '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,CHG_MONEDA=?CHG_MONEDA '
      '  ,CANAL_A_FACTURAR=?CANAL_A_FACTURAR '
      '  ,FECHA_HORA=?FECHA_HORA '
      '  ,Z_PREFIJO_NCF=?Z_PREFIJO_NCF '
      '  ,TARIFA=?TARIFA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,MONEDA=?MONEDA '
      '  ,ALMACEN=?ALMACEN '
      '  ,TIPO_RELACION=?TIPO_RELACION '
      '  ,SFV_NUM_DOSIFICACION=?SFV_NUM_DOSIFICACION'
      'WHERE'
      '  ID_TICKET=?ID_TICKET'
      '')
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = QMCabeceraAfterPost
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID_TICKET'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_CABECERA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMCabeceraEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIT: TIntegerField
      FieldName = 'RIT'
    end
    object QMCabeceraRVT: TIntegerField
      FieldName = 'RVT'
    end
    object QMCabeceraSESION: TIntegerField
      FieldName = 'SESION'
    end
    object QMCabeceraCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object QMCabeceraTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QMCabeceraUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object QMCabeceraALMACEN: TFIBStringField
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabeceraMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCabeceraFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMCabeceraFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabeceraNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object QMCabeceraCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QMCabeceraESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object QMCabeceraMODO_IVA: TIntegerField
      FieldName = 'MODO_IVA'
    end
    object QMCabeceraENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object QMCabeceraBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object QMCabeceraI_DTO_LINEAS: TFloatField
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabeceraS_CUOTA_IVA: TFloatField
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabeceraS_CUOTA_RE: TFloatField
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraDTO_CIAL: TFloatField
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraI_DTO_CIAL: TFloatField
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabeceraDTO_PP: TFloatField
      FieldName = 'DTO_PP'
    end
    object QMCabeceraI_DTO_PP: TFloatField
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraS_BASES: TFloatField
      FieldName = 'S_BASES'
    end
    object QMCabeceraLINEAS: TIntegerField
      FieldName = 'LINEAS'
    end
    object QMCabeceraLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraCONTROL_STOCK: TIntegerField
      FieldName = 'CONTROL_STOCK'
    end
    object QMCabeceraA_DEVOLVER: TFloatField
      FieldName = 'A_DEVOLVER'
    end
    object QMCabeceraENTRADA_FAC: TIntegerField
      FieldName = 'ENTRADA_FAC'
    end
    object QMCabeceraDEVOLUCION: TIntegerField
      FieldName = 'DEVOLUCION'
    end
    object QMCabeceraTARIFA: TFIBStringField
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMCabeceraS_CUOTA_IVA_CANAL: TFloatField
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object QMCabeceraS_CUOTA_RE_CANAL: TFloatField
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object QMCabeceraS_BASES_CANAL: TFloatField
      FieldName = 'S_BASES_CANAL'
    end
    object QMCabeceraCHG_MONEDA: TIntegerField
      FieldName = 'CHG_MONEDA'
    end
    object QMCabeceraA_DEVOLVER_CANAL: TFloatField
      FieldName = 'A_DEVOLVER_CANAL'
    end
    object QMCabeceraLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMCabeceraACREEDOR: TIntegerField
      FieldName = 'ACREEDOR'
    end
    object QMCabeceraTIPO_GASTO: TIntegerField
      FieldName = 'TIPO_GASTO'
    end
    object QMCabeceraTIPO_RELACION: TFIBStringField
      FieldName = 'TIPO_RELACION'
      Size = 3
    end
    object QMCabeceraCANAL_A_FACTURAR: TIntegerField
      FieldName = 'CANAL_A_FACTURAR'
    end
    object QMCabeceraAGENTE: TIntegerField
      FieldName = 'AGENTE'
    end
    object QMCabeceraFACTURACION: TIntegerField
      FieldName = 'FACTURACION'
    end
    object QMCabeceraID_TICKET: TIntegerField
      FieldName = 'ID_TICKET'
    end
    object QMCabeceraID_TICKET_DEVOLUCION: TIntegerField
      FieldName = 'ID_TICKET_DEVOLUCION'
    end
    object QMCabeceraID_FAMILIA: TIntegerField
      FieldName = 'ID_FAMILIA'
    end
    object QMCabeceraFECHA_HORA: TFIBStringField
      FieldName = 'FECHA_HORA'
      Size = 15
    end
    object QMCabeceraZ_PREFIJO_NCF: TFIBStringField
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object QMCabeceraZ_CONTADOR_NCF: TFIBStringField
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object QMCabeceraZ_TIPO_NCF: TIntegerField
      FieldName = 'Z_TIPO_NCF'
    end
    object QMCabeceraSFV_AUTORIZACION: TFIBStringField
      DisplayLabel = 'Autorizacion'
      FieldName = 'SFV_AUTORIZACION'
    end
    object QMCabeceraSFV_CODIGO_CONTROL: TFIBStringField
      DisplayLabel = 'Cod. Control'
      FieldName = 'SFV_CODIGO_CONTROL'
    end
    object QMCabeceraSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField
      DisplayLabel = 'Cod. Respuesta Rapida'
      FieldName = 'SFV_CODIGO_RESPUESTA_RAPIDA'
      Size = 256
    end
    object QMCabeceraSFV_NUM_DOSIFICACION: TIntegerField
      DisplayLabel = 'Nro. Dosificacion'
      FieldName = 'SFV_NUM_DOSIFICACION'
    end
    object QMCabeceraVALIDO: TIntegerField
      DisplayLabel = 'Valido'
      FieldName = 'VALIDO'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_DETALLE'
      
        '  (DTO_CIAL,DTO_PP,DESCUENTO,TOTAL_LINEA,UNIDADES_EXT,NOTAS,C_IV' +
        'A,B_DTO_LINEA,B_IMPONIBLE,I_DESCUENTO,I_DTO_CIAL,I_DTO_PP,BRUTO,' +
        'P_COSTE,PRECIO,UNIDADES,PSIVA,PSIVA_CANAL,TOTAL_LINEA_CANAL,B_DT' +
        'O_LINEA_CANAL,B_IMPONIBLE_CANAL,ID_MOV_STOCKS,ID_C_A,ID_A,ENTRAD' +
        'A,M_MOV_STOCK,RIT,SERIE,REC_REGISTRO,REC_LINEA,LINEA,ID_TICKET,I' +
        'D_TICKET_DETALLE,CANAL_A_FACTURAR,USUARIO,CANAL_DESTINO,IVA_INCL' +
        'UIDO,P_RECARGO,P_IVA,TIPO_IVA,TITULO,CANAL,EJERCICIO,EMPRESA,REC' +
        '_EJERCICIO,PAIS,ARTICULO,ALMACEN,TIPO,NSERIE)'
      'VALUES'
      
        '  (?DTO_CIAL,?DTO_PP,?DESCUENTO,?TOTAL_LINEA,?UNIDADES_EXT,?NOTA' +
        'S,?C_IVA,?B_DTO_LINEA,?B_IMPONIBLE,?I_DESCUENTO,?I_DTO_CIAL,?I_D' +
        'TO_PP,?BRUTO,?P_COSTE,?PRECIO,?UNIDADES,?PSIVA,?PSIVA_CANAL,?TOT' +
        'AL_LINEA_CANAL,?B_DTO_LINEA_CANAL,?B_IMPONIBLE_CANAL,?ID_MOV_STO' +
        'CKS,?ID_C_A,?ID_A,?ENTRADA,?M_MOV_STOCK,?RIT,?SERIE,?REC_REGISTR' +
        'O,?REC_LINEA,?LINEA,?ID_TICKET,?ID_TICKET_DETALLE,?CANAL_A_FACTU' +
        'RAR,?USUARIO,?CANAL_DESTINO,?IVA_INCLUIDO,?P_RECARGO,?P_IVA,?TIP' +
        'O_IVA,?TITULO,?CANAL,?EJERCICIO,?EMPRESA,?REC_EJERCICIO,?PAIS,?A' +
        'RTICULO,?ALMACEN,?TIPO,?NSERIE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  D.*,'
      
        '  (SELECT STOCK FROM A_ART_DAME_STOCK3(D.EMPRESA, D.CANAL, D.ALM' +
        'ACEN, D.ARTICULO, '#39'3000.01.01'#39')) STOCK'
      'FROM GES_TICKET_DETALLE D'
      'WHERE'
      '  D.EMPRESA=?EMPRESA AND'
      '  D.EJERCICIO=?EJERCICIO AND'
      '  D.CANAL=?CANAL AND'
      '  D.SERIE=?SERIE AND'
      '  D.TIPO=?TIPO AND '
      '  D.RIT=?RIT AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT'
      '  D.*,'
      
        '  (SELECT STOCK FROM A_ART_DAME_STOCK3(D.EMPRESA, D.CANAL, D.ALM' +
        'ACEN, D.ARTICULO, '#39'3000.01.01'#39')) STOCK'
      'FROM GES_TICKET_DETALLE D'
      'WHERE'
      '  D.EMPRESA=?EMPRESA AND'
      '  D.EJERCICIO=?EJERCICIO AND'
      '  D.CANAL=?CANAL AND'
      '  D.SERIE=?SERIE AND'
      '  D.TIPO=?TIPO'
      '  AND D.RIT=?RIT'
      'ORDER BY D.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_DETALLE'
      'SET'
      '  DTO_CIAL=?DTO_CIAL '
      '  ,DTO_PP=?DTO_PP '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,TOTAL_LINEA=?TOTAL_LINEA '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '/*  ,NOTAS=?NOTAS */'
      '  ,C_IVA=?C_IVA '
      '  ,B_DTO_LINEA=?B_DTO_LINEA '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,BRUTO=?BRUTO '
      '  ,P_COSTE=?P_COSTE '
      '  ,PRECIO=?PRECIO '
      '  ,UNIDADES=?UNIDADES '
      '  ,PSIVA=?PSIVA '
      '  ,PSIVA_CANAL=?PSIVA_CANAL '
      '  ,TOTAL_LINEA_CANAL=?TOTAL_LINEA_CANAL '
      '  ,B_DTO_LINEA_CANAL=?B_DTO_LINEA_CANAL '
      '  ,B_IMPONIBLE_CANAL=?B_IMPONIBLE_CANAL '
      '  ,ID_MOV_STOCKS=?ID_MOV_STOCKS '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_A=?ID_A '
      '  ,ENTRADA=?ENTRADA '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,REC_REGISTRO=?REC_REGISTRO '
      '  ,REC_LINEA=?REC_LINEA '
      '  ,ID_TICKET=?ID_TICKET '
      '  ,ID_TICKET_DETALLE=?ID_TICKET_DETALLE '
      '  ,CANAL_A_FACTURAR=?CANAL_A_FACTURAR '
      '  ,USUARIO=?USUARIO '
      '  ,CANAL_DESTINO=?CANAL_DESTINO '
      '  ,IVA_INCLUIDO=?IVA_INCLUIDO '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,P_IVA=?P_IVA '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,TITULO=?TITULO '
      '  ,REC_EJERCICIO=?REC_EJERCICIO '
      '  ,PAIS=?PAIS '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN=?ALMACEN '
      '  ,NSERIE=?NSERIE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 144
    Top = 56
  end
  object xInfoActualizada: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_CABECERA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_CABECERA'
      
        '  (Z_CONTADOR_NCF,DTO_CIAL,S_BASES,I_DTO_PP,DTO_PP,I_DTO_CIAL,S_' +
        'CUOTA_RE,S_CUOTA_IVA,I_DTO_LINEAS,BRUTO,NOTAS,FECHA,A_DEVOLVER,A' +
        '_DEVOLVER_CANAL,S_BASES_CANAL,S_CUOTA_RE_CANAL,S_CUOTA_IVA_CANAL' +
        ',ID_FAMILIA,ID_TICKET_DEVOLUCION,ID_TICKET,FACTURACION,AGENTE,TI' +
        'PO_GASTO,ACREEDOR,ENTRADA,CLIENTE,TERCERO,RVT,RIT,SERIE,CAJA,SES' +
        'ION,ENTRADA_FAC,LINEAS,Z_TIPO_NCF,TURNO,CONTROL_STOCK,MODO_IVA,E' +
        'STADO,DESCRIPCION,USUARIO,CANAL,EJERCICIO,EMPRESA,DEVOLUCION,CHG' +
        '_MONEDA,CANAL_A_FACTURAR,FECHA_HORA,Z_PREFIJO_NCF,TARIFA,FORMA_P' +
        'AGO,MONEDA,ALMACEN,TIPO,TIPO_RELACION)'
      'VALUES'
      
        '  (?Z_CONTADOR_NCF,?DTO_CIAL,?S_BASES,?I_DTO_PP,?DTO_PP,?I_DTO_C' +
        'IAL,?S_CUOTA_RE,?S_CUOTA_IVA,?I_DTO_LINEAS,?BRUTO,?NOTAS,?FECHA,' +
        '?A_DEVOLVER,?A_DEVOLVER_CANAL,?S_BASES_CANAL,?S_CUOTA_RE_CANAL,?' +
        'S_CUOTA_IVA_CANAL,?ID_FAMILIA,?ID_TICKET_DEVOLUCION,?ID_TICKET,?' +
        'FACTURACION,?AGENTE,?TIPO_GASTO,?ACREEDOR,?ENTRADA,?CLIENTE,?TER' +
        'CERO,?RVT,?RIT,?SERIE,?CAJA,?SESION,?ENTRADA_FAC,?LINEAS,?Z_TIPO' +
        '_NCF,?TURNO,?CONTROL_STOCK,?MODO_IVA,?ESTADO,?DESCRIPCION,?USUAR' +
        'IO,?CANAL,?EJERCICIO,?EMPRESA,?DEVOLUCION,?CHG_MONEDA,?CANAL_A_F' +
        'ACTURAR,?FECHA_HORA,?Z_PREFIJO_NCF,?TARIFA,?FORMA_PAGO,?MONEDA,?' +
        'ALMACEN,?TIPO,?TIPO_RELACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_CABECERA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    SelectSQL.Strings = (
      
        'SELECT C.S_BASES, C.S_CUOTA_IVA, C.LIQUIDO, C.MONEDA, C.ESTADO, ' +
        'C.CLIENTE,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_TICKET_DETALLE'
      '        WHERE'
      '        ID_TICKET = C.ID_TICKET) UNIDADES,'
      '       (SELECT SIGNO_MONEDA'
      '        FROM SYS_MONEDAS'
      '        WHERE'
      '        MONEDA = C.MONEDA) SIGNO_MONEDA, C.A_DEVOLVER,'
      
        '       IIF(C.SFV_NUM_DOSIFICACION = 0, C.RIT, C.SFV_NUM_DOSIFICA' +
        'CION) AS NUM_TICKET,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM EMP_CLIENTES CC'
      '        JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO'
      '        WHERE'
      '        CC.EMPRESA = C.EMPRESA AND'
      '        CC.CLIENTE = C.CLIENTE) NOMBRE_R_SOCIAL'
      'FROM GES_TICKET_CABECERA C'
      'WHERE'
      'C.ID_TICKET = :ID_TICKET')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_CABECERA'
      'SET'
      '  Z_CONTADOR_NCF=?Z_CONTADOR_NCF '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,S_BASES=?S_BASES '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,DTO_PP=?DTO_PP '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,BRUTO=?BRUTO '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA=?FECHA '
      '  ,A_DEVOLVER=?A_DEVOLVER '
      '  ,A_DEVOLVER_CANAL=?A_DEVOLVER_CANAL '
      '  ,S_BASES_CANAL=?S_BASES_CANAL '
      '  ,S_CUOTA_RE_CANAL=?S_CUOTA_RE_CANAL '
      '  ,S_CUOTA_IVA_CANAL=?S_CUOTA_IVA_CANAL '
      '  ,ID_FAMILIA=?ID_FAMILIA '
      '  ,ID_TICKET_DEVOLUCION=?ID_TICKET_DEVOLUCION '
      '  ,ID_TICKET=?ID_TICKET '
      '  ,FACTURACION=?FACTURACION '
      '  ,AGENTE=?AGENTE '
      '  ,TIPO_GASTO=?TIPO_GASTO '
      '  ,ACREEDOR=?ACREEDOR '
      '  ,ENTRADA=?ENTRADA '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,RVT=?RVT '
      '  ,CAJA=?CAJA '
      '  ,SESION=?SESION '
      '  ,ENTRADA_FAC=?ENTRADA_FAC '
      '  ,LINEAS=?LINEAS '
      '  ,Z_TIPO_NCF=?Z_TIPO_NCF '
      '  ,TURNO=?TURNO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ESTADO=?ESTADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,USUARIO=?USUARIO '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,CHG_MONEDA=?CHG_MONEDA '
      '  ,CANAL_A_FACTURAR=?CANAL_A_FACTURAR '
      '  ,FECHA_HORA=?FECHA_HORA '
      '  ,Z_PREFIJO_NCF=?Z_PREFIJO_NCF '
      '  ,TARIFA=?TARIFA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,MONEDA=?MONEDA '
      '  ,ALMACEN=?ALMACEN '
      '  ,TIPO_RELACION=?TIPO_RELACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_CABECERA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object xInfoActualizadaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
      OnGetText = xInfoActualizadaLIQUIDOGetText
    end
    object xInfoActualizadaS_BASES: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'S_BASES'
    end
    object xInfoActualizadaS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xInfoActualizadaUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xInfoActualizadaSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo Moneda'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object xInfoActualizadaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xInfoActualizadaA_DEVOLVER: TFloatField
      DisplayLabel = 'A Devolver'
      FieldName = 'A_DEVOLVER'
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaNUM_TICKET: TIntegerField
      DisplayLabel = 'Num Ticket'
      FieldName = 'NUM_TICKET'
    end
    object xInfoActualizadaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xInfoActualizadaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 144
    Top = 104
  end
  object xTicketFormaPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TICKET_FP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TICKET_FP'
      
        '  (TOTAL_ENTREGADO,TOTAL_COBRADO,RIT,SERIE,TITULO,CANAL,EJERCICI' +
        'O,EMPRESA,FORMA_PAGO,TIPO)'
      'VALUES'
      
        '  (?TOTAL_ENTREGADO,?TOTAL_COBRADO,?RIT,?SERIE,?TITULO,?CANAL,?E' +
        'JERCICIO,?EMPRESA,?FORMA_PAGO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TICKET_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TICKET_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT '
      'ORDER BY FORMA_PAGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TICKET_FP'
      'SET'
      '  TOTAL_ENTREGADO=?TOTAL_ENTREGADO '
      '  ,TOTAL_COBRADO=?TOTAL_COBRADO '
      '  ,TITULO=?TITULO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    DataSource = DSQMCabecera
    OnNewRecord = xTicketFormaPagoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TICKET_FP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object xTicketFormaPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTicketFormaPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTicketFormaPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTicketFormaPagoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTicketFormaPagoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xTicketFormaPagoRIT: TIntegerField
      DisplayLabel = 'Rit'
      FieldName = 'RIT'
    end
    object xTicketFormaPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xTicketFormaPagoTOTAL_COBRADO: TFloatField
      DisplayLabel = 'Total Cobrado'
      FieldName = 'TOTAL_COBRADO'
    end
    object xTicketFormaPagoTOTAL_ENTREGADO: TFloatField
      DisplayLabel = 'Total Entreg.'
      FieldName = 'TOTAL_ENTREGADO'
    end
    object xTicketFormaPagoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTicketFormaPago: TDataSource
    DataSet = xTicketFormaPago
    Left = 144
    Top = 152
  end
  object xFamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, FAMILIA, TITULO, ID_FAMILIA, I' +
        'D_IMAGEN'
      'FROM VER_FAMILIAS_CUENTAS'
      'WHERE'
      'EMPRESA=:EMPRESA AND'
      'EJERCICIO=:EJERCICIO AND'
      'CANAL=:CANAL AND'
      'FAMILIA<>:FAMILIA_SISTEMA AND'
      'WEB = 1'
      'ORDER BY ORDEN, FAMILIA')
    UniDirectional = False
    AfterOpen = xFamiliaAfterOpen
    BeforeClose = xFamiliaBeforeClose
    BeforeScroll = xFamiliaBeforeScroll
    Left = 40
    Top = 248
    object xFamiliaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFamiliaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFamiliaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFamiliaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xFamiliaID_FAMILIA: TIntegerField
      DisplayLabel = 'Id Familia'
      FieldName = 'ID_FAMILIA'
    end
    object xFamiliaID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
  end
  object DSxFamilia: TDataSource
    DataSet = xFamilia
    Left = 144
    Top = 248
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 128
    SelectSQL.Strings = (
      '/* Se modifica en ejecucion */'
      
        'SELECT FIRST :PRIMEROS SKIP :SALTANDO C.ARTICULO, C.TITULO, C.ID' +
        '_A, A.SUBFAMILIA, A.IMAGEN'
      'FROM CON_CUENTAS_GES_ART C'
      'JOIN ART_ARTICULOS A ON C.ID_A = A.ID_A'
      'WHERE'
      'C.EMPRESA=:EMPRESA AND'
      'C.EJERCICIO=:EJERCICIO AND '
      'C.CANAL=:CANAL AND'
      'A.FAMILIA = :FAMILIA AND'
      'A.SUBFAMILIA = :SUBFAMILIA'
      'ORDER BY C.ARTICULO')
    UniDirectional = False
    DataSource = DSxFamilia
    Left = 40
    Top = 344
  end
  object DSArticulo: TDataSource
    DataSet = xArticulo
    Left = 144
    Top = 344
  end
  object QMNIF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_FAC_NIF'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,NOMBRE,NIF,DIRECCION' +
        ',C_POSTAL,PROVINCIA,'#13#10'ID_S,PAIS,LOCALIDAD,TELEFONO01,TELEFONO02,' +
        'TELEFAX,EMAIL,NOTAS,COLONIA,TERCERO,'#13#10'CARNET_APLICADOR,NOMBRE_CO' +
        'NTACTO,COMO_NOS_CONOCIERON,TIPO_DOC_IDENT,PAIS_DOC_IDENT)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?NOMBRE,?NIF,?' +
        'DIRECCION,?C_POSTAL,?PROVINCIA,'#13#10'?ID_S,?PAIS,?LOCALIDAD,?TELEFON' +
        'O01,?TELEFONO02,?TELEFAX,?EMAIL,?NOTAS,?COLONIA,?TERCERO,'#13#10'?CARN' +
        'ET_APLICADOR,?NOMBRE_CONTACTO,?COMO_NOS_CONOCIERON,?TIPO_DOC_IDE' +
        'NT,?PAIS_DOC_IDENT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_NIF '
      'WHERE '
      'ID_S = :ID_TICKET AND /*Para evitar colisiones con doc venta*/'
      'TIPO = :TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_FAC_NIF'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,NIF=?NIF '
      '  ,DIRECCION=?DIRECCION '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,ID_S=?ID_S '
      '  ,PAIS=?PAIS '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,EMAIL=?EMAIL '
      '  ,NOTAS=?NOTAS '
      '  ,COLONIA=?COLONIA '
      '  ,TERCERO=?TERCERO '
      '  ,CARNET_APLICADOR=?CARNET_APLICADOR '
      '  ,NOMBRE_CONTACTO=?NOMBRE_CONTACTO '
      '  ,COMO_NOS_CONOCIERON=?COMO_NOS_CONOCIERON '
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
    TableName = 'GES_CABECERAS_S_FAC_NIF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 248
    object QMNIFEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMNIFEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMNIFCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMNIFSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNIFTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object QMNIFRIG: TIntegerField
      FieldName = 'RIG'
    end
    object QMNIFNOMBRE: TFIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMNIFNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMNIFDIRECCION: TFIBStringField
      FieldName = 'DIRECCION'
      Size = 100
    end
    object QMNIFC_POSTAL: TFIBStringField
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object QMNIFPROVINCIA: TFIBStringField
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMNIFID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMNIFPAIS: TFIBStringField
      FieldName = 'PAIS'
      Size = 3
    end
    object QMNIFLOCALIDAD: TFIBStringField
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMNIFTELEFONO01: TFIBStringField
      FieldName = 'TELEFONO01'
    end
    object QMNIFTELEFONO02: TFIBStringField
      FieldName = 'TELEFONO02'
    end
    object QMNIFTELEFAX: TFIBStringField
      FieldName = 'TELEFAX'
    end
    object QMNIFEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMNIFNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMNIFCOLONIA: TFIBStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMNIFTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNIFCARNET_APLICADOR: TFIBStringField
      DisplayLabel = 'Carnet Aplicador'
      FieldName = 'CARNET_APLICADOR'
    end
    object QMNIFNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object QMNIFCOMO_NOS_CONOCIERON: TIntegerField
      DisplayLabel = 'Como nos conocieron'
      FieldName = 'COMO_NOS_CONOCIERON'
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
    Left = 360
    Top = 248
  end
  object xTickets: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT G.EMPRESA, G.EJERCICIO, G.CANAL, G.SERIE, G.TIPO, G.RIT, ' +
        'G.SESION, G.CAJA, G.TURNO, G.USUARIO, G.FORMA_PAGO,'
      
        '       G.FECHA, G.ID_TICKET, G.LIQUIDO, G.ESTADO, E.TITULO AS TI' +
        'TULO_ESTADO, G.MOTIVO_ANULADO, G.CLIENTE,'
      '       T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL'
      'FROM GES_TICKET_CABECERA G'
      'JOIN GES_TPV_TIPOS_ESTADO E ON G.ESTADO = E.ESTADO'
      
        'JOIN EMP_CLIENTES C ON G.EMPRESA = C.EMPRESA AND G.CLIENTE = C.C' +
        'LIENTE'
      'JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      'WHERE'
      'G.EMPRESA = :EMPRESA AND'
      'G.EJERCICIO = :EJERCICIO AND'
      'G.CANAL = :CANAL AND'
      'G.SERIE = :SERIE AND'
      'G.TIPO = :TIPO AND'
      'G.SESION = :SESION AND'
      'G.CAJA = :CAJA AND'
      'G.TURNO = :TURNO AND'
      'G.FACTURACION = 0 AND'
      'G.ESTADO NOT IN (2,3)'
      'ORDER BY G.ESTADO, G.RIT DESC')
    UniDirectional = False
    Left = 40
    Top = 392
    object xTicketsEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTicketsEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTicketsCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTicketsSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTicketsTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xTicketsRIT: TIntegerField
      DisplayLabel = 'Ticket'
      FieldName = 'RIT'
    end
    object xTicketsSESION: TIntegerField
      DisplayLabel = 'Sesi'#243'n'
      FieldName = 'SESION'
    end
    object xTicketsCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object xTicketsTURNO: TIntegerField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
    end
    object xTicketsUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xTicketsFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xTicketsFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xTicketsID_TICKET: TIntegerField
      DisplayLabel = 'Id Ticket'
      FieldName = 'ID_TICKET'
    end
    object xTicketsLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xTicketsESTADO: TIntegerField
      DisplayLabel = 'Id Estado'
      FieldName = 'ESTADO'
    end
    object xTicketsTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'TITULO_ESTADO'
    end
    object xTicketsMOTIVO_ANULADO: TFIBStringField
      FieldName = 'MOTIVO_ANULADO'
      Size = 40
    end
    object xTicketsCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xTicketsNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTicketsNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object DSTickets: TDataSource
    DataSet = xTickets
    Left = 144
    Top = 392
  end
  object QMTurno: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM GES_TPV_SESIONES_CAJAS_TURNO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'SESION = :SESION AND'
      'CAJA = :CAJA AND'
      'TURNO = :TURNO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_TPV_SESIONES_CAJAS_TURNO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'SESION = :SESION AND'
      'CAJA = :CAJA AND'
      'TURNO = :TURNO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_SESIONES_CAJAS_TURNO'
      'SET CAMBIO_ENTREGADO = :CAMBIO_ENTREGADO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'SESION = :SESION AND'
      'CAJA = :CAJA AND'
      'TURNO = :TURNO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 296
    object QMTurnoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMTurnoEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMTurnoCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMTurnoSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTurnoSESION: TIntegerField
      FieldName = 'SESION'
    end
    object QMTurnoCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object QMTurnoTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QMTurnoABIERTO: TIntegerField
      FieldName = 'ABIERTO'
    end
    object QMTurnoI_IVA: TFloatField
      FieldName = 'I_IVA'
    end
    object QMTurnoB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object QMTurnoTOTAL_TURNO: TFloatField
      FieldName = 'TOTAL_TURNO'
    end
    object QMTurnoFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
    end
    object QMTurnoFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object QMTurnoUSUARIO_ABRE: TIntegerField
      FieldName = 'USUARIO_ABRE'
    end
    object QMTurnoUSUARIO_CIERRA: TIntegerField
      FieldName = 'USUARIO_CIERRA'
    end
    object QMTurnoCAMBIO_ENTREGADO: TFloatField
      FieldName = 'CAMBIO_ENTREGADO'
    end
    object QMTurnoDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
    object QMTurnoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object DSTurno: TDataSource
    DataSet = QMTurno
    Left = 360
    Top = 296
  end
  object xTurnoFP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT T.*, F.TITULO AS TITULO_FP'
      'FROM GES_TPV_SESIONES_CAJAS_TURNO_FP T'
      'JOIN SYS_FORMAS_PAGO F ON (F.FORMA = T.FORMA_PAGO)'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL AND'
      'T.SERIE = :SERIE AND'
      'T.SESION = :SESION AND'
      'T.CAJA = :CAJA AND'
      'T.TURNO = :TURNO AND'
      'T.FORMA_PAGO = :FORMA_PAGO')
    SelectSQL.Strings = (
      'SELECT T.*, F.TITULO AS TITULO_FP'
      'FROM GES_TPV_SESIONES_CAJAS_TURNO_FP T'
      'JOIN SYS_FORMAS_PAGO F ON (F.FORMA = T.FORMA_PAGO)'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL AND'
      'T.SERIE = :SERIE AND'
      'T.SESION = :SESION AND'
      'T.CAJA = :CAJA AND'
      'T.TURNO = :TURNO'
      'ORDER BY T.FORMA_PAGO')
    UniDirectional = False
    Left = 248
    Top = 344
    object xTurnoFPEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xTurnoFPEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xTurnoFPCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xTurnoFPSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xTurnoFPSESION: TIntegerField
      FieldName = 'SESION'
    end
    object xTurnoFPCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object xTurnoFPTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object xTurnoFPFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xTurnoFPTOTAL_COBRADO: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_COBRADO'
    end
    object xTurnoFPTITULO_FP: TFIBStringField
      DisplayLabel = 'Forma pago'
      FieldName = 'TITULO_FP'
      Size = 40
    end
  end
  object DSTurnoFP: TDataSource
    DataSet = xTurnoFP
    Left = 360
    Top = 344
  end
  object QMIngresosEgresos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_INGRESOS_EGRESOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_INGRESOS_EGRESOS'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,SESION,CAJA,TURNO,TIPO_MOVIMIEN' +
        'TO,IMPORTE,DESCRIPCION,NOTA,FECHA,ENTRADA,ID)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?SESION,?CAJA,?TURNO,?TIPO_' +
        'MOVIMIENTO,?IMPORTE,?DESCRIPCION,?NOTA,?FECHA,?ENTRADA,?ID)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_INGRESOS_EGRESOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_INGRESOS_EGRESOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'SESION=?SESION AND'
      'CAJA=?CAJA AND'
      'TURNO=?TURNO'
      'ORDER BY ID DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_INGRESOS_EGRESOS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,SESION=?SESION '
      '  ,CAJA=?CAJA '
      '  ,TURNO=?TURNO '
      '  ,TIPO_MOVIMIENTO=?TIPO_MOVIMIENTO '
      '  ,IMPORTE=?IMPORTE '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,NOTA=?NOTA '
      '  ,FECHA=?FECHA '
      '  ,ENTRADA=?ENTRADA '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMIngresosEgresosBeforePost
    OnCalcFields = QMIngresosEgresosCalcFields
    OnNewRecord = QMIngresosEgresosNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_INGRESOS_EGRESOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 200
    object QMIngresosEgresosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIngresosEgresosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMIngresosEgresosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMIngresosEgresosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMIngresosEgresosSESION: TIntegerField
      DisplayLabel = 'Sesi'#243'n'
      FieldName = 'SESION'
    end
    object QMIngresosEgresosCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMIngresosEgresosTURNO: TIntegerField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
    end
    object QMIngresosEgresosTIPO_MOVIMIENTO: TFIBStringField
      DisplayLabel = 'Tipo Mov.'
      FieldName = 'TIPO_MOVIMIENTO'
      Size = 3
    end
    object QMIngresosEgresosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMIngresosEgresosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMIngresosEgresosNOTA: TBlobField
      DisplayLabel = 'Nota'
      FieldName = 'NOTA'
      Size = 8
    end
    object QMIngresosEgresosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMIngresosEgresosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMIngresosEgresosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMIngresosEgresosDESC_TIPO_MOVIEMIENTO: TStringField
      DisplayLabel = 'Tipo Mov.'
      FieldKind = fkCalculated
      FieldName = 'DESC_TIPO_MOVIEMIENTO'
      Calculated = True
    end
  end
  object DSQMIngresosEgresos: TDataSource
    DataSet = QMIngresosEgresos
    Left = 360
    Top = 200
  end
  object frxDBQMIngresosEgresos: TfrxDBDataset
    UserName = 'frxDBQMIngresosEgresos'
    CloseDataSource = False
    DataSource = DSQMIngresosEgresos
    Left = 616
    Top = 200
  end
  object frDBQMIngresosEgresos: TfrDBDataSet
    DataSource = DSQMIngresosEgresos
    Left = 488
    Top = 200
  end
  object frIngresosEgresos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frIngresosEgresosGetValue
    OnBeforePrint = frIngresosEgresosBeforePrint
    OnEnterRect = frIngresosEgresosBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 616
    Top = 8
    ReportForm = {19000000}
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 610
    ValorGrupo = 99
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 22
    Opciones.Pagina.Ancho = 40
    Opciones.Pagina.Tamanyo = 22
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Comprobante de ingresos y egresos'
    ControlaLongitud = True
    Left = 616
    Top = 96
  end
  object frxIngresosEgresos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 43455.6496641898
    ReportOptions.LastChange = 43455.6496641898
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxIngresosEgresosBeforePrint
    OnGetValue = frxIngresosEgresosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 616
    Top = 56
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xSubfamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 128
    RefreshSQL.Strings = (
      
        'SELECT S.SUBFAMILIA, S.TITULO, S.ID_SUBFAMILIA, C.EMPRESA, C.EJE' +
        'RCICIO, C.CANAL, C.FAMILIA'
      'FROM ART_SUBFAMILIAS S'
      'JOIN ART_FAMILIAS F ON S.ID_FAMILIA = F.ID_FAMILIA'
      
        'JOIN CON_CUENTAS_GES_FAM C ON F.EMPRESA = C.EMPRESA AND F.FAMILI' +
        'A = C.FAMILIA'
      'WHERE'
      'S.ID_SUBFAMILIA = :ID_SUBFAMILIA AND'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL')
    SelectSQL.Strings = (
      
        'SELECT FIRST :PRIMEROS SKIP :SALTANDO S.SUBFAMILIA, S.TITULO, S.' +
        'ID_SUBFAMILIA, C.EMPRESA, C.EJERCICIO, C.CANAL,'
      '              C.FAMILIA,'
      '              -- IMAGEN DE PRIMER ARTICULO DE LA SUBFAMILIA'
      '              (SELECT FIRST 1 IMAGEN'
      '               FROM ART_ARTICULOS'
      '               WHERE'
      '               EMPRESA = S.EMPRESA AND'
      '               FAMILIA = F.FAMILIA AND'
      '               SUBFAMILIA = S.SUBFAMILIA AND'
      '               IMAGEN <> 0'
      '               ORDER BY ARTICULO) ID_IMAGEN'
      'FROM ART_SUBFAMILIAS S'
      'JOIN ART_FAMILIAS F ON S.ID_FAMILIA = F.ID_FAMILIA'
      
        'JOIN CON_CUENTAS_GES_FAM C ON F.EMPRESA = C.EMPRESA AND F.FAMILI' +
        'A = C.FAMILIA'
      'WHERE'
      'S.ID_FAMILIA = :ID_FAMILIA AND'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL'
      'ORDER BY S.SUBFAMILIA')
    UniDirectional = False
    DataSource = DSxFamilia
    AfterOpen = xSubfamiliaAfterOpen
    BeforeScroll = xSubfamiliaBeforeScroll
    Left = 40
    Top = 296
    object xSubfamiliaSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object xSubfamiliaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xSubfamiliaID_SUBFAMILIA: TIntegerField
      DisplayLabel = 'Id Subfamilia'
      FieldName = 'ID_SUBFAMILIA'
    end
    object xSubfamiliaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSubfamiliaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSubfamiliaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSubfamiliaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xSubfamiliaID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Familia'
      FieldName = 'ID_IMAGEN'
    end
  end
  object DSxSubfamilia: TDataSource
    DataSet = xSubfamilia
    Left = 144
    Top = 296
  end
end
