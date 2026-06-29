object DMEscandalloProd_kri: TDMEscandalloProd_kri
  OldCreateOrder = False
  OnCreate = DMEscandalloProdCreate
  Left = 568
  Top = 279
  Height = 294
  Width = 424
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 336
    Top = 16
  end
  object QMEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_ESC_PRODUCCION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  NUMERO=?old_NUMERO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_ESC_PRODUCCION'
      
        '  (FECHA_HASTA,FECHA_DESDE,UNIDADES,NUMERO,ACTIVO,EMPRESA,ARTICU' +
        'LO,COSTE)'
      'VALUES'
      
        '  (?FECHA_HASTA,?FECHA_DESDE,?UNIDADES,?NUMERO,?ACTIVO,?EMPRESA,' +
        '?ARTICULO,?COSTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ver_articulos_esc_prod_tit_kri'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  NUMERO=?NUMERO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESC_PROD_TIT_KRI C'
      'WHERE '
      'C.EMPRESA = :EMPRESA AND'
      'C.ACTIVO = 1'
      'ORDER BY C.ARTICULO, C.ACTIVO DESC, C.NUMERO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_ESC_PRODUCCION'
      'SET'
      '  FECHA_HASTA=?FECHA_HASTA '
      '  ,FECHA_DESDE=?FECHA_DESDE '
      '  ,UNIDADES=?UNIDADES '
      '  ,ACTIVO=?ACTIVO '
      '  ,COSTE=?COSTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  NUMERO=?NUMERO ')
    AfterDelete = Graba
    AfterOpen = QMEscandalloAfterOpen
    AfterPost = QMEscandalloAfterPost
    BeforePost = QMEscandalloBeforePost
    OnNewRecord = QMEscandalloNewRecord
    OnPostError = QMEscandalloPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'NUMERO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ver_articulos_esc_prod_tit_kri'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMEscandalloARTICULOChange
      Size = 15
    end
    object QMEscandalloNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEscandalloUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMEscandalloFECHA_DESDE: TDateTimeField
      DisplayLabel = 'Fecha Desde'
      FieldName = 'FECHA_DESDE'
    end
    object QMEscandalloFECHA_HASTA: TDateTimeField
      DisplayLabel = 'Fecha Hasta'
      FieldName = 'FECHA_HASTA'
    end
    object QMEscandalloACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEscandalloCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMEscandalloSUM_UNID_KRI: TFloatField
      DisplayLabel = 'Suma Uds.'
      FieldKind = fkCalculated
      FieldName = 'SUM_UNID_KRI'
      OnGetText = QMEscandalloSUM_UNID_KRIGetText
      Calculated = True
    end
    object QMEscandalloTITULO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 144
    Top = 16
  end
  object DSQMEscandalloDet: TDataSource
    DataSet = QMEscandalloDet
    Left = 144
    Top = 64
  end
  object QMEscandalloDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_ESCANDALLO_PROD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  NUMERO=?old_NUMERO AND '
      '  DETALLE=?old_DETALLE AND '
      '  LINEA = ?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_ESCANDALLO_PROD'
      
        '  (EMPRESA,ARTICULO,NUMERO,DETALLE,LINEA,CANTIDAD,COSTE,TITULO,/' +
        '*FAMILIA,*/P_COSTE)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?NUMERO,?DETALLE,?LINEA,?CANTIDAD,?COSTE,?' +
        'TITULO,/*?FAMILIA,*/?P_COSTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_ESCANDALLO_PROD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  NUMERO=?NUMERO AND '
      '  DETALLE=?DETALLE AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'select   PROD.EMPRESA,'
      '         PROD.ARTICULO,'
      '         PROD.NUMERO,'
      '         PROD.DETALLE,'
      '         PROD.LINEA,'
      '         PROD.CANTIDAD,'
      '         PROD.COSTE,'
      '         PROD.TITULO,'
      '         ART.FAMILIA,'
      '         ART.P_COSTE'
      '  from art_articulos_esc_prod_detalle prod'
      '  left join art_articulos art'
      '  on (art.empresa=prod.empresa)and(art.articulo=prod.detalle)'
      'WHERE prod.EMPRESA =?EMPRESA AND prod.ARTICULO=?ARTICULO AND'
      ' prod.NUMERO=?NUMERO'
      'ORDER BY prod.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_ESCANDALLO_PROD'
      'SET'
      '  CANTIDAD=?CANTIDAD '
      '  ,COSTE=?COSTE '
      '  ,TITULO=?TITULO '
      '/*  ,FAMILIA=?FAMILIA */'
      '  ,P_COSTE=?P_COSTE '
      '  ,DETALLE=?DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA = ?LINEA ')
    DataSource = DSQMEscandallo
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMEscandalloDetBeforePost
    OnNewRecord = QMEscandalloDetNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'NUMERO '
      'DETALLE '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_ESCANDALLO_PROD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMEscandalloDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloDetARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMEscandalloDetNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEscandalloDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      OnChange = QMEscandalloDetDETALLEChange
      Size = 15
    end
    object QMEscandalloDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMEscandalloDetTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEscandalloDetFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEscandalloDetP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMEscandalloDetCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMEscandalloDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 144
    Top = 160
  end
  object QContador: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(NUMERO) AS CONTADOR FROM ART_ARTICULOS_ESC_PRODUCCION'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    Transaction = TLocal
    AutoTrans = True
    Left = 248
    Top = 112
  end
  object xArticulosDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    Transaction = TLocal
    AutoTrans = True
    Left = 248
    Top = 64
  end
  object QEjercicio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT APERTURA, CIERRE FROM EMP_EJERCICIOS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO')
    Transaction = TLocal
    AutoTrans = True
    Left = 248
    Top = 16
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSQMEscandallo
    Left = 40
    Top = 160
  end
  object QDuplicaEscandalloTyC: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_duplica_esc_prod_tyc (?EMPRESA,?ARTICULO' +
        ',?NUMERO)')
    Transaction = TUpdate
    AutoTrans = True
    Left = 248
    Top = 160
  end
  object DSQMEscandalloProc: TDataSource
    DataSet = QMEscandalloProc
    Left = 144
    Top = 112
  end
  object QMEscandalloProc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_ESCANDALLO_PROC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  NUMERO=?old_NUMERO AND '
      '  PROCESO=?old_PROCESO AND'
      '  LINEA=?old_LINEA')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_ESCANDALLO_PROC'
      
        '  (EMPRESA,ARTICULO,NUMERO,PROCESO,TITULO_PROCESO,DURACION,PRECI' +
        'O,LINEA,OPERARIO,TITULO_OP)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?NUMERO,?PROCESO,?TITULO_PROCESO,?DURACION' +
        ',?PRECIO,?LINEA,?OPERARIO,?TITULO_OP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_ESCANDALLO_PROC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  NUMERO=?NUMERO AND '
      '  PROCESO=?PROCESO AND'
      '  LINEA = ?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESCANDALLO_PROC'
      '   where empresa=?empresa and articulo=?articulo '
      '              and numero=?numero'
      '     order by proceso')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_ESCANDALLO_PROC'
      'SET'
      '  TITULO_PROCESO=?TITULO_PROCESO '
      '  ,DURACION=?DURACION '
      '  ,PRECIO=?PRECIO'
      '  ,OPERARIO=?OPERARIO'
      '  ,TITULO_OP=?TITULO_OP '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  NUMERO=?NUMERO AND '
      '  PROCESO=?PROCESO AND'
      '  LINEA=?LINEA ')
    DataSource = DSQMEscandallo
    AfterDelete = QMEscandalloProcAfterDelete
    AfterPost = QMEscandalloProcAfterPost
    OnNewRecord = QMEscandalloProcNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'NUMERO '
      'PROCESO '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_ESCANDALLO_PROC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMEscandalloProcEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloProcNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEscandalloProcPROCESO: TIntegerField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
      OnChange = QMEscandalloProcPROCESOChange
    end
    object QMEscandalloProcARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMEscandalloProcPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMEscandalloProcDURACION: TFloatField
      DisplayLabel = 'Duraci'#243'n'
      FieldName = 'DURACION'
    end
    object QMEscandalloProcTITULO_PROCESO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PROCESO'
      Size = 60
    end
    object QMEscandalloProcLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMEscandalloProcOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMEscandalloProcTITULO_OP: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_OP'
      Size = 60
    end
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
    Top = 64
  end
  object DSxCaracteristicas: TDataSource
    DataSet = xCaracteristicas
    Left = 144
    Top = 208
  end
  object xCaracteristicas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_CARACTERISTICA'
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'ARTICULO = :ARTICULO '
      'ORDER BY CODIGO')
    UniDirectional = False
    DataSource = DSQMEscandallo
    Left = 40
    Top = 208
  end
end
