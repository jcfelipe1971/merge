object DMPrevisionTesoreria: TDMPrevisionTesoreria
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 214
  Top = 109
  Height = 571
  Width = 518
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 280
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
    Left = 352
    Top = 8
  end
  object QMConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PREV_TESORERIA_CONFIG'
      'WHERE'
      '  ORDEN=?old_ORDEN AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PREV_TESORERIA_CONFIG'
      
        '  (EMPRESA,PREVISION,ORDEN,TITULO,SQL,CELDA_EXCEL,CELDA_EXCEL_PR' +
        'EV)'
      'VALUES'
      
        '  (?EMPRESA,?PREVISION,?ORDEN,?TITULO,?SQL,?CELDA_EXCEL,?CELDA_E' +
        'XCEL_PREV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PREV_TESORERIA_CONFIG'
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  EMPRESA=?EMPRESA AND'
      '  PREVISION=?PREVISION')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PREV_TESORERIA_CONFIG'
      'WHERE EMPRESA=?EMPRESA AND PREVISION=?PREVISION'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PREV_TESORERIA_CONFIG'
      'SET'
      '  TITULO=?TITULO '
      '  ,SQL=?SQL '
      '  ,CELDA_EXCEL=?CELDA_EXCEL'
      '  ,CELDA_EXCEL_PREV=?CELDA_EXCEL_PREV'
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  EMPRESA=?EMPRESA AND'
      '  PREVISION=?PREVISION')
    DataSource = DSQMPrevision
    OnNewRecord = QMConfiguracionNewRecord
    ClavesPrimarias.Strings = (
      'ORDEN '
      'EMPRESA '
      'PREVISION'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PREV_TESORERIA_CONFIG'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMConfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionPREVISION: TIntegerField
      DisplayLabel = 'Previsi'#243'n'
      FieldName = 'PREVISION'
    end
    object QMConfiguracionORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMConfiguracionTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMConfiguracionSQL: TBlobField
      DisplayLabel = 'Sentencia SQL'
      FieldName = 'SQL'
      Size = 8
    end
    object QMConfiguracionCELDA_EXCEL: TFIBStringField
      DisplayLabel = 'Celda Excel'
      FieldName = 'CELDA_EXCEL'
      Size = 15
    end
    object QMConfiguracionCELDA_EXCEL_PREV: TFIBStringField
      DisplayLabel = 'Celda Excel Prev.'
      FieldName = 'CELDA_EXCEL_PREV'
      Size = 15
    end
  end
  object DSQMConfiguracion: TDataSource
    DataSet = QMConfiguracion
    Left = 152
    Top = 56
  end
  object QMPrevisionPrev: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PREV_TESORERIA_PREV'
      'WHERE'
      '  ORDEN=?old_ORDEN AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PREV_TESORERIA_PREV'
      
        '  (EMPRESA,PREVISION,EJERCICIO,ORDEN,TITULO,MES_01,MES_02,MES_03' +
        ',MES_04,MES_05,MES_06,MES_07,MES_08,MES_09,MES_10,MES_11,MES_12)'
      'VALUES'
      
        '  (?EMPRESA,?PREVISION,?EJERCICIO,?ORDEN,?TITULO,?MES_01,?MES_02' +
        ',?MES_03,?MES_04,?MES_05,?MES_06,?MES_07,?MES_08,?MES_09,?MES_10' +
        ',?MES_11,?MES_12)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PREV_TESORERIA_PREV'
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND'
      '  PREVISION=?PREVISION')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PREV_TESORERIA_PREV'
      
        'WHERE EMPRESA=?EMPRESA AND PREVISION=?PREVISION AND EJERCICIO=?E' +
        'JERCICIO'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PREV_TESORERIA_PREV'
      'SET'
      '  TITULO=?TITULO '
      '  ,MES_01=?MES_01 '
      '  ,MES_02=?MES_02 '
      '  ,MES_03=?MES_03 '
      '  ,MES_04=?MES_04 '
      '  ,MES_05=?MES_05 '
      '  ,MES_06=?MES_06 '
      '  ,MES_07=?MES_07 '
      '  ,MES_08=?MES_08 '
      '  ,MES_09=?MES_09 '
      '  ,MES_10=?MES_10 '
      '  ,MES_11=?MES_11 '
      '  ,MES_12=?MES_12 '
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND'
      '  PREVISION=?PREVISION')
    DataSource = DSQMPrevision
    ClavesPrimarias.Strings = (
      'ORDEN '
      'EJERCICIO '
      'EMPRESA '
      'PREVISION'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PREV_TESORERIA_PREV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMPrevisionPrevEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPrevisionPrevPREVISION: TIntegerField
      DisplayLabel = 'Previsi'#243'n'
      FieldName = 'PREVISION'
    end
    object QMPrevisionPrevEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPrevisionPrevORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMPrevisionPrevTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPrevisionPrevMES_01: TFloatField
      DisplayLabel = 'Mes 01'
      FieldName = 'MES_01'
    end
    object QMPrevisionPrevMES_02: TFloatField
      DisplayLabel = 'Mes 02'
      FieldName = 'MES_02'
    end
    object QMPrevisionPrevMES_03: TFloatField
      DisplayLabel = 'Mes 03'
      FieldName = 'MES_03'
    end
    object QMPrevisionPrevMES_04: TFloatField
      DisplayLabel = 'Mes 04'
      FieldName = 'MES_04'
    end
    object QMPrevisionPrevMES_05: TFloatField
      DisplayLabel = 'Mes 05'
      FieldName = 'MES_05'
    end
    object QMPrevisionPrevMES_06: TFloatField
      DisplayLabel = 'Mes 06'
      FieldName = 'MES_06'
    end
    object QMPrevisionPrevMES_07: TFloatField
      DisplayLabel = 'Mes 07'
      FieldName = 'MES_07'
    end
    object QMPrevisionPrevMES_08: TFloatField
      DisplayLabel = 'Mes 08'
      FieldName = 'MES_08'
    end
    object QMPrevisionPrevMES_09: TFloatField
      DisplayLabel = 'Mes 09'
      FieldName = 'MES_09'
    end
    object QMPrevisionPrevMES_10: TFloatField
      DisplayLabel = 'Mes 00'
      FieldName = 'MES_10'
    end
    object QMPrevisionPrevMES_11: TFloatField
      DisplayLabel = 'Mes 11'
      FieldName = 'MES_11'
    end
    object QMPrevisionPrevMES_12: TFloatField
      DisplayLabel = 'Mes 12'
      FieldName = 'MES_12'
    end
  end
  object DSQMPrevisionPrev: TDataSource
    DataSet = QMPrevisionPrev
    Left = 152
    Top = 104
  end
  object QMResultado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PREV_TESORERIA_RESULTADO'
      'WHERE'
      '  ORDEN=?old_ORDEN AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PREV_TESORERIA_RESULTADO'
      
        '  (ENTRADA,EMPRESA,PREVISION,ORDEN,TITULO,MES_01,MES_02,MES_03,M' +
        'ES_04,MES_05,MES_06,MES_07,MES_08,MES_09,MES_10,MES_11,MES_12,PR' +
        'EV_01,PREV_02,PREV_03,PREV_04,PREV_05,PREV_06,PREV_07,PREV_08,PR' +
        'EV_09,PREV_10,PREV_11,PREV_12)'
      'VALUES'
      
        '  (?ENTRADA,?EMPRESA,?PREVISION,?ORDEN,?TITULO,?MES_01,?MES_02,?' +
        'MES_03,?MES_04,?MES_05,?MES_06,?MES_07,?MES_08,?MES_09,?MES_10,?' +
        'MES_11,?MES_12,?PREV_01,?PREV_02,?PREV_03,?PREV_04,?PREV_05,?PRE' +
        'V_06,?PREV_07,?PREV_08,?PREV_09,?PREV_10,?PREV_11,?PREV_12)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PREV_TESORERIA_RESULTADO'
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA AND'
      '  PREVISION=?PREVISION')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PREV_TESORERIA_RESULTADO'
      
        'WHERE EMPRESA=?EMPRESA AND PREVISION=?PREVISION AND ENTRADA=?ENT' +
        'RADA'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PREV_TESORERIA_RESULTADO'
      'SET'
      '  TITULO=?TITULO '
      '  ,MES_01=?MES_01 '
      '  ,MES_02=?MES_02 '
      '  ,MES_03=?MES_03 '
      '  ,MES_04=?MES_04 '
      '  ,MES_05=?MES_05 '
      '  ,MES_06=?MES_06 '
      '  ,MES_07=?MES_07 '
      '  ,MES_08=?MES_08 '
      '  ,MES_09=?MES_09 '
      '  ,MES_10=?MES_10 '
      '  ,MES_11=?MES_11 '
      '  ,MES_12=?MES_12 '
      '  ,PREV_01=?PREV_01 '
      '  ,PREV_02=?PREV_02 '
      '  ,PREV_03=?PREV_03 '
      '  ,PREV_04=?PREV_04 '
      '  ,PREV_05=?PREV_05 '
      '  ,PREV_06=?PREV_06 '
      '  ,PREV_07=?PREV_07 '
      '  ,PREV_08=?PREV_08 '
      '  ,PREV_09=?PREV_09 '
      '  ,PREV_10=?PREV_10 '
      '  ,PREV_11=?PREV_11 '
      '  ,PREV_12=?PREV_12 '
      'WHERE'
      '  ORDEN=?ORDEN AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA AND'
      '  PREVISION=?PREVISION'
      '')
    DataSource = DSQMPrevision
    ClavesPrimarias.Strings = (
      'ORDEN '
      'EMPRESA '
      'ENTRADA '
      'PREVISION'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PREV_TESORERIA_RESULTADO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object QMResultadoENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMResultadoPREVISION: TIntegerField
      DisplayLabel = 'Previsi'#243'n'
      FieldName = 'PREVISION'
    end
    object QMResultadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMResultadoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMResultadoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMResultadoMES_01: TFloatField
      DisplayLabel = 'Mes 01'
      FieldName = 'MES_01'
    end
    object QMResultadoMES_02: TFloatField
      DisplayLabel = 'Mes 02'
      FieldName = 'MES_02'
    end
    object QMResultadoMES_03: TFloatField
      DisplayLabel = 'Mes 03'
      FieldName = 'MES_03'
    end
    object QMResultadoMES_04: TFloatField
      DisplayLabel = 'Mes 04'
      FieldName = 'MES_04'
    end
    object QMResultadoMES_05: TFloatField
      DisplayLabel = 'Mes 05'
      FieldName = 'MES_05'
    end
    object QMResultadoMES_06: TFloatField
      DisplayLabel = 'Mes 06'
      FieldName = 'MES_06'
    end
    object QMResultadoMES_07: TFloatField
      DisplayLabel = 'Mes 07'
      FieldName = 'MES_07'
    end
    object QMResultadoMES_08: TFloatField
      DisplayLabel = 'Mes 08'
      FieldName = 'MES_08'
    end
    object QMResultadoMES_09: TFloatField
      DisplayLabel = 'Mes 09'
      FieldName = 'MES_09'
    end
    object QMResultadoMES_10: TFloatField
      DisplayLabel = 'Mes 10'
      FieldName = 'MES_10'
    end
    object QMResultadoMES_11: TFloatField
      DisplayLabel = 'Mes 11'
      FieldName = 'MES_11'
    end
    object QMResultadoMES_12: TFloatField
      DisplayLabel = 'Mes 12'
      FieldName = 'MES_12'
    end
    object QMResultadoPREV_01: TFloatField
      DisplayLabel = 'Prev. 1'
      FieldName = 'PREV_01'
    end
    object QMResultadoPREV_02: TFloatField
      DisplayLabel = 'Prev. 2'
      FieldName = 'PREV_02'
    end
    object QMResultadoPREV_03: TFloatField
      DisplayLabel = 'Prev. 3'
      FieldName = 'PREV_03'
    end
    object QMResultadoPREV_04: TFloatField
      DisplayLabel = 'Prev. 4'
      FieldName = 'PREV_04'
    end
    object QMResultadoPREV_05: TFloatField
      DisplayLabel = 'Prev. 5'
      FieldName = 'PREV_05'
    end
    object QMResultadoPREV_06: TFloatField
      DisplayLabel = 'Prev. 6'
      FieldName = 'PREV_06'
    end
    object QMResultadoPREV_07: TFloatField
      DisplayLabel = 'Prev. 7'
      FieldName = 'PREV_07'
    end
    object QMResultadoPREV_08: TFloatField
      DisplayLabel = 'Prev. 8'
      FieldName = 'PREV_08'
    end
    object QMResultadoPREV_09: TFloatField
      DisplayLabel = 'Prev. 9'
      FieldName = 'PREV_09'
    end
    object QMResultadoPREV_10: TFloatField
      DisplayLabel = 'Prev. 10'
      FieldName = 'PREV_10'
    end
    object QMResultadoPREV_11: TFloatField
      DisplayLabel = 'Prev. 11'
      FieldName = 'PREV_11'
    end
    object QMResultadoPREV_12: TFloatField
      DisplayLabel = 'Prev. 12'
      FieldName = 'PREV_12'
    end
  end
  object DSQMResultado: TDataSource
    DataSet = QMResultado
    Left = 152
    Top = 152
  end
  object ExcelApplication: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 280
    Top = 56
  end
  object ExcelWorkbook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 352
    Top = 56
  end
  object QMPrevision: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PREV_TESORERIA'
      'WHERE'
      '  PREVISION=?old_PREVISION AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PREV_TESORERIA'
      '  (EMPRESA,PREVISION,TITULO,PLANTILLA)'
      'VALUES'
      '  (?EMPRESA,?PREVISION,?TITULO,?PLANTILLA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PREV_TESORERIA'
      'WHERE'
      '  PREVISION=?PREVISION AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PREV_TESORERIA'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY PREVISION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PREV_TESORERIA'
      'SET'
      '  TITULO=?TITULO'
      '  ,PLANTILLA=?PLANTILLA '
      'WHERE'
      '  PREVISION=?PREVISION AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMPrevisionAfterOpen
    BeforeClose = QMPrevisionBeforeClose
    OnNewRecord = QMPrevisionNewRecord
    ClavesPrimarias.Strings = (
      'PREVISION '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PREV_TESORERIA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMPrevisionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPrevisionPREVISION: TIntegerField
      DisplayLabel = 'Previsi'#243'n'
      FieldName = 'PREVISION'
    end
    object QMPrevisionTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPrevisionPLANTILLA: TFIBStringField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
      Size = 200
    end
  end
  object DSQMPrevision: TDataSource
    DataSet = QMPrevision
    Left = 152
    Top = 8
  end
end
