object DMControlPlazas: TDMControlPlazas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 473
  Top = 177
  Height = 449
  Width = 482
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 8
  end
  object QMEstructuraGolo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ID_FAMILIA=?old_ID_FAMILIA AND '
      '  DIA_SEMANA=?old_DIA_SEMANA AND '
      '  HORA=?old_HORA ')
    InsertSQL.Strings = (
      'INSERT INTO ESTRUCTURA_PLAZAS_POR_FAM'
      
        '  (ID_FAMILIA,ACTIVO,DIA_SEMANA,CANAL,EMPRESA,HORA,FAMILIA,ALMAC' +
        'EN,'
      
        '  ACTIVO_WEB_01,ACTIVO_WEB_02,ACTIVO_WEB_03,ACTIVO_WEB_04,ACTIVO' +
        '_WEB_05,ACTIVO_WEB_06,ACTIVO_WEB_07,ACTIVO_WEB_08,ACTIVO_WEB_09,' +
        'ACTIVO_WEB_10,ACTIVO_WEB_11,ACTIVO_WEB_12,'
      
        '  VISIBLE_WEB_01,VISIBLE_WEB_02,VISIBLE_WEB_03,VISIBLE_WEB_04,VI' +
        'SIBLE_WEB_05,VISIBLE_WEB_06,VISIBLE_WEB_07,VISIBLE_WEB_08,VISIBL' +
        'E_WEB_09,VISIBLE_WEB_10,VISIBLE_WEB_11,VISIBLE_WEB_12)'
      'VALUES'
      
        '  (?ID_FAMILIA,?ACTIVO,?DIA_SEMANA,?CANAL,?EMPRESA,?HORA,?FAMILI' +
        'A,?ALMACEN,'
      
        '  ?ACTIVO_WEB_01,?ACTIVO_WEB_02,?ACTIVO_WEB_03,?ACTIVO_WEB_04,?A' +
        'CTIVO_WEB_05,?ACTIVO_WEB_06,?ACTIVO_WEB_07,?ACTIVO_WEB_08,?ACTIV' +
        'O_WEB_09,?ACTIVO_WEB_10,?ACTIVO_WEB_11,?ACTIVO_WEB_12,'
      
        '  ?VISIBLE_WEB_01,?VISIBLE_WEB_02,?VISIBLE_WEB_03,?VISIBLE_WEB_0' +
        '4,?VISIBLE_WEB_05,?VISIBLE_WEB_06,?VISIBLE_WEB_07,?VISIBLE_WEB_0' +
        '8,?VISIBLE_WEB_09,?VISIBLE_WEB_10,?VISIBLE_WEB_11,?VISIBLE_WEB_1' +
        '2)'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA AND '
      '  HORA=?HORA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA'
      'ORDER BY HORA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ESTRUCTURA_PLAZAS_POR_FAM'
      'SET'
      '  HORA=?HORA'
      '  ,ACTIVO=?ACTIVO '
      '  ,FAMILIA=?FAMILIA '
      '  ,ACTIVO_WEB_01=?ACTIVO_WEB_01 '
      '  ,ACTIVO_WEB_02=?ACTIVO_WEB_02 '
      '  ,ACTIVO_WEB_03=?ACTIVO_WEB_03 '
      '  ,ACTIVO_WEB_04=?ACTIVO_WEB_04 '
      '  ,ACTIVO_WEB_05=?ACTIVO_WEB_05 '
      '  ,ACTIVO_WEB_06=?ACTIVO_WEB_06 '
      '  ,ACTIVO_WEB_07=?ACTIVO_WEB_07 '
      '  ,ACTIVO_WEB_08=?ACTIVO_WEB_08 '
      '  ,ACTIVO_WEB_09=?ACTIVO_WEB_09 '
      '  ,ACTIVO_WEB_10=?ACTIVO_WEB_10 '
      '  ,ACTIVO_WEB_11=?ACTIVO_WEB_11 '
      '  ,ACTIVO_WEB_12=?ACTIVO_WEB_12 '
      '  ,VISIBLE_WEB_01=?VISIBLE_WEB_01 '
      '  ,VISIBLE_WEB_02=?VISIBLE_WEB_02 '
      '  ,VISIBLE_WEB_03=?VISIBLE_WEB_03 '
      '  ,VISIBLE_WEB_04=?VISIBLE_WEB_04 '
      '  ,VISIBLE_WEB_05=?VISIBLE_WEB_05 '
      '  ,VISIBLE_WEB_06=?VISIBLE_WEB_06 '
      '  ,VISIBLE_WEB_07=?VISIBLE_WEB_07 '
      '  ,VISIBLE_WEB_08=?VISIBLE_WEB_08 '
      '  ,VISIBLE_WEB_09=?VISIBLE_WEB_09 '
      '  ,VISIBLE_WEB_10=?VISIBLE_WEB_10 '
      '  ,VISIBLE_WEB_11=?VISIBLE_WEB_11 '
      '  ,VISIBLE_WEB_12=?VISIBLE_WEB_12 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA AND '
      '  HORA=?old_HORA ')
    OnNewRecord = QMEstructuraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ID_FAMILIA '
      'DIA_SEMANA '
      'HORA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ESTRUCTURA_PLAZAS_POR_FAM'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMEstructuraGoloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEstructuraGoloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEstructuraGoloALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMEstructuraGoloID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Fam.'
      FieldName = 'ID_FAMILIA'
    end
    object QMEstructuraGoloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEstructuraGoloDIA_SEMANA: TIntegerField
      DisplayLabel = 'Dia Semana'
      FieldName = 'DIA_SEMANA'
    end
    object QMEstructuraGoloHORA: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      OnGetText = QMEstructuraHORAGetText
      OnSetText = QMEstructuraHORASetText
      Size = 15
    end
    object QMEstructuraGoloACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEstructuraGoloACTIVO_WEB_01: TIntegerField
      DisplayLabel = 'Ene.'
      FieldName = 'ACTIVO_WEB_01'
    end
    object QMEstructuraGoloACTIVO_WEB_02: TIntegerField
      DisplayLabel = 'Feb.'
      FieldName = 'ACTIVO_WEB_02'
    end
    object QMEstructuraGoloACTIVO_WEB_03: TIntegerField
      DisplayLabel = 'Mar.'
      FieldName = 'ACTIVO_WEB_03'
    end
    object QMEstructuraGoloACTIVO_WEB_04: TIntegerField
      DisplayLabel = 'Abr.'
      FieldName = 'ACTIVO_WEB_04'
    end
    object QMEstructuraGoloACTIVO_WEB_05: TIntegerField
      DisplayLabel = 'May.'
      FieldName = 'ACTIVO_WEB_05'
    end
    object QMEstructuraGoloACTIVO_WEB_06: TIntegerField
      DisplayLabel = 'Jun.'
      FieldName = 'ACTIVO_WEB_06'
    end
    object QMEstructuraGoloACTIVO_WEB_07: TIntegerField
      DisplayLabel = 'Jul.'
      FieldName = 'ACTIVO_WEB_07'
    end
    object QMEstructuraGoloACTIVO_WEB_08: TIntegerField
      DisplayLabel = 'Ago.'
      FieldName = 'ACTIVO_WEB_08'
    end
    object QMEstructuraGoloACTIVO_WEB_09: TIntegerField
      DisplayLabel = 'Sep.'
      FieldName = 'ACTIVO_WEB_09'
    end
    object QMEstructuraGoloACTIVO_WEB_10: TIntegerField
      DisplayLabel = 'Oct.'
      FieldName = 'ACTIVO_WEB_10'
    end
    object QMEstructuraGoloACTIVO_WEB_11: TIntegerField
      DisplayLabel = 'Nov.'
      FieldName = 'ACTIVO_WEB_11'
    end
    object QMEstructuraGoloACTIVO_WEB_12: TIntegerField
      DisplayLabel = 'Dic.'
      FieldName = 'ACTIVO_WEB_12'
    end
    object QMEstructuraGoloVISIBLE_WEB_01: TIntegerField
      DisplayLabel = 'Ene.'
      FieldName = 'VISIBLE_WEB_01'
    end
    object QMEstructuraGoloVISIBLE_WEB_02: TIntegerField
      DisplayLabel = 'Feb.'
      FieldName = 'VISIBLE_WEB_02'
    end
    object QMEstructuraGoloVISIBLE_WEB_03: TIntegerField
      DisplayLabel = 'Mar.'
      FieldName = 'VISIBLE_WEB_03'
    end
    object QMEstructuraGoloVISIBLE_WEB_04: TIntegerField
      DisplayLabel = 'Abr.'
      FieldName = 'VISIBLE_WEB_04'
    end
    object QMEstructuraGoloVISIBLE_WEB_05: TIntegerField
      DisplayLabel = 'May.'
      FieldName = 'VISIBLE_WEB_05'
    end
    object QMEstructuraGoloVISIBLE_WEB_06: TIntegerField
      DisplayLabel = 'Jun.'
      FieldName = 'VISIBLE_WEB_06'
    end
    object QMEstructuraGoloVISIBLE_WEB_07: TIntegerField
      DisplayLabel = 'Jul.'
      FieldName = 'VISIBLE_WEB_07'
    end
    object QMEstructuraGoloVISIBLE_WEB_08: TIntegerField
      DisplayLabel = 'Ago.'
      FieldName = 'VISIBLE_WEB_08'
    end
    object QMEstructuraGoloVISIBLE_WEB_09: TIntegerField
      DisplayLabel = 'Sep.'
      FieldName = 'VISIBLE_WEB_09'
    end
    object QMEstructuraGoloVISIBLE_WEB_10: TIntegerField
      DisplayLabel = 'Oct.'
      FieldName = 'VISIBLE_WEB_10'
    end
    object QMEstructuraGoloVISIBLE_WEB_11: TIntegerField
      DisplayLabel = 'Nov.'
      FieldName = 'VISIBLE_WEB_11'
    end
    object QMEstructuraGoloVISIBLE_WEB_12: TIntegerField
      DisplayLabel = 'Dic.'
      FieldName = 'VISIBLE_WEB_12'
    end
  end
  object QMPlazasGolo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ID_FAMILIA=?old_ID_FAMILIA AND '
      '  FECHA_HORA=?old_FECHA_HORA ')
    InsertSQL.Strings = (
      'INSERT INTO PLAZAS_POR_FAMILIA'
      
        '  (PLAZAS_MAXIMAS,PLAZAS,ID,ID_FAMILIA,ACTIVO,ACTIVO_WEB,MENSAJE' +
        ',CANAL,EMPRESA,FECHA_HORA,ALMACEN,VISIBLE_WEB)'
      'VALUES'
      
        '  (?PLAZAS_MAXIMAS,?PLAZAS,?ID,?ID_FAMILIA,?ACTIVO,?ACTIVO_WEB,?' +
        'MENSAJE,?CANAL,?EMPRESA,?FECHA_HORA,?ALMACEN,?VISIBLE_WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA=?FECHA_HORA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA STARTING WITH ?FECHA'
      'ORDER BY FECHA_HORA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PLAZAS_POR_FAMILIA'
      'SET'
      '  PLAZAS_MAXIMAS=?PLAZAS_MAXIMAS '
      '  ,PLAZAS=?PLAZAS '
      '  ,ID=?ID '
      '  ,ACTIVO=?ACTIVO '
      '  ,ACTIVO_WEB=?ACTIVO_WEB'
      '  ,MENSAJE=?MENSAJE '
      '  ,VISIBLE_WEB=?VISIBLE_WEB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA=?FECHA_HORA ')
    BeforePost = QMPlazasBeforePost
    OnNewRecord = QMPlazasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ID_FAMILIA '
      'FECHA_HORA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PLAZAS_POR_FAMILIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMPlazasGoloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPlazasGoloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPlazasGoloALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPlazasGoloID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Fam.'
      FieldName = 'ID_FAMILIA'
    end
    object QMPlazasGoloFECHA_HORA: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'FECHA_HORA'
      OnGetText = QMPlazasFECHA_HORAGetText
      OnSetText = QMPlazasFECHA_HORASetText
      Size = 15
    end
    object QMPlazasGoloPLAZAS: TFloatField
      DisplayLabel = 'Plazas'
      FieldName = 'PLAZAS'
    end
    object QMPlazasGoloPLAZAS_MAXIMAS: TFloatField
      DisplayLabel = 'Plazas Max.'
      FieldName = 'PLAZAS_MAXIMAS'
    end
    object QMPlazasGoloID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMPlazasGoloMENSAJE: TFIBStringField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 60
    end
    object QMPlazasGoloACTIVO: TIntegerField
      DisplayLabel = 'Activo TPV'
      FieldName = 'ACTIVO'
    end
    object QMPlazasGoloACTIVO_WEB: TIntegerField
      DisplayLabel = 'Venta Web'
      FieldName = 'ACTIVO_WEB'
    end
    object QMPlazasGoloVISIBLE_WEB: TIntegerField
      DisplayLabel = 'Horario Web'
      FieldName = 'VISIBLE_WEB'
    end
  end
  object DSQMEstructuraGolo: TDataSource
    DataSet = QMEstructuraGolo
    Left = 152
    Top = 56
  end
  object DSQMPlazasGolo: TDataSource
    DataSet = QMPlazasGolo
    Left = 152
    Top = 104
  end
  object QMEstructuraCat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ID_FAMILIA=?old_ID_FAMILIA AND '
      '  DIA_SEMANA=?old_DIA_SEMANA AND '
      '  HORA=?old_HORA ')
    InsertSQL.Strings = (
      'INSERT INTO ESTRUCTURA_PLAZAS_POR_FAM'
      
        '  (ID_FAMILIA,ACTIVO,DIA_SEMANA,CANAL,EMPRESA,HORA,FAMILIA,ALMAC' +
        'EN,'
      
        '  ACTIVO_WEB_01,ACTIVO_WEB_02,ACTIVO_WEB_03,ACTIVO_WEB_04,ACTIVO' +
        '_WEB_05,ACTIVO_WEB_06,ACTIVO_WEB_07,ACTIVO_WEB_08,ACTIVO_WEB_09,' +
        'ACTIVO_WEB_10,ACTIVO_WEB_11,ACTIVO_WEB_12,'
      
        '  VISIBLE_WEB_01,VISIBLE_WEB_02,VISIBLE_WEB_03,VISIBLE_WEB_04,VI' +
        'SIBLE_WEB_05,VISIBLE_WEB_06,VISIBLE_WEB_07,VISIBLE_WEB_08,VISIBL' +
        'E_WEB_09,VISIBLE_WEB_10,VISIBLE_WEB_11,VISIBLE_WEB_12)'
      'VALUES'
      
        '  (?ID_FAMILIA,?ACTIVO,?DIA_SEMANA,?CANAL,?EMPRESA,?HORA,?FAMILI' +
        'A,?ALMACEN,'
      
        '  ?ACTIVO_WEB_01,?ACTIVO_WEB_02,?ACTIVO_WEB_03,?ACTIVO_WEB_04,?A' +
        'CTIVO_WEB_05,?ACTIVO_WEB_06,?ACTIVO_WEB_07,?ACTIVO_WEB_08,?ACTIV' +
        'O_WEB_09,?ACTIVO_WEB_10,?ACTIVO_WEB_11,?ACTIVO_WEB_12,'
      
        '  ?VISIBLE_WEB_01,?VISIBLE_WEB_02,?VISIBLE_WEB_03,?VISIBLE_WEB_0' +
        '4,?VISIBLE_WEB_05,?VISIBLE_WEB_06,?VISIBLE_WEB_07,?VISIBLE_WEB_0' +
        '8,?VISIBLE_WEB_09,?VISIBLE_WEB_10,?VISIBLE_WEB_11,?VISIBLE_WEB_1' +
        '2)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA AND '
      '  HORA=?HORA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA'
      'ORDER BY HORA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ESTRUCTURA_PLAZAS_POR_FAM'
      'SET'
      '  ACTIVO=?ACTIVO '
      '  ,FAMILIA=?FAMILIA '
      '  ,ACTIVO_WEB_01=?ACTIVO_WEB_01 '
      '  ,ACTIVO_WEB_02=?ACTIVO_WEB_02 '
      '  ,ACTIVO_WEB_03=?ACTIVO_WEB_03 '
      '  ,ACTIVO_WEB_04=?ACTIVO_WEB_04 '
      '  ,ACTIVO_WEB_05=?ACTIVO_WEB_05 '
      '  ,ACTIVO_WEB_06=?ACTIVO_WEB_06 '
      '  ,ACTIVO_WEB_07=?ACTIVO_WEB_07 '
      '  ,ACTIVO_WEB_08=?ACTIVO_WEB_08 '
      '  ,ACTIVO_WEB_09=?ACTIVO_WEB_09 '
      '  ,ACTIVO_WEB_10=?ACTIVO_WEB_10 '
      '  ,ACTIVO_WEB_11=?ACTIVO_WEB_11 '
      '  ,ACTIVO_WEB_12=?ACTIVO_WEB_12 '
      '  ,VISIBLE_WEB_01=?VISIBLE_WEB_01 '
      '  ,VISIBLE_WEB_02=?VISIBLE_WEB_02 '
      '  ,VISIBLE_WEB_03=?VISIBLE_WEB_03 '
      '  ,VISIBLE_WEB_04=?VISIBLE_WEB_04 '
      '  ,VISIBLE_WEB_05=?VISIBLE_WEB_05 '
      '  ,VISIBLE_WEB_06=?VISIBLE_WEB_06 '
      '  ,VISIBLE_WEB_07=?VISIBLE_WEB_07 '
      '  ,VISIBLE_WEB_08=?VISIBLE_WEB_08 '
      '  ,VISIBLE_WEB_09=?VISIBLE_WEB_09 '
      '  ,VISIBLE_WEB_10=?VISIBLE_WEB_10 '
      '  ,VISIBLE_WEB_11=?VISIBLE_WEB_11 '
      '  ,VISIBLE_WEB_12=?VISIBLE_WEB_12 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA AND '
      '  HORA=?HORA ')
    OnNewRecord = QMEstructuraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ID_FAMILIA '
      'DIA_SEMANA '
      'HORA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ESTRUCTURA_PLAZAS_POR_FAM'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMEstructuraCatEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEstructuraCatCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEstructuraCatALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMEstructuraCatID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Fam.'
      FieldName = 'ID_FAMILIA'
    end
    object QMEstructuraCatFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEstructuraCatDIA_SEMANA: TIntegerField
      DisplayLabel = 'Dia Semana'
      FieldName = 'DIA_SEMANA'
    end
    object QMEstructuraCatHORA: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      OnGetText = QMEstructuraHORAGetText
      OnSetText = QMEstructuraHORASetText
      Size = 15
    end
    object QMEstructuraCatACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEstructuraCatACTIVO_WEB_01: TIntegerField
      DisplayLabel = 'Ene.'
      FieldName = 'ACTIVO_WEB_01'
    end
    object QMEstructuraCatACTIVO_WEB_02: TIntegerField
      DisplayLabel = 'Feb.'
      FieldName = 'ACTIVO_WEB_02'
    end
    object QMEstructuraCatACTIVO_WEB_03: TIntegerField
      DisplayLabel = 'Mar.'
      FieldName = 'ACTIVO_WEB_03'
    end
    object QMEstructuraCatACTIVO_WEB_04: TIntegerField
      DisplayLabel = 'Abr.'
      FieldName = 'ACTIVO_WEB_04'
    end
    object QMEstructuraCatACTIVO_WEB_05: TIntegerField
      DisplayLabel = 'May.'
      FieldName = 'ACTIVO_WEB_05'
    end
    object QMEstructuraCatACTIVO_WEB_06: TIntegerField
      DisplayLabel = 'Jun.'
      FieldName = 'ACTIVO_WEB_06'
    end
    object QMEstructuraCatACTIVO_WEB_07: TIntegerField
      DisplayLabel = 'Jul.'
      FieldName = 'ACTIVO_WEB_07'
    end
    object QMEstructuraCatACTIVO_WEB_08: TIntegerField
      DisplayLabel = 'Ago.'
      FieldName = 'ACTIVO_WEB_08'
    end
    object QMEstructuraCatACTIVO_WEB_09: TIntegerField
      DisplayLabel = 'Sep.'
      FieldName = 'ACTIVO_WEB_09'
    end
    object QMEstructuraCatACTIVO_WEB_10: TIntegerField
      DisplayLabel = 'Oct.'
      FieldName = 'ACTIVO_WEB_10'
    end
    object QMEstructuraCatACTIVO_WEB_11: TIntegerField
      DisplayLabel = 'Nov.'
      FieldName = 'ACTIVO_WEB_11'
    end
    object QMEstructuraCatACTIVO_WEB_12: TIntegerField
      DisplayLabel = 'Dic.'
      FieldName = 'ACTIVO_WEB_12'
    end
    object QMEstructuraCatVISIBLE_WEB_01: TIntegerField
      DisplayLabel = 'Ene.'
      FieldName = 'VISIBLE_WEB_01'
    end
    object QMEstructuraCatVISIBLE_WEB_02: TIntegerField
      DisplayLabel = 'Feb.'
      FieldName = 'VISIBLE_WEB_02'
    end
    object QMEstructuraCatVISIBLE_WEB_03: TIntegerField
      DisplayLabel = 'Mar.'
      FieldName = 'VISIBLE_WEB_03'
    end
    object QMEstructuraCatVISIBLE_WEB_04: TIntegerField
      DisplayLabel = 'Abr.'
      FieldName = 'VISIBLE_WEB_04'
    end
    object QMEstructuraCatVISIBLE_WEB_05: TIntegerField
      DisplayLabel = 'May.'
      FieldName = 'VISIBLE_WEB_05'
    end
    object QMEstructuraCatVISIBLE_WEB_06: TIntegerField
      DisplayLabel = 'Jun.'
      FieldName = 'VISIBLE_WEB_06'
    end
    object QMEstructuraCatVISIBLE_WEB_07: TIntegerField
      DisplayLabel = 'Jul'
      FieldName = 'VISIBLE_WEB_07'
    end
    object QMEstructuraCatVISIBLE_WEB_08: TIntegerField
      DisplayLabel = 'Ago.'
      FieldName = 'VISIBLE_WEB_08'
    end
    object QMEstructuraCatVISIBLE_WEB_09: TIntegerField
      DisplayLabel = 'Sep.'
      FieldName = 'VISIBLE_WEB_09'
    end
    object QMEstructuraCatVISIBLE_WEB_10: TIntegerField
      DisplayLabel = 'Oct.'
      FieldName = 'VISIBLE_WEB_10'
    end
    object QMEstructuraCatVISIBLE_WEB_11: TIntegerField
      DisplayLabel = 'Nov.'
      FieldName = 'VISIBLE_WEB_11'
    end
    object QMEstructuraCatVISIBLE_WEB_12: TIntegerField
      DisplayLabel = 'Dic.'
      FieldName = 'VISIBLE_WEB_12'
    end
  end
  object QMPlazasCat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ID_FAMILIA=?old_ID_FAMILIA AND '
      '  FECHA_HORA=?old_FECHA_HORA ')
    InsertSQL.Strings = (
      'INSERT INTO PLAZAS_POR_FAMILIA'
      
        '  (PLAZAS_MAXIMAS,PLAZAS,ID,ID_FAMILIA,ACTIVO,ACTIVO_WEB,MENSAJE' +
        ',CANAL,EMPRESA,FECHA_HORA,ALMACEN,VISIBLE_WEB)'
      'VALUES'
      
        '  (?PLAZAS_MAXIMAS,?PLAZAS,?ID,?ID_FAMILIA,?ACTIVO,?ACTIVO_WEB,?' +
        'MENSAJE,?CANAL,?EMPRESA,?FECHA_HORA,?ALMACEN,?VISIBLE_WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA=?FECHA_HORA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA STARTING WITH ?FECHA'
      'ORDER BY FECHA_HORA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PLAZAS_POR_FAMILIA'
      'SET'
      '  PLAZAS_MAXIMAS=?PLAZAS_MAXIMAS '
      '  ,PLAZAS=?PLAZAS '
      '  ,ID=?ID '
      '  ,ACTIVO=?ACTIVO '
      '  ,ACTIVO_WEB=?ACTIVO_WEB'
      '  ,MENSAJE=?MENSAJE '
      '  ,VISIBLE_WEB=?VISIBLE_WEB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA=?FECHA_HORA ')
    BeforePost = QMPlazasBeforePost
    OnNewRecord = QMPlazasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ID_FAMILIA '
      'FECHA_HORA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PLAZAS_POR_FAMILIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
    object QMPlazasCatEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPlazasCatCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPlazasCatALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPlazasCatID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Fam.'
      FieldName = 'ID_FAMILIA'
    end
    object QMPlazasCatFECHA_HORA: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'FECHA_HORA'
      OnGetText = QMPlazasFECHA_HORAGetText
      OnSetText = QMPlazasFECHA_HORASetText
      Size = 15
    end
    object QMPlazasCatPLAZAS: TFloatField
      DisplayLabel = 'Plazas'
      FieldName = 'PLAZAS'
    end
    object QMPlazasCatPLAZAS_MAXIMAS: TFloatField
      DisplayLabel = 'Plazas Max.'
      FieldName = 'PLAZAS_MAXIMAS'
    end
    object QMPlazasCatID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMPlazasCatMENSAJE: TFIBStringField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 60
    end
    object QMPlazasCatACTIVO: TIntegerField
      DisplayLabel = 'Activo TPV'
      FieldName = 'ACTIVO'
    end
    object QMPlazasCatACTIVO_WEB: TIntegerField
      DisplayLabel = 'Venta Web'
      FieldName = 'ACTIVO_WEB'
    end
    object QMPlazasCatVISIBLE_WEB: TIntegerField
      DisplayLabel = 'Horario Web'
      FieldName = 'VISIBLE_WEB'
    end
  end
  object DSQMEstructuraCat: TDataSource
    DataSet = QMEstructuraCat
    Left = 152
    Top = 152
  end
  object DSQMPlazasCat: TDataSource
    DataSet = QMPlazasCat
    Left = 152
    Top = 200
  end
  object QMEstructuraEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ID_FAMILIA=?old_ID_FAMILIA AND '
      '  DIA_SEMANA=?old_DIA_SEMANA AND '
      '  HORA=?old_HORA ')
    InsertSQL.Strings = (
      'INSERT INTO ESTRUCTURA_PLAZAS_POR_FAM'
      
        '  (ID_FAMILIA,ACTIVO,DIA_SEMANA,CANAL,EMPRESA,HORA,FAMILIA,ALMAC' +
        'EN,'
      
        '  ACTIVO_WEB_01,ACTIVO_WEB_02,ACTIVO_WEB_03,ACTIVO_WEB_04,ACTIVO' +
        '_WEB_05,ACTIVO_WEB_06,ACTIVO_WEB_07,ACTIVO_WEB_08,ACTIVO_WEB_09,' +
        'ACTIVO_WEB_10,ACTIVO_WEB_11,ACTIVO_WEB_12,'
      
        '  VISIBLE_WEB_01,VISIBLE_WEB_02,VISIBLE_WEB_03,VISIBLE_WEB_04,VI' +
        'SIBLE_WEB_05,VISIBLE_WEB_06,VISIBLE_WEB_07,VISIBLE_WEB_08,VISIBL' +
        'E_WEB_09,VISIBLE_WEB_10,VISIBLE_WEB_11,VISIBLE_WEB_12)'
      'VALUES'
      
        '  (?ID_FAMILIA,?ACTIVO,?DIA_SEMANA,?CANAL,?EMPRESA,?HORA,?FAMILI' +
        'A,?ALMACEN,'
      
        '  ?ACTIVO_WEB_01,?ACTIVO_WEB_02,?ACTIVO_WEB_03,?ACTIVO_WEB_04,?A' +
        'CTIVO_WEB_05,?ACTIVO_WEB_06,?ACTIVO_WEB_07,?ACTIVO_WEB_08,?ACTIV' +
        'O_WEB_09,?ACTIVO_WEB_10,?ACTIVO_WEB_11,?ACTIVO_WEB_12,'
      
        '  ?VISIBLE_WEB_01,?VISIBLE_WEB_02,?VISIBLE_WEB_03,?VISIBLE_WEB_0' +
        '4,?VISIBLE_WEB_05,?VISIBLE_WEB_06,?VISIBLE_WEB_07,?VISIBLE_WEB_0' +
        '8,?VISIBLE_WEB_09,?VISIBLE_WEB_10,?VISIBLE_WEB_11,?VISIBLE_WEB_1' +
        '2)'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA AND '
      '  HORA=?HORA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ESTRUCTURA_PLAZAS_POR_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA'
      'ORDER BY HORA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ESTRUCTURA_PLAZAS_POR_FAM'
      'SET'
      '  ACTIVO=?ACTIVO '
      '  ,FAMILIA=?FAMILIA '
      '  ,ACTIVO_WEB_01=?ACTIVO_WEB_01 '
      '  ,ACTIVO_WEB_02=?ACTIVO_WEB_02 '
      '  ,ACTIVO_WEB_03=?ACTIVO_WEB_03 '
      '  ,ACTIVO_WEB_04=?ACTIVO_WEB_04 '
      '  ,ACTIVO_WEB_05=?ACTIVO_WEB_05 '
      '  ,ACTIVO_WEB_06=?ACTIVO_WEB_06 '
      '  ,ACTIVO_WEB_07=?ACTIVO_WEB_07 '
      '  ,ACTIVO_WEB_08=?ACTIVO_WEB_08 '
      '  ,ACTIVO_WEB_09=?ACTIVO_WEB_09 '
      '  ,ACTIVO_WEB_10=?ACTIVO_WEB_10 '
      '  ,ACTIVO_WEB_11=?ACTIVO_WEB_11 '
      '  ,ACTIVO_WEB_12=?ACTIVO_WEB_12 '
      '  ,VISIBLE_WEB_01=?VISIBLE_WEB_01 '
      '  ,VISIBLE_WEB_02=?VISIBLE_WEB_02 '
      '  ,VISIBLE_WEB_03=?VISIBLE_WEB_03 '
      '  ,VISIBLE_WEB_04=?VISIBLE_WEB_04 '
      '  ,VISIBLE_WEB_05=?VISIBLE_WEB_05 '
      '  ,VISIBLE_WEB_06=?VISIBLE_WEB_06 '
      '  ,VISIBLE_WEB_07=?VISIBLE_WEB_07 '
      '  ,VISIBLE_WEB_08=?VISIBLE_WEB_08 '
      '  ,VISIBLE_WEB_09=?VISIBLE_WEB_09 '
      '  ,VISIBLE_WEB_10=?VISIBLE_WEB_10 '
      '  ,VISIBLE_WEB_11=?VISIBLE_WEB_11 '
      '  ,VISIBLE_WEB_12=?VISIBLE_WEB_12 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  DIA_SEMANA=?DIA_SEMANA AND '
      '  HORA=?HORA ')
    OnNewRecord = QMEstructuraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ID_FAMILIA '
      'DIA_SEMANA '
      'HORA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ESTRUCTURA_PLAZAS_POR_FAM'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 248
    object QMEstructuraEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEstructuraEscCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEstructuraEscALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMEstructuraEscID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Fam.'
      FieldName = 'ID_FAMILIA'
    end
    object QMEstructuraEscFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEstructuraEscDIA_SEMANA: TIntegerField
      DisplayLabel = 'Dia Semana'
      FieldName = 'DIA_SEMANA'
    end
    object QMEstructuraEscHORA: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      OnGetText = QMEstructuraHORAGetText
      OnSetText = QMEstructuraHORASetText
      Size = 15
    end
    object QMEstructuraEscACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEstructuraEscACTIVO_WEB_01: TIntegerField
      DisplayLabel = 'Ene.'
      FieldName = 'ACTIVO_WEB_01'
    end
    object QMEstructuraEscACTIVO_WEB_02: TIntegerField
      DisplayLabel = 'Feb.'
      FieldName = 'ACTIVO_WEB_02'
    end
    object QMEstructuraEscACTIVO_WEB_03: TIntegerField
      DisplayLabel = 'Mar.'
      FieldName = 'ACTIVO_WEB_03'
    end
    object QMEstructuraEscACTIVO_WEB_04: TIntegerField
      DisplayLabel = 'Abr.'
      FieldName = 'ACTIVO_WEB_04'
    end
    object QMEstructuraEscACTIVO_WEB_05: TIntegerField
      DisplayLabel = 'May.'
      FieldName = 'ACTIVO_WEB_05'
    end
    object QMEstructuraEscACTIVO_WEB_06: TIntegerField
      DisplayLabel = 'Jun.'
      FieldName = 'ACTIVO_WEB_06'
    end
    object QMEstructuraEscACTIVO_WEB_07: TIntegerField
      DisplayLabel = 'Jul.'
      FieldName = 'ACTIVO_WEB_07'
    end
    object QMEstructuraEscACTIVO_WEB_08: TIntegerField
      DisplayLabel = 'Ago.'
      FieldName = 'ACTIVO_WEB_08'
    end
    object QMEstructuraEscACTIVO_WEB_09: TIntegerField
      DisplayLabel = 'Sep.'
      FieldName = 'ACTIVO_WEB_09'
    end
    object QMEstructuraEscACTIVO_WEB_10: TIntegerField
      DisplayLabel = 'Oct.'
      FieldName = 'ACTIVO_WEB_10'
    end
    object QMEstructuraEscACTIVO_WEB_11: TIntegerField
      DisplayLabel = 'Nov.'
      FieldName = 'ACTIVO_WEB_11'
    end
    object QMEstructuraEscACTIVO_WEB_12: TIntegerField
      DisplayLabel = 'Dic.'
      FieldName = 'ACTIVO_WEB_12'
    end
    object QMEstructuraEscVISIBLE_WEB_01: TIntegerField
      DisplayLabel = 'Ene.'
      FieldName = 'VISIBLE_WEB_01'
    end
    object QMEstructuraEscVISIBLE_WEB_02: TIntegerField
      DisplayLabel = 'Feb.'
      FieldName = 'VISIBLE_WEB_02'
    end
    object QMEstructuraEscVISIBLE_WEB_03: TIntegerField
      DisplayLabel = 'Mar.'
      FieldName = 'VISIBLE_WEB_03'
    end
    object QMEstructuraEscVISIBLE_WEB_04: TIntegerField
      DisplayLabel = 'Abr.'
      FieldName = 'VISIBLE_WEB_04'
    end
    object QMEstructuraEscVISIBLE_WEB_05: TIntegerField
      DisplayLabel = 'May.'
      FieldName = 'VISIBLE_WEB_05'
    end
    object QMEstructuraEscVISIBLE_WEB_06: TIntegerField
      DisplayLabel = 'Jun.'
      FieldName = 'VISIBLE_WEB_06'
    end
    object QMEstructuraEscVISIBLE_WEB_07: TIntegerField
      DisplayLabel = 'Jul.'
      FieldName = 'VISIBLE_WEB_07'
    end
    object QMEstructuraEscVISIBLE_WEB_08: TIntegerField
      DisplayLabel = 'Ago.'
      FieldName = 'VISIBLE_WEB_08'
    end
    object QMEstructuraEscVISIBLE_WEB_09: TIntegerField
      DisplayLabel = 'Sep.'
      FieldName = 'VISIBLE_WEB_09'
    end
    object QMEstructuraEscVISIBLE_WEB_10: TIntegerField
      DisplayLabel = 'Oct.'
      FieldName = 'VISIBLE_WEB_10'
    end
    object QMEstructuraEscVISIBLE_WEB_11: TIntegerField
      DisplayLabel = 'Nov.'
      FieldName = 'VISIBLE_WEB_11'
    end
    object QMEstructuraEscVISIBLE_WEB_12: TIntegerField
      DisplayLabel = 'Dic.'
      FieldName = 'VISIBLE_WEB_12'
    end
  end
  object QMPlazasEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  ID_FAMILIA=?old_ID_FAMILIA AND '
      '  FECHA_HORA=?old_FECHA_HORA ')
    InsertSQL.Strings = (
      'INSERT INTO PLAZAS_POR_FAMILIA'
      
        '  (PLAZAS_MAXIMAS,PLAZAS,ID,ID_FAMILIA,ACTIVO,ACTIVO_WEB,MENSAJE' +
        ',CANAL,EMPRESA,FECHA_HORA,ALMACEN,VISIBLE_WEB)'
      'VALUES'
      
        '  (?PLAZAS_MAXIMAS,?PLAZAS,?ID,?ID_FAMILIA,?ACTIVO,?ACTIVO_WEB,?' +
        'MENSAJE,?CANAL,?EMPRESA,?FECHA_HORA,?ALMACEN,?VISIBLE_WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA=?FECHA_HORA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PLAZAS_POR_FAMILIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA STARTING WITH ?FECHA'
      'ORDER BY FECHA_HORA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PLAZAS_POR_FAMILIA'
      'SET'
      '  PLAZAS_MAXIMAS=?PLAZAS_MAXIMAS '
      '  ,PLAZAS=?PLAZAS '
      '  ,ID=?ID '
      '  ,ACTIVO=?ACTIVO '
      '  ,ACTIVO_WEB=?ACTIVO_WEB'
      '  ,MENSAJE=?MENSAJE '
      '  ,VISIBLE_WEB=?VISIBLE_WEB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ID_FAMILIA=?ID_FAMILIA AND '
      '  FECHA_HORA=?FECHA_HORA ')
    BeforePost = QMPlazasBeforePost
    OnNewRecord = QMPlazasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ALMACEN '
      'ID_FAMILIA '
      'FECHA_HORA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PLAZAS_POR_FAMILIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 296
    object QMPlazasEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPlazasEscCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPlazasEscALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPlazasEscID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Fam.'
      FieldName = 'ID_FAMILIA'
    end
    object QMPlazasEscFECHA_HORA: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'FECHA_HORA'
      OnGetText = QMPlazasFECHA_HORAGetText
      OnSetText = QMPlazasFECHA_HORASetText
      Size = 15
    end
    object QMPlazasEscPLAZAS: TFloatField
      DisplayLabel = 'Plazas'
      FieldName = 'PLAZAS'
    end
    object QMPlazasEscPLAZAS_MAXIMAS: TFloatField
      DisplayLabel = 'Plazas Max.'
      FieldName = 'PLAZAS_MAXIMAS'
    end
    object QMPlazasEscID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMPlazasEscMENSAJE: TFIBStringField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 60
    end
    object QMPlazasEscACTIVO: TIntegerField
      DisplayLabel = 'Activo TPV'
      FieldName = 'ACTIVO'
    end
    object QMPlazasEscACTIVO_WEB: TIntegerField
      DisplayLabel = 'Venta Web'
      FieldName = 'ACTIVO_WEB'
    end
    object QMPlazasEscVISIBLE_WEB: TIntegerField
      DisplayLabel = 'Horario Web'
      FieldName = 'VISIBLE_WEB'
    end
  end
  object DSQMEstructuraEsc: TDataSource
    DataSet = QMEstructuraEsc
    Left = 152
    Top = 248
  end
  object DSQMPlazasEsc: TDataSource
    DataSet = QMPlazasEsc
    Left = 152
    Top = 296
  end
end
