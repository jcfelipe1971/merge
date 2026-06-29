object DMAdjunto: TDMAdjunto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 554
  Top = 181
  Height = 345
  Width = 411
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 344
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 344
    Top = 56
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
    InsertSQL.Strings = (
      'INSERT INTO VER_ADJUNTOS'
      
        '  (EMPRESA,TIPO,ID,/*TITULO,*/ID_ADJUNTO,TITULO_ADJUNTO,ARCHIVO,' +
        'NOMBRE,REPOSITORIO,WEB)'
      'VALUES'
      
        '  (?EMPRESA,?TIPO,?ID,/*?TITULO,*/?ID_ADJUNTO,?TITULO_ADJUNTO,?A' +
        'RCHIVO,?NOMBRE,?REPOSITORIO,?WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ADJUNTOS'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  ID=?ID AND '
      '  ID_ADJUNTO=?ID_ADJUNTO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ADJUNTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  TIPO=?TIPO AND '
      '  ID=?ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ADJUNTOS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      '  ,TITULO_ADJUNTO=?TITULO_ADJUNTO '
      '  ,ARCHIVO=?ARCHIVO '
      '  ,NOMBRE=?NOMBRE '
      '  ,REPOSITORIO = ?REPOSITORIO'
      '  ,WEB=?WEB'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  ID=?ID AND '
      '  ID_ADJUNTO=?ID_ADJUNTO ')
    BeforeEdit = QMAdjuntosBeforeEdit
    BeforeInsert = QMAdjuntosBeforeInsert
    BeforePost = QMAdjuntosBeforePost
    OnNewRecord = QMAdjuntosNewRecord
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
    Left = 32
    Top = 16
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
    object QMAdjuntosARCHIVO: TBlobField
      DisplayLabel = 'Archivo'
      FieldName = 'ARCHIVO'
      Size = 8
    end
    object QMAdjuntosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      OnGetText = QMAdjuntosNOMBREGetText
      Size = 256
    end
    object QMAdjuntosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAdjuntosREPOSITORIO: TIntegerField
      DisplayLabel = 'Repositorio'
      FieldName = 'REPOSITORIO'
      OnChange = QMAdjuntosREPOSITORIOChange
    end
    object QMAdjuntosDESCRIPCION_REPOSITORIO: TStringField
      DisplayLabel = 'Repositorio'
      FieldKind = fkCalculated
      FieldName = 'DESCRIPCION_REPOSITORIO'
      OnGetText = QMAdjuntosDESCRIPCION_REPOSITORIOGetText
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
    Left = 112
    Top = 16
  end
end
