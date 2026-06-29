object DMCentroCoste: TDMCentroCoste
  OldCreateOrder = False
  OnCreate = DMCentroCosteCreate
  Left = 463
  Top = 368
  Height = 275
  Width = 335
  object QMCentroCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CENTROS_COSTE'
      'WHERE '
      ' (EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  NUM_DIGITO=?NUM_DIGITO AND'
      '  LET_DIGITO=?LET_DIGITO)')
    InsertSQL.Strings = (
      'INSERT INTO CON_CENTROS_COSTE'
      '  (EMPRESA,EJERCICIO,CANAL,NUM_DIGITO,TITULO,LET_DIGITO)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?NUM_DIGITO,?TITULO,?LET_DIGITO)')
    RefreshSQL.Strings = (
      'SELECT * FROM CON_CENTROS_COSTE'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND NUM_DIGITO=?NUM_DIGITO AND '
      'LET_DIGITO=?LET_DIGITO')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CENTROS_COSTE'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL'
      'ORDER BY NUM_DIGITO,LET_DIGITO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CENTROS_COSTE'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '    EMPRESA=?old_EMPRESA AND'
      '    EJERCICIO=?old_EJERCICIO AND'
      '    CANAL=?old_CANAL AND'
      '    NUM_DIGITO=?oldNUM_DIGITO AND'
      '    LET_DIGITO=?oldLET_DIGITO')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCentroCosteNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NUM_DIGITO '
      'LET_DIGITO'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CENTROS_COSTE'
    UpdateTransaction = TLocal
    Left = 40
    Top = 32
    object QMCentroCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentroCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCentroCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCentroCosteNUM_DIGITO: TIntegerField
      DisplayLabel = 'Nro. D'#237'gito'
      FieldName = 'NUM_DIGITO'
    end
    object QMCentroCosteTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMCentroCosteLET_DIGITO: TFIBStringField
      DisplayLabel = 'Letra'
      FieldName = 'LET_DIGITO'
      Size = 3
    end
  end
  object DSQMCentroCoste: TDataSource
    DataSet = QMCentroCoste
    Left = 156
    Top = 30
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 254
    Top = 32
  end
  object QMCentroCosteSerie: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CENTROS_COSTE_SERIE'
      'WHERE'
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CENTROS_COSTE_SERIE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,DIGITO_1,DIGITO_2,DIGITO_3,DIGI' +
        'TO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?DIGITO_1,?DIGITO_2,?DIGITO' +
        '_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CENTROS_COSTE_SERIE'
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CENTROS_COSTE_SERIE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CENTROS_COSTE_SERIE'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCentroCosteSerieNewRecord
    ClavesPrimarias.Strings = (
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CENTROS_COSTE_SERIE'
    UpdateTransaction = TLocal
    Left = 40
    Top = 80
    object QMCentroCosteSerieEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentroCosteSerieEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCentroCosteSerieCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCentroCosteSerieSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCentroCosteSerieDIGITO_1: TFIBStringField
      DisplayLabel = 'D1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMCentroCosteSerieDIGITO_2: TFIBStringField
      DisplayLabel = 'D2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMCentroCosteSerieDIGITO_3: TFIBStringField
      DisplayLabel = 'D3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMCentroCosteSerieDIGITO_4: TFIBStringField
      DisplayLabel = 'D4'
      FieldName = 'DIGITO_4'
      Size = 31
    end
    object QMCentroCosteSerieDIGITO_5: TFIBStringField
      DisplayLabel = 'D5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
  end
  object DSQMCentroCosteSerie: TDataSource
    DataSet = QMCentroCosteSerie
    Left = 156
    Top = 78
  end
  object QMCentroCosteAgente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CENTROS_COSTE_AGENTE'
      'WHERE'
      '  AGENTE=?old_AGENTE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CENTROS_COSTE_AGENTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,DIGITO_1,DIGITO_2,DIGITO_3,DIG' +
        'ITO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?DIGITO_1,?DIGITO_2,?DIGIT' +
        'O_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CENTROS_COSTE_AGENTE'
      'WHERE'
      '  AGENTE=?AGENTE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CENTROS_COSTE_AGENTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY AGENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CENTROS_COSTE_AGENTE'
      'SET'
      '  TITULO=?TITULO '
      '  ,DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  AGENTE=?AGENTE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCentroCosteAgenteNewRecord
    ClavesPrimarias.Strings = (
      'AGENTE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CENTROS_COSTE_AGENTE'
    UpdateTransaction = TLocal
    Left = 40
    Top = 128
    object QMCentroCosteAgenteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentroCosteAgenteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCentroCosteAgenteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCentroCosteAgenteAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCentroCosteAgenteTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCentroCosteAgenteDIGITO_1: TFIBStringField
      DisplayLabel = 'D1'
      FieldName = 'DIGITO_1'
      Size = 1
    end
    object QMCentroCosteAgenteDIGITO_2: TFIBStringField
      DisplayLabel = 'D2'
      FieldName = 'DIGITO_2'
      Size = 1
    end
    object QMCentroCosteAgenteDIGITO_3: TFIBStringField
      DisplayLabel = 'D3'
      FieldName = 'DIGITO_3'
      Size = 1
    end
    object QMCentroCosteAgenteDIGITO_4: TFIBStringField
      DisplayLabel = 'D4'
      FieldName = 'DIGITO_4'
      Size = 1
    end
    object QMCentroCosteAgenteDIGITO_5: TFIBStringField
      DisplayLabel = 'D5'
      FieldName = 'DIGITO_5'
      Size = 1
    end
  end
  object DSQMCentroCosteAgente: TDataSource
    DataSet = QMCentroCosteAgente
    Left = 156
    Top = 126
  end
  object QMAgenciaTramitadora: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CENTROS_COSTE_AGENCIA'
      'WHERE'
      '  AGENCIA_TRAMITADORA=?old_AGENCIA_TRAMITADORA AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CENTROS_COSTE_AGENCIA'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENCIA_TRAMITADORA,DIGITO_1,DIGITO_2' +
        ',DIGITO_3,DIGITO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENCIA_TRAMITADORA,?DIGITO_1,?DI' +
        'GITO_2,?DIGITO_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CENTROS_COSTE_AGENCIA'
      'WHERE'
      '  AGENCIA_TRAMITADORA=?AGENCIA_TRAMITADORA AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CENTROS_COSTE_AGENCIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY AGENCIA_TRAMITADORA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CENTROS_COSTE_AGENCIA'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  AGENCIA_TRAMITADORA=?AGENCIA_TRAMITADORA AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMAgenciaTramitadoraNewRecord
    ClavesPrimarias.Strings = (
      'AGENCIA_TRAMITADORA '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CENTROS_COSTE_AGENCIA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 176
    object QMAgenciaTramitadoraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAgenciaTramitadoraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAgenciaTramitadoraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAgenciaTramitadoraDIGITO_1: TFIBStringField
      DisplayLabel = 'D1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMAgenciaTramitadoraDIGITO_2: TFIBStringField
      DisplayLabel = 'D2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMAgenciaTramitadoraDIGITO_3: TFIBStringField
      DisplayLabel = 'D3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMAgenciaTramitadoraDIGITO_4: TFIBStringField
      DisplayLabel = 'D4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMAgenciaTramitadoraDIGITO_5: TFIBStringField
      DisplayLabel = 'D5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
    object QMAgenciaTramitadoraAGENCIA_TRAMITADORA: TIntegerField
      DisplayLabel = 'Ag. Tramitadora'
      FieldName = 'AGENCIA_TRAMITADORA'
    end
  end
  object DSQMAgenciaTramitadora: TDataSource
    DataSet = QMAgenciaTramitadora
    Left = 156
    Top = 174
  end
end
