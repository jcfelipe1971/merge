object DMEtiColor: TDMEtiColor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 752
  Top = 399
  Height = 291
  Width = 478
  object QMEtiColor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ETI_COLOR'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ETI_COLOR'
      '  (CODIGO,TITULO,COLOR_DECIMAL)'
      'VALUES'
      '  (?CODIGO,?TITULO,?COLOR_DECIMAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ETI_COLOR'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ETI_COLOR'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ETI_COLOR'
      'SET'
      '  TITULO=?TITULO '
      '  ,COLOR_DECIMAL=?COLOR_DECIMAL '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterScroll = QMEtiColorAfterScroll
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ETI_COLOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMEtiColorCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMEtiColorTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 25
    end
    object QMEtiColorCOLOR_DECIMAL: TFloatField
      DisplayLabel = 'Color'
      FieldName = 'COLOR_DECIMAL'
    end
  end
  object DSQMEtiColor: TDataSource
    DataSet = QMEtiColor
    Left = 184
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 56
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
    Left = 184
    Top = 8
  end
end
