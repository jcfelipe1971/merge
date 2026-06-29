object DMCuentasIRPF: TDMCuentasIRPF
  OldCreateOrder = False
  OnCreate = DMCuentasIRPFCreate
  Left = 614
  Top = 536
  Height = 259
  Width = 369
  object QMVerIRPF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT * FROM VER_IRPF'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PAIS=?PAIS AND '
      'TIPO=?TIPO')
    SelectSQL.Strings = (
      'SELECT * FROM VER_IRPF'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PAIS=?PAIS'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_IRPF'
      'SET CUENTA=?CUENTA,'
      'CUENTA_ABONO=?CUENTA_ABONO'
      'WHERE EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'TIPO=?TIPO AND'
      'PAIS=?PAIS')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PAIS '
      'TIPO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_IRPF'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMVerIRPFPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMVerIRPFTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMVerIRPFP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object QMVerIRPFBASE: TIntegerField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
    object QMVerIRPFEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVerIRPFEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVerIRPFCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVerIRPFCUENTA: TFIBStringField
      DisplayLabel = 'Cta. Cargo'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMVerIRPFCUENTA_ABONO: TFIBStringField
      DisplayLabel = 'Cta. Abono'
      FieldName = 'CUENTA_ABONO'
      Size = 15
    end
    object QMVerIRPFTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMVerIRPFTITULO_BASE: TStringField
      DisplayLabel = 'T'#237'tulo Base'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'TITULO_BASE'
      OnGetText = QMVerIRPFTITULO_BASEGetText
      Size = 25
      Calculated = True
    end
  end
  object DSQMVerIRPF: TDataSource
    DataSet = QMVerIRPF
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 64
  end
end
