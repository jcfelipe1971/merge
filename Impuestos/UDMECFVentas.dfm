object DMECFVentas: TDMECFVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 583
  Top = 271
  Height = 396
  Width = 413
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 280
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 344
    Top = 16
  end
  object QMDocumentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM  GES_CABECERAS_S_FAC_DGII'
      'WHERE'
      'ID_S = :ID_S')
    RefreshSQL.Strings = (
      
        'SELECT D.*, S.EMPRESA, S.EJERCICIO, S.CANAL, S.SERIE, S.TIPO, S.' +
        'RIG, S.FECHA, F.TOTAL_A_COBRAR, F.MODO_IVA, S.CLIENTE,'
      '       F.Z_PREFIJO_NCF, F.Z_CONTADOR_NCF, F.Z_TIPO_NCF  '
      'FROM GES_CABECERAS_S_FAC_DGII D'
      'JOIN GES_CABECERAS_S S ON (D.ID_S = S.ID_S)'
      'JOIN GES_CABECERAS_S_FAC F ON (D.ID_S = F.ID_S)'
      'WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      
        'SELECT D.*, S.EMPRESA, S.EJERCICIO, S.CANAL, S.SERIE, S.TIPO, S.' +
        'RIG, S.FECHA, F.TOTAL_A_COBRAR, F.MODO_IVA, S.CLIENTE,'
      
        '       F.Z_PREFIJO_NCF, F.Z_CONTADOR_NCF, F.Z_TIPO_NCF,D.ENVIO_R' +
        'ESPUESTA_JSON, D.CONSULTA_RESPUESTA_JSON'
      'FROM GES_CABECERAS_S_FAC_DGII D'
      'JOIN GES_CABECERAS_S S ON (D.ID_S = S.ID_S)'
      'JOIN GES_CABECERAS_S_FAC F ON (D.ID_S = F.ID_S)'
      'WHERE EMPRESA = :EMPRESA AND'
      '      EJERCICIO = :EJERCICIO AND'
      '      CANAL = :CANAL AND'
      '      SERIE = :SERIE AND'
      '      TIPO = '#39'FAC'#39'   ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    BeforeDelete = QMDocumentosBeforeDelete
    OnCalcFields = QMDocumentosCalcFields
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 19
    object QMDocumentosID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMDocumentosID_ENVIO: TFIBStringField
      DisplayLabel = 'ID Envio'
      FieldName = 'ID_ENVIO'
      Size = 40
    end
    object QMDocumentosSTAMP_DATE: TFIBStringField
      DisplayLabel = 'Stamp Date'
      FieldName = 'STAMP_DATE'
    end
    object QMDocumentosSTATUS: TFIBStringField
      DisplayLabel = 'Status Envio'
      FieldName = 'STATUS'
    end
    object QMDocumentosSECURITY_CODE: TFIBStringField
      DisplayLabel = 'Security Code'
      FieldName = 'SECURITY_CODE'
    end
    object QMDocumentosSEQUENCE_CONSUMED: TIntegerField
      DisplayLabel = 'Seq. Consumida'
      FieldName = 'SEQUENCE_CONSUMED'
    end
    object QMDocumentosENCF: TFIBStringField
      FieldName = 'ENCF'
    end
    object QMDocumentosURL_XML: TFIBStringField
      DisplayLabel = 'Url XML'
      FieldName = 'URL_XML'
      Size = 500
    end
    object QMDocumentosURL_PDF: TFIBStringField
      DisplayLabel = 'Url PDF'
      FieldName = 'URL_PDF'
      Size = 500
    end
    object QMDocumentosXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosPDF: TBlobField
      FieldName = 'PDF'
      Size = 8
    end
    object QMDocumentosDOCUMENT_STAMP_URL: TFIBStringField
      DisplayLabel = 'Doc. Stamp URL'
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object QMDocumentosTRACK_ID: TFIBStringField
      DisplayLabel = 'Track ID'
      FieldName = 'TRACK_ID'
      Size = 40
    end
    object QMDocumentosENVIO_RESPUESTA_JSON: TMemoField
      DisplayLabel = 'Resp. Envio JSON'
      FieldName = 'ENVIO_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosCONSULTA_RESPUESTA_JSON: TMemoField
      DisplayLabel = 'Resp. Consula JSON'
      FieldName = 'CONSULTA_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosGOVERMENT_RESPONSE: TFIBStringField
      DisplayLabel = 'Gov. Respuesta'
      FieldName = 'GOVERMENT_RESPONSE'
      Size = 256
    end
    object QMDocumentosMENSAJE_ERROR_ENVIO_ECF: TFIBStringField
      DisplayLabel = 'Mensaje Error de Envio'
      FieldName = 'MENSAJE_ERROR_ENVIO_ECF'
      Size = 500
    end
    object QMDocumentosSTATUS_CONSULTA: TFIBStringField
      DisplayLabel = 'Status Consulta'
      FieldName = 'STATUS_CONSULTA'
    end
    object QMDocumentosLEGAL_STATUS_CONSULTA: TFIBStringField
      DisplayLabel = 'Legal Status Consulta'
      FieldName = 'LEGAL_STATUS_CONSULTA'
    end
    object QMDocumentosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDocumentosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDocumentosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDocumentosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDocumentosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDocumentosRIG: TIntegerField
      FieldName = 'RIG'
    end
    object QMDocumentosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDocumentosTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'T.  Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMDocumentosMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMDocumentosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDocumentosZ_PREFIJO_NCF: TFIBStringField
      DisplayLabel = 'Prefijo NCF'
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object QMDocumentosZ_CONTADOR_NCF: TFIBStringField
      DisplayLabel = 'Contador NCF'
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object QMDocumentosZ_TIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'Z_TIPO_NCF'
    end
    object QMDocumentosMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField
      DisplayLabel = 'Mensaje error consulta ECF'
      FieldName = 'MENSAJE_ERROR_CONSULTA_ECF'
      Size = 500
    end
    object QMDocumentosRESPUESTA_ENVIO: TIntegerField
      DisplayLabel = 'Respuesta Envio'
      FieldKind = fkCalculated
      FieldName = 'RESPUESTA_ENVIO'
      ReadOnly = True
      Calculated = True
    end
    object QMDocumentosRESPUESTA_CONSULTA: TIntegerField
      DisplayLabel = 'Respuesta Consulta'
      FieldKind = fkCalculated
      FieldName = 'RESPUESTA_CONSULTA'
      ReadOnly = True
      Calculated = True
    end
  end
  object DSQMDocumentos: TDataSource
    DataSet = QMDocumentos
    Left = 128
    Top = 19
  end
end
