object DMAFPIndicadores: TDMAFPIndicadores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 357
  Top = 276
  Height = 235
  Width = 295
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 240
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
    Left = 240
    Top = 72
  end
  object QMAFPIndicadores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT * FROM VER_AFP_EQUIVALENCIA '
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'EJERCICIO = :EJERCICIO AND '
      'CANAL = :CANAL AND '
      'PERIODO = :PERIODO AND'
      'CODIGO = :CODIGO')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT * FROM VER_AFP_EQUIVALENCIA '
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'EJERCICIO = :EJERCICIO AND '
      'CANAL = :CANAL AND '
      'PERIODO = :PERIODO '
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AFP_EQUIVALENCIA'
      'SET'
      'TASA_AFP_DEPENDIENTE = :TASA_AFP_DEPENDIENTE,'
      'TASA_SIS_DEPENDIENTE = :TASA_SIS_DEPENDIENTE,'
      'TASA_AFP_INDEPENDIENTE = :TASA_AFP_INDEPENDIENTE'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO = :PERIODO AND'
      'CODIGO = :CODIGO  ')
    AutoCalcFields = False
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AFP_EQUIVALENCIA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 37
    Top = 17
    object QMAFPIndicadoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAFPIndicadoresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAFPIndicadoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAFPIndicadoresPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMAFPIndicadoresCODIGO: TFIBStringField
      DisplayLabel = 'Codigo AFP'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMAFPIndicadoresGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMAFPIndicadoresTASA_AFP_DEPENDIENTE: TFloatField
      DisplayLabel = ' AFP Dep. %'
      FieldName = 'TASA_AFP_DEPENDIENTE'
    end
    object QMAFPIndicadoresTASA_SIS_DEPENDIENTE: TFloatField
      DisplayLabel = 'SIS Dep. %'
      FieldName = 'TASA_SIS_DEPENDIENTE'
    end
    object QMAFPIndicadoresTASA_AFP_INDEPENDIENTE: TFloatField
      DisplayLabel = 'AFP Indep. %'
      FieldName = 'TASA_AFP_INDEPENDIENTE'
    end
  end
  object DSQMAFPIndicadores: TDataSource
    DataSet = QMAFPIndicadores
    Left = 150
    Top = 17
  end
end
