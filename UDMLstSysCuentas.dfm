object DMLstSysCuentas: TDMLstSysCuentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 879
  Top = 202
  Height = 223
  Width = 328
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
      '  PGC=?PGC AND'
      ' PAIS=?PAIS'
      'ORDER BY GESTION,CUENTA,NIVEL')
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
    AfterDelete = Graba
    AfterPost = Graba
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
    Left = 32
    Top = 56
    object QMCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
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
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
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
    Left = 128
    Top = 56
  end
  object DSxCuentasGestion: TDataSource
    DataSet = xCuentasGestion
    Left = 128
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 8
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
    Left = 32
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 264
    Top = 8
  end
  object frGestiones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Definici'#243'n de Balances'
    RebuildPrinter = False
    OnGetValue = frGestionesGetValue
    OnBeforePrint = frGestionesEnterRect
    OnEnterRect = frGestionesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 8
    ReportForm = {19000000}
  end
  object frDBxCuentas: TfrDBDataSet
    DataSource = DSCuentas
    Left = 240
    Top = 56
  end
end
