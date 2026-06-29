object DMSysCajas: TDMSysCajas
  OldCreateOrder = False
  OnCreate = DMSysCajasCreate
  Left = 574
  Top = 292
  Height = 237
  Width = 291
  object QMSysCajas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CAJAS'
      'WHERE'
      '  CAJA=?old_CAJA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CAJAS'
      '  (CAJA,TITULO)'
      'VALUES'
      '  (?CAJA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CAJAS'
      'WHERE'
      '  CAJA=?CAJA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CAJAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CAJAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  CAJA=?CAJA ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'CAJA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CAJAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMSysCajasCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMSysCajasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMSysCajas: TDataSource
    DataSet = QMSysCajas
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 80
  end
end
