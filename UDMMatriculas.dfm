object DMMatriculas: TDMMatriculas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 496
  Top = 329
  Height = 188
  Width = 331
  object DSQMMatriculas: TDataSource
    DataSet = QMMatriculas
    Left = 164
    Top = 12
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 262
    Top = 12
  end
  object QMMatriculas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MATRICULAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  MATRICULA=?old_MATRICULA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MATRICULAS'
      '  (EMPRESA,MATRICULA,TITULO,TRANSPORTISTA,DEFECTO)'
      'VALUES'
      '  (?EMPRESA,?MATRICULA,?TITULO,?TRANSPORTISTA,?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MATRICULAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MATRICULA=?MATRICULA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MATRICULAS'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'ORDER BY DEFECTO DESC, MATRICULA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MATRICULAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TRANSPORTISTA=?TRANSPORTISTA'
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MATRICULA=?MATRICULA ')
    OnNewRecord = QMMatriculasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'MATRICULA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MATRICULAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 41
    Top = 12
    object QMMatriculasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMatriculasMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object QMMatriculasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMatriculasTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMMatriculasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
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
    Left = 262
    Top = 60
  end
end
