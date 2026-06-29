object DMCalendarioZona: TDMCalendarioZona
  OldCreateOrder = False
  OnCreate = DMCalendarioZonaCreate
  Left = 515
  Top = 178
  Height = 400
  Width = 291
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 208
    Top = 16
  end
  object QMZonas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_ZONAS'
      'WHERE'
      '  ZONA=?old_ZONA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_ZONAS'
      '  (TITULO,DEFECTO,ZONA,CALENDARIO)'
      'VALUES'
      '  (?TITULO,?DEFECTO,?ZONA,?CALENDARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_ZONAS'
      'WHERE'
      '  ZONA=?ZONA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_ZONAS'
      ' ORDER BY ZONA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_ZONAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,DEFECTO=?DEFECTO '
      '  ,CALENDARIO=?CALENDARIO '
      'WHERE'
      '  ZONA=?ZONA ')
    AfterDelete = Graba
    AfterOpen = QMZonasAfterOpen
    AfterPost = Graba
    AfterScroll = QMZonasAfterScroll
    ClavesPrimarias.Strings = (
      'ZONA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_ZONAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMZonasZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMZonasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMZonasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMZonasCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
  end
  object DSQMZonas: TDataSource
    DataSet = QMZonas
    Left = 136
    Top = 16
  end
  object DSxCalendario: TDataSource
    DataSet = xCalendario
    Left = 136
    Top = 64
  end
  object xCalendario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT cal.*, hor.descripcion as desc_horario '
      'FROM OPE_CALENDARIO_C cal'
      'join ope_horarios hor '
      '  on (hor.empresa = cal.empresa and hor.horario=cal.horario)'
      'where cal.empresa=?empresa and cal.calendario=?calendario')
    UniDirectional = False
    DataSource = DSQMZonas
    BeforeOpen = xCalendarioBeforeOpen
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
    Left = 136
    Top = 112
  end
end
