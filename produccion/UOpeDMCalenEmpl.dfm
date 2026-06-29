object OpeDMCalenEmpl: TOpeDMCalenEmpl
  OldCreateOrder = False
  OnCreate = OpeDMCalenEmplCreate
  Left = 887
  Top = 184
  Height = 400
  Width = 339
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 248
    Top = 16
  end
  object QMEmpleado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterDelete = Graba
    AfterOpen = QMEmpleadoAfterOpen
    AfterPost = Graba
    AfterScroll = QMEmpleadoAfterScroll
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'EMPLEADO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMPLEADOS_CUENTAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMEmpleadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpleadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMEmpleadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEmpleadoCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMEmpleadoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMEmpleado: TDataSource
    DataSet = QMEmpleado
    Left = 152
    Top = 16
  end
  object DSxCalendario: TDataSource
    DataSet = xCalendario
    Left = 152
    Top = 64
  end
  object xCalendario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CAL.*, HOR.DESCRIPCION AS DESC_HORARIO'
      'FROM OPE_CALENDARIO_C CAL'
      
        'LEFT JOIN OPE_HORARIOS HOR ON HOR.EMPRESA = CAL.EMPRESA AND HOR.' +
        'HORARIO = CAL.HORARIO'
      'WHERE'
      'CAL.EMPRESA = :EMPRESA AND'
      'CAL.CALENDARIO = :CALENDARIO')
    UniDirectional = False
    DataSource = DSQMEmpleado
    Left = 40
    Top = 64
    object xCalendarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCalendarioCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object xCalendarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xCalendarioSABADO_FEST: TIntegerField
      DisplayLabel = 'Sabado Festivo'
      FieldName = 'SABADO_FEST'
    end
    object xCalendarioDOMINGO_FEST: TIntegerField
      DisplayLabel = 'Domingo Festivo'
      FieldName = 'DOMINGO_FEST'
    end
    object xCalendarioHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object xCalendarioDESC_HORARIO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_HORARIO'
      Size = 100
    end
  end
  object xHorasTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from ope_calendario_empl_horas (?empresa, ?calendario, ' +
        '?empleado, ?ejercicio, ?dias_ejercicio)')
    UniDirectional = False
    Left = 40
    Top = 112
    object xHorasTotalesHORAS_PROD: TFloatField
      DisplayLabel = 'Horas Prod.'
      FieldName = 'HORAS_PROD'
    end
    object xHorasTotalesHORAS_NO_PROD: TFloatField
      DisplayLabel = 'Horas no Prod.'
      FieldName = 'HORAS_NO_PROD'
    end
    object xHorasTotalesHORAS_LAB: TFloatField
      DisplayLabel = 'Horas Lab.'
      FieldName = 'HORAS_LAB'
    end
  end
  object DSxHorasTotales: TDataSource
    DataSet = xHorasTotales
    Left = 152
    Top = 112
  end
end
