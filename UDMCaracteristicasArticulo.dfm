object DMCaracteristicasArticulo: TDMCaracteristicasArticulo
  OldCreateOrder = False
  OnCreate = DMCaracteristicasArticuloCreate
  Left = 494
  Top = 342
  Height = 224
  Width = 300
  object DSQMCaracteristicasArticulo: TDataSource
    DataSet = QMCaracteristicasArticulo
    Left = 192
    Top = 16
  end
  object QMCaracteristicasArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_CARACTERISTICAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_CARACTERISTICAS'
      '  (EMPRESA,'#13#10'CODIGO,TITULO)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?CODIGO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_CARACTERISTICAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_CARACTERISTICAS'
      'WHERE'
      '  EMPRESA=?EMPRESA'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_CARACTERISTICAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO ')
    OnNewRecord = QMCaracteristicasArticuloNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_CARACTERISTICAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMCaracteristicasArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCaracteristicasArticuloCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 25
    end
    object QMCaracteristicasArticuloTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 256
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 56
    Top = 72
  end
end
