object DMPresenciaDiario: TDMPresenciaDiario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 371
  Top = 181
  Height = 466
  Width = 463
  object QMProDetPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM PRO_VER_DIARIO_PRESENCIA'
      'WHERE'
      'ID_DET_PRESENCIA = ?ID_DET_PRESENCIA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_VER_DIARIO_PRESENCIA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'FECHA >= :FECHAD AND'
      'FECHA <= :FECHAH'
      'ORDER BY FECHA, HORA_ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_VER_DIARIO_PRESENCIA'
    UpdateTransaction = TLocal
    Left = 48
    Top = 8
    object QMProDetPreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetPreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProDetPreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProDetPreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProDetPreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProDetPreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMProDetPreID_CAB_PRESENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_CAB_PRESENCIA'
    end
    object QMProDetPreOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMProDetPreFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProDetPreHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMProDetPreDESC_HORARIO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_HORARIO'
      Size = 100
    end
    object QMProDetPreCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMProDetPreDESC_CALENDARIO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CALENDARIO'
      Size = 40
    end
    object QMProDetPreESTADO_CAB: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_CAB'
    end
    object QMProDetPreLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetPreID_DET_PRESENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_DET_PRESENCIA'
    end
    object QMProDetPreTIPO_PRE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_PRE'
      Size = 3
    end
    object QMProDetPreID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Id Incidencia'
      FieldName = 'ID_INCIDENCIA'
    end
    object QMProDetPreDESC_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_INCIDENCIA'
      Size = 60
    end
    object QMProDetPreESTADO_DET: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_DET'
    end
    object QMProDetPreTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object QMProDetPreDESC_OPERARIO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_OPERARIO'
      Size = 60
    end
    object QMProDetPreTIEMPO_TOTAL: TDateTimeField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOTAL'
    end
    object QMProDetPreHORA_ENTRADA: TDateTimeField
      DisplayLabel = 'Hora Ent.'
      FieldName = 'HORA_ENTRADA'
    end
    object QMProDetPreHORA_SALIDA: TDateTimeField
      DisplayLabel = 'Hora Sal.'
      FieldName = 'HORA_SALIDA'
    end
    object QMProDetPreTIEMPO: TDateTimeField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMProDetPreHORA_ENTRADA_ORIGINAL: TDateTimeField
      DisplayLabel = 'Hora Ent. (Orig)'
      FieldName = 'HORA_ENTRADA_ORIGINAL'
      ReadOnly = True
    end
    object QMProDetPreHORA_SALIDA_ORIGINAL: TDateTimeField
      DisplayLabel = 'Hora Sal. (Orig)'
      FieldName = 'HORA_SALIDA_ORIGINAL'
      ReadOnly = True
    end
  end
  object DSQMProDetPre: TDataSource
    DataSet = QMProDetPre
    Left = 176
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 8
  end
  object DSxCalendario: TDataSource
    DataSet = xCalendario
    Left = 176
    Top = 152
  end
  object xCalendario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION'
      'FROM OPE_CALENDARIO_C'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CALENDARIO = :CALENDARIO')
    UniDirectional = False
    Left = 48
    Top = 152
    object xCalendarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object xHorario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION'
      'FROM OPE_HORARIOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'HORARIO = :HORARIO')
    UniDirectional = False
    Left = 48
    Top = 104
    object xHorarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxHorario: TDataSource
    DataSet = xHorario
    Left = 176
    Top = 104
  end
  object QMProDetPreTiempos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT TIEMPO'
      'FROM PRO_VER_DIARIO_PRESENCIA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'FECHA >= :FECHAD AND'
      'FECHA <= :FECHAH')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_VER_DIARIO_PRESENCIA'
    UpdateTransaction = TLocal
    Left = 48
    Top = 56
    object QMProDetPreTiemposTIEMPO: TDateTimeField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
  end
  object DSQMProPreTiempos: TDataSource
    DataSet = QMProDetPreTiempos
    Left = 176
    Top = 56
  end
  object xIncidencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION'
      'FROM PRO_SYS_TIPO_INCIDENCIA'
      'WHERE'
      'ID_INCIDENCIA = :ID_INCIDENCIA')
    UniDirectional = False
    Left = 48
    Top = 200
    object xIncidenciaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxIncidencia: TDataSource
    DataSet = xIncidencia
    Left = 176
    Top = 200
  end
end
