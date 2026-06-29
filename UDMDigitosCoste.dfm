object DMDigitosCoste: TDMDigitosCoste
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 199
  Top = 174
  Height = 181
  Width = 286
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 14
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 134
    Top = 16
  end
  object QMCentroCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_CENTRO_COSTE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_CENTRO_COSTE'
      '  (ID,D1,D2,D3,D4,D5,PORCENTAJE,LINEA)'
      'VALUES'
      '  (?ID,?D1,?D2,?D3,?D4,?D5,?PORCENTAJE,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_CENTRO_COSTE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_CENTRO_COSTE'
      'WHERE'
      '  ID=?ID '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_CENTRO_COSTE'
      'SET'
      '  D1=?D1 '
      '  ,D2=?D2 '
      '  ,D3=?D3 '
      '  ,D4=?D4 '
      '  ,D5=?D5 '
      '  ,PORCENTAJE=?PORCENTAJE '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID=?ID ')
    BeforePost = QMCentroCosteBeforePost
    OnNewRecord = QMCentroCosteNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CENTRO_COSTE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_FAC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 39
    Top = 64
    object QMCentroCosteID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCentroCosteLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCentroCosteD1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'D1'
      Size = 3
    end
    object QMCentroCosteD2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'D2'
      Size = 3
    end
    object QMCentroCosteD3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'D3'
      Size = 3
    end
    object QMCentroCosteD4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'D4'
      Size = 3
    end
    object QMCentroCosteD5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'D5'
      Size = 3
    end
    object QMCentroCostePORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMCentroCoste: TDataSource
    DataSet = QMCentroCoste
    Left = 136
    Top = 64
  end
end
