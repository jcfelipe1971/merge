object DMIntroduceSeries: TDMIntroduceSeries
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 542
  Top = 104
  Height = 505
  Width = 422
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 336
    Top = 16
  end
  object QMTmpAsignar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_ASIGNAR_SERIALIZACION'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_DETALLES=?old_ID_DETALLES AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_ASIGNAR_SERIALIZACION'
      '  (LINEA,ID,ID_DETALLES,ARTICULO,UNIDADES,NSERIE)'
      'VALUES'
      '  (?LINEA,?ID,?ID_DETALLES,?ARTICULO,?UNIDADES,?NSERIE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ASIGNAR_SERIALIZACION'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_DETALLES=?ID_DETALLES AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_ASIGNAR_SERIALIZACION'
      'WHERE'
      'ID_DETALLES = :ID_DETALLES AND'
      'ARTICULO = :ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_ASIGNAR_SERIALIZACION'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,NSERIE=?NSERIE '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_DETALLES=?ID_DETALLES AND '
      '  ID=?ID ')
    DataSource = DSArticulos
    BeforePost = QMTmpAsignarBeforePost
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_DETALLES '
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_ASIGNAR_SERIALIZACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 208
    object QMTmpAsignarID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMTmpAsignarID_DETALLES: TIntegerField
      DisplayLabel = 'ID Detalles'
      FieldName = 'ID_DETALLES'
    end
    object QMTmpAsignarLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMTmpAsignarARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTmpAsignarUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMTmpAsignarNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
  end
  object DSQMTmpAsignar: TDataSource
    DataSet = QMTmpAsignar
    Left = 160
    Top = 208
  end
  object xAsignados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT A.ARTICULO, A.NSERIE, D.ID_GDS'
      'FROM GES_DETALLES_SERIALIZACION D'
      
        'LEFT JOIN ART_ARTICULOS_SERIALIZACION A ON A.EMPRESA = D.EMPRESA' +
        ' AND A.CANAL = D.CANAL AND A.CODIGO = D.CODIGO AND A.ALMACEN = D' +
        '.ALMACEN'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO = :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.SERIE = :SERIE AND'
      'D.TIPO = :TIPO AND'
      'D.RIG = :RIG AND'
      'D.LINEA = :LINEA AND'
      'A.ARTICULO = :ARTICULO'
      'ORDER BY D.ID_GDS')
    UniDirectional = False
    DataSource = DSArticulos
    Left = 48
    Top = 160
    object xAsignadosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xAsignadosNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xAsignadosID_GDS: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_GDS'
    end
  end
  object DSxAsignados: TDataSource
    DataSet = xAsignados
    Left = 160
    Top = 160
  end
  object xComprobarAsignados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT COUNT(*) AS ASIGNADOS'
      'FROM GES_DETALLES_SERIALIZACION DET'
      'JOIN ART_ARTICULOS_SERIALIZACION ART '
      'ON '
      'ART.EMPRESA = DET.EMPRESA AND '
      'ART.CANAL = DET.CANAL AND '
      'ART.CODIGO = DET.CODIGO AND '
      'ART.ALMACEN = DET.ALMACEN'
      'WHERE'
      'DET.EMPRESA = :EMPRESA AND'
      'DET.EJERCICIO = :EJERCICIO AND'
      'DET.CANAL = :CANAL AND'
      'DET.SERIE = :SERIE  AND'
      'DET.TIPO = :TIPO AND'
      'DET.RIG = :RIG AND'
      'DET.LINEA = :LINEA AND'
      'DET.ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSArticulos
    Left = 48
    Top = 112
    object xComprobarAsignadosASIGNADOS: TIntegerField
      DisplayLabel = 'Asignados'
      FieldName = 'ASIGNADOS'
    end
  end
  object DSxCompAsignados: TDataSource
    DataSet = xComprobarAsignados
    Left = 160
    Top = 112
  end
  object xDetalles: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, CANAL, EJERCICIO, SERIE, TIPO, RIG, LINEA, ARTIC' +
        'ULO, UNIDADES, ALMACEN, ID_E AS ID_DOC'
      'FROM GES_DETALLES_E'
      'WHERE'
      'ID_DETALLES_E = :ID_DETALLES AND'
      'TIPO = :TIPO')
    UniDirectional = False
    DataSource = DSArticulos
    Left = 48
    Top = 64
    object xDetallesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetallesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetallesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetallesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetallesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDetallesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDetallesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetallesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDetallesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xDetallesID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object xDetallesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object DSxDetalles: TDataSource
    DataSet = xDetalles
    Left = 160
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 336
    Top = 64
  end
  object QMArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT '#39'ART'#39' AS TIPO_ART, A.ARTICULO, D.ID_DETALLES_S AS ID_DETA' +
        'LLES, D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO,'
      '       D.RIG, D.LINEA'
      'FROM GES_DETALLES_S D'
      
        'JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A' +
        '.ARTICULO'
      'WHERE'
      'D.ID_DETALLES_S = :ID_DETALLE AND'
      'A.SERIALIZADO = 1'
      'UNION'
      
        'SELECT '#39'ESC'#39' AS TIPO_ART, A.ARTICULO, D.ID_DETALLES_S AS ID_DETA' +
        'LLES, D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO,'
      '       D.RIG, D.LINEA'
      'FROM GES_DETALLES_S D'
      
        'JOIN ART_ARTICULOS_ESCANDALLO E ON D.EMPRESA = E.EMPRESA AND D.A' +
        'RTICULO = E.ARTICULO'
      
        'JOIN ART_ARTICULOS A ON E.EMPRESA = A.EMPRESA AND E.DETALLE = A.' +
        'ARTICULO'
      'WHERE'
      'D.ID_DETALLES_S = :ID_DETALLE AND'
      'A.SERIALIZADO = 1')
    UniDirectional = False
    AfterOpen = QMArticulosAfterOpen
    BeforeClose = QMArticulosBeforeClose
    Left = 48
    Top = 16
    object QMArticulosTIPO: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ART'
      Size = 3
    end
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosID_DETALLES: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES'
    end
    object QMArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticulosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMArticulosTIPO1: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMArticulosRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMArticulosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSArticulos: TDataSource
    DataSet = QMArticulos
    Left = 160
    Top = 16
  end
end
