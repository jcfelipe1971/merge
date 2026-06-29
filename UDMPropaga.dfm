object DMPropaga: TDMPropaga
  OldCreateOrder = False
  OnCreate = DMPropagaCreate
  Left = 500
  Top = 193
  Height = 491
  Width = 437
  object QMPropaga: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_PROPAGA'
      'WHERE'
      '  O_EMPRESA=?old_O_EMPRESA AND '
      '  O_EJERCICIO=?old_O_EJERCICIO AND '
      '  O_CANAL=?old_O_CANAL AND '
      '  D_EMPRESA=?old_D_EMPRESA AND '
      '  D_EJERCICIO=?old_D_EJERCICIO AND '
      '  D_CANAL=?old_D_CANAL ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_PROPAGA'
      
        '  (O_EMPRESA,O_EJERCICIO,O_CANAL,AUTO_EJERCICIOS,D_EMPRESA,D_EJE' +
        'RCICIO,D_CANAL,MODO,MODIFICA)'
      'VALUES'
      
        '  (?O_EMPRESA,?O_EJERCICIO,?O_CANAL,?AUTO_EJERCICIOS,?D_EMPRESA,' +
        '?D_EJERCICIO,?D_CANAL,?MODO,?MODIFICA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_PROPAGA'
      'WHERE'
      '  O_EMPRESA=?O_EMPRESA AND '
      '  O_EJERCICIO=?O_EJERCICIO AND '
      '  O_CANAL=?O_CANAL AND '
      '  D_EMPRESA=?D_EMPRESA AND '
      '  D_EJERCICIO=?D_EJERCICIO AND '
      '  D_CANAL=?D_CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_PROPAGA'
      'WHERE O_EMPRESA = ?EMPRESA '
      'AND O_EJERCICIO = ?EJERCICIO'
      'AND O_CANAL = ?CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_PROPAGA'
      'SET'
      '  AUTO_EJERCICIOS=?AUTO_EJERCICIOS '
      '  ,MODO=?MODO'
      '  ,MODIFICA = ?MODIFICA '
      'WHERE'
      '  O_EMPRESA=?O_EMPRESA AND '
      '  O_EJERCICIO=?O_EJERCICIO AND '
      '  O_CANAL=?O_CANAL AND '
      '  D_EMPRESA=?D_EMPRESA AND '
      '  D_EJERCICIO=?D_EJERCICIO AND '
      '  D_CANAL=?D_CANAL '
      '  ')
    AfterOpen = QMPropagaAfterOpen
    OnNewRecord = QMPropagaNewRecord
    ClavesPrimarias.Strings = (
      'O_EMPRESA '
      'O_EJERCICIO '
      'O_CANAL '
      'D_EMPRESA '
      'D_EJERCICIO '
      'D_CANAL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_PROPAGA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 24
    object QMPropagaO_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa Orig.'
      FieldName = 'O_EMPRESA'
      OnChange = QMPropagaO_EMPRESAChange
    end
    object QMPropagaO_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio Orig.'
      FieldName = 'O_EJERCICIO'
    end
    object QMPropagaO_CANAL: TIntegerField
      DisplayLabel = 'Canal Orig.'
      FieldName = 'O_CANAL'
      OnChange = QMPropagaO_CANALChange
    end
    object QMPropagaD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa D.'
      FieldName = 'D_EMPRESA'
    end
    object QMPropagaD_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio D.'
      FieldName = 'D_EJERCICIO'
    end
    object QMPropagaD_CANAL: TIntegerField
      DisplayLabel = 'Canal D.'
      FieldName = 'D_CANAL'
      OnChange = QMPropagaD_CANALChange
    end
    object QMPropagaAUTO_EJERCICIOS: TIntegerField
      DisplayLabel = 'Auto Ejer.'
      FieldName = 'AUTO_EJERCICIOS'
    end
    object QMPropagaMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMPropagaMODIFICA: TIntegerField
      DisplayLabel = 'Modifica'
      FieldName = 'MODIFICA'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 304
    Top = 24
  end
  object DSQMPropaga: TDataSource
    DataSet = QMPropaga
    Left = 168
    Top = 24
  end
  object xEmpresas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_EMPRESAS'
      'WHERE EMPRESA = ?O_EMPRESA')
    UniDirectional = False
    DataSource = DSQMPropaga
    Left = 48
    Top = 72
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CANAL FROM EMP_CANALES'
      'WHERE EMPRESA = ?O_EMPRESA AND'
      'EJERCICIO =?O_EJERCICIO AND'
      'CANAL = ?O_CANAL '
      'AND ACTIVO = 1')
    UniDirectional = False
    DataSource = DSQMPropaga
    AfterOpen = xCanalesAfterOpen
    Left = 48
    Top = 120
  end
  object DSxEmpresas: TDataSource
    DataSet = xEmpresas
    Left = 168
    Top = 72
  end
  object DSxCanales: TDataSource
    DataSet = xCanales
    Left = 168
    Top = 120
  end
  object xSys_Canales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CANALES'
      'WHERE CANAL = ?CANAL')
    UniDirectional = False
    DataSource = DSxCanales
    Left = 48
    Top = 168
  end
  object DSxSys_Canales: TDataSource
    DataSet = xSys_Canales
    Left = 168
    Top = 168
  end
  object xEmpresaDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_EMPRESAS'
      'WHERE EMPRESA = ?D_EMPRESA')
    UniDirectional = False
    DataSource = DSQMPropaga
    AfterOpen = xEmpresaDestinoAfterOpen
    Left = 48
    Top = 216
  end
  object xCanalesDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CANAL FROM EMP_CANALES'
      'WHERE EMPRESA =?D_EMPRESA AND'
      'EJERCICIO = ?D_EJERCICIO AND'
      'CANAL = ?D_CANAL'
      'AND ACTIVO = 1')
    UniDirectional = False
    DataSource = DSQMPropaga
    AfterOpen = xCanalesDestinoAfterOpen
    Left = 48
    Top = 264
  end
  object xSys_CanalesDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CANALES'
      'WHERE CANAL = ?CANAL')
    UniDirectional = False
    DataSource = DSxCanalesDestino
    Left = 48
    Top = 312
  end
  object DSxEmpresaDestino: TDataSource
    DataSet = xEmpresaDestino
    Left = 168
    Top = 216
  end
  object DSxCanalesDestino: TDataSource
    DataSet = xCanalesDestino
    Left = 168
    Top = 264
  end
  object DSxSys_CanalesDestino: TDataSource
    DataSet = xSys_CanalesDestino
    Left = 168
    Top = 312
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
    Top = 24
  end
end
