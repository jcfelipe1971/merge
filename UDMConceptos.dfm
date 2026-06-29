object DMConceptos: TDMConceptos
  OldCreateOrder = False
  OnCreate = DMConceptosCreate
  Left = 356
  Top = 245
  Height = 137
  Width = 346
  object DSQMConceptos: TDataSource
    DataSet = QMConceptos
    Left = 122
    Top = 28
  end
  object QMConceptos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONCEPTOS'
      'WHERE'
      '  CONCEPTO=?old_CONCEPTO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONCEPTOS'
      '  (CONCEPTO,TITULO)'
      'VALUES'
      '  (?CONCEPTO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONCEPTOS'
      'WHERE'
      '  CONCEPTO=?OLD_CONCEPTO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONCEPTOS'
      'ORDER BY CONCEPTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONCEPTOS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  CONCEPTO=?old_CONCEPTO ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'CONCEPTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONCEPTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 32
    object QMConceptosCONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Size = 3
    end
    object QMConceptosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 26
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
    Top = 26
  end
end
