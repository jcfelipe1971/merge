object DMEmpresasStock: TDMEmpresasStock
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 420
  Top = 266
  Height = 150
  Width = 242
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 183
    Top = 8
  end
  object QMEmpresas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_STOCKS_ALMACENES'
      'WHERE'
      '  ALMACEN_D=?old_ALMACEN_D AND '
      '  CANAL_D=?old_CANAL_D AND '
      '  EMPRESA_D=?old_EMPRESA_D AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_STOCKS_ALMACENES'
      '  (EMPRESA,CANAL,ALMACEN,EMPRESA_D,CANAL_D,ALMACEN_D)'
      'VALUES'
      '  (?EMPRESA,?CANAL,?ALMACEN,?EMPRESA_D,?CANAL_D,?ALMACEN_D)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_STOCKS_ALMACENES'
      'WHERE'
      '  ALMACEN_D=?old_ALMACEN_D AND'
      '  CANAL_D=?old_CANAL_D AND'
      '  EMPRESA_D=?old_EMPRESA_D AND'
      '  ALMACEN=?old_ALMACEN AND'
      '  CANAL=?old_CANAL AND'
      '  EMPRESA=?old_EMPRESA '
      ' ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_STOCKS_ALMACENES'
      'ORDER BY EMPRESA, CANAL, ALMACEN, EMPRESA_D, CANAL_D, ALMACEN_D')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_STOCKS_ALMACENES'
      'SET'
      '  ALMACEN_D=?new_ALMACEN_D,'
      '  CANAL_D=?new_CANAL_D,'
      '  EMPRESA_D=?new_EMPRESA_D,'
      '  ALMACEN=?new_ALMACEN,'
      '  CANAL=?new_CANAL,'
      '  EMPRESA=?new_EMPRESA'
      'WHERE'
      '  ALMACEN_D=?old_ALMACEN_D AND '
      '  CANAL_D=?old_CANAL_D AND '
      '  EMPRESA_D=?old_EMPRESA_D AND '
      '  ALMACEN=?old_ALMACEN AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA '
      ' ')
    BeforeEdit = QMEmpresasBeforeEdit
    ClavesPrimarias.Strings = (
      'ALMACEN_D '
      'CANAL_D '
      'EMPRESA_D '
      'ALMACEN '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_STOCKS_ALMACENES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 23
    Top = 8
    object QMEmpresasEMPRESA: TIntegerField
      DisplayLabel = 'Emp. Ori.'
      FieldName = 'EMPRESA'
    end
    object QMEmpresasCANAL: TIntegerField
      DisplayLabel = 'Can. Ori.'
      FieldName = 'CANAL'
    end
    object QMEmpresasALMACEN: TFIBStringField
      DisplayLabel = 'Alm. Ori.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMEmpresasEMPRESA_D: TIntegerField
      DisplayLabel = 'Emp. Des.'
      FieldName = 'EMPRESA_D'
    end
    object QMEmpresasCANAL_D: TIntegerField
      DisplayLabel = 'Can. Des.'
      FieldName = 'CANAL_D'
    end
    object QMEmpresasALMACEN_D: TFIBStringField
      DisplayLabel = 'Alm. Des.'
      FieldName = 'ALMACEN_D'
      Size = 3
    end
  end
  object QMDSEmpresas: TDataSource
    DataSet = QMEmpresas
    Left = 98
    Top = 9
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 183
    Top = 56
  end
end
