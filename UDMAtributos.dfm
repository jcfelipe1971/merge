object DMAtributos: TDMAtributos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 265
  Top = 228
  Height = 237
  Width = 355
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
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
    Left = 264
    Top = 56
  end
  object DSQMAtributos: TDataSource
    DataSet = QMAtributos
    Left = 120
    Top = 8
  end
  object QMAtributos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ATRIBUTO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ATRIBUTO'
      '  (ID,ID_PADRE,ATRIBUTO,TIPO,TIPO_PADRE)'
      'VALUES'
      '  (?ID,?ID_PADRE,?ATRIBUTO,?TIPO,?TIPO_PADRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ATRIBUTO'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ATRIBUTO'
      'ORDER BY TIPO, ATRIBUTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ATRIBUTO'
      'SET'
      '  ID_PADRE=?ID_PADRE '
      '  ,ATRIBUTO=?ATRIBUTO '
      '  ,TIPO=?TIPO '
      '  ,TIPO_PADRE=?TIPO_PADRE '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    BeforePost = QMAtributosBeforePost
    OnNewRecord = QMAtributosNewRecord
    ClavesPrimarias.Strings = (
      'ID')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ATRIBUTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 8
    object QMAtributosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMAtributosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAtributosATRIBUTO: TFIBStringField
      DisplayLabel = 'Atributo'
      FieldName = 'ATRIBUTO'
      Size = 60
    end
    object QMAtributosTIPO_PADRE: TFIBStringField
      DisplayLabel = 'Tipo Padre'
      FieldName = 'TIPO_PADRE'
      Size = 3
    end
    object QMAtributosID_PADRE: TIntegerField
      DisplayLabel = 'Id Padre'
      FieldName = 'ID_PADRE'
    end
  end
end
