object DMAsistenteExpSaldos: TDMAsistenteExpSaldos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 480
  Top = 202
  Height = 413
  Width = 565
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 16
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 128
    Top = 17
  end
  object DSxMultiSeleccion: TDataSource
    DataSet = xMultiSeleccion
    Left = 312
    Top = 136
  end
  object xMultiSeleccion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT * FROM TMP_MULTISELECCION'
      'WHERE ENTRADA=?ENTRADA')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_MULTISELECCION'
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_MULTISELECCION'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_MULTISELECCION'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    ClavesPrimarias.Strings = (
      'ALMACEN '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_MULTISELECCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 224
    Top = 136
    object xMultiSeleccionENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xMultiSeleccionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMultiSeleccionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMultiSeleccionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMultiSeleccionTITULO_CANAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CANAL'
      Size = 40
    end
    object xMultiSeleccionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xMultiSeleccionTITULO_ALMACEN: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ALMACEN'
      Size = 40
    end
    object xMultiSeleccionMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = xMultiSeleccionMARCADOChange
    end
  end
  object DSQMSaldosExp: TDataSource
    DataSet = QMSaldosExp
    Left = 121
    Top = 82
  end
  object QMSaldosExp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_SALDOS_EXPORTAR'
      'WHERE'
      '  CUENTA=?old_CUENTA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_SALDOS_EXPORTAR'
      '  (ENTRADA,CUENTA,TITULO,DEBE,HABER,SALDO,MARCADO)'
      'VALUES'
      '  (?ENTRADA,?CUENTA,?TITULO,?DEBE,?HABER,?SALDO,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_SALDOS_EXPORTAR'
      'WHERE'
      '  CUENTA=?CUENTA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_SALDOS_EXPORTAR'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_SALDOS_EXPORTAR'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  CUENTA=?CUENTA AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = QMSaldosExpNewRecord
    ClavesPrimarias.Strings = (
      'CUENTA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_SALDOS_EXPORTAR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 80
    object QMSaldosExpENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMSaldosExpCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMSaldosExpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object QMSaldosExpDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object QMSaldosExpHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object QMSaldosExpSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object QMSaldosExpMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object DSQMColumnas: TDataSource
    DataSet = QMColumnas
    Left = 121
    Top = 144
  end
  object QMColumnas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_COLUMNAS_EXPORTAR'
      'WHERE'
      '  NOMBRE_CAMPO=?old_NOMBRE_CAMPO AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_COLUMNAS_EXPORTAR'
      '  (ENTRADA,NOMBRE_CAMPO,NOMBRE_ENCAB,MARCADO)'
      'VALUES'
      '  (?ENTRADA,?NOMBRE_CAMPO,?NOMBRE_ENCAB,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_COLUMNAS_EXPORTAR'
      'WHERE'
      '  NOMBRE_CAMPO=?NOMBRE_CAMPO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_COLUMNAS_EXPORTAR'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_COLUMNAS_EXPORTAR'
      'SET'
      '  NOMBRE_ENCAB=?NOMBRE_ENCAB '
      '  ,MARCADO=?MARCADO '
      'WHERE'
      '  NOMBRE_CAMPO=?NOMBRE_CAMPO AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = QMColumnasNewRecord
    ClavesPrimarias.Strings = (
      'NOMBRE_CAMPO '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_COLUMNAS_EXPORTAR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 144
    object QMColumnasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMColumnasNOMBRE_CAMPO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_CAMPO'
      Size = 40
    end
    object QMColumnasNOMBRE_ENCAB: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_ENCAB'
      Size = 40
    end
    object QMColumnasMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object xColExportar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select nombre_campo, nombre_encab from tmp_columnas_exportar'
      'where entrada=?entrada and marcado=1')
    UniDirectional = False
    Left = 224
    Top = 198
    object xColExportarNOMBRE_CAMPO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_CAMPO'
      Size = 40
    end
    object xColExportarNOMBRE_ENCAB: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_ENCAB'
      Size = 40
    end
  end
  object DSxColExportar: TDataSource
    DataSet = xColExportar
    Left = 314
    Top = 200
  end
  object SPRangos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_asientos_max_min (?EMPRESA,?EJERCICIO,?CANAL' +
        ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 384
    Top = 29
  end
  object xCta_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM CON_CUENTAS'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and cuenta=?cuenta'
      '')
    UniDirectional = False
    Left = 224
    Top = 24
  end
  object DSxCta_Desde: TDataSource
    DataSet = xCta_Desde
    Left = 304
    Top = 24
  end
  object xCta_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM CON_CUENTAS'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and cuenta=?cuenta'
      '')
    UniDirectional = False
    Left = 224
    Top = 80
  end
  object DSxCta_Hasta: TDataSource
    DataSet = xCta_Hasta
    Left = 312
    Top = 80
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_SALDOS_EXPORTAR'
      'WHERE ENTRADA=?ENTRADA AND MARCADO=1')
    UniDirectional = False
    Left = 224
    Top = 264
    object xRecorreENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xRecorreCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xRecorreTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object xRecorreDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xRecorreHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xRecorreSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xRecorreMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object DSxRecorre: TDataSource
    DataSet = xRecorre
    Left = 312
    Top = 264
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 200
  end
end
