object DMOrdenesPromociones: TDMOrdenesPromociones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 341
  Top = 174
  Height = 176
  Width = 212
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 16
  end
  object QMPromociones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROMOCIONES_ORDENES'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROMOCIONES_ORDENES'
      '  (EMPRESA,TIPO,TITULO,ORDEN,CONTINUA)'
      'VALUES'
      '  (?EMPRESA,?TIPO,?TITULO,?ORDEN,?CONTINUA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROMOCIONES_ORDENES'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROMOCIONES_ORDENES'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROMOCIONES_ORDENES'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,CONTINUA=?CONTINUA '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = QMPromocionesAfterDelete
    AfterPost = QMPromocionesAfterPost
    OnNewRecord = QMPromocionesNewRecord
    ClavesPrimarias.Strings = (
      'TIPO'
      'EMPRESA')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROMOCIONES_ORDENES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 80
    object QMPromocionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPromocionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPromocionesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPromocionesORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMPromocionesCONTINUA: TIntegerField
      DisplayLabel = 'Continua'
      FieldName = 'CONTINUA'
    end
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 136
    Top = 80
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 136
    Top = 16
  end
end
