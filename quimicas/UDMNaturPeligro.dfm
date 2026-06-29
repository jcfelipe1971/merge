object DMNaturPeligro: TDMNaturPeligro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 423
  Top = 310
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 146
    Top = 18
  end
  object DSQMNaturPeligro: TDataSource
    DataSet = QMNaturPeligro
    Left = 41
    Top = 67
  end
  object QMNaturPeligro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_QUI_NATURALEZA_PELIGRO'
      'WHERE'
      '  COD_NATURALEZA_PELIGRO=?old_COD_NATURALEZA_PELIGRO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_QUI_NATURALEZA_PELIGRO'
      '  (COD_NATURALEZA_PELIGRO,DESCRIPCION_CORTA,TEXTO)'
      'VALUES'
      '  (?COD_NATURALEZA_PELIGRO,?DESCRIPCION_CORTA,?TEXTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_QUI_NATURALEZA_PELIGRO'
      'WHERE'
      '  COD_NATURALEZA_PELIGRO=?COD_NATURALEZA_PELIGRO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_QUI_NATURALEZA_PELIGRO'
      'order by cod_naturaleza_peligro')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_QUI_NATURALEZA_PELIGRO'
      'SET'
      '  DESCRIPCION_CORTA=?DESCRIPCION_CORTA,'
      '  TEXTO=?TEXTO '
      'WHERE'
      '  COD_NATURALEZA_PELIGRO=?COD_NATURALEZA_PELIGRO ')
    BeforePost = QMNaturPeligroBeforePost
    ClavesPrimarias.Strings = (
      'COD_NATURALEZA_PELIGRO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_QUI_NATURALEZA_PELIGRO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 41
    Top = 12
    object QMNaturPeligroCOD_NATURALEZA_PELIGRO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NATURALEZA_PELIGRO'
    end
    object QMNaturPeligroDESCRIPCION_CORTA: TFIBStringField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCION_CORTA'
      Size = 100
    end
    object QMNaturPeligroTEXTO: TBlobField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 8
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
    Left = 148
    Top = 72
  end
end
