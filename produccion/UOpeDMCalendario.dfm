object OpeDMCalendario: TOpeDMCalendario
  OldCreateOrder = False
  OnCreate = OpeDMCalendarioCreate
  Left = 492
  Top = 256
  Height = 315
  Width = 295
  object QMCalendario: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_CALENDARIO_C'
      'WHERE'
      '  CALENDARIO=?old_CALENDARIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_CALENDARIO_C'
      
        '  (EMPRESA,CALENDARIO,DESCRIPCION,SABADO_FEST,DOMINGO_FEST,HORAR' +
        'IO)'
      'VALUES'
      
        '  (?EMPRESA,?CALENDARIO,?DESCRIPCION,?SABADO_FEST,?DOMINGO_FEST,' +
        '?HORARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_CALENDARIO_C'
      'WHERE'
      '  CALENDARIO=?CALENDARIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_CALENDARIO_C'
      'where empresa=?empresa'
      ' ORDER BY CALENDARIO, EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_CALENDARIO_C'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,SABADO_FEST=?SABADO_FEST '
      '  ,DOMINGO_FEST=?DOMINGO_FEST '
      '  ,HORARIO=?HORARIO'
      'WHERE'
      '  CALENDARIO=?CALENDARIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    AfterScroll = QMCalendarioAfterScroll
    BeforePost = QMCalendarioBeforePost
    OnNewRecord = QMCalendarioNewRecord
    ClavesPrimarias.Strings = (
      'CALENDARIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_CALENDARIO_C'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMCalendarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCalendarioCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMCalendarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMCalendarioSABADO_FEST: TIntegerField
      DisplayLabel = 'Sab. Fest.'
      FieldName = 'SABADO_FEST'
    end
    object QMCalendarioDOMINGO_FEST: TIntegerField
      Tag = 1
      DisplayLabel = 'Dom. Fest.'
      FieldName = 'DOMINGO_FEST'
    end
    object QMCalendarioHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
  end
  object DSQMCalendario: TDataSource
    DataSet = QMCalendario
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
    Left = 232
    Top = 16
  end
  object xHorasTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'select * from ope_calendario_horas (?empresa, ?calendario, ?ejer' +
        'cicio, ?dias_ejercicio)')
    UniDirectional = False
    Left = 40
    Top = 64
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
    Top = 64
  end
end
