object DMMultiAgrupacion: TDMMultiAgrupacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 686
  Top = 203
  Height = 229
  Width = 320
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 24
  end
  object DSxMultiAgrupacion: TDataSource
    DataSet = xMultiAgrupacion
    Left = 144
    Top = 80
  end
  object xMultiAgrupacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_AGRUPACIONES'
      'WHERE'
      '  AGRUPACION=?old_AGRUPACION AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_AGRUPACIONES'
      '  (ENTRADA,AGRUPACION,TITULO,MARCADO)'
      'VALUES'
      '  (?ENTRADA,?AGRUPACION,?TITULO,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_AGRUPACIONES'
      'WHERE'
      '  AGRUPACION=?AGRUPACION AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_AGRUPACIONES'
      'WHERE '
      'ENTRADA=?ENTRADA'
      'ORDER BY AGRUPACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_AGRUPACIONES'
      'SET'
      '  TITULO=?TITULO '
      '  ,MARCADO=?MARCADO '
      'WHERE'
      '  AGRUPACION=?AGRUPACION AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = xMultiAgrupacionAfterPost
    OnNewRecord = xMultiAgrupacionNewRecord
    ClavesPrimarias.Strings = (
      'AGRUPACION '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_AGRUPACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 80
    object xMultiAgrupacionENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xMultiAgrupacionAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xMultiAgrupacionTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xMultiAgrupacionMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
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
    Left = 144
    Top = 24
  end
end
