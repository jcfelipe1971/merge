object DMSysCuentas: TDMSysCuentas
  OldCreateOrder = False
  OnCreate = DMSysCuentasCreate
  Left = 879
  Top = 202
  Height = 401
  Width = 316
  object QMCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CUENTAS'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  CUENTA=?old_CUENTA  AND'
      '  PGC=?old_PGC'
      '')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CUENTAS'
      
        '  (GESTION,TIPO,NIVEL,TITULO,SUPERIOR,CUENTA,TIPO_TERCERO,PGC,PA' +
        'IS)'
      'VALUES'
      
        '  (?GESTION,?TIPO,?NIVEL,?TITULO,?SUPERIOR,?CUENTA,?TIPO_TERCERO' +
        ',?PGC,?PAIS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CUENTAS'
      'WHERE'
      '  PGC=?PGC AND '
      '  CUENTA=?CUENTA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CUENTAS'
      'WHERE'
      '  PGC=?PGC'
      'ORDER BY NIVEL,CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CUENTAS'
      'SET'
      '  GESTION=?GESTION '
      '  ,TIPO=?TIPO '
      '  ,NIVEL=?NIVEL '
      '  ,TITULO=?TITULO '
      '  ,SUPERIOR=?SUPERIOR '
      ' ,TIPO_TERCERO=?TIPO_TERCERO'
      ' ,REG_CIERRE=?REG_CIERRE'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  CUENTA=?CUENTA AND'
      '  PGC=?PGC'
      '  ')
    DataSource = DSxPgC
    AfterDelete = Graba
    AfterOpen = QMCuentasAfterOpen
    AfterPost = Graba
    OnNewRecord = QMCuentasNewRecord
    ClavesPrimarias.Strings = (
      'PGC '
      'CUENTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CUENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCuentasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object QMCuentasNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMCuentasSUPERIOR: TFIBStringField
      DisplayLabel = 'Superior'
      FieldName = 'SUPERIOR'
      Size = 15
    end
    object QMCuentasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCuentasGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
      OnChange = QMCuentasGESTIONChange
    end
    object QMCuentasTIPO_TERCERO: TIntegerField
      DisplayLabel = 'Tipo Terc.'
      FieldName = 'TIPO_TERCERO'
      OnChange = QMCuentasTIPO_TERCEROChange
    end
    object QMCuentasREG_CIERRE: TIntegerField
      DisplayLabel = 'Reg. Cierre'
      FieldName = 'REG_CIERRE'
    end
    object QMCuentasPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object QMCuentasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSCuentas: TDataSource
    DataSet = QMCuentas
    Left = 136
    Top = 16
  end
  object DSxCuentasPadres: TDataSource
    DataSet = xCuentasPadres
    Left = 136
    Top = 64
  end
  object DSxCuentasGestion: TDataSource
    DataSet = xCuentasGestion
    Left = 136
    Top = 112
  end
  object DSxTipoTercero: TDataSource
    DataSet = xTipoTercero
    Left = 136
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 16
  end
  object xCuentasPadres: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from sys_cuentas '
      'where '
      '  pgc=?pgc and'
      '  cuenta<>?cuenta and'
      '  ?cuenta starting with cuenta '
      'ORDER BY CUENTA DESC')
    UniDirectional = False
    DataSource = DSCuentas
    Left = 40
    Top = 64
    object xCuentasPadresPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xCuentasPadresCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCuentasPadresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object xCuentasPadresNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xCuentasPadresSUPERIOR: TFIBStringField
      DisplayLabel = 'Superior'
      FieldName = 'SUPERIOR'
      Size = 15
    end
    object xCuentasPadresTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xCuentasPadresGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
    end
    object xCuentasPadresTIPO_TERCERO: TIntegerField
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
    end
  end
  object xCuentasGestion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_CUENTAS_GESTION'
      'WHERE'
      '  PGC=?PGC AND'
      '  GESTION=?GESTION')
    UniDirectional = False
    DataSource = DSCuentas
    Left = 40
    Top = 112
  end
  object xTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPOS_TERCERO where tipo=?tipo_tercero')
    UniDirectional = False
    DataSource = DSCuentas
    Left = 40
    Top = 160
  end
  object xPgC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      ' FROM SYS_PLANES_CONTABLES'
      'ORDER BY PGC')
    UniDirectional = False
    AfterOpen = xPgCAfterOpen
    Left = 40
    Top = 208
    object xPgCPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xPgCPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object xPgCTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPgCDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxPgC: TDataSource
    DataSet = xPgC
    Left = 136
    Top = 208
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 64
  end
end
