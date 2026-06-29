object DMGrupoIncoterm: TDMGrupoIncoterm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 244
  Top = 170
  Height = 174
  Width = 294
  object DSQMGrupo: TDataSource
    DataSet = QMGrupo
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
  object QMGrupo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_GRUPO_INCOTERM'
      'WHERE'
      '  GRUPO=?old_GRUPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_GRUPO_INCOTERM'
      '  (GRUPO,TITULO)'
      'VALUES'
      '  (?GRUPO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_GRUPO_INCOTERM'
      'WHERE'
      '  GRUPO=?GRUPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GRUPO_INCOTERM'
      ' ORDER BY GRUPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_GRUPO_INCOTERM'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  GRUPO=?GRUPO ')
    ClavesPrimarias.Strings = (
      'GRUPO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GRUPO_INCOTERM'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 49
    Top = 68
    object QMGrupoGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object QMGrupoTITULO: TFIBStringField
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
