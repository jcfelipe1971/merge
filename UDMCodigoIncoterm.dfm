object DMCodigoIncoterm: TDMCodigoIncoterm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 244
  Top = 170
  Height = 174
  Width = 294
  object DSQMCodigo: TDataSource
    DataSet = QMCodigo
    Left = 172
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 46
    Top = 4
  end
  object QMCodigo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CODIGO_INCOTERM'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CODIGO_INCOTERM'
      '  (GRUPO,CODIGO,TITULO)'
      'VALUES'
      '  (?GRUPO,?CODIGO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CODIGO_INCOTERM'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CODIGO_INCOTERM'
      ' ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CODIGO_INCOTERM'
      'SET'
      '  GRUPO=?GRUPO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CODIGO_INCOTERM'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 49
    Top = 68
    object QMCodigoGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object QMCodigoCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMCodigoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 174
    Top = 4
  end
end
