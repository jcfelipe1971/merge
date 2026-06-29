object DMDivisiones: TDMDivisiones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 288
  Top = 146
  Height = 150
  Width = 256
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 8
  end
  object xDivisionesCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_DIVISIONES'
      'WHERE'
      '  DIVISION=?old_DIVISION AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_DIVISIONES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,DIVISION,PORCENTA' +
        'JE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?DIVISION,' +
        '?PORCENTAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_DIVISIONES'
      'WHERE'
      '  DIVISION=?DIVISION AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_DIVISIONES'
      'WHERE '
      'ID_S = ?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_DIVISIONES'
      'SET'
      '  ID_S=?ID_S '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,DIVISION=?DIVISION '
      'WHERE'
      '  DIVISION=?old_DIVISION AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterPost = xDivisionesCabAfterPost
    OnNewRecord = xDivisionesCabNewRecord
    ClavesPrimarias.Strings = (
      'DIVISION '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_DIVISIONES'
    UpdateTransaction = TLocal
    Left = 24
    Top = 8
    object xDivisionesCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDivisionesCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDivisionesCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDivisionesCabSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDivisionesCabTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDivisionesCabRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDivisionesCabID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xDivisionesCabDIVISION: TFIBStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Size = 5
    end
    object xDivisionesCabPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object xDivisionesDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_DIVISIONES'
      'WHERE'
      '  DIVISION=?old_DIVISION AND '
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_DIVISIONES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_S,ID_DETALLES' +
        '_S,DIVISION,PORCENTAJE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_S,?ID' +
        '_DETALLES_S,?DIVISION,?PORCENTAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S_DIVISIONES'
      'WHERE'
      '  DIVISION=?DIVISION AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_DIVISIONES'
      'WHERE '
      'ID_S = ?ID_S AND'
      'ID_DETALLES_S = ?ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_DIVISIONES'
      'SET'
      '  DIVISION=?DIVISION'
      '  ,PORCENTAJE=?PORCENTAJE '
      'WHERE'
      '  DIVISION=?old_DIVISION AND '
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterPost = xDivisionesDetAfterPost
    OnNewRecord = xDivisionesDetNewRecord
    ClavesPrimarias.Strings = (
      'DIVISION '
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_DIVISIONES'
    UpdateTransaction = TLocal
    Left = 24
    Top = 56
    object xDivisionesDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDivisionesDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDivisionesDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDivisionesDetSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDivisionesDetTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDivisionesDetRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDivisionesDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDivisionesDetID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xDivisionesDetID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xDivisionesDetDIVISION: TFIBStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Size = 5
    end
    object xDivisionesDetPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSxDivisionesCab: TDataSource
    DataSet = xDivisionesCab
    Left = 120
    Top = 8
  end
  object DSxDivisionesDet: TDataSource
    DataSet = xDivisionesDet
    Left = 120
    Top = 56
  end
end
