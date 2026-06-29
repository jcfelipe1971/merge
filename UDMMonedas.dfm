object DMMonedas: TDMMonedas
  OldCreateOrder = False
  OnCreate = DMAuxiliaresCreate
  Left = 574
  Top = 342
  Height = 333
  Width = 436
  object DSQMMonedas: TDataSource
    DataSet = QMMonedas
    Left = 92
    Top = 26
  end
  object QMMonedas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MONEDAS'
      'WHERE'
      '  MONEDA=?old_MONEDA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MONEDAS'
      
        '  (DEFECTO,TITULO,DEC_CALCULOS,DEC_VER,SIGNO_MONEDA,MONEDA,GENER' +
        'O_MASCULINO,DESC_DECIMALES,CUENTA_PRI_VENTAS,CUENTA_PRI_COMPRAS,' +
        'CUENTA_CLIENTE'
      '  ,CUENTA_PROVEEDOR)'
      'VALUES'
      
        '  (?DEFECTO,?TITULO,?DEC_CALCULOS,?DEC_VER,?SIGNO_MONEDA,?MONEDA' +
        ',?GENERO_MASCULINO,?DESC_DECIMALES,?CUENTA_PRI_VENTAS,?CUENTA_PR' +
        'I_COMPRAS,?CUENTA_CLIENTE'
      ',?CUENTA_PROVEEDOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS'
      'WHERE'
      '  MONEDA=?old_MONEDA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS'
      'ORDER BY MONEDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MONEDAS'
      'SET'
      '  DEFECTO=?DEFECTO '
      '  ,TITULO=?TITULO '
      '  ,DEC_CALCULOS=?DEC_CALCULOS '
      '  ,DEC_VER=?DEC_VER '
      '  ,SIGNO_MONEDA=?SIGNO_MONEDA '
      '  ,GENERO_MASCULINO=?GENERO_MASCULINO'
      '  ,DESC_DECIMALES=?DESC_DECIMALES'
      '  ,CUENTA_PRI_VENTAS=?CUENTA_PRI_VENTAS'
      '  ,CUENTA_PRI_COMPRAS=?CUENTA_PRI_COMPRAS'
      '  ,CUENTA_CLIENTE=?CUENTA_CLIENTE'
      '  ,CUENTA_PROVEEDOR=?CUENTA_PROVEEDOR'
      'WHERE'
      '  MONEDA=?old_MONEDA ')
    AfterOpen = QMMonedasAfterOpen
    AfterPost = QMMonedasAfterPost
    OnNewRecord = QMMonedasNewRecord
    ClavesPrimarias.Strings = (
      'MONEDA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MONEDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 26
    object QMMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMMonedasSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object QMMonedasDEC_VER: TIntegerField
      DisplayLabel = 'D. Ver'
      FieldName = 'DEC_VER'
    end
    object QMMonedasDEC_CALCULOS: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object QMMonedasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMMonedasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMMonedasGENERO_MASCULINO: TIntegerField
      DisplayLabel = 'Genero'
      FieldName = 'GENERO_MASCULINO'
    end
    object QMMonedasCODIGO_SEUR: TFIBStringField
      DisplayLabel = 'Cod. SEUR'
      FieldName = 'CODIGO_SEUR'
      Size = 3
    end
    object QMMonedasDESC_DECIMALES: TFIBStringField
      DisplayLabel = 'Desc. Decimales'
      FieldName = 'DESC_DECIMALES'
      Size = 40
    end
    object QMMonedasCUENTA_PRI_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Pri. Ventas'
      FieldName = 'CUENTA_PRI_VENTAS'
      Size = 15
    end
    object QMMonedasCUENTA_PRI_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Pri. compras'
      FieldName = 'CUENTA_PRI_COMPRAS'
      Size = 15
    end
    object QMMonedasCUENTA_CLIENTE: TFIBStringField
      DisplayLabel = 'Cta. Clienta'
      FieldName = 'CUENTA_CLIENTE'
      Size = 15
    end
    object QMMonedasCUENTA_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cta. Proveedor'
      FieldName = 'CUENTA_PROVEEDOR'
      Size = 15
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 164
    Top = 26
  end
  object QMIdiomas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MONEDAS_IDIOMAS'
      'WHERE'
      '  MONEDA=?old_MONEDA AND '
      '  IDIOMA=?old_IDIOMA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MONEDAS_IDIOMAS'
      '  (IDIOMA,TITULO,MONEDA)'
      'VALUES'
      '  (?IDIOMA,?TITULO,?MONEDA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS_IDIOMAS'
      'WHERE'
      '  MONEDA=?MONEDA AND '
      '  IDIOMA=?IDIOMA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS_IDIOMAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MONEDAS_IDIOMAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  MONEDA=?MONEDA AND '
      '  IDIOMA=?IDIOMA ')
    DataSource = DSQMMonedas
    OnNewRecord = QMIdiomasNewRecord
    ClavesPrimarias.Strings = (
      'MONEDA '
      'IDIOMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MONEDAS_IDIOMAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 88
    object QMIdiomasMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMIdiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMIdiomasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMIdiomas: TDataSource
    DataSet = QMIdiomas
    Left = 100
    Top = 90
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 180
    Top = 90
  end
end
