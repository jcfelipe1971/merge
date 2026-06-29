object DMDepartamentos: TDMDepartamentos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 609
  Top = 333
  Height = 185
  Width = 274
  object DSQMDepartamentos: TDataSource
    DataSet = QMDepartamentos
    Left = 172
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 46
    Top = 4
  end
  object QMDepartamentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_DEPARTAMENTOS'
      'WHERE'
      '  DEPARTAMENTO=?old_DEPARTAMENTO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_DEPARTAMENTOS'
      '  (DEPARTAMENTO,TITULO)'
      'VALUES'
      '  (?DEPARTAMENTO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_DEPARTAMENTOS'
      'WHERE'
      '  DEPARTAMENTO=?DEPARTAMENTO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_DEPARTAMENTOS'
      ' ORDER BY DEPARTAMENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_DEPARTAMENTOS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  DEPARTAMENTO=?DEPARTAMENTO ')
    ClavesPrimarias.Strings = (
      'DEPARTAMENTO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_DEPARTAMENTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 49
    Top = 68
    object QMDepartamentosDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      Size = 5
    end
    object QMDepartamentosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
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
    Left = 174
    Top = 4
  end
end
