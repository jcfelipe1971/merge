object DMPedidosEntreAlmacenes: TDMPedidosEntreAlmacenes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 273
  Top = 155
  Height = 269
  Width = 403
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_PEA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_PEA'
      
        '  (ID,EMPRESA,EJERCICIO,CANAL,SERIE,RIG,FECHA,ALMACEN_ORI,ALMACE' +
        'N_DST,COMENTARIO,ENTRADA,ESTADO,NOTAS)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?FECHA,?ALMACEN_OR' +
        'I,?ALMACEN_DST,?COMENTARIO,?ENTRADA,?ESTADO,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_PEA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_PEA'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      '((EJERCICIO=?EJERCICIO) OR (ESTADO = 0))) AND'
      'CANAL=?CANAL AND'
      '(ALMACEN_ORI=?ALMACEN OR ALMACEN_DST=?ALMACEN)'
      'ORDER BY EJERCICIO, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_PEA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,RIG=?RIG '
      '  ,FECHA=?FECHA '
      '  ,ALMACEN_ORI=?ALMACEN_ORI '
      '  ,ALMACEN_DST=?ALMACEN_DST '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,ENTRADA=?ENTRADA '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  ID=?ID ')
    AfterEdit = QMCabeceraAfterEdit
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    BeforeDelete = QMCabeceraBeforeDelete
    BeforeEdit = QMCabeceraBeforeEdit
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_PEA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 20
    object QMCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
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
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraALMACEN_ORI: TFIBStringField
      DisplayLabel = 'Alm. Orig.'
      FieldName = 'ALMACEN_ORI'
      Size = 3
    end
    object QMCabeceraALMACEN_DST: TFIBStringField
      DisplayLabel = 'Alm. Dest.'
      FieldName = 'ALMACEN_DST'
      Size = 3
    end
    object QMCabeceraCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = QMCabeceraTITULO_ESTADOGetText
      Size = 30
      Calculated = True
    end
    object QMCabeceraMOV_MAN_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Man.'
      FieldName = 'MOV_MAN_STOCK'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 111
    Top = 20
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 336
    Top = 10
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_PEA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_PEA'
      
        '  (ID,ID_CAB,EMPRESA,EJERCICIO,CANAL,SERIE,RIG,LINEA,ARTICULO,TI' +
        'TULO,UNIDADES_PED,PRECIO,UNIDADES_ENV,UNIDADES_REC,ENTRADA,ID_A,' +
        'ID_C_A)'
      'VALUES'
      
        '  (?ID,?ID_CAB,?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?LINEA,?AR' +
        'TICULO,?TITULO,?UNIDADES_PED,?PRECIO,?UNIDADES_ENV,?UNIDADES_REC' +
        ',?ENTRADA,?ID_A,?ID_C_A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_PEA '
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_PEA'
      'WHERE '
      'ID_CAB=?ID'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_PEA'
      'SET'
      '  ID_CAB=?ID_CAB '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES_PED=?UNIDADES_PED '
      '  ,PRECIO=?PRECIO '
      '  ,UNIDADES_ENV=?UNIDADES_ENV '
      '  ,UNIDADES_REC=?UNIDADES_REC '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabecera
    AfterPost = QMDetalleAfterPost
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = QMDetalleBeforeEdit
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_PEA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 68
    object QMDetalleID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetalleID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
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
      OnChange = QMDetalleARTICULOChange
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNIDADES_PED'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleUNIDADES_ENV: TFloatField
      DisplayLabel = 'Uds. Env.'
      FieldName = 'UNIDADES_ENV'
    end
    object QMDetalleUNIDADES_REC: TFloatField
      DisplayLabel = 'Uds. Rec.'
      FieldName = 'UNIDADES_REC'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM2: TFloatField
      DisplayLabel = 'Stock Alm. 2'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM3: TFloatField
      DisplayLabel = 'Stock Alm. 3'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM3'
      Calculated = True
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 68
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 244
    Top = 8
  end
end
