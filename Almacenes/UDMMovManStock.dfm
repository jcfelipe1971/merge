object DMMovManStock: TDMMovManStock
  OldCreateOrder = False
  OnCreate = DMMovManStockCreate
  OnDestroy = DataModuleDestroy
  Left = 601
  Top = 236
  Height = 401
  Width = 488
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 376
    Top = 16
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_ST'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SERIE=?old_SERIE AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_ST'
      
        '  (FECHA,ENTRADA,RIG,SERIE,CANAL_DST,CANAL_ORI,TIPO_VALORACION,E' +
        'JERCICIO,EMPRESA,COMENTARIO,ALMACEN_DST,ALMACEN_ORI,TIPO_OPERACI' +
        'ON,ORIGEN)'
      'VALUES'
      
        '  (?FECHA,?ENTRADA,?RIG,?SERIE,?CANAL_DST,?CANAL_ORI,?TIPO_VALOR' +
        'ACION,?EJERCICIO,?EMPRESA,?COMENTARIO,?ALMACEN_DST,?ALMACEN_ORI,' +
        '?TIPO_OPERACION,?ORIGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_ST'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_ST'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO'
      'ORDER BY SERIE, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_ST'
      'SET'
      '  FECHA=?FECHA '
      '  ,ENTRADA=?ENTRADA '
      '  ,CANAL_DST=?CANAL_DST '
      '  ,CANAL_ORI=?CANAL_ORI '
      '  ,TIPO_VALORACION=?TIPO_VALORACION '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,ALMACEN_DST=?ALMACEN_DST '
      '  ,ALMACEN_ORI=?ALMACEN_ORI '
      '  ,TIPO_OPERACION=?TIPO_OPERACION'
      '  ,ORIGEN=?ORIGEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIG=?RIG ')
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = QMCabeceraAfterPost
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    BeforeDelete = QMCabeceraBeforeDelete
    BeforeEdit = QMCabeceraBeforeEdit
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'SERIE '
      'EJERCICIO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_ST'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 16
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraTIPO_OPERACION: TFIBStringField
      DisplayLabel = 'Tipo Oper.'
      FieldName = 'TIPO_OPERACION'
      OnChange = QMCabeceraTIPO_OPERACIONChange
      Size = 1
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraALMACEN_ORI: TFIBStringField
      DisplayLabel = 'Alm. Orig.'
      FieldName = 'ALMACEN_ORI'
      OnChange = QMCabeceraALMACEN_ORIChange
      Size = 3
    end
    object QMCabeceraCANAL_ORI: TIntegerField
      DisplayLabel = 'Canal Orig.'
      FieldName = 'CANAL_ORI'
    end
    object QMCabeceraALMACEN_DST: TFIBStringField
      DisplayLabel = 'Alm. Dest.'
      FieldName = 'ALMACEN_DST'
      OnChange = QMCabeceraALMACEN_DSTChange
      Size = 3
    end
    object QMCabeceraCANAL_DST: TIntegerField
      DisplayLabel = 'Canal Dest.'
      FieldName = 'CANAL_DST'
    end
    object QMCabeceraCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMCabeceraTIPO_VALORACION: TIntegerField
      DisplayLabel = 'Tipo Val.'
      FieldName = 'TIPO_VALORACION'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraID_REG: TIntegerField
      DisplayLabel = 'ID Reg.'
      FieldName = 'ID_REG'
    end
    object QMCabeceraDEPOSITO: TIntegerField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'DEPOSITO'
    end
    object QMCabeceraDEFINITIVO: TIntegerField
      DisplayLabel = 'Definitivo'
      FieldName = 'DEFINITIVO'
    end
    object QMCabeceraORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QMCabeceraID_ORIGEN: TIntegerField
      DisplayLabel = 'ID Orig.'
      FieldName = 'ID_ORIGEN'
    end
    object QMCabeceraRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMCabeceraID_ST: TIntegerField
      DisplayLabel = 'Id Mov.'
      FieldName = 'ID_ST'
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = QMCabeceraTITULO_ESTADOGetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 104
    Top = 16
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 64
  end
  object xAlmacenOrig: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO, CTROL_UBICACION FROM ART_ALMACENES'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ALMACEN=?ALMACEN_ORI')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 24
    Top = 160
  end
  object xAlmacenDst: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO, CTROL_UBICACION FROM ART_ALMACENES'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ALMACEN=?ALMACEN_DST')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 24
    Top = 208
  end
  object DSxAlmacenOrig: TDataSource
    DataSet = xAlmacenOrig
    Left = 104
    Top = 160
  end
  object DSxAlmacenDst: TDataSource
    DataSet = xAlmacenDst
    Left = 104
    Top = 208
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT '
      'ARTICULO, CONTROLA_MEDIDAS, '
      'SERIALIZADO, ID_A, LOTES, UBICABLE,'
      'MULTIPLO_1, MULTIPLO_2, MULTIPLO_3, MULTIPLO_4'
      'FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 192
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_MOVS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_MOVS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,SERIE,RIG,LINEA,ARTICULO,TITULO,UNIDADES,' +
        'UNIDADES_EXT,PRECIO,ENTRADA,PRECIO_VENTA,ORDEN_PRODUCCION,ID_UBI' +
        'CACION_E,ID_A_UBICACION_E,TIT_UBICACION_E,COMPOSICION_E,'#13#10'CALLE_' +
        'E,ESTANTERIA_E,REPISA_E,POSICION_E,ID_UBICACION_S,ID_A_UBICACION' +
        '_S,TIT_UBICACION_S,COMPOSICION_S,CALLE_S,ESTANTERIA_S,'#13#10'REPISA_S' +
        ',POSICION_S,ID_DETALLES_ST,ID_A,ID_C_A,NSERIE,MOV_STOCK_A,MOV_ST' +
        'OCK_B,ALFA_1,ALFA_2,'#13#10'ALFA_3,ALFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,' +
        'LOTEABLE,UBICABLE,REF_PROVEEDOR)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?SERIE,?RIG,?LINEA,?ARTICULO,?TITULO,?U' +
        'NIDADES,?UNIDADES_EXT,?PRECIO,?ENTRADA,?PRECIO_VENTA,?ORDEN_PROD' +
        'UCCION,?ID_UBICACION_E,?ID_A_UBICACION_E,?TIT_UBICACION_E,?COMPO' +
        'SICION_E,'#13#10'?CALLE_E,?ESTANTERIA_E,?REPISA_E,?POSICION_E,?ID_UBIC' +
        'ACION_S,?ID_A_UBICACION_S,?TIT_UBICACION_S,?COMPOSICION_S,?CALLE' +
        '_S,?ESTANTERIA_S,'#13#10'?REPISA_S,?POSICION_S,?ID_DETALLES_ST,?ID_A,?' +
        'ID_C_A,?NSERIE,?MOV_STOCK_A,?MOV_STOCK_B,?ALFA_1,?ALFA_2,'#13#10'?ALFA' +
        '_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?LOTEABLE,?UBICABLE,?' +
        'REF_PROVEEDOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_MOVS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_MOVS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND '
      'EJERCICIO = ?EJERCICIO AND'
      'SERIE = ?SERIE AND'
      'RIG = ?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_MOVS'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,PRECIO=?PRECIO '
      '  ,ENTRADA=?ENTRADA '
      '  ,PRECIO_VENTA=?PRECIO_VENTA '
      '  ,ORDEN_PRODUCCION=?ORDEN_PRODUCCION '
      '  ,ID_UBICACION_E=?ID_UBICACION_E '
      '  ,ID_A_UBICACION_E=?ID_A_UBICACION_E '
      '  ,TIT_UBICACION_E=?TIT_UBICACION_E '
      '  ,COMPOSICION_E=?COMPOSICION_E '
      '  ,CALLE_E=?CALLE_E '
      '  ,ESTANTERIA_E=?ESTANTERIA_E '
      '  ,REPISA_E=?REPISA_E '
      '  ,POSICION_E=?POSICION_E '
      '  ,ID_UBICACION_S=?ID_UBICACION_S '
      '  ,ID_A_UBICACION_S=?ID_A_UBICACION_S '
      '  ,TIT_UBICACION_S=?TIT_UBICACION_S '
      '  ,COMPOSICION_S=?COMPOSICION_S '
      '  ,CALLE_S=?CALLE_S '
      '  ,ESTANTERIA_S=?ESTANTERIA_S '
      '  ,REPISA_S=?REPISA_S '
      '  ,POSICION_S=?POSICION_S '
      '  ,ID_DETALLES_ST=?ID_DETALLES_ST '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,NSERIE=?NSERIE '
      '  ,MOV_STOCK_A=?MOV_STOCK_A '
      '  ,MOV_STOCK_B=?MOV_STOCK_B '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,LOTEABLE=?LOTEABLE '
      '  ,UBICABLE=?UBICABLE '
      '  ,REF_PROVEEDOR=?REF_PROVEEDOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMCabecera
    AfterDelete = QMDetalleAfterDelete
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    BeforeClose = QMDetalleBeforeClose
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = QMDetalleBeforeEdit
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'SERIE '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_MOVS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      EditMask = '>ccccccccccccccc;0;_'
      Size = 15
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnGetText = QMDetalleUNIDADESGetText
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QMDetalleMOV_STOCK_A: TIntegerField
      DisplayLabel = 'Nro. Mov. Man. A'
      FieldName = 'MOV_STOCK_A'
    end
    object QMDetalleMOV_STOCK_B: TIntegerField
      DisplayLabel = 'Nro. Mov. Man. B'
      FieldName = 'MOV_STOCK_B'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMDetallePRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMDetalleORDEN_PRODUCCION: TFIBStringField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
      OnChange = QMDetalleID_LOTEChange
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetalleID_UBICACION_E: TIntegerField
      DisplayLabel = 'ID Ubic. E.'
      FieldName = 'ID_UBICACION_E'
      OnChange = QMDetalleID_UBICACION_EChange
    end
    object QMDetalleID_A_UBICACION_E: TIntegerField
      DisplayLabel = 'ID Art. Ubic. E.'
      FieldName = 'ID_A_UBICACION_E'
    end
    object QMDetalleCOMPOSICION_E: TFIBStringField
      DisplayLabel = 'Composici'#243'n E.'
      FieldName = 'COMPOSICION_E'
    end
    object QMDetalleCALLE_E: TFIBStringField
      DisplayLabel = 'Calle E.'
      FieldName = 'CALLE_E'
      Size = 3
    end
    object QMDetalleESTANTERIA_E: TFIBStringField
      DisplayLabel = 'Estanter'#237'a E.'
      FieldName = 'ESTANTERIA_E'
      Size = 3
    end
    object QMDetalleREPISA_E: TFIBStringField
      DisplayLabel = 'Repisa E.'
      FieldName = 'REPISA_E'
      Size = 3
    end
    object QMDetallePOSICION_E: TFIBStringField
      DisplayLabel = 'Posici'#243'n E.'
      FieldName = 'POSICION_E'
      Size = 3
    end
    object QMDetalleID_UBICACION_S: TIntegerField
      DisplayLabel = 'ID Ubic. S'
      FieldName = 'ID_UBICACION_S'
      OnChange = QMDetalleID_UBICACION_SChange
    end
    object QMDetalleID_A_UBICACION_S: TIntegerField
      DisplayLabel = 'ID Art. Ubic. S.'
      FieldName = 'ID_A_UBICACION_S'
    end
    object QMDetalleCOMPOSICION_S: TFIBStringField
      DisplayLabel = 'Composici'#243'n S.'
      FieldName = 'COMPOSICION_S'
    end
    object QMDetalleCALLE_S: TFIBStringField
      DisplayLabel = 'Calle S.'
      FieldName = 'CALLE_S'
      Size = 3
    end
    object QMDetalleESTANTERIA_S: TFIBStringField
      DisplayLabel = 'Estanter'#237'a S.'
      FieldName = 'ESTANTERIA_S'
      Size = 3
    end
    object QMDetalleREPISA_S: TFIBStringField
      DisplayLabel = 'Repisa S.'
      FieldName = 'REPISA_S'
      Size = 3
    end
    object QMDetallePOSICION_S: TFIBStringField
      DisplayLabel = 'Posici'#243'n S.'
      FieldName = 'POSICION_S'
      Size = 3
    end
    object QMDetalleTIT_UBICACION_E: TFIBStringField
      DisplayLabel = 'Tit. Ubicaci'#243'n E.'
      FieldName = 'TIT_UBICACION_E'
      Size = 60
    end
    object QMDetalleTIT_UBICACION_S: TFIBStringField
      DisplayLabel = 'Tit. Ubicaci'#243'n S.'
      FieldName = 'TIT_UBICACION_S'
      Size = 60
    end
    object QMDetalleTitulo_Lote_OP: TStringField
      FieldKind = fkCalculated
      FieldName = 'Titulo_Lote_OP'
      Calculated = True
    end
    object QMDetalleCLASIFICACION: TStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'CLASIFICACION'
      Calculated = True
    end
    object QMDetalleCANT_LOTE: TFloatField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
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
      DisplayWidth = 40
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
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM2: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM3: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM3'
      Calculated = True
    end
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
    end
    object QMDetalleUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object QMDetalleREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QMDetalleSTOCK_ORI: TFloatField
      DisplayLabel = 'Stock Orig.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ORI'
      Calculated = True
    end
    object QMDetalleSTOCK_DST: TFloatField
      DisplayLabel = 'Stock Dest.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_DST'
      Calculated = True
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 64
  end
  object xTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT SUM(D.UNIDADES) AS UNIDADES, SUM(D.VALOR) AS IMPORTE, MIN' +
        '(C.RIC) AS RIC'
      'FROM GES_CABECERAS_ST C'
      'JOIN GES_DETALLES_ST D'
      'ON C.ID_ST=D.ID_ST'
      'WHERE'
      'C.EMPRESA = ?EMPRESA AND'
      'C.EJERCICIO = ?EJERCICIO AND'
      'C.SERIE = ?SERIE AND'
      'C.RIG = ?RIG')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 24
    Top = 112
    object xTotalesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xTotalesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xTotalesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
  end
  object DSxTotales: TDataSource
    DataSet = xTotales
    Left = 104
    Top = 112
  end
end
