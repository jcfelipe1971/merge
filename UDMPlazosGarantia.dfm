object DMPlazosGarantia: TDMPlazosGarantia
  OldCreateOrder = False
  OnCreate = DMPlazosGarantiaCreate
  Left = 516
  Top = 291
  Height = 190
  Width = 239
  object QMPlazosGarantia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PLAZOS_GARANTIA'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PLAZOS_GARANTIA'
      '  (ANYOS,MESES,DIAS,TITULO,TIPO)'
      'VALUES'
      '  (?ANYOS,?MESES,?DIAS,?TITULO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PLAZOS_GARANTIA'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PLAZOS_GARANTIA'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PLAZOS_GARANTIA'
      'SET'
      '  ANYOS=?ANYOS '
      '  ,MESES=?MESES '
      '  ,DIAS=?DIAS '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMPlazosGarantiaBeforePost
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PLAZOS_GARANTIA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMPlazosGarantiaTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMPlazosGarantiaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMPlazosGarantiaDIAS: TIntegerField
      DisplayLabel = 'Dias'
      FieldName = 'DIAS'
    end
    object QMPlazosGarantiaMESES: TIntegerField
      DisplayLabel = 'Meses'
      FieldName = 'MESES'
    end
    object QMPlazosGarantiaANYOS: TIntegerField
      DisplayLabel = 'A'#241'os'
      FieldName = 'ANYOS'
    end
  end
  object DSQMPlazosGarantia: TDataSource
    DataSet = QMPlazosGarantia
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 80
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
    Top = 80
  end
end
