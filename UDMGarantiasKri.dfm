object DMGarantiasKri: TDMGarantiasKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 282
  Top = 154
  Height = 271
  Width = 317
  object DSxGarantias: TDataSource
    DataSet = xGarantias
    Left = 136
    Top = 16
  end
  object xGarantias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_GARANTIAS_REPARACION'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID=?old_ID AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA AND'
      '  ID_S_CAB=?old_ID_S_CAB ')
    InsertSQL.Strings = (
      'INSERT INTO ART_GARANTIAS_REPARACION'
      
        '  (EMPRESA,ARTICULO,ID,DETALLE,REFERENCIA,ORDEN_TRABAJO,ORDEN,MA' +
        'RCA,ID_S_CAB)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?ID,?DETALLE,?REFERENCIA,?ORDEN_TRABAJO,?O' +
        'RDEN,?MARCA,?ID_S_CAB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_GARANTIAS_REPARACION'
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  ID=?ID AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA AND'
      '  ID_S_CAB=?ID_S_CAB '
      '')
    SelectSQL.Strings = (
      'SELECT * FROM ART_GARANTIAS_REPARACION'
      'WHERE'
      'ID_S_CAB=?ID_S_CAB'
      'ORDER BY ARTICULO,ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_GARANTIAS_REPARACION'
      'SET'
      '  REFERENCIA=?REFERENCIA '
      '  ,ORDEN_TRABAJO=?ORDEN_TRABAJO '
      '  ,MARCA=?MARCA '
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  ID=?ID AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ID_S_CAB=?ID_S_CAB ')
    AfterScroll = xGarantiasAfterScroll
    OnNewRecord = xGarantiasNewRecord
    ClavesPrimarias.Strings = (
      'DETALLE '
      'ID '
      'ARTICULO '
      'EMPRESA '
      'ID_S_CAB ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_GARANTIAS_REPARACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 16
    object xGarantiasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xGarantiasARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xGarantiasID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xGarantiasDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object xGarantiasREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object xGarantiasORDEN_TRABAJO: TFIBStringField
      DisplayLabel = 'Orden Trabajo'
      FieldName = 'ORDEN_TRABAJO'
      Size = 15
    end
    object xGarantiasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xGarantiasMARCA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'MARCA'
    end
    object xGarantiasID_S_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S_CAB'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 264
    Top = 64
  end
end
