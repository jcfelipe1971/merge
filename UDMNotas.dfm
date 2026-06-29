object DMNotas: TDMNotas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 798
  Top = 204
  Height = 239
  Width = 364
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 16
  end
  object QMNotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_NOTAS'
      'WHERE'
      '  ID_NOTA=?old_ID_NOTA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_NOTAS'
      
        '  (ID_NOTA,EMPRESA,EJERCICIO,CANAL,RIC,NUMERO_NOTA,VISIBLE,FECHA' +
        ',NOTA,ASIENTO)'
      'VALUES'
      
        '  (?ID_NOTA,?EMPRESA,?EJERCICIO,?CANAL,?RIC,?NUMERO_NOTA,?VISIBL' +
        'E,?FECHA,?NOTA,?ASIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_NOTAS'
      'WHERE'
      '  ID_NOTA=?ID_NOTA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_NOTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND '
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'ASIENTO = ?ASIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_NOTAS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,RIC=?RIC '
      '  ,NUMERO_NOTA=?NUMERO_NOTA '
      '  ,VISIBLE=?VISIBLE '
      '  ,FECHA=?FECHA '
      '  ,NOTA=?NOTA '
      '  ,ASIENTO=?ASIENTO '
      'WHERE'
      '  ID_NOTA=?ID_NOTA ')
    AfterDelete = Graba
    AfterOpen = QMNotasAfterOpen
    AfterPost = Graba
    BeforeClose = QMNotasBeforeClose
    BeforePost = QMNotasBeforePost
    OnNewRecord = QMNotasNewRecord
    ClavesPrimarias.Strings = (
      'ID_NOTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_NOTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMNotasID_NOTA: TIntegerField
      DisplayLabel = 'ID Nota'
      FieldName = 'ID_NOTA'
    end
    object QMNotasNUMERO_NOTA: TIntegerField
      DisplayLabel = 'Nro. Nota'
      FieldName = 'NUMERO_NOTA'
    end
    object QMNotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNotasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNotasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNotasRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMNotasASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMNotasVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMNotasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMNotasNOTA: TBlobField
      DisplayLabel = 'Nota'
      FieldName = 'NOTA'
      Size = 8
    end
    object QMNotasNOTA_TEXTO: TStringField
      DisplayLabel = 'Nota'
      FieldKind = fkCalculated
      FieldName = 'NOTA_TEXTO'
      OnGetText = QMNotasNOTA_TEXTOGetText
      Calculated = True
    end
  end
  object DSQMNotas: TDataSource
    DataSet = QMNotas
    Left = 136
    Top = 16
  end
  object QMNotasDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CON_NOTAS_CUENTAS'
      'WHERE'
      '  ID_NOTA=?old_ID_NOTA AND '
      '  CUENTA=?old_CUENTA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CON_NOTAS_CUENTAS'
      '  (ID_NOTA,CUENTA,TITULO)'
      'VALUES'
      '  (?ID_NOTA,?CUENTA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_NOTAS_CUENTAS'
      'WHERE'
      '  ID_NOTA=?ID_NOTA AND '
      '  CUENTA=?CUENTA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CON_NOTAS_CUENTAS'
      'WHERE'
      'ID_NOTA = ?ID_NOTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CON_NOTAS_CUENTAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID_NOTA=?ID_NOTA AND '
      '  CUENTA=?CUENTA ')
    DataSource = DSQMNotas
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMNotasDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_NOTA '
      'CUENTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CON_NOTAS_CUENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMNotasDetalleID_NOTA: TIntegerField
      DisplayLabel = 'ID Nota'
      FieldName = 'ID_NOTA'
    end
    object QMNotasDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMNotasDetallePGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object QMNotasDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object DSQMNotasDetalle: TDataSource
    DataSet = QMNotasDetalle
    Left = 136
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 16
  end
end
