object OpeDMHorario: TOpeDMHorario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 500
  Top = 437
  Height = 317
  Width = 289
  object QMHorario: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_HORARIOS'
      'WHERE'
      '  HORARIO=?old_HORARIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_HORARIOS'
      '  (EMPRESA,HORARIO,DESCRIPCION)'
      'VALUES'
      '  (?EMPRESA,?HORARIO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_HORARIOS'
      'WHERE'
      '  HORARIO=?HORARIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_HORARIOS'
      'where empresa=?empresa'
      'order by horario')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_HORARIOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  HORARIO=?HORARIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMHorarioAfterOpen
    OnNewRecord = QMHorarioNewRecord
    ClavesPrimarias.Strings = (
      'HORARIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_HORARIOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMHorarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMHorarioHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMHorarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSQMHorario: TDataSource
    DataSet = QMHorario
    Left = 128
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 208
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_HORARIOS_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  HORARIO=?old_HORARIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_HORARIOS_DET'
      
        '  (EMPRESA,HORARIO,HORA_INI,HORA_FIN,HORA_PRODUCTIVA,TITULO,LINE' +
        'A)'
      'VALUES'
      
        '  (?EMPRESA,?HORARIO,?HORA_INI,?HORA_FIN,?HORA_PRODUCTIVA,?TITUL' +
        'O,?LINEA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_HORARIOS_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  HORARIO=?HORARIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_HORARIOS_DET'
      'where empresa=?empresa and horario=?horario'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_HORARIOS_DET'
      'SET'
      '  HORA_INI=?HORA_INI '
      '  ,HORA_FIN=?HORA_FIN '
      '  ,HORA_PRODUCTIVA=?HORA_PRODUCTIVA '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  HORARIO=?HORARIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMHorario
    AfterDelete = QMDetalleAfterDelete
    AfterPost = QMDetalleAfterPost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'HORARIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_HORARIOS_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMDetalleHORA_INI: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INI'
      DisplayFormat = '00:00;1;_'
      EditFormat = '00:00;1;_'
    end
    object QMDetalleHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
      DisplayFormat = '00:00;1;_'
      EditFormat = '00:00;1;_'
    end
    object QMDetalleHORA_PRODUCTIVA: TIntegerField
      DisplayLabel = 'Hora Productiva'
      FieldName = 'HORA_PRODUCTIVA'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 56
  end
  object QLinea: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select Max(Linea) As NLinea'
      'From OPE_HORARIOS_DET'
      'Where ((EMPRESA=?EMPRESA) and (horario=?horario))')
    Transaction = TLocal
    AutoTrans = True
    Left = 208
    Top = 104
  end
  object xTotalHoras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'select horas_prod, horas_no_prod, (horas_prod+horas_no_prod) as ' +
        'horas_lab'
      'from ope_horarios_total_horas (?empresa, ?horario)')
    UniDirectional = False
    DataSource = DSQMHorario
    Left = 40
    Top = 104
    object xTotalHorasHORAS_PROD: TFloatField
      DisplayLabel = 'Horas Prod.'
      FieldName = 'HORAS_PROD'
    end
    object xTotalHorasHORAS_NO_PROD: TFloatField
      DisplayLabel = 'Horas no Prod.'
      FieldName = 'HORAS_NO_PROD'
    end
    object xTotalHorasHORAS_LAB: TFloatField
      DisplayLabel = 'Horas Lab.'
      FieldName = 'HORAS_LAB'
    end
  end
  object DSxTotalHoras: TDataSource
    DataSet = xTotalHoras
    Left = 128
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 208
    Top = 56
  end
end
