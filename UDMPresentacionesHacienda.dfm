object DMPresentacionesHacienda: TDMPresentacionesHacienda
  OldCreateOrder = False
  OnCreate = DMPresentacionesHaciendaCreate
  Left = 494
  Top = 342
  Height = 224
  Width = 459
  object DSQMPresentacionesHacienda: TDataSource
    DataSet = QMPresentacionesHacienda
    Left = 192
    Top = 16
  end
  object QMPresentacionesHacienda: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_PRESENTACIONES_HACIENDA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  EJERCICIO=?old_EJERCICIO AND'
      '  MODELO=?old_MODELO AND'
      '  PERIODO=?old_PERIODO')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_PRESENTACIONES_HACIENDA'
      '  (EMPRESA, EJERCICIO, MODELO, PERIODO, NOTAS)'
      'VALUES'
      '  (?EMPRESA, ?EJERCICIO, ?MODELO, ?PERIODO, ?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_PRESENTACIONES_HACIENDA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  MODELO=?MODELO AND'
      '  PERIODO=?PERIODO')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_PRESENTACIONES_HACIENDA'
      'WHERE'
      '  EMPRESA=?EMPRESA'
      'ORDER BY EJERCICIO, MODELO, PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_PRESENTACIONES_HACIENDA'
      'SET'
      '  NOTAS=?NOTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  EJERCICIO=?old_EJERCICIO AND'
      '  MODELO=?old_MODELO AND'
      '  PERIODO=?old_PERIODO')
    AfterOpen = QMPresentacionesHaciendaAfterOpen
    BeforeClose = QMPresentacionesHaciendaBeforeClose
    OnNewRecord = QMPresentacionesHaciendaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'MODELO '
      'PERIODO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_PRESENTACIONES_HACIENDA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMPresentacionesHaciendaID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
    end
    object QMPresentacionesHaciendaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPresentacionesHaciendaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPresentacionesHaciendaMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      OnChange = QMPresentacionesHaciendaMODELOChange
      Size = 15
    end
    object QMPresentacionesHaciendaPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMPresentacionesHaciendaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
    end
    object QMPresentacionesHaciendaPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMPresentacionesHaciendaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 256
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
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
    Left = 328
    Top = 64
  end
  object QMAdjuntos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ADJUNTOS'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  ID=?old_ID AND '
      '  ID_ADJUNTO=?old_ID_ADJUNTO ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ADJUNTOS'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  ID=?ID AND '
      '  ID_ADJUNTO=?ID_ADJUNTO ')
    SelectSQL.Strings = (
      'SELECT EMPRESA, TIPO, ID, TITULO, ID_ADJUNTO, TITULO_ADJUNTO, '
      '       NOMBRE, FECHA, REPOSITORIO, WEB'
      'FROM VER_ADJUNTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  TIPO='#39'PHA'#39' AND '
      '  ID=?ID_MODELO'
      'ORDER BY ID_ADJUNTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ADJUNTOS'
      'SET'
      '  TITULO_ADJUNTO=?TITULO_ADJUNTO '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  ID=?ID AND '
      '  ID_ADJUNTO=?ID_ADJUNTO ')
    DataSource = DSQMPresentacionesHacienda
    ClavesPrimarias.Strings = (
      'TIPO '
      'ID '
      'ID_ADJUNTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ADJUNTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 64
    object QMAdjuntosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAdjuntosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAdjuntosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMAdjuntosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 100
    end
    object QMAdjuntosID_ADJUNTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_ADJUNTO'
    end
    object QMAdjuntosTITULO_ADJUNTO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ADJUNTO'
      Size = 100
    end
    object QMAdjuntosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 256
    end
    object QMAdjuntosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAdjuntosREPOSITORIO: TIntegerField
      DisplayLabel = 'Repositorio'
      FieldName = 'REPOSITORIO'
    end
    object QMAdjuntosDESCRIPCION_REPOSITORIO: TStringField
      DisplayLabel = 'Repositorio'
      FieldKind = fkCalculated
      FieldName = 'DESCRIPCION_REPOSITORIO'
      Size = 30
      Calculated = True
    end
    object QMAdjuntosWEB: TIntegerField
      DisplayLabel = 'Mostrar en Web'
      FieldName = 'WEB'
    end
  end
  object DSQMAdjuntos: TDataSource
    DataSet = QMAdjuntos
    Left = 192
    Top = 64
  end
end
