object DMTipoImpuestoAdicional: TDMTipoImpuestoAdicional
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 699
  Top = 386
  Height = 287
  Width = 312
  object QMTipoImpuestoAdicional: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_IMPUESTO_ADICIONAL'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_IMPUESTO_ADICIONAL'
      '  (PORCENTAJE,TIPO,TITULO,ACTIVO,PAIS)'
      'VALUES'
      '  (?PORCENTAJE,?TIPO,?TITULO,?ACTIVO,?PAIS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IMPUESTO_ADICIONAL'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IMPUESTO_ADICIONAL'
      'WHERE'
      'PAIS = :PAIS'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_IMPUESTO_ADICIONAL'
      'SET'
      '  PORCENTAJE=?PORCENTAJE '
      '  ,TITULO=?TITULO '
      '  ,ACTIVO=?ACTIVO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    BeforePost = QMTipoImpuestoAdicionalBeforePost
    OnNewRecord = QMTipoImpuestoAdicionalNewRecord
    ClavesPrimarias.Strings = (
      'PAIS'
      'TIPO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = True
    Mensajes = False
    TableName = 'SYS_TIPO_IMPUESTO_ADICIONAL'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 48
    object QMTipoImpuestoAdicionalPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMTipoImpuestoAdicionalTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipoImpuestoAdicionalTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMTipoImpuestoAdicionalPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMTipoImpuestoAdicionalACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 56
    Top = 144
  end
  object DSQMTipoImpuestoAdicional: TDataSource
    DataSet = QMTipoImpuestoAdicional
    Left = 200
    Top = 48
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 144
  end
end
