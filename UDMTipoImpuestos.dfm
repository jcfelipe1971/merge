object DMTipoImpuestos: TDMTipoImpuestos
  OldCreateOrder = False
  OnCreate = DMTipoImpuestosCreate
  Left = 522
  Top = 371
  Height = 172
  Width = 278
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 72
    Top = 72
  end
  object QMTipoImpuestos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_IMPUESTOS'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_IMPUESTOS'
      '  (PORCENTAJE,TITULO,TIPO,PAIS)'
      'VALUES'
      '  (?PORCENTAJE,?TITULO,?TIPO,?PAIS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IMPUESTOS'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IMPUESTOS'
      'WHERE PAIS=?PAIS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_IMPUESTOS'
      'SET'
      '  PORCENTAJE=?PORCENTAJE '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    AfterDelete = QMTipoImpuestosAfterDelete
    AfterPost = QMTipoImpuestosAfterPost
    BeforePost = QMTipoImpuestosBeforePost
    OnNewRecord = QMTipoImpuestosNewRecord
    ClavesPrimarias.Strings = (
      'PAIS '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_IMPUESTOS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 24
    object QMTipoImpuestosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMTipoImpuestosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipoImpuestosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMTipoImpuestosPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMTipoImpuestos: TDataSource
    DataSet = QMTipoImpuestos
    Left = 136
    Top = 16
  end
end
