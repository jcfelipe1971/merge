object DMAgenda: TDMAgenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 529
  Top = 241
  Height = 478
  Width = 485
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 368
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 424
    Top = 8
  end
  object QMAgenda: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_AGENDA'
      'WHERE'
      'ID_AGENDA = :ID_AGENDA')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SYS_AGENDA'
      'WHERE'
      'ID_AGENDA = :ID_AGENDA   ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_AGENDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_AGENDA'
      'SET'
      'USUARIO = :USUARIO,'
      'FECHA = :FECHA,'
      'TITULO = :TITULO,'
      'DESCRIPCION = :DESCRIPCION  '
      'WHERE'
      'ID_AGENDA = :ID_AGENDA')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMAgendaID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
    end
    object QMAgendaID_AGENDA_EVENTO: TIntegerField
      FieldName = 'ID_AGENDA_EVENTO'
    end
    object QMAgendaUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMAgendaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAgendaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgendaDESCRIPCION: TMemoField
      DisplayLabel = 'Decripcion'
      FieldName = 'DESCRIPCION'
      BlobType = ftMemo
      Size = 8
    end
    object QMAgendaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
  end
  object DSQMAgenda: TDataSource
    DataSet = QMAgenda
    Left = 200
    Top = 16
  end
  object DSQMAgendaEventos: TDataSource
    DataSet = QMAgendaEventos
    Left = 192
    Top = 176
  end
  object DSQMAgendaEventoPeriodos: TDataSource
    DataSet = QMAgendaEventoPeriodos
    Left = 200
    Top = 88
  end
  object QMAgendaEventos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_AGENDA_EVENTOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_AGENDA_EVENTOS'
      'SET'
      'USUARIO = :USUARIO,'
      'TITULO = :TITULO,'
      'DESCRIPCION = :DESCRIPCION'
      'WHERE'
      'ID_AGENDA_EVENTO = :ID_AGENDA_EVENTO')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 176
    object QMAgendaEventosID_AGENDA_EVENTO: TIntegerField
      FieldName = 'ID_AGENDA_EVENTO'
    end
    object QMAgendaEventosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMAgendaEventosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgendaEventosDESCRIPCION: TMemoField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      BlobType = ftMemo
      Size = 8
    end
  end
  object QMAgendaEventoPeriodos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      '    DELETE FROM SYS_AGENDA_EVENTO_PERIODOS'
      '    WHERE'
      '    ID_AGENDA_EVENTO_PERIODO = :ID_AGENDA_EVENTO_PERIODO')
    InsertSQL.Strings = (
      'INSERT INTO VER_AGENDA_EVENTOS ('
      
        'USUARIO, TITULO, DESCRIPCION, ID_AGENDA_EVENTO, ID_AGENDA_EVENTO' +
        '_PERIODO, DIA_SEMANA, DIA_MES, MES, FECHA_INICIO,'
      ' FECHA_FIN)'
      'VALUES ('
      
        ':USUARIO, :TITULO, :DESCRIPCION, :ID_AGENDA_EVENTO, :ID_AGENDA_E' +
        'VENTO_PERIODO, :DIA_SEMANA, :DIA_MES, :MES,'
      ' :FECHA_INICIO, :FECHA_FIN)')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_AGENDA_EVENTOS'
      'WHERE'
      'ID_AGENDA_EVENTO_PERIODO = :ID_AGENDA_EVENTO_PERIODO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_AGENDA_EVENTOS'
      'WHERE'
      'USUARIO = :USUARIO   ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGENDA_EVENTOS'
      'SET'
      'USUARIO = :USUARIO,'
      'TITULO = :TITULO,'
      'DESCRIPCION = :DESCRIPCION,'
      'DIA_SEMANA = :DIA_SEMANA,'
      'DIA_MES = :DIA_MES,'
      'MES = :MES,'
      'FECHA_INICIO = :FECHA_INICIO,'
      'FECHA_FIN = :FECHA_FIN'
      'WHERE'
      'ID_AGENDA_EVENTO_PERIODO = :ID_AGENDA_EVENTO_PERIODO ')
    OnNewRecord = QMAgendaEventoPeriodosNewRecord
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 88
    object QMAgendaEventoPeriodosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMAgendaEventoPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAgendaEventoPeriodosDESCRIPCION: TMemoField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      BlobType = ftMemo
      Size = 8
    end
    object QMAgendaEventoPeriodosID_AGENDA_EVENTO: TIntegerField
      FieldName = 'ID_AGENDA_EVENTO'
    end
    object QMAgendaEventoPeriodosID_AGENDA_EVENTO_PERIODO: TIntegerField
      FieldName = 'ID_AGENDA_EVENTO_PERIODO'
    end
    object QMAgendaEventoPeriodosDIA_SEMANA: TFIBStringField
      DisplayLabel = 'Dia Semana'
      FieldName = 'DIA_SEMANA'
      Size = 1
    end
    object QMAgendaEventoPeriodosDIA_MES: TIntegerField
      DisplayLabel = 'Dia Mes'
      FieldName = 'DIA_MES'
    end
    object QMAgendaEventoPeriodosMES: TIntegerField
      DisplayLabel = 'Mes'
      FieldName = 'MES'
    end
    object QMAgendaEventoPeriodosFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object QMAgendaEventoPeriodosFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
  end
end
