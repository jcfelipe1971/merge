object Dashboard: TDashboard
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 218
  Top = 201
  Height = 185
  Width = 387
  object xDashBoard: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_DASHBOARD'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_DASHBOARD'
      
        '  (ID,'#13#10'EMPRESA,USUARIO,ORDEN,PAGINA,DESCRIPCION,TIPO,SQL,TRANSA' +
        'CCION_READONLY,CONFIGURACION)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?USUARIO,?ORDEN,?PAGINA,?DESCRIPCION,?TIPO,?SQ' +
        'L,?TRANSACCION_READONLY,?CONFIGURACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_DASHBOARD'
      'WHERE'
      '  ID=?ID '
      
        'SELECT U.*, D.DESCRIPCION, D.TIPO, D.SQL, D.TRANSACCION_READONLY' +
        ', D.CONFIGURACION'
      'FROM EMP_DASHBOARD_USUARIO U'
      'JOIN EMP_DASHBOARD D ON D.ID = U.ID'
      'WHERE'
      'U.EMPRESA = :EMPRESA AND'
      'U.USUARIO = :USUARIO AND'
      'U.ID = :ID')
    SelectSQL.Strings = (
      
        'SELECT U.*, D.DESCRIPCION, D.TIPO, D.SQL, D.TRANSACCION_READONLY' +
        ', D.CONFIGURACION'
      'FROM EMP_DASHBOARD_USUARIO U'
      'JOIN EMP_DASHBOARD D ON D.ID = U.ID'
      'WHERE'
      'U.EMPRESA = :EMPRESA AND'
      'U.USUARIO = :USUARIO'
      'ORDER BY U.PAGINA, U.ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_DASHBOARD'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,USUARIO=?USUARIO '
      '  ,ORDEN=?ORDEN '
      '  ,PAGINA=?PAGINA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,TIPO=?TIPO '
      '  ,SQL=?SQL '
      '  ,TRANSACCION_READONLY=?TRANSACCION_READONLY '
      '  ,CONFIGURACION=?CONFIGURACION '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_DASHBOARD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object xDashBoardID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xDashBoardEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDashBoardUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xDashBoardPAGINA: TIntegerField
      DisplayLabel = 'Pagina'
      FieldName = 'PAGINA'
    end
    object xDashBoardORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xDashBoardTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDashBoardDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object xDashBoardSQL: TMemoField
      FieldName = 'SQL'
      BlobType = ftMemo
      Size = 8
    end
    object xDashBoardTRANSACCION_READONLY: TIntegerField
      DisplayLabel = 'Transaccion RO'
      FieldName = 'TRANSACCION_READONLY'
    end
    object xDashBoardCONFIGURACION: TMemoField
      DisplayLabel = 'Configuracion'
      FieldName = 'CONFIGURACION'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSxDashBoard: TDataSource
    DataSet = xDashBoard
    Left = 120
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 320
    Top = 8
  end
end
