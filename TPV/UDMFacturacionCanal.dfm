object DMFacturacionCanal: TDMFacturacionCanal
  OldCreateOrder = False
  OnCreate = DMEmpCajasCreate
  Left = 605
  Top = 242
  Height = 268
  Width = 303
  object QMCanales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_CANAL_A_FACTURAR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND'
      '  CAJA=?old_CAJA')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_CANAL_A_FACTURAR'
      '  (EMPRESA,CANAL,PORCENTAJE,RESTO,CAJA,IMPORTE)'
      'VALUES'
      '  (?EMPRESA,?CANAL,?PORCENTAJE,?RESTO,?CAJA,?IMPORTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_CANAL_A_FACTURAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND'
      '  CAJA=?CAJA')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TICKET_CANAL_A_FACTURAR'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_CANAL_A_FACTURAR'
      'SET'
      '  PORCENTAJE=?PORCENTAJE '
      '  ,RESTO=?RESTO'
      '  ,IMPORTE=?IMPORTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND'
      '  CAJA=?CAJA')
    AfterDelete = Graba
    AfterOpen = QMCanalesAfterOpen
    AfterPost = Graba
    BeforeClose = QMCanalesBeforeClose
    OnNewRecord = QMCanalesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CAJA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_CANAL_A_FACTURAR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMCanalesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      OnChange = QMCanalesCANALChange
    end
    object QMCanalesPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMCanalesRESTO: TIntegerField
      DisplayLabel = 'Resto'
      FieldName = 'RESTO'
    end
    object QMCanalesCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
      OnChange = QMCanalesCAJAChange
    end
    object QMCanalesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSQMCanales: TDataSource
    DataSet = QMCanales
    Left = 112
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 16
  end
  object xCanal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_CANALES'
      'WHERE'
      'CANAL=?CANAL')
    UniDirectional = False
    DataSource = DSQMCanales
    Left = 40
    Top = 64
    object xCanalTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCanal: TDataSource
    DataSet = xCanal
    Left = 112
    Top = 64
  end
  object xCaja: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_CAJAS'
      'WHERE'
      'CAJA=?CAJA')
    UniDirectional = False
    DataSource = DSQMCanales
    Left = 40
    Top = 112
    object xCajaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCaja: TDataSource
    DataSet = xCaja
    Left = 112
    Top = 112
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
    Top = 64
  end
end
