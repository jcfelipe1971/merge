object DMAgrupaciones: TDMAgrupaciones
  OldCreateOrder = False
  OnCreate = DMAgrupacionesCreate
  Left = 626
  Top = 182
  Height = 177
  Width = 343
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 214
    Top = 11
  end
  object QMAgrupaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_AGRUPACIONES'
      'WHERE'
      '  AGRUPACION=?old_AGRUPACION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_AGRUPACIONES'
      '  (TITULO,AGRUPACION,TIPO,NOTAS,TITULO_WEB,WEB)'
      'VALUES'
      '  (?TITULO,?AGRUPACION,?TIPO,?NOTAS,?TITULO_WEB,?WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_AGRUPACIONES'
      'WHERE'
      '  AGRUPACION=?AGRUPACION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_AGRUPACIONES'
      'order by agrupacion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_AGRUPACIONES'
      'SET'
      '  TITULO=?TITULO '
      '  ,TIPO=?TIPO '
      '  ,NOTAS=?NOTAS '
      '  ,TITULO_WEB=?TITULO_WEB'
      '  ,WEB=?WEB'
      'WHERE'
      '  AGRUPACION=?AGRUPACION ')
    OnNewRecord = QMAgrupacionesNewRecord
    ClavesPrimarias.Strings = (
      'AGRUPACION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_AGRUPACIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 12
    object QMAgrupacionesAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMAgrupacionesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMAgrupacionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMAgrupacionesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAgrupacionesTITULO_WEB: TFIBStringField
      DisplayLabel = 'T'#237'tulo WEB'
      FieldName = 'TITULO_WEB'
      Size = 15
    end
    object QMAgrupacionesWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
  end
  object DSQMAgrupaciones: TDataSource
    DataSet = QMAgrupaciones
    Left = 132
    Top = 12
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 278
    Top = 11
  end
end
