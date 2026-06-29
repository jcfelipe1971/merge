object DMFamiliasEscandallos: TDMFamiliasEscandallos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 356
  Top = 357
  Height = 262
  Width = 436
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 108
  end
  object ZQMFamiliasEscandallos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_FAM_ESCANDALLOS'
      'WHERE'
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  FAMILIA=?old_FAMILIA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_FAM_ESCANDALLOS'
      '  (EMPRESA,FAMILIA,ESCANDALLO,COMPUESTO)'
      'VALUES'
      '  (?EMPRESA,?FAMILIA,?ESCANDALLO,?COMPUESTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_FAM_ESCANDALLOS'
      'WHERE'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_FAM_ESCANDALLOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_FAM_ESCANDALLOS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,COMPUESTO=?COMPUESTO '
      'WHERE'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  FAMILIA=?FAMILIA ')
    AfterDelete = Graba
    AfterOpen = ZQMFamiliasEscandallosAfterOpen
    AfterPost = Graba
    OnNewRecord = ZQMFamiliasEscandallosNewRecord
    ClavesPrimarias.Strings = (
      'ESCANDALLO '
      'FAMILIA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_FAM_ESCANDALLOS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 28
    object ZQMFamiliasEscandallosFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      OnChange = ZQMFamiliasEscandallosFAMILIAChange
      Size = 5
    end
    object ZQMFamiliasEscandallosESCANDALLO: TIntegerField
      FieldName = 'ESCANDALLO'
      OnChange = ZQMFamiliasEscandallosESCANDALLOChange
    end
    object ZQMFamiliasEscandallosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object ZQMFamiliasEscandallosDescFamili: TStringField
      DisplayLabel = 'DescFamilia'
      FieldKind = fkCalculated
      FieldName = 'DescFamili'
      OnGetText = ZQMFamiliasEscandallosDescFamiliGetText
      Size = 30
      Calculated = True
    end
    object ZQMFamiliasEscandallosDescCompuesto: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescCompuesto'
      OnGetText = ZQMFamiliasEscandallosDescCompuestoGetText
      Size = 30
      Calculated = True
    end
  end
  object ZDSQMFamiliasEscandallos: TDataSource
    DataSet = ZQMFamiliasEscandallos
    Left = 168
    Top = 28
  end
  object xFamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TITULO FROM VER_FAMILIAS_CUENTAS'
      'where EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND FAMILIA=?FAMILIA')
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_FAMILIAS_CUENTAS'
      'where EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND FAMILIA=?FAMILIA')
    UniDirectional = False
    DataSource = ZDSQMFamiliasEscandallos
    Left = 280
    Top = 40
    object xFamiliaTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamilia: TDataSource
    DataSet = xFamilia
    Left = 348
    Top = 40
  end
  object xCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT COMPUESTO FROM PRO_ESCANDALLO '
      'WHERE EMPRESA=?EMPRESA AND ESCANDALLO=?ESCANDALLO'
      'AND TIPO='#39'EPR'#39)
    SelectSQL.Strings = (
      'SELECT COMPUESTO FROM PRO_ESCANDALLO '
      'WHERE EMPRESA=?EMPRESA AND ESCANDALLO=?ESCANDALLO'
      'AND TIPO='#39'EPR'#39)
    UniDirectional = False
    DataSource = ZDSQMFamiliasEscandallos
    Left = 280
    Top = 112
    object xCompuestoCOMPUESTO: TFIBStringField
      FieldName = 'COMPUESTO'
      Size = 15
    end
  end
  object DSxCompuesto: TDataSource
    DataSet = xCompuesto
    Left = 348
    Top = 112
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 36
    Top = 164
  end
end
