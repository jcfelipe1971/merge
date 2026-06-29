object OpeDMDepart: TOpeDMDepart
  OldCreateOrder = False
  OnCreate = OpeDMDepartCreate
  Left = 254
  Top = 251
  Height = 110
  Width = 319
  object QMDepartamento: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_DEPARTAMENTOS'
      'WHERE'
      '  DEPARTAMENTO=?old_DEPARTAMENTO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_DEPARTAMENTOS'
      '  (EMPRESA,DEPARTAMENTO,DESCRIPCION)'
      'VALUES'
      '  (?EMPRESA,?DEPARTAMENTO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_DEPARTAMENTOS'
      'WHERE'
      '  DEPARTAMENTO=?DEPARTAMENTO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_DEPARTAMENTOS'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY DEPARTAMENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_DEPARTAMENTOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  DEPARTAMENTO=?DEPARTAMENTO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = QMDepartamentoAfterPost
    BeforePost = QMDepartamentoBeforePost
    ClavesPrimarias.Strings = (
      'DEPARTAMENTO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_DEPARTAMENTOS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMDepartamentoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDepartamentoDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Depart.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMDepartamentoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSQMDepartamento: TDataSource
    DataSet = QMDepartamento
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 16
  end
end
