object DMMultiBalances: TDMMultiBalances
  OldCreateOrder = False
  OnCreate = DMMultiBalancesCreate
  Left = 485
  Top = 452
  Height = 229
  Width = 320
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 42
    Top = 22
  end
  object DSxMultiBalance: TDataSource
    DataSet = xMultiBalance
    Left = 129
    Top = 76
  end
  object xMultiBalance: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_MULTIBALANCES'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PERIODO=?old_PERIODO AND '
      '  BALANCE=?old_BALANCE ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_MULTIBALANCES'
      '  (ENTRADA,EMPRESA,EJERCICIO,CANAL,PERIODO,BALANCE,MARCADO)'
      'VALUES'
      
        '  (?ENTRADA,?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?BALANCE,?MARCAD' +
        'O)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_MULTIBALANCES'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO AND '
      '  BALANCE=?BALANCE ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_MULTIBALANCES'
      'WHERE '
      'ENTRADA = ?ENTRADA '
      'AND EMPRESA = ?EMPRESA'
      'AND EJERCICIO = ?EJERCICIO'
      'AND BALANCE = ?BALANCE'
      'AND PERIODO = ?PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_MULTIBALANCES'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO AND '
      '  BALANCE=?BALANCE ')
    AfterPost = xMultiBalanceAfterPost
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PERIODO '
      'BALANCE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_MULTIBALANCES'
    UpdateTransaction = TLocal
    Left = 46
    Top = 76
    object xMultiBalanceENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xMultiBalanceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMultiBalanceEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMultiBalanceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMultiBalancePERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xMultiBalanceBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xMultiBalanceMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = xMultiBalanceMARCADOChange
    end
    object xMultiBalanceTITULO_CANAL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CANAL'
      Size = 40
    end
  end
  object SPRellenarSeleccion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE '
      
        'T_RELLENA_MULTIBALANCES(?ENTRADA,?EMPRESA,?EJERCICIO,?BALANCE,?P' +
        'ERIODO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 224
    Top = 18
  end
  object QMarcarTodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE TMP_MULTIBALANCES'
      'SET MARCADO = ?MARCA'
      'WHERE ENTRADA=?ENTRADA')
    Transaction = TLocal
    AutoTrans = True
    Left = 228
    Top = 74
  end
end
