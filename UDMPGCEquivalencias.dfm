object DMPGCEquivalencias: TDMPGCEquivalencias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 806
  Top = 219
  Height = 264
  Width = 387
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 16
  end
  object QMEquivalencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PLANES_EQUIVALENCIAS'
      'WHERE'
      '  ID_PGC_EQUIVALENCIA=?old_ID_PGC_EQUIVALENCIA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PLANES_EQUIVALENCIAS'
      
        '  (ID_PGC_EQUIVALENCIA,O_TITULO,O_CUENTA,O_PGC,D_TITULO,D_CUENTA' +
        ',D_PGC,NOTAS)'
      'VALUES'
      
        '  (?ID_PGC_EQUIVALENCIA,?O_TITULO,?O_CUENTA,?O_PGC,?D_TITULO,?D_' +
        'CUENTA,?D_PGC,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PLANES_EQUIVALENCIAS'
      'WHERE'
      '  ID_PGC_EQUIVALENCIA=?ID_PGC_EQUIVALENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PLANES_EQUIVALENCIAS'
      'WHERE O_PGC = ?OPGC AND D_PGC=?DPGC'
      'ORDER BY O_CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PLANES_EQUIVALENCIAS'
      'SET'
      '  O_TITULO=?O_TITULO '
      '  ,O_CUENTA=?O_CUENTA '
      '  ,D_TITULO=?D_TITULO '
      '  ,D_CUENTA=?D_CUENTA '
      ' ,NOTAS=?NOTAS'
      'WHERE'
      '  ID_PGC_EQUIVALENCIA=?ID_PGC_EQUIVALENCIA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEquivalenciasNewRecord
    ClavesPrimarias.Strings = (
      'ID_PGC_EQUIVALENCIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PLANES_EQUIVALENCIAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMEquivalenciasO_TITULO: TFIBStringField
      DisplayLabel = 'Titulo Orig.'
      FieldName = 'O_TITULO'
      Size = 150
    end
    object QMEquivalenciasO_CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta Orig.'
      FieldName = 'O_CUENTA'
      Size = 15
    end
    object QMEquivalenciasO_PGC: TIntegerField
      DisplayLabel = 'PGC Orig.'
      FieldName = 'O_PGC'
    end
    object QMEquivalenciasD_TITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'D_TITULO'
      Size = 150
    end
    object QMEquivalenciasD_CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta D.'
      FieldName = 'D_CUENTA'
      Size = 15
    end
    object QMEquivalenciasD_PGC: TIntegerField
      DisplayLabel = 'PGC D.'
      FieldName = 'D_PGC'
    end
    object QMEquivalenciasID_PGC_EQUIVALENCIA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_PGC_EQUIVALENCIA'
    end
    object QMEquivalenciasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMEquivalencias: TDataSource
    DataSet = QMEquivalencias
    Left = 135
    Top = 16
  end
  object xOPGCs: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PLANES_CONTABLES')
    UniDirectional = False
    Left = 40
    Top = 72
    object xOPGCsPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object xOPGCsTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xOPGCsPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xOPGCsDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object xDPGCs: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PLANES_CONTABLES')
    UniDirectional = False
    Left = 40
    Top = 120
    object xDPGCsPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object xDPGCsTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDPGCsPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xDPGCsDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxOPGCs: TDataSource
    AutoEdit = False
    DataSet = xOPGCs
    Left = 135
    Top = 72
  end
  object DSxDPGCs: TDataSource
    AutoEdit = False
    DataSet = xDPGCs
    Left = 135
    Top = 119
  end
end
