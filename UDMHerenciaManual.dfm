object DMHerenciaManual: TDMHerenciaManual
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 255
  Width = 309
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S'
      
        '  (SERIE,UNIDADES,PRECIO,P_COSTE,BRUTO,B_COMISION,I_DTO_PP,I_DTO' +
        '_CIAL,I_DESCUENTO,B_IMPONIBLE,I_COMISION,NOTAS,UNIDADES_EXT,B_CO' +
        'MISION_CANAL,UNIDADES_SEC,COMISION_LINEAL,I_COMISION_LINEAL,NOTA' +
        'S2,ULT_MODIFICACION,COSTE_ADICIONAL,RIG,LINEA,DESCUENTO,DESCUENT' +
        'O_2,DESCUENTO_3,COMISION,M_MOV_STOCK,P_IVA,P_RECARGO,DTO_PP,DTO_' +
        'CIAL,ENTRADA,ID_S,ID_DETALLES_S,ID_D_S_GR,ID_A_M_C_T,ID_C_A,ID_A' +
        ',ID_MOV_STOCKS,MARGEN_KRI,TIPO_LINEA_KRI,ORDEN,ORIGEN,ID_P,PROYE' +
        'CTO,ID_REGISTRO,ID_DESPIECE,EMPRESA,EJERCICIO,CANAL,TITULO,PIEZA' +
        'S_X_BULTO,BULTOS,TIPO_IVA,IVA_INCLUIDO,EJER_MOV,TITULO_IDIOMA,PR' +
        'OC_PROMOCION,APLICA_UNIDADES_SECUNDARIAS,CERTIFICADO,CERT_NEGATI' +
        'VO,LINEA_RELACION,MANIPULACION,INVERSION_SUJETO_PASIVO,LOTE_SIMP' +
        'LE,TIPO,ALMACEN,ARTICULO,PAIS,NSERIE,NO_FABRICACION_KRI,TIPO_LIN' +
        'EA,CRC_NOTAS,CRC_NOTAS2,PRO_NUM_PLANO,CUENTA,TIPO_IMPUESTO_ADICI' +
        'ONAL)'
      'VALUES'
      
        '  (?SERIE,?UNIDADES,?PRECIO,?P_COSTE,?BRUTO,?B_COMISION,?I_DTO_P' +
        'P,?I_DTO_CIAL,?I_DESCUENTO,?B_IMPONIBLE,?I_COMISION,?NOTAS,?UNID' +
        'ADES_EXT,?B_COMISION_CANAL,?UNIDADES_SEC,?COMISION_LINEAL,?I_COM' +
        'ISION_LINEAL,?NOTAS2,?ULT_MODIFICACION,?COSTE_ADICIONAL,?RIG,?LI' +
        'NEA,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?COMISION,?M_MOV_STOCK,' +
        '?P_IVA,?P_RECARGO,?DTO_PP,?DTO_CIAL,?ENTRADA,?ID_S,?ID_DETALLES_' +
        'S,?ID_D_S_GR,?ID_A_M_C_T,?ID_C_A,?ID_A,?ID_MOV_STOCKS,?MARGEN_KR' +
        'I,?TIPO_LINEA_KRI,?ORDEN,?ORIGEN,?ID_P,?PROYECTO,?ID_REGISTRO,?I' +
        'D_DESPIECE,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?PIEZAS_X_BULTO,?B' +
        'ULTOS,?TIPO_IVA,?IVA_INCLUIDO,?EJER_MOV,?TITULO_IDIOMA,?PROC_PRO' +
        'MOCION,?APLICA_UNIDADES_SECUNDARIAS,?CERTIFICADO,?CERT_NEGATIVO,' +
        '?LINEA_RELACION,?MANIPULACION,?INVERSION_SUJETO_PASIVO,?LOTE_SIM' +
        'PLE,?TIPO,?ALMACEN,?ARTICULO,?PAIS,?NSERIE,?NO_FABRICACION_KRI,?' +
        'TIPO_LINEA,?CRC_NOTAS,?CRC_NOTAS2,?PRO_NUM_PLANO,?CUENTA,?TIPO_I' +
        'MPUESTO_ADICIONAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S ' +
        'AS ID_DOC, ID_DETALLES_S AS ID_DETALLE_DOC, ARTICULO, TITULO '
      'FROM GES_DETALLES_S'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,P_COSTE=?P_COSTE '
      '  ,BRUTO=?BRUTO '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_COMISION=?I_COMISION '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,B_COMISION_CANAL=?B_COMISION_CANAL '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,NOTAS2=?NOTAS2 '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,COMISION=?COMISION '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_S=?ID_S '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_D_S_GR=?ID_D_S_GR '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_A=?ID_A '
      '  ,ID_MOV_STOCKS=?ID_MOV_STOCKS '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,PROYECTO=?PROYECTO '
      '  ,ID_REGISTRO=?ID_REGISTRO '
      '  ,ID_DESPIECE=?ID_DESPIECE '
      '  ,TITULO=?TITULO '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,BULTOS=?BULTOS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,IVA_INCLUIDO=?IVA_INCLUIDO '
      '  ,EJER_MOV=?EJER_MOV '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,CERT_NEGATIVO=?CERT_NEGATIVO '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,MANIPULACION=?MANIPULACION '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,PAIS=?PAIS '
      '  ,NSERIE=?NSERIE '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,CUENTA=?CUENTA '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_OFERTA_C DET INDEX (GES_DETALLES_S_' +
        'CAB_ID),'
      
        '                VER_DETALLE_OFERTA_C OFC INDEX (GES_DETALLES_S_O' +
        'FC_ID)))  ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_OFC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
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
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMDetalleID_DETALLE_DOC: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLE_DOC'
    end
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
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
    Left = 216
    Top = 56
  end
  object QMDetalleDestino: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S'
      
        '  (SERIE,UNIDADES,PRECIO,P_COSTE,BRUTO,B_COMISION,I_DTO_PP,I_DTO' +
        '_CIAL,I_DESCUENTO,B_IMPONIBLE,I_COMISION,NOTAS,UNIDADES_EXT,B_CO' +
        'MISION_CANAL,UNIDADES_SEC,COMISION_LINEAL,I_COMISION_LINEAL,NOTA' +
        'S2,ULT_MODIFICACION,COSTE_ADICIONAL,RIG,LINEA,DESCUENTO,DESCUENT' +
        'O_2,DESCUENTO_3,COMISION,M_MOV_STOCK,P_IVA,P_RECARGO,DTO_PP,DTO_' +
        'CIAL,ENTRADA,ID_S,ID_DETALLES_S,ID_D_S_GR,ID_A_M_C_T,ID_C_A,ID_A' +
        ',ID_MOV_STOCKS,MARGEN_KRI,TIPO_LINEA_KRI,ORDEN,ORIGEN,ID_P,PROYE' +
        'CTO,ID_REGISTRO,ID_DESPIECE,EMPRESA,EJERCICIO,CANAL,TITULO,PIEZA' +
        'S_X_BULTO,BULTOS,TIPO_IVA,IVA_INCLUIDO,EJER_MOV,TITULO_IDIOMA,PR' +
        'OC_PROMOCION,APLICA_UNIDADES_SECUNDARIAS,CERTIFICADO,CERT_NEGATI' +
        'VO,LINEA_RELACION,MANIPULACION,INVERSION_SUJETO_PASIVO,LOTE_SIMP' +
        'LE,TIPO,ALMACEN,ARTICULO,PAIS,NSERIE,NO_FABRICACION_KRI,TIPO_LIN' +
        'EA,CRC_NOTAS,CRC_NOTAS2,PRO_NUM_PLANO,CUENTA,TIPO_IMPUESTO_ADICI' +
        'ONAL)'
      'VALUES'
      
        '  (?SERIE,?UNIDADES,?PRECIO,?P_COSTE,?BRUTO,?B_COMISION,?I_DTO_P' +
        'P,?I_DTO_CIAL,?I_DESCUENTO,?B_IMPONIBLE,?I_COMISION,?NOTAS,?UNID' +
        'ADES_EXT,?B_COMISION_CANAL,?UNIDADES_SEC,?COMISION_LINEAL,?I_COM' +
        'ISION_LINEAL,?NOTAS2,?ULT_MODIFICACION,?COSTE_ADICIONAL,?RIG,?LI' +
        'NEA,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?COMISION,?M_MOV_STOCK,' +
        '?P_IVA,?P_RECARGO,?DTO_PP,?DTO_CIAL,?ENTRADA,?ID_S,?ID_DETALLES_' +
        'S,?ID_D_S_GR,?ID_A_M_C_T,?ID_C_A,?ID_A,?ID_MOV_STOCKS,?MARGEN_KR' +
        'I,?TIPO_LINEA_KRI,?ORDEN,?ORIGEN,?ID_P,?PROYECTO,?ID_REGISTRO,?I' +
        'D_DESPIECE,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?PIEZAS_X_BULTO,?B' +
        'ULTOS,?TIPO_IVA,?IVA_INCLUIDO,?EJER_MOV,?TITULO_IDIOMA,?PROC_PRO' +
        'MOCION,?APLICA_UNIDADES_SECUNDARIAS,?CERTIFICADO,?CERT_NEGATIVO,' +
        '?LINEA_RELACION,?MANIPULACION,?INVERSION_SUJETO_PASIVO,?LOTE_SIM' +
        'PLE,?TIPO,?ALMACEN,?ARTICULO,?PAIS,?NSERIE,?NO_FABRICACION_KRI,?' +
        'TIPO_LINEA,?CRC_NOTAS,?CRC_NOTAS2,?PRO_NUM_PLANO,?CUENTA,?TIPO_I' +
        'MPUESTO_ADICIONAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S ' +
        'AS ID_DOC, ID_DETALLES_S AS ID_DETALLE_DOC, ARTICULO, TITULO '
      'FROM GES_DETALLES_S'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,P_COSTE=?P_COSTE '
      '  ,BRUTO=?BRUTO '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_COMISION=?I_COMISION '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,B_COMISION_CANAL=?B_COMISION_CANAL '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,NOTAS2=?NOTAS2 '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,COMISION=?COMISION '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_S=?ID_S '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_D_S_GR=?ID_D_S_GR '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,ID_C_A=?ID_C_A '
      '  ,ID_A=?ID_A '
      '  ,ID_MOV_STOCKS=?ID_MOV_STOCKS '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,PROYECTO=?PROYECTO '
      '  ,ID_REGISTRO=?ID_REGISTRO '
      '  ,ID_DESPIECE=?ID_DESPIECE '
      '  ,TITULO=?TITULO '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,BULTOS=?BULTOS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,IVA_INCLUIDO=?IVA_INCLUIDO '
      '  ,EJER_MOV=?EJER_MOV '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,CERT_NEGATIVO=?CERT_NEGATIVO '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,MANIPULACION=?MANIPULACION '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,PAIS=?PAIS '
      '  ,NSERIE=?NSERIE '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,CUENTA=?CUENTA '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_OFERTA_C DET INDEX (GES_DETALLES_S_' +
        'CAB_ID),'
      
        '                VER_DETALLE_OFERTA_C OFC INDEX (GES_DETALLES_S_O' +
        'FC_ID)))  ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_OFC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMDetalleDestinoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleDestinoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleDestinoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleDestinoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleDestinoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleDestinoRIG: TIntegerField
      DisplayLabel = 'NroDocumento'
      FieldName = 'RIG'
    end
    object QMDetalleDestinoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleDestinoID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMDetalleDestinoID_DETALLE_DOC: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLE_DOC'
    end
    object QMDetalleDestinoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleDestinoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSQMDetalleDestino: TDataSource
    DataSet = QMDetalleDestino
    Left = 120
    Top = 56
  end
end
