object DMBalances: TDMBalances
  OldCreateOrder = False
  OnCreate = DMBalancesCreate
  Left = 422
  Top = 160
  Height = 336
  Width = 490
  object xBalances: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_BALANCES                   '
      'WHERE'
      '  BALANCE=?old_BALANCE AND '
      '  PAIS=?old_PAIS ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_BALANCES                   '
      'WHERE'
      'PAIS=?PAIS AND'
      'ACTIVO = 1'
      'ORDER BY BALANCE')
    UniDirectional = False
    AfterOpen = xBalancesAfterOpen
    BeforeClose = xBalancesBeforeClose
    Left = 56
    Top = 8
    object xBalancesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xBalancesBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xBalancesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      OnGetText = xBalancesTITULOGetText
      Size = 40
    end
    object xBalancesGENERICO: TIntegerField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'GENERICO'
    end
    object xBalancesTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xBalancesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSQMBalances: TDataSource
    DataSet = xBalances
    Left = 200
    Top = 8
  end
  object QMBalances_Def: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_BALANCES_DEFINICION        '
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  CLAVE=?old_CLAVE AND '
      '  BALANCE=?old_BALANCE AND '
      '  PAIS=?old_PAIS ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_BALANCES_DEFINICION        '
      '  (TITULO,ORDEN,BALANCE,PAIS,CLAVE,GRUPO,TIPO,SIGNO)'
      'VALUES'
      '  (?TITULO,?ORDEN,?BALANCE,?PAIS,?CLAVE,?GRUPO,?TIPO,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_BALANCES_DEFINICION        '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  CLAVE=?CLAVE AND '
      '  BALANCE=?BALANCE AND '
      '  PAIS=?PAIS ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_BALANCES_DEFINICION        '
      'where (pais=?pais) and (balance=?balance)'
      'order by clave, tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_BALANCES_DEFINICION        '
      'SET'
      '  TITULO=?TITULO '
      '  ,ORDEN=?ORDEN '
      '  ,GRUPO=?GRUPO '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  CLAVE=?CLAVE AND '
      '  BALANCE=?BALANCE AND '
      '  PAIS=?PAIS ')
    DataSource = DSQMBalances
    AfterDelete = Graba
    AfterOpen = QMBalances_DefAfterOpen
    AfterPost = Graba
    BeforeClose = QMBalances_DefBeforeClose
    OnNewRecord = QMBalances_DefNewRecord
    ClavesPrimarias.Strings = (
      'TIPO '
      'CLAVE '
      'BALANCE '
      'PAIS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_BALANCES_DEFINICION        '
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMBalances_DefPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMBalances_DefBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object QMBalances_DefCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object QMBalances_DefTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMBalances_DefGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object QMBalances_DefORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMBalances_DefSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMBalances_DefTITULO2: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 100
    end
    object QMBalances_DefDESC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_TIPO'
      OnGetText = QMBalances_DefDESC_TIPOGetText
      Size = 40
      Calculated = True
    end
    object QMBalances_DefDESC_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_GRUPO'
      OnGetText = QMBalances_DefDESC_GRUPOGetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMBalances_Def: TDataSource
    DataSet = QMBalances_Def
    Left = 200
    Top = 56
  end
  object QMBalances_Def_Detalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_BALANCES_DEFINICION_DETALLE'
      'WHERE'
      '  ACUMULA=?old_ACUMULA AND '
      '  TIPO=?old_TIPO AND '
      '  CLAVE=?old_CLAVE AND '
      '  BALANCE=?old_BALANCE AND '
      '  PAIS=?old_PAIS ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_BALANCES_DEFINICION_DETALLE'
      '  (BALANCE,PAIS,ACUMULA,CLAVE,SIGNO,TIPO)'
      'VALUES'
      '  (?BALANCE,?PAIS,?ACUMULA,?CLAVE,?SIGNO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_BALANCES_DEFINICION_DETALLE'
      'WHERE'
      '  ACUMULA=?ACUMULA AND '
      '  TIPO=?TIPO AND '
      '  CLAVE=?CLAVE AND '
      '  BALANCE=?BALANCE AND '
      '  PAIS=?PAIS ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_BALANCES_DEFINICION_DETALLE'
      
        'where (pais=?pais) and (balance=?balance) and (clave=?clave) and' +
        ' (tipo=?tipo)'
      'order by acumula')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_BALANCES_DEFINICION_DETALLE'
      'SET'
      '  SIGNO=?SIGNO '
      ' ,PORCENTAJE=?PORCENTAJE'
      'WHERE'
      '  ACUMULA=?ACUMULA AND '
      '  TIPO=?TIPO AND '
      '  CLAVE=?CLAVE AND '
      '  BALANCE=?BALANCE AND '
      '  PAIS=?PAIS ')
    DataSource = DSQMBalances_Def
    OnNewRecord = QMBalances_Def_DetalleNewRecord
    ClavesPrimarias.Strings = (
      'ACUMULA '
      'TIPO '
      'CLAVE '
      'BALANCE '
      'PAIS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_BALANCES_DEFINICION_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QMBalances_Def_DetallePAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMBalances_Def_DetalleBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object QMBalances_Def_DetalleCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object QMBalances_Def_DetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMBalances_Def_DetalleACUMULA: TFIBStringField
      DisplayLabel = 'Acumula'
      FieldName = 'ACUMULA'
      Size = 15
    end
    object QMBalances_Def_DetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      OnGetText = QMBalances_Def_DetalleSIGNOGetText
      Size = 1
    end
    object QMBalances_Def_DetalleDESC_SIGNO: TStringField
      DisplayLabel = 'Desc. Signo'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'DESC_SIGNO'
      ReadOnly = True
      Size = 35
      Calculated = True
    end
    object QMBalances_Def_DetallePORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMBalances_Def_Detalle: TDataSource
    DataSet = QMBalances_Def_Detalle
    Left = 200
    Top = 104
  end
  object xBalancesElec: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'Select * from sys_balances where((pais=?pais)and(balance=?balanc' +
        'e)) '
      'order by balance')
    SelectSQL.Strings = (
      'Select * from sys_balances where(pais=?pais) order by balance')
    UniDirectional = False
    Left = 56
    Top = 248
  end
  object DSxBalancesElec: TDataSource
    DataSet = xBalancesElec
    Left = 200
    Top = 248
  end
  object QMBalancesCAB: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_BALANCES'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  BALANCE=?old_BALANCE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_BALANCES'
      '  (BALANCE,TITULO,GENERICO,TIPO,ORIGEN,PAIS,ACTIVO)'
      'VALUES'
      '  (?BALANCE,?TITULO,?GENERICO,?TIPO,?ORIGEN,?PAIS,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_BALANCES'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  BALANCE=?BALANCE ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_BALANCES'
      'WHERE'
      'PAIS = ?PAIS'
      'ORDER BY BALANCE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_BALANCES'
      'SET'
      '  TITULO=?TITULO '
      '  ,GENERICO=?GENERICO '
      '  ,TIPO=?TIPO '
      '  ,ORIGEN=?ORIGEN '
      '  ,ACTIVO=?ACTIVO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  BALANCE=?BALANCE ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforeDelete = QMBalancesBloquea
    BeforeEdit = QMBalancesBloquea
    OnNewRecord = QMBalancesCABNewRecord
    OnPostError = QMBalancesCABPostError
    ClavesPrimarias.Strings = (
      'PAIS '
      'BALANCE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_BALANCES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 200
    object QMBalancesCABPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMBalancesCABBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
      OnValidate = QMBalancesCABBALANCEValidate
    end
    object QMBalancesCABTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMBalancesCABGENERICO: TIntegerField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'GENERICO'
    end
    object QMBalancesCABTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMBalancesCABORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMBalancesCABACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSQMBalancesCAB: TDataSource
    DataSet = QMBalancesCAB
    Left = 200
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 320
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
    Left = 408
    Top = 8
  end
end
