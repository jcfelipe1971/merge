object DMSIIFolios: TDMSIIFolios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 369
  Top = 281
  Height = 178
  Width = 336
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 32
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 280
    Top = 32
  end
  object QMFolios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_FOLIOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SII_FOLIOS ('
      
        'ID, EMPRESA, CANAL, SERIE, TIPO, TIPO_DOC_TRIBUTARIO, FECHA_AUTO' +
        'RIZACION, COMENTARIO, NUMERO_INICIO, NUMERO_FINAL,'
      ' CONTADOR, AVISO_FOLIOS_PENDIENTES, ACTIVO)'
      'VALUES ('
      
        ' ?ID,  ?EMPRESA,  ?CANAL,  ?SERIE,  ?TIPO,  ?TIPO_DOC_TRIBUTARIO' +
        ', '#39'NOW'#39', '#39#39',  ?NUMERO_INICIO,  ?NUMERO_FINAL,'
      '  ?CONTADOR,  ?AVISO_FOLIOS_PENDIENTES,  ?ACTIVO) ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_FOLIOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_FOLIOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL=:CANAL '
      'ORDER BY SERIE, TIPO, NUMERO_INICIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_FOLIOS'
      'SET'
      '  SERIE=?SERIE '
      '  ,FECHA_AUTORIZACION=?FECHA_AUTORIZACION '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,NUMERO_INICIO=?NUMERO_INICIO '
      '  ,NUMERO_FINAL=?NUMERO_FINAL '
      '  ,CONTADOR=?CONTADOR '
      '  ,AVISO_FOLIOS_PENDIENTES=?AVISO_FOLIOS_PENDIENTES '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,ACTIVO=?ACTIVO '
      '  ,TIPO=?TIPO '
      '  ,TIPO_DOC_TRIBUTARIO=?TIPO_DOC_TRIBUTARIO '
      '  ,XML_AUTORIZACION_FOLIOS=?XML_AUTORIZACION_FOLIOS'
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMFoliosBeforePost
    OnNewRecord = QMFoliosNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_FOLIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 32
    object QMFoliosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMFoliosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFoliosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFoliosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFoliosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMFoliosFECHA_AUTORIZACION: TDateTimeField
      DisplayLabel = 'Fecha Autorizacion'
      FieldName = 'FECHA_AUTORIZACION'
    end
    object QMFoliosNUMERO_INICIO: TIntegerField
      DisplayLabel = 'Num. Inicio'
      FieldName = 'NUMERO_INICIO'
    end
    object QMFoliosNUMERO_FINAL: TIntegerField
      DisplayLabel = 'Num. Final'
      FieldName = 'NUMERO_FINAL'
    end
    object QMFoliosCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMFoliosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMFoliosAVISO_FOLIOS_PENDIENTES: TIntegerField
      DisplayLabel = 'Aviso folios pendientes'
      FieldName = 'AVISO_FOLIOS_PENDIENTES'
    end
    object QMFoliosCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMFoliosTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      OnChange = QMFoliosTIPO_DOC_TRIBUTARIOChange
      Size = 3
    end
    object QMFoliosXML_AUTORIZACION_FOLIOS: TMemoField
      FieldName = 'XML_AUTORIZACION_FOLIOS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQMFolios: TDataSource
    DataSet = QMFolios
    Left = 120
    Top = 32
  end
end
