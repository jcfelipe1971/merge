object DMPackingList: TDMPackingList
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 805
  Top = 201
  Height = 440
  Width = 427
  object DSQMBultosDet: TDataSource
    DataSet = QMBultosDet
    Left = 192
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
    Top = 8
  end
  object DSQMBultoActual: TDataSource
    DataSet = QMBultoActual
    Left = 192
    Top = 8
  end
  object QMBultosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PACKING_LIST_DET'
      'WHERE'
      '  ID_B=?old_ID_B AND '
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PACKING_LIST_DET'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,NUMERO_BULTO,ID_B' +
        ',ID_B_PADRE,NIVEL,ORDEN,GRUPO,ARTICULO,TITULO,ID_DETALLES_S,LINE' +
        'A,UNIDADES,PESO_UNITARIO,CANTIDAD_ETIQUETAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?NUMERO_BU' +
        'LTO,?ID_B,?ID_B_PADRE,?NIVEL,?ORDEN,?GRUPO,?ARTICULO,?TITULO,?ID' +
        '_DETALLES_S,?LINEA,?UNIDADES,?PESO_UNITARIO,1)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PACKING_LIST_DET'
      'WHERE'
      '  ID_B=?ID_B AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PACKING_LIST_DET'
      'WHERE'
      'ID_S = :ID_S AND'
      '((ID_B = :ID_B) OR (ID_B IN (SELECT ID_B_H'
      
        '                             FROM G_PACKING_LIST_DESCENDENCIA(:I' +
        'D_S, :ID_B))))'
      'ORDER BY LINEA, NIVEL, ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PACKING_LIST_DET'
      'SET'
      '  PESO_UNITARIO=?PESO_UNITARIO'
      ' ,NUMERO_BULTO_DET=?NUMERO_BULTO_DET'
      ',CANTIDAD_ETIQUETAS = ?CANTIDAD_ETIQUETAS '
      'WHERE'
      '  ID_B=?ID_B AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    ClavesPrimarias.Strings = (
      'ID_B '
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PACKING_LIST_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMBultosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMBultosDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMBultosDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMBultosDetSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMBultosDetTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMBultosDetRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMBultosDetID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMBultosDetNUMERO_BULTO: TFIBStringField
      DisplayLabel = 'N'#250'm. Bulto'
      FieldName = 'NUMERO_BULTO'
      Size = 10
    end
    object QMBultosDetID_B: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_B'
    end
    object QMBultosDetID_B_PADRE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_B_PADRE'
    end
    object QMBultosDetNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMBultosDetORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMBultosDetGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMBultosDetARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMBultosDetTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMBultosDetID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMBultosDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMBultosDetUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMBultosDetPESO_UNITARIO: TFloatField
      DisplayLabel = 'Peso Unit.'
      FieldName = 'PESO_UNITARIO'
    end
    object QMBultosDetNUMERO_BULTO_DET: TFIBStringField
      DisplayLabel = 'Bulto Destino'
      FieldName = 'NUMERO_BULTO_DET'
      Size = 10
    end
    object QMBultosDetCANTIDAD_ETIQUETAS: TIntegerField
      DisplayLabel = 'Cant. Etiquetas'
      FieldName = 'CANTIDAD_ETIQUETAS'
    end
    object QMBultosDetPESO_LINEA: TFloatField
      DisplayLabel = 'Peso Linea'
      FieldName = 'PESO_LINEA'
    end
    object QMBultosDetALFA_1: TFIBStringField
      DisplayLabel = 'Campo 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMBultosDetALFA_2: TFIBStringField
      DisplayLabel = 'Campo 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMBultosDetALFA_3: TFIBStringField
      DisplayLabel = 'Campo 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMBultosDetALFA_4: TFIBStringField
      DisplayLabel = 'Campo 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMBultosDetALFA_5: TFIBStringField
      DisplayLabel = 'Campo 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMBultosDetALFA_6: TFIBStringField
      DisplayLabel = 'Campo 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMBultosDetALFA_7: TFIBStringField
      DisplayLabel = 'Campo 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMBultosDetALFA_8: TFIBStringField
      DisplayLabel = 'Campo 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object QMBultoActual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_BULTOS'
      'WHERE'
      '  ID_B=?old_ID_B ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_BULTOS'
      
        '  (SERIE,NUMERO_BULTO,PESO_NETO,PESO_BRUTO,VOLUMEN,PESO,ALTURA,R' +
        'IG,ID_S,ORDEN,NIVEL,ID_B,ID_B_PADRE,GRUPO,BULTO,EMPRESA,EJERCICI' +
        'O,CANAL,UBICACION,TITULO_BULTO,SSCC,TIPO,ALTO,ANCHO,FONDO,DIAMET' +
        'RO)'
      'VALUES'
      
        '  (?SERIE,?NUMERO_BULTO,?PESO_NETO,?PESO_BRUTO,?VOLUMEN,?PESO,?A' +
        'LTURA,?RIG,?ID_S,?ORDEN,?NIVEL,?ID_B,?ID_B_PADRE,?GRUPO,?BULTO,?' +
        'EMPRESA,?EJERCICIO,?CANAL,?UBICACION,?TITULO_BULTO,?SSCC,?TIPO,?' +
        'ALTO,?ANCHO,?FONDO,?DIAMETRO)')
    RefreshSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_DETALLES_S_BULTOS'
      '        WHERE'
      '        ID_S = C.ID_S AND'
      '        ID_B = C.ID_B) SUM_UNIDADES'
      'FROM GES_CABECERAS_S_BULTOS C'
      'WHERE'
      'C.ID_B = :ID_B')
    SelectSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM GES_DETALLES_S_BULTOS'
      '        WHERE'
      '        ID_S = C.ID_S AND'
      '        ID_B = C.ID_B) SUM_UNIDADES'
      'FROM GES_CABECERAS_S_BULTOS C'
      'WHERE'
      'C.ID_B = :ID_B')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_BULTOS'
      'SET'
      '  NUMERO_BULTO=?NUMERO_BULTO'
      '  ,PESO=?PESO'
      '  ,ALTO=?ALTO '
      '  ,ANCHO=?ANCHO '
      '  ,FONDO=?FONDO '
      '  ,DIAMETRO=?DIAMETRO '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,TITULO_BULTO=?TITULO_BULTO'
      '  ,BULTO=?BULTO'
      '  ,ALTURA=?ALTURA'
      '  ,SSCC=?SSCC'
      'WHERE'
      '  ID_B=?ID_B')
    AfterPost = QMBultoActualAfterPost
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_BULTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMBultoActualEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMBultoActualEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMBultoActualCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMBultoActualSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMBultoActualTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMBultoActualRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMBultoActualID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMBultoActualNUMERO_BULTO: TFIBStringField
      DisplayLabel = 'N'#250'm. Bulto'
      FieldName = 'NUMERO_BULTO'
      Size = 10
    end
    object QMBultoActualORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMBultoActualNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMBultoActualPESO_NETO: TFloatField
      DisplayLabel = 'Peso Neto'
      FieldName = 'PESO_NETO'
    end
    object QMBultoActualPESO_BRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUTO'
    end
    object QMBultoActualVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMBultoActualDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMBultoActualID_B: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_B'
    end
    object QMBultoActualID_B_PADRE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_B_PADRE'
    end
    object QMBultoActualUBICACION: TFIBStringField
      DisplayLabel = 'Ubicaci'#243'n'
      FieldName = 'UBICACION'
    end
    object QMBultoActualGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMBultoActualPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMBultoActualBULTO: TIntegerField
      DisplayLabel = 'Bulto'
      FieldName = 'BULTO'
      OnChange = QMBultoActualBULTOChange
    end
    object QMBultoActualTITULO_BULTO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_BULTO'
      Size = 60
    end
    object QMBultoActualSSCC: TFIBStringField
      FieldName = 'SSCC'
      Size = 40
    end
    object QMBultoActualSUM_UNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'SUM_UNIDADES'
    end
    object QMBultoActualALTURA: TFloatField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA'
    end
    object QMBultoActualALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMBultoActualANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMBultoActualFONDO: TFloatField
      DisplayLabel = 'Fondo'
      FieldName = 'FONDO'
    end
  end
  object QMDatosEmbarque: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_ALB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_ALB'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,TEXTO_PORTES,I_PORTE' +
        'S,I_BASE_RETENCION,P_RETENCION,RIC,'#13#10'TIPO_IRPF,A_IRPF,TOTAL_A_CO' +
        'BRAR,I_RETENCION,BULTOS_KRI,ID_S,TRASPASADO,ALMACEN_DEPOSITO,NUM' +
        '_MOV_DEPOSITO,DEPOSITO,'#13#10'DEVOLUCION_DEPOSITO,FECHA_CIERRE,DATOS_' +
        'EMBARQUE_IZQ,DATOS_EMBARQUE_DER,ID_REGISTRO,ALBARAN_VALORADO,FEC' +
        'HA_SERVIDO,EMPLEADO_RESPONSABLE,EMPLEADO_ATENCION,DOCUMENTO_MUES' +
        'TRAS,'#13#10'FACTURABLE,ENTRADA_FACTURACION,GARANTIA,FOLIO,TIPO_DOC_TR' +
        'IBUTARIO,SII_FMA_PAGO,TIPO_VENTA,ID_TIPO_DESPACHO,FECHA_ENTREGA_' +
        'REPARTO,ID_TIPO_GIRO_CLIENTE,'#13#10'ID_TIPO_GIRO_EMPRESA,INDTRASLADO,' +
        'TPOIMPRESION,FECHA_PACKING_LIST,COD_MOTIVO_ABONO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?TEXTO_PORTES,' +
        '?I_PORTES,?I_BASE_RETENCION,?P_RETENCION,?RIC,'#13#10'?TIPO_IRPF,?A_IR' +
        'PF,?TOTAL_A_COBRAR,?I_RETENCION,?BULTOS_KRI,?ID_S,?TRASPASADO,?A' +
        'LMACEN_DEPOSITO,?NUM_MOV_DEPOSITO,?DEPOSITO,'#13#10'?DEVOLUCION_DEPOSI' +
        'TO,?FECHA_CIERRE,?DATOS_EMBARQUE_IZQ,?DATOS_EMBARQUE_DER,?ID_REG' +
        'ISTRO,?ALBARAN_VALORADO,?FECHA_SERVIDO,?EMPLEADO_RESPONSABLE,?EM' +
        'PLEADO_ATENCION,?DOCUMENTO_MUESTRAS,'#13#10'?FACTURABLE,?ENTRADA_FACTU' +
        'RACION,?GARANTIA,?FOLIO,?TIPO_DOC_TRIBUTARIO,?SII_FMA_PAGO,?TIPO' +
        '_VENTA,?ID_TIPO_DESPACHO,?FECHA_ENTREGA_REPARTO,?ID_TIPO_GIRO_CL' +
        'IENTE,'#13#10'?ID_TIPO_GIRO_EMPRESA,?INDTRASLADO,?TPOIMPRESION,?FECHA_' +
        'PACKING_LIST,?COD_MOTIVO_ABONO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_ALB'
      'WHERE'
      '  ID_S=?ID_S')
    SelectSQL.Strings = (
      
        'SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKI' +
        'NG_LIST FROM GES_CABECERAS_S_ALB'
      'WHERE '
      'ID_S=?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_ALB'
      'SET'
      '  DATOS_EMBARQUE_IZQ=?DATOS_EMBARQUE_IZQ '
      '  ,DATOS_EMBARQUE_DER=?DATOS_EMBARQUE_DER '
      '  ,FECHA_PACKING_LIST=?FECHA_PACKING_LIST '
      'WHERE'
      '  ID_S=?ID_S ')
    ClavesPrimarias.Strings = (
      'ID_S'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_ALB'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QMDatosEmbarqueID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMDatosEmbarqueDATOS_EMBARQUE_IZQ: TBlobField
      DisplayLabel = 'Datos Embarque Izq.'
      FieldName = 'DATOS_EMBARQUE_IZQ'
      Size = 8
    end
    object QMDatosEmbarqueDATOS_EMBARQUE_DER: TBlobField
      DisplayLabel = 'Datos Embarque Der.'
      FieldName = 'DATOS_EMBARQUE_DER'
      Size = 8
    end
    object QMDatosEmbarqueFECHA_PACKING_LIST: TDateTimeField
      DisplayLabel = 'Fecha Packing List'
      FieldName = 'FECHA_PACKING_LIST'
    end
  end
  object DSQMDatosEmbarque: TDataSource
    DataSet = QMDatosEmbarque
    Left = 192
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
    Left = 328
    Top = 56
  end
  object xBultosDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT D.*, C.NUMERO_BULTO FROM GES_DETALLES_S_BULTOS D'
      'JOIN GES_CABECERAS_S_BULTOS C'
      'ON D.ID_B = C.ID_B'
      'WHERE '
      'D.ID_S=?ID_S'
      'ORDER BY D.LINEA')
    UniDirectional = False
    Left = 56
    Top = 152
    object xBultosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBultosDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xBultosDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xBultosDetSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xBultosDetTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xBultosDetRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xBultosDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xBultosDetID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xBultosDetID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xBultosDetID_B: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_B'
    end
    object xBultosDetUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xBultosDetPESO_UNITARIO: TFloatField
      DisplayLabel = 'Peso Unit.'
      FieldName = 'PESO_UNITARIO'
    end
    object xBultosDetNUMERO_BULTO_DET: TFIBStringField
      DisplayLabel = 'Nro. Bulto Det.'
      FieldName = 'NUMERO_BULTO_DET'
      Size = 10
    end
    object xBultosDetNUMERO_BULTO: TFIBStringField
      DisplayLabel = 'N'#250'm. Bulto'
      FieldName = 'NUMERO_BULTO'
      Size = 10
    end
  end
end
