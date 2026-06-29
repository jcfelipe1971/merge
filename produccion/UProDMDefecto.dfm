object ProDMDefecto: TProDMDefecto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 498
  Top = 234
  Height = 351
  Width = 351
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 220
    Top = 16
  end
  object QMDefecto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD_CAB_DEFECTO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD_CAB_DEFECTO'
      
        '  (EMPRESA,ID,FECHA,OP,COMPUESTO,TITULO_ARTICULO,FASE,TITULO_FAS' +
        'E,OPERARIO,TITULO_OPERARIO,CANTIDAD_TERMINADAS,CUARTAS,TIRADO,AC' +
        'TUALIZADO)'
      'VALUES'
      
        '  (?EMPRESA,?ID,?FECHA,?OP,?COMPUESTO,?TITULO_ARTICULO,?FASE,?TI' +
        'TULO_FASE,?OPERARIO,?TITULO_OPERARIO,?CANTIDAD_TERMINADAS,?CUART' +
        'AS,?TIRADO,?ACTUALIZADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_CAB_DEFECTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRO_ORD_CAB_DEFECTO'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD_CAB_DEFECTO'
      'SET'
      '  FECHA=?FECHA '
      '  ,OP=?OP '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FASE=?FASE '
      '  ,TITULO_FASE=?TITULO_FASE '
      '  ,OPERARIO=?OPERARIO '
      '  ,TITULO_OPERARIO=?TITULO_OPERARIO '
      '  ,CANTIDAD_TERMINADAS=?CANTIDAD_TERMINADAS '
      '  ,CUARTAS=?CUARTAS '
      '  ,TIRADO=?TIRADO '
      '  ,ACTUALIZADO=?ACTUALIZADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    AfterOpen = QMDefectoAfterOpen
    BeforeClose = QMDefectoBeforeClose
    BeforePost = QMDefectoBeforePost
    OnNewRecord = QMDefectoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRO_ORD_CAB_DEFECTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMDefectoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDefectoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDefectoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDefectoOP: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'OP'
    end
    object QMDefectoCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMDefectoTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Compuesto'
      FieldName = 'TITULO_ARTICULO'
      Size = 60
    end
    object QMDefectoFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
    object QMDefectoTITULO_FASE: TFIBStringField
      DisplayLabel = 'Titulo Fase'
      FieldName = 'TITULO_FASE'
      Size = 40
    end
    object QMDefectoOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMDefectoTITULO_OPERARIO: TFIBStringField
      DisplayLabel = 'Titulo Operario'
      FieldName = 'TITULO_OPERARIO'
      Size = 60
    end
    object QMDefectoCANTIDAD_TERMINADAS: TFloatField
      DisplayLabel = 'Cant. Terminada'
      FieldName = 'CANTIDAD_TERMINADAS'
    end
    object QMDefectoCUARTAS: TFloatField
      DisplayLabel = 'Cuartas'
      FieldName = 'CUARTAS'
    end
    object QMDefectoTIRADO: TFloatField
      DisplayLabel = 'Tirado'
      FieldName = 'TIRADO'
    end
    object QMDefectoACTUALIZADO: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTUALIZADO'
    end
  end
  object DSQMDefecto: TDataSource
    DataSet = QMDefecto
    Left = 120
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_DET_DEFECTO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_CAB=?old_ID_CAB AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_DET_DEFECTO'
      '  (EMPRESA,ID_CAB,LINEA,ID,CODIGO_DEFECTO,CANTIDAD)'
      'VALUES'
      '  (?EMPRESA,?ID_CAB,?LINEA,?ID,?CODIGO_DEFECTO,?CANTIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_DEFECTO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_CAB=?ID_CAB AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_DEFECTO'
      'WHERE EMPRESA=?EMPRESA AND'
      'ID_CAB=?ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_DET_DEFECTO'
      'SET'
      '  ID=?ID '
      '  ,CODIGO_DEFECTO=?CODIGO_DEFECTO '
      '  ,CANTIDAD=?CANTIDAD '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_CAB=?ID_CAB AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDefecto
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_CAB '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_DEFECTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleID_CAB: TIntegerField
      DisplayLabel = 'ID Cab.'
      FieldName = 'ID_CAB'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMDetalleCODIGO_DEFECTO: TIntegerField
      DisplayLabel = 'Cod. Defecto'
      FieldName = 'CODIGO_DEFECTO'
    end
    object QMDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetalleDescDefecto: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescDefecto'
      OnGetText = QMDetalleDescDefectoGetText
      Calculated = True
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 64
  end
  object xLineaDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) as nlinea from pro_ord_det_defecto'
      'where (id_cab=?id_cab)')
    Transaction = TLocal
    AutoTrans = True
    Left = 216
    Top = 112
  end
  object SPMarcar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure pro_ord_marcar_defecto (?EMPRESA,?FECHA_DESDE,' +
        '?FECHA_HASTA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 216
    Top = 168
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 216
    Top = 64
  end
end
