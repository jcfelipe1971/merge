object DMPeriodoFacturacion: TDMPeriodoFacturacion
  OldCreateOrder = False
  OnCreate = DMPeriodoFacturacionCreate
  Left = 494
  Top = 342
  Height = 173
  Width = 285
  object DSQMPeriodoFacturacion: TDataSource
    DataSet = QMPeriodoFacturacion
    Left = 176
    Top = 16
  end
  object QMPeriodoFacturacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PERIODOS_FACTURACION'
      'WHERE'
      '  PERIODO=?old_PERIODO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PERIODOS_FACTURACION'
      '  (EMPRESA,PERIODO,TITULO)'
      'VALUES'
      '  (?EMPRESA,?PERIODO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PERIODOS_FACTURACION'
      'WHERE'
      '  PERIODO=?PERIODO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PERIODOS_FACTURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA '
      'ORDER BY PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PERIODOS_FACTURACION'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  PERIODO=?PERIODO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMPeriodoFacturacionNewRecord
    ClavesPrimarias.Strings = (
      'PERIODO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PERIODOS_FACTURACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMPeriodoFacturacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPeriodoFacturacionPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMPeriodoFacturacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 176
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
    Left = 48
    Top = 64
  end
end
