object DMControl_Lotes: TDMControl_Lotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 402
  Top = 156
  Height = 425
  Width = 780
  object QMArticulos_Lotes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_LOTES'
      'WHERE'
      '  LOTE=?old_LOTE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_LOTES'
      
        '  (F_ENVASADO,F_CADUCIDAD,F_FABRICACION,SERIE,ID_A,CODIGO,PROVEE' +
        'DOR,ID_LOTE,EMPRESA,CANAL,CLASIFICACION,LOTE,AUTO_REETIQUETADO,A' +
        'LMACEN,ARTICULO,NOTAS,MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,PRECIO' +
        ')'
      'VALUES'
      
        '  (?F_ENVASADO,?F_CADUCIDAD,?F_FABRICACION,?SERIE,?ID_A,?CODIGO,' +
        '?PROVEEDOR,?ID_LOTE,?EMPRESA,?CANAL,?CLASIFICACION,?LOTE,?AUTO_R' +
        'EETIQUETADO,?ALMACEN,?ARTICULO,?NOTAS,?MEDIDA_1,?MEDIDA_2,?MEDID' +
        'A_3,?MEDIDA_4,?PRECIO)')
    RefreshSQL.Strings = (
      'SELECT'
      
        'L.*, A.TITULO_LARGO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.A' +
        'LFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8'
      'FROM ART_ARTICULOS_LOTES L'
      
        'JOIN ART_ARTICULOS A ON L.EMPRESA = A.EMPRESA AND L.ARTICULO = A' +
        '.ARTICULO'
      'WHERE'
      '  L.LOTE=?old_LOTE AND '
      '  L.ARTICULO=?ARTICULO AND '
      '  L.EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT L.*, A.TITULO_LARGO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA' +
        '_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8'
      'FROM ART_ARTICULOS_LOTES L'
      
        'JOIN ART_ARTICULOS A ON L.EMPRESA = A.EMPRESA AND L.ARTICULO = A' +
        '.ARTICULO'
      'WHERE'
      'L.EMPRESA = ?EMPRESA'
      'ORDER BY L.ARTICULO, L.LOTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_LOTES'
      'SET'
      '  LOTE = ?new_LOTE'
      '  ,F_ENVASADO=?F_ENVASADO '
      '  ,F_CADUCIDAD=?F_CADUCIDAD '
      '  ,F_FABRICACION=?F_FABRICACION '
      '  ,SERIE=?SERIE '
      '  ,ID_A=?ID_A '
      '  ,CODIGO=?CODIGO '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,CANAL=?CANAL '
      '  ,CLASIFICACION=?CLASIFICACION '
      '  ,AUTO_REETIQUETADO=?AUTO_REETIQUETADO '
      '  ,ALMACEN=?ALMACEN '
      '  ,NOTAS=?NOTAS'
      '  ,MEDIDA_1=?MEDIDA_1'
      '  ,MEDIDA_2=?MEDIDA_2'
      '  ,MEDIDA_3=?MEDIDA_3'
      '  ,MEDIDA_4=?MEDIDA_4'
      '  ,PRECIO=?PRECIO'
      'WHERE'
      '  LOTE=?old_LOTE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMArticulos_LotesAfterOpen
    BeforeClose = QMArticulos_LotesBeforeClose
    BeforePost = QMArticulos_LotesBeforePost
    OnNewRecord = QMArticulos_LotesNewRecord
    ClavesPrimarias.Strings = (
      'LOTE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_LOTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 104
    object QMArticulos_LotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulos_LotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticulos_LotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMArticulos_LotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulos_LotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMArticulos_LotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMArticulos_LotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMArticulos_LotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMArticulos_LotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMArticulos_LotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMArticulos_LotesID_A: TIntegerField
      DisplayLabel = 'ID Articulo'
      FieldName = 'ID_A'
    end
    object QMArticulos_LotesAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiquetado'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object QMArticulos_LotesCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMArticulos_LotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMArticulos_LotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMArticulos_LotesNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMArticulos_LotesMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMArticulos_LotesMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMArticulos_LotesMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMArticulos_LotesMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMArticulos_LotesPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMArticulos_LotesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 256
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMArticulos_LotesALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMArticulos_LotesALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMArticulos_LotesALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMArticulos_LotesALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMArticulos_LotesALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMArticulos_LotesALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMArticulos_LotesALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMArticulos_LotesALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSQMArticulos_Lotes: TDataSource
    DataSet = QMArticulos_Lotes
    Left = 144
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 32
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 8
  end
  object DSQMDetCompras: TDataSource
    DataSet = QMDetCompras
    Left = 384
    Top = 56
  end
  object DSQMDetVentas: TDataSource
    DataSet = QMDetVentas
    Left = 384
    Top = 104
  end
  object DSQMMovMan: TDataSource
    DataSet = QMDetMovMan
    Left = 384
    Top = 152
  end
  object QMDetCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT L.*, T.NOMBRE_R_SOCIAL'
      'FROM GES_DETALLES_E_LOTES L'
      
        'LEFT JOIN EMP_PROVEEDORES P ON L.EMPRESA = P.EMPRESA AND L.PROVE' +
        'EDOR = P.PROVEEDOR'
      'LEFT JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      '(L.ID_A = :ID_A AND'
      'L.ID_LOTE = :ID_LOTE AND'
      'L.TIPO = '#39'ALP'#39') OR (L.ID_A = :ID_A AND'
      'L.ID_LOTE = :ID_LOTE AND'
      'L.TIPO = '#39'FAP'#39' AND'
      '(NOT EXISTS(SELECT REL.D_EMPRESA'
      '            FROM GES_DETALLES_E_RELACIONES REL'
      '            WHERE'
      '            REL.D_EMPRESA = L.EMPRESA AND'
      '            REL.D_EJERCICIO = L.EJERCICIO AND'
      '            REL.D_CANAL = L.CANAL AND'
      '            REL.D_SERIE = L.SERIE AND'
      '            REL.D_TIPO = L.TIPO AND'
      '            REL.D_RIG = L.RIG AND'
      '            REL.D_LINEA = L.LINEA AND'
      '            REL.O_TIPO <> '#39'PEP'#39')))')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 256
    Top = 56
    object QMDetComprasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetComprasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetComprasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetComprasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetComprasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetComprasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetComprasLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object QMDetComprasLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetComprasN_SERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMDetComprasCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMDetComprasF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMDetComprasF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMDetComprasF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMDetComprasCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetComprasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetComprasALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetComprasID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetComprasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetComprasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetComprasID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetComprasLOTE_ANTERIOR: TFIBStringField
      DisplayLabel = 'Lote Ant.'
      FieldName = 'LOTE_ANTERIOR'
    end
    object QMDetComprasID_REETIQUETADO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_REETIQUETADO'
    end
    object QMDetComprasID_A_UBICACION: TIntegerField
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetComprasSUBLINEA: TIntegerField
      FieldName = 'SUBLINEA'
    end
    object QMDetComprasNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object QMDetVentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT L.*, C.CLIENTE, T.NOMBRE_R_SOCIAL'
      'FROM GES_DETALLES_S_LOTES L'
      'LEFT JOIN GES_DETALLES_S D ON L.ID_DETALLES_S = D.ID_DETALLES_S'
      'LEFT JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      
        'LEFT JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENT' +
        'E = CC.CLIENTE'
      'LEFT JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO'
      'WHERE'
      '(L.ID_A = :ID_A AND'
      'L.ID_LOTE = :ID_LOTE AND'
      'L.TIPO = '#39'ALB'#39') OR ((L.ID_A = :ID_A AND'
      '(L.ID_LOTE = :ID_LOTE) AND'
      '(L.TIPO = '#39'FAC'#39') AND'
      '(NOT EXISTS(SELECT REL.O_EMPRESA'
      '            FROM GES_DETALLES_RELACIONES REL'
      '            WHERE'
      '            REL.D_EMPRESA = L.EMPRESA AND'
      '            REL.D_EJERCICIO = L.EJERCICIO AND'
      '            REL.D_CANAL = L.CANAL AND'
      '            REL.D_SERIE = L.SERIE AND'
      '            REL.D_TIPO = L.TIPO AND'
      '            REL.D_RIG = L.RIG AND'
      '            REL.D_LINEA = L.LINEA AND'
      '            REL.O_TIPO <> '#39'PEC'#39'))))')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 256
    Top = 104
    object QMDetVentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetVentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetVentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetVentasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetVentasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetVentasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetVentasLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object QMDetVentasLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetVentasN_SERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMDetVentasCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMDetVentasF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMDetVentasF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMDetVentasF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMDetVentasCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetVentasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetVentasALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetVentasID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetVentasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetVentasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetVentasID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetVentasID_A_UBICACION: TIntegerField
      DisplayLabel = 'Id Art. Ubicacion'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetVentasSUBLINEA: TIntegerField
      DisplayLabel = 'Sublinea'
      FieldName = 'SUBLINEA'
    end
    object QMDetVentasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetVentasNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object QMDetMovMan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_DETALLES_ST_LOTES DET'
      'JOIN GES_CABECERAS_ST CAB'
      'ON'
      'CAB.EMPRESA = DET.EMPRESA AND'
      'CAB.EJERCICIO = DET.EJERCICIO AND'
      'CAB.SERIE = DET.SERIE AND'
      'CAB.RIG = DET.RIG'
      'WHERE'
      'CAB.TIPO_OPERACION IN ('#39'E'#39', '#39'S'#39', '#39'T'#39') AND'
      'DET.ID_A = :ID_A AND'
      'DET.ID_LOTE = :ID_LOTE')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 256
    Top = 152
    object QMDetMovManEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetMovManEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetMovManSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetMovManRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetMovManLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object QMDetMovManLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetMovManN_SERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMDetMovManCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMDetMovManF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMDetMovManF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMDetMovManF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMDetMovManCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetMovManARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetMovManALMACEN_ORI: TFIBStringField
      DisplayLabel = 'Alm. Ori.'
      FieldName = 'ALMACEN_ORI'
      Size = 3
    end
    object QMDetMovManALMACEN_DST: TFIBStringField
      DisplayLabel = 'Alm. Dest.'
      FieldName = 'ALMACEN_DST'
      Size = 3
    end
    object QMDetMovManCANAL_ORI: TIntegerField
      DisplayLabel = 'Canal Ori.'
      FieldName = 'CANAL_ORI'
    end
    object QMDetMovManCANAL_DST: TIntegerField
      DisplayLabel = 'Canal Dest.'
      FieldName = 'CANAL_DST'
    end
    object QMDetMovManID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetMovManPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetMovManID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetMovManLOTE_ANTERIOR: TFIBStringField
      DisplayLabel = 'Lote Ant.'
      FieldName = 'LOTE_ANTERIOR'
    end
    object QMDetMovManID_REETIQUETADO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_REETIQUETADO'
    end
    object QMDetMovManID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMDetMovManEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object QMDetMovManSERIE1: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE1'
      Size = 10
    end
    object QMDetMovManEJERCICIO1: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO1'
    end
    object QMDetMovManRIG1: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'RIG1'
    end
    object QMDetMovManTIPO_OPERACION: TFIBStringField
      DisplayLabel = 'Tipo Oper.'
      FieldName = 'TIPO_OPERACION'
      Size = 1
    end
    object QMDetMovManFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetMovManALMACEN_ORI1: TFIBStringField
      DisplayLabel = 'Alm. Ori.'
      FieldName = 'ALMACEN_ORI1'
      Size = 3
    end
    object QMDetMovManCANAL_ORI1: TIntegerField
      DisplayLabel = 'Canal Ori.'
      FieldName = 'CANAL_ORI1'
    end
    object QMDetMovManALMACEN_DST1: TFIBStringField
      DisplayLabel = 'Alm. Dest.'
      FieldName = 'ALMACEN_DST1'
      Size = 3
    end
    object QMDetMovManCANAL_DST1: TIntegerField
      DisplayLabel = 'Canal Dest.'
      FieldName = 'CANAL_DST1'
    end
    object QMDetMovManCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMDetMovManTIPO_VALORACION: TIntegerField
      DisplayLabel = 'Tipo Val.'
      FieldName = 'TIPO_VALORACION'
    end
    object QMDetMovManENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetMovManID_REG: TIntegerField
      DisplayLabel = 'ID Reg.'
      FieldName = 'ID_REG'
    end
    object QMDetMovManESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetMovManDEPOSITO: TIntegerField
      DisplayLabel = 'Deposito'
      FieldName = 'DEPOSITO'
    end
    object QMDetMovManDEFINITIVO: TIntegerField
      DisplayLabel = 'Definitivo'
      FieldName = 'DEFINITIVO'
    end
    object QMDetMovManSOF_MOVIMIENTO: TFIBStringField
      DisplayLabel = 'Movimiento'
      FieldName = 'SOF_MOVIMIENTO'
      Size = 1
    end
    object QMDetMovManID_A_UBICACION_E: TIntegerField
      DisplayLabel = 'ID Ubic. Art. E.'
      FieldName = 'ID_A_UBICACION_E'
    end
    object QMDetMovManID_A_UBICACION_S: TIntegerField
      DisplayLabel = 'ID Ubic. Art. S.'
      FieldName = 'ID_A_UBICACION_S'
    end
    object QMDetMovManORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QMDetMovManID_ORIGEN: TIntegerField
      DisplayLabel = 'ID Origen'
      FieldName = 'ID_ORIGEN'
    end
  end
  object DSQMSof_ArticulosLotes: TDataSource
    DataSet = QMSofArticulos_Lotes
    Left = 384
    Top = 296
  end
  object xArtStocks2: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM A_ART_DAME_STOCK_ART_ED(:EMPRESA, :CANAL, :ARTICULO, '#39#39', 1,' +
        ' 1, 1 /*DJI LRK KRI*/ , 1 /*DJI LRK KRI*/ , 0, 0, 0, NULL)'
      'WHERE'
      'CANAL = :CANAL'
      'ORDER BY ALMACEN, CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArticulos_Lotes
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 256
    Top = 248
    object xArtStocks2EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArtStocks2CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArtStocks2ALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArtStocks2TITULO_ALM: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ALM'
      Size = 60
    end
    object xArtStocks2ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArtStocks2TITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xArtStocks2EXISTENCIAS: TFloatField
      DisplayLabel = 'Stock.'
      FieldName = 'EXISTENCIAS'
    end
    object xArtStocks2EXISTENCIAS_EXT: TFloatField
      DisplayLabel = 'Existencias Ext.'
      FieldName = 'EXISTENCIAS_EXT'
    end
    object xArtStocks2ENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArtStocks2VALOR_ENTRADAS: TFloatField
      DisplayLabel = 'Val. Entr.'
      FieldName = 'VALOR_ENTRADAS'
    end
    object xArtStocks2SALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object xArtStocks2VALOR_SALIDAS: TFloatField
      DisplayLabel = 'Valor Sal.'
      FieldName = 'VALOR_SALIDAS'
    end
    object xArtStocks2VALOR_EXISTENCIAS: TFloatField
      DisplayLabel = 'Valor Exist.'
      FieldName = 'VALOR_EXISTENCIAS'
    end
    object xArtStocks2P_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xArtStocks2PMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object xArtStocks2STOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object xArtStocks2STOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object xArtStocks2PEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object xArtStocks2PEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object xArtStocks2PEDIDOS_A_TMP: TFloatField
      DisplayLabel = 'Pedidos Tmp.'
      FieldName = 'PEDIDOS_A_TMP'
    end
    object xArtStocks2STOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock Virt.'
      FieldName = 'STOCK_VIRTUAL'
    end
    object xArtStocks2RESERVADAS: TFloatField
      DisplayLabel = 'Reserv.'
      FieldName = 'RESERVADAS'
    end
    object xArtStocks2DISPONIBLES: TFloatField
      DisplayLabel = 'Disponibles'
      FieldName = 'DISPONIBLES'
    end
    object xArtStocks2EN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object xArtStocks2ID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArtStocks2EXISTENCIAS_REALES: TFloatField
      DisplayLabel = 'Exist. Reales'
      FieldName = 'EXISTENCIAS_REALES'
    end
  end
  object DSxArtStocks2: TDataSource
    DataSet = xArtStocks2
    Left = 384
    Top = 248
  end
  object QMProduccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_MAT_LOTES'
      'WHERE'
      'ID_A = :ID_A AND'
      'LOTE = :LOTE AND'
      'PROVEEDOR = :PROVEEDOR ')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 256
    Top = 8
    object QMProduccionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProduccionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProduccionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProduccionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProduccionNORDEN: TIntegerField
      DisplayLabel = 'N. Orden'
      FieldName = 'NORDEN'
    end
    object QMProduccionLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMProduccionN_SERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMProduccionCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMProduccionF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMProduccionF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMProduccionF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMProduccionCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMProduccionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProduccionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMProduccionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProduccionID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMProduccionESTADO_LOTE: TIntegerField
      DisplayLabel = 'Estado Lote'
      FieldName = 'ESTADO_LOTE'
    end
    object QMProduccionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMProduccionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProduccionPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProduccionID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMProduccionID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSProduccion: TDataSource
    DataSet = QMProduccion
    Left = 384
    Top = 8
  end
  object QMProSinAsignar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      'MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIEs, '
      'MAT.RIG_OF, MAT.LINEA_MAT, MAT.ALMACEN, '
      'MAT.COMPONENTE, MAT.ORDEN, MAT.LINEA_FASE, '
      'MAT.ID_ORDEN, MAT.ESTADO, MAT.UNIDADES_STOCK'
      'FROM PRO_ORD ORD'
      'JOIN PRO_ORD_MAT MAT ON (ORD.ID_ORDEN = MAT.ID_ORDEN)'
      'WHERE'
      'MAT.ID_A = :ID_A AND'
      '((ORD.SITUACION = 1) OR'
      '(ORD.SITUACION = 2) AND'
      '(ORD.ALMACEN_SAL = ORD.ALMACEN_LAN))'
      ''
      '/*'
      'SELECT *'
      'FROM PRO_ORD_MAT DET'
      
        'JOIN ART_ARTICULOS ART ON (ART.EMPRESA = DET.EMPRESA AND ART.ID_' +
        'A = DET.ID_A)'
      'JOIN PRO_ORD CAB ON (CAB.ID_ORDEN = DET.ID_ORDEN)'
      'WHERE'
      'DET.ID_A = :ID_A AND'
      'ART.LOTES = 1 AND'
      'CAB.FECHA_ORD >= ART.FECHA_ENLOTADO AND'
      'ID_ORDEN_MAT NOT IN (SELECT ID_ORDEN_MAT'
      '                     FROM PRO_ORD_MAT_LOTES'
      '                     WHERE'
      '                     ID_A = :ID_A)'
      '*/')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 512
    Top = 8
    object QMProSinAsignarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProSinAsignarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProSinAsignarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProSinAsignarSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProSinAsignarRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMProSinAsignarLINEA_MAT: TIntegerField
      DisplayLabel = 'Lin. Mat.'
      FieldName = 'LINEA_MAT'
    end
    object QMProSinAsignarALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMProSinAsignarCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMProSinAsignarORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProSinAsignarLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProSinAsignarID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProSinAsignarESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProSinAsignarUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'UNIDADES_STOCK'
    end
  end
  object DSQMProSinAsignar: TDataSource
    DataSet = QMProSinAsignar
    Left = 648
    Top = 8
  end
  object QMComSinAsignar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '-- Facturas sin origen en ALP y sin lote suficiente'
      
        'select d.empresa, d.ejercicio, d.canal, d.serie, d.tipo, d.rig, ' +
        'd.linea, d.almacen, d.articulo, d.titulo, d.unidades,'
      '       d.precio, c.id_e'
      'from ges_detalles_e d'
      'join art_articulos a on (a.id_a = d.id_a)'
      'join ges_cabeceras_e c on (c.id_e = d.id_e)'
      
        'left join ges_detalles_e_relaciones r on d.empresa = r.d_empresa' +
        ' and d.ejercicio = r.d_ejercicio and d.canal = r.d_canal and d.s' +
        'erie = r.d_serie and d.tipo = r.d_tipo and d.rig = r.d_rig and d' +
        '.linea = r.d_linea'
      'where'
      'd.id_a = :id_a and'
      'a.lotes = 1 and'
      'd.tipo = '#39'FAP'#39' and'
      '((r.o_empresa is null) or (r.o_tipo <> '#39'ALP'#39')) and'
      '(coalesce((select sum(cantidad)'
      '           from ges_detalles_e_lotes'
      '           where'
      '           id_detalles_e = d.id_detalles_e), 0) <> d.unidades)'
      'union'
      '-- Albaranes y sin lote suficiente'
      
        'select d.empresa, d.ejercicio, d.canal, d.serie, d.tipo, d.rig, ' +
        'd.linea, d.almacen, d.articulo, d.titulo, d.unidades,'
      '       d.precio, c.id_e'
      'from ges_detalles_e d'
      'join art_articulos a on (a.id_a = d.id_a)'
      'join ges_cabeceras_e c on (c.id_e = d.id_e)'
      'where'
      'd.id_a = :id_a and'
      'a.lotes = 1 and'
      'd.tipo = '#39'ALP'#39' and'
      '(coalesce((select sum(cantidad)'
      '           from ges_detalles_e_lotes'
      '           where'
      '           id_detalles_e = d.id_detalles_e), 0) <> d.unidades)')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 512
    Top = 56
    object QMComSinAsignarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMComSinAsignarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMComSinAsignarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMComSinAsignarSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMComSinAsignarTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMComSinAsignarRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMComSinAsignarLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object QMComSinAsignarALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMComSinAsignarARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMComSinAsignarTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMComSinAsignarUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMComSinAsignarID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
  end
  object DSQMComSinAsignar: TDataSource
    DataSet = QMComSinAsignar
    Left = 648
    Top = 56
  end
  object QMVentSinAsignar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '-- Facturas sin origen en ALB y sin lote suficiente'
      
        'select d.empresa, d.ejercicio, d.canal, d.serie, d.tipo, d.rig, ' +
        'd.linea, d.almacen, d.articulo, d.titulo, d.unidades,'
      '       d.precio, c.id_s'
      'from ges_detalles_s d'
      'join art_articulos a on (a.id_a = d.id_a)'
      'join ges_cabeceras_s c on (c.id_s = d.id_s)'
      
        'left join ges_detalles_relaciones r on d.id_detalles_s = r.d_id_' +
        'detalles_s'
      'where'
      'd.id_a = :id_a and'
      'a.lotes = 1 and'
      'd.tipo = '#39'FAC'#39' and'
      '((r.o_id_detalles_s is null) or (r.o_tipo <> '#39'ALB'#39')) and'
      '(coalesce((select sum(cantidad)'
      '           from ges_detalles_s_lotes'
      '           where'
      '           id_detalles_s = d.id_detalles_s), 0) <> d.unidades)'
      'union'
      '-- Albaranes y sin lote suficiente'
      
        'select d.empresa, d.ejercicio, d.canal, d.serie, d.tipo, d.rig, ' +
        'd.linea, d.almacen, d.articulo, d.titulo, d.unidades,'
      '       d.precio, c.id_s'
      'from ges_detalles_s d'
      'join art_articulos a on (a.id_a = d.id_a)'
      'join ges_cabeceras_s c on (c.id_s = d.id_s)'
      'where'
      'd.id_a = :id_a and'
      'a.lotes = 1 and'
      'd.tipo = '#39'ALB'#39' and'
      '(coalesce((select sum(cantidad)'
      '           from ges_detalles_s_lotes'
      '           where'
      '           id_detalles_s = d.id_detalles_s), 0) <> d.unidades)'
      ' ')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 512
    Top = 104
    object QMVentSinAsignarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVentSinAsignarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVentSinAsignarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVentSinAsignarSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMVentSinAsignarTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMVentSinAsignarRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMVentSinAsignarLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMVentSinAsignarALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMVentSinAsignarARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMVentSinAsignarTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMVentSinAsignarUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMVentSinAsignarPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMVentSinAsignarID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
  end
  object DSQMVentSinAsignar: TDataSource
    DataSet = QMVentSinAsignar
    Left = 648
    Top = 104
  end
  object DSQMProCompSinAsignar: TDataSource
    DataSet = QMProCompSinAsignar
    Left = 648
    Top = 152
  end
  object QMProCompSinAsignar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD DET'
      'JOIN ART_ARTICULOS ART ON (ART.ID_A = DET.ID_A)'
      'WHERE'
      'DET.ID_A = :ID_A AND'
      'ART.LOTES = 1 AND'
      'DET.FECHA_ORD >= ART.FECHA_ENLOTADO AND'
      'DET.SITUACION < 4 AND'
      'DET.ID_ORDEN NOT IN (SELECT ID_ORDEN'
      '                     FROM PRO_ORD_MAT_LOTES'
      '                     WHERE'
      '                     ID_A = :ID_A)')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 512
    Top = 152
    object QMProCompSinAsignarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCompSinAsignarEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCompSinAsignarCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCompSinAsignarSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMProCompSinAsignarRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMProCompSinAsignarSUBORDEN: TIntegerField
      DisplayLabel = 'Sub Orden'
      FieldName = 'SUBORDEN'
    end
    object QMProCompSinAsignarALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProCompSinAsignarALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMProCompSinAsignarALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMProCompSinAsignarFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fec. Ord.'
      FieldName = 'FECHA_ORD'
    end
    object QMProCompSinAsignarCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMProCompSinAsignarCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMProCompSinAsignarESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProCompSinAsignarESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProCompSinAsignarPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMProCompSinAsignarLINEA_PED: TIntegerField
      DisplayLabel = 'Lin. Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMProCompSinAsignarFECHA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PED'
    end
    object QMProCompSinAsignarUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QMProCompSinAsignarUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Man.'
      FieldName = 'UNI_MANUAL'
    end
    object QMProCompSinAsignarUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Tot.'
      FieldName = 'UNI_TOTAL'
    end
    object QMProCompSinAsignarUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object QMProCompSinAsignarUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QMProCompSinAsignarID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProCompSinAsignarTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanz.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMProCompSinAsignarID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMProCompSinAsignarID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMProCompSinAsignarARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProCompSinAsignarTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProCompSinAsignarUNIDADES: TFIBStringField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      Size = 2
    end
  end
  object QMSofArticulos_Lotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT LOTE, PROVEEDOR, STOCK, ALMACEN, MEDIDA1, MEDIDA2, MEDIDA' +
        '3, MEDIDA4, UNI_EN_FAB'
      'FROM SOF_ARTICULOS_LOTES(:EMPRESA, :ARTICULO, :CANAL)'
      'WHERE'
      'LOTE = :LOTE AND'
      'STOCK <> 0'
      'ORDER BY LOTE')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 256
    Top = 296
    object QMSofArticulos_LotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMSofArticulos_LotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMSofArticulos_LotesSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMSofArticulos_LotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMSofArticulos_LotesMEDIDA1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA1'
    end
    object QMSofArticulos_LotesMEDIDA2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA2'
    end
    object QMSofArticulos_LotesMEDIDA3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA3'
    end
    object QMSofArticulos_LotesMEDIDA4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA4'
    end
    object QMSofArticulos_LotesUNI_EN_FAB: TFloatField
      DisplayLabel = 'Uds. en Fab.'
      FieldName = 'UNI_EN_FAB'
    end
  end
  object DSQMDetMovUbi: TDataSource
    DataSet = QMDetMovUbi
    Left = 384
    Top = 200
  end
  object QMDetMovUbi: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_HISTORICO_MOV_UB'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'ID_LOTE = :ID_LOTE')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 256
    Top = 200
    object QMDetMovUbiENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetMovUbiEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetMovUbiEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetMovUbiCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetMovUbiN_MOV_UBICACION: TIntegerField
      DisplayLabel = 'Movimiento'
      FieldName = 'N_MOV_UBICACION'
    end
    object QMDetMovUbiO_ID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Orig.'
      FieldName = 'O_ID_UBICACION'
    end
    object QMDetMovUbiD_ID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Dest.'
      FieldName = 'D_ID_UBICACION'
    end
    object QMDetMovUbiID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetMovUbiO_ID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art. Orig.'
      FieldName = 'O_ID_A_UBICACION'
    end
    object QMDetMovUbiD_ID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art. Ubic. Dest.'
      FieldName = 'D_ID_A_UBICACION'
    end
    object QMDetMovUbiFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetMovUbiUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetMovUbiID_MOV_STOCKS_UB: TIntegerField
      DisplayLabel = 'ID Mov. Ubic.'
      FieldName = 'ID_MOV_STOCKS_UB'
    end
    object QMDetMovUbiID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetMovUbiO_COMPOSICION: TStringField
      DisplayLabel = 'Ubic. Origen'
      FieldKind = fkCalculated
      FieldName = 'O_COMPOSICION'
      OnGetText = QMDetMovUbiO_COMPOSICIONGetText
      Calculated = True
    end
    object QMDetMovUbiD_COMPOSICION: TStringField
      DisplayLabel = 'Ubicacion Destino'
      FieldKind = fkCalculated
      FieldName = 'D_COMPOSICION'
      OnGetText = QMDetMovUbiD_COMPOSICIONGetText
      Calculated = True
    end
  end
  object QMComposicionCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT COMPONENTE, TITULO_COMPONENTE, COMPOSICION FROM DAME_COMP' +
        'OSICION_COMPUESTO_JVV(:ID_LOTE)'
      '')
    SelectSQL.Strings = (
      
        'SELECT COMPONENTE, TITULO_COMPONENTE, COMPOSICION FROM DAME_COMP' +
        'OSICION_COMPUESTO_JVV(:ID_LOTE)')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 512
    Top = 200
    object QMComposicionCompuestoCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMComposicionCompuestoTITULO_COMPONENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_COMPONENTE'
      Size = 60
    end
    object QMComposicionCompuestoCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composici'#243'n'
      FieldName = 'COMPOSICION'
      Size = 200
    end
  end
  object DSComposicionCompuesto: TDataSource
    DataSet = QMComposicionCompuesto
    Left = 648
    Top = 200
  end
  object QMOrdenesProduccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from VER_PRO_ORD'
      'where ID_ORDEN in (select distinct(ID_ORDEN)'
      '                   from PRO_ORD_RESERVA'
      '                   where ID_LOTE = :ID_LOTE'
      '                   union'
      '                   select distinct(ID_ORDEN)'
      '                   from PRO_ORD_MAT_RESERVA_LOTES'
      '                   where ID_LOTE = :ID_LOTE)    ')
    UniDirectional = False
    DataSource = DSQMArticulos_Lotes
    Left = 512
    Top = 248
    object QMOrdenesProduccionID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMOrdenesProduccionESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
  end
  object DSOrdenesProduccion: TDataSource
    DataSet = QMOrdenesProduccion
    Left = 648
    Top = 248
  end
  object QMMovimientosStock: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT * FROM A_ART_DAME_MOV_STOCK_LOTES(:EMPRESA, :CANAL, :ALMA' +
        'CEN_DESDE, :ALMACEN_HASTA, :ARTICULO_DESDE, :ARTICULO_HASTA, :LO' +
        'TE_DESDE, :LOTE_HASTA, :FECHA_DESDE, :FECHA_HASTA, :FAMILIA_DESD' +
        'E, :FAMILIA_HASTA)'
      'WHERE'
      'ID_MOV_STOCK=?ID_MOV_STOCK AND'
      'ID_LOTE=?ID_LOTE')
    SelectSQL.Strings = (
      
        'SELECT * FROM A_ART_DAME_MOV_STOCK_LOTES(:EMPRESA, :CANAL, :ALMA' +
        'CEN_DESDE, :ALMACEN_HASTA, :ARTICULO_DESDE, :ARTICULO_HASTA, :LO' +
        'TE_DESDE, :LOTE_HASTA, :FECHA_DESDE, :FECHA_HASTA, :FAMILIA_DESD' +
        'E, :FAMILIA_HASTA)'
      'ORDER BY FECHA, ARTICULO, LOTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    ClavesPrimarias.Strings = (
      'ID_MOV_STOCK '
      'ID_LOTE'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 512
    Top = 296
    object QMMovimientosStockEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMovimientosStockCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMovimientosStockALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMMovimientosStockARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMMovimientosStockLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMMovimientosStockENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMMovimientosStockSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMMovimientosStockFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMMovimientosStockDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. N'#250'mero'
      FieldName = 'DOC_NUMERO'
    end
    object QMMovimientosStockDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMMovimientosStockDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMMovimientosStockTIPO_OPER: TFIBStringField
      DisplayLabel = 'Tipo. Oper.'
      FieldName = 'TIPO_OPER'
      Size = 1
    end
    object QMMovimientosStockID_DOC: TIntegerField
      DisplayLabel = 'ID Doc'
      FieldName = 'ID_DOC'
    end
    object QMMovimientosStockID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMMovimientosStockID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMMovimientosStockCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli/Pro'
      FieldName = 'COD_CLI_PRO'
    end
    object QMMovimientosStockTITULO_CLI_PRO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLI_PRO'
      Size = 60
    end
    object QMMovimientosStockREF_PEDIDO: TFIBStringField
      DisplayLabel = 'Ref. Pedido'
      FieldName = 'REF_PEDIDO'
      Size = 40
    end
    object QMMovimientosStockID_DOC_PEDIDO: TIntegerField
      DisplayLabel = 'ID Doc. Pedido'
      FieldName = 'ID_DOC_PEDIDO'
    end
    object QMMovimientosStockPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMMovimientosStockPRECIO_SIN_DTO: TFloatField
      DisplayLabel = 'Precio Sin Dto.'
      FieldName = 'PRECIO_SIN_DTO'
    end
    object QMMovimientosStockCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMMovimientosStockTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo Art'#237'culo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMMovimientosStockFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
  end
  object DSQMMovimientosStock: TDataSource
    DataSet = QMMovimientosStock
    Left = 648
    Top = 296
  end
end
