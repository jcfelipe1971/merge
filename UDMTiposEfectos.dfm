object DMTiposEfectos: TDMTiposEfectos
  OldCreateOrder = False
  OnCreate = DMTiposEfectosCreate
  Left = 494
  Top = 342
  Height = 160
  Width = 219
  object DSQMTiposEfectos: TDataSource
    DataSet = QMTiposEfectos
    Left = 136
    Top = 16
  end
  object QMTiposEfectos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_EFECTO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_EFECTO'
      '  (TIPO,TITULO, TIPO_EFECTO_FACTURAE,MEDIO_PAGO_FACTURAE_CL)'
      'VALUES'
      '  (?TIPO,?TITULO, ?TIPO_EFECTO_FACTURAE,?MEDIO_PAGO_FACTURAE_CL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_EFECTO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_EFECTO'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_EFECTO'
      'SET'
      '  TITULO=?TITULO '
      '  ,TIPO_EFECTO_FACTURAE=?TIPO_EFECTO_FACTURAE'
      '  ,MEDIO_PAGO_FACTURAE_CL=?MEDIO_PAGO_FACTURAE_CL'
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMTiposEfectosNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_EFECTO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMTiposEfectosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMTiposEfectosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMTiposEfectosTIPO_EFECTO_FACTURAE: TIntegerField
      DisplayLabel = 'Tipo Efecto FacturaE'
      FieldName = 'TIPO_EFECTO_FACTURAE'
    end
    object QMTiposEfectosMEDIO_PAGO_FACTURAE_CL: TFIBStringField
      DisplayLabel = 'Medio Pago FacturaE CL'
      FieldName = 'MEDIO_PAGO_FACTURAE_CL'
      Size = 2
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 136
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 64
  end
end
