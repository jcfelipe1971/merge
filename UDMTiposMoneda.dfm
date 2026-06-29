object DMTiposMoneda: TDMTiposMoneda
  OldCreateOrder = False
  OnCreate = DMAuxiliaresCreate
  Left = 574
  Top = 342
  Height = 231
  Width = 337
  object DSQMTiposMoneda: TDataSource
    DataSet = QMTiposMoneda
    Left = 136
    Top = 24
  end
  object QMTiposMoneda: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_MONEDAS'
      'WHERE'
      '  COD_MONEDA=?old_COD_MONEDA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_MONEDAS'
      '  (COD_MONEDA,MONEDA,DESCRIPCION,TIPO,VALOR)'
      'VALUES'
      '  (?COD_MONEDA,?MONEDA,?DESCRIPCION,?TIPO,?VALOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_MONEDAS'
      'WHERE'
      '  COD_MONEDA=?COD_MONEDA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_MONEDAS'
      'ORDER BY MONEDA, VALOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_MONEDAS'
      'SET'
      '  MONEDA=?MONEDA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,TIPO=?TIPO '
      '  ,VALOR=?VALOR '
      'WHERE'
      '  COD_MONEDA=?COD_MONEDA ')
    AfterDelete = Graba
    AfterPost = QMTiposMonedaAfterPost
    AfterScroll = QMTiposMonedaAfterScroll
    ClavesPrimarias.Strings = (
      'COD_MONEDA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_MONEDAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMTiposMonedaCOD_MONEDA: TIntegerField
      DisplayLabel = 'Cod. Moneda'
      FieldName = 'COD_MONEDA'
    end
    object QMTiposMonedaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMTiposMonedaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object QMTiposMonedaTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTiposMonedaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 72
  end
end
