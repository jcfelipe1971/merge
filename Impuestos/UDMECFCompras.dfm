object DMECFCompras: TDMECFCompras
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 584
  Top = 270
  Height = 394
  Width = 407
  object QMDocumentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM  GES_CABECERAS_E_FAC_DGII'
      'WHERE'
      'ID_E = :ID_E')
    RefreshSQL.Strings = (
      
        'SELECT D.*, S.EMPRESA, S.EJERCICIO, S.CANAL, S.SERIE, S.TIPO, S.' +
        'RIG, S.FECHA, F.TOTAL_FACTURA, F.MODO_IVA, F.PROVEEDOR,'
      '       F.Z_PREFIJO_NCF, F.Z_CONTADOR_NCF, F.Z_TIPO_NCF  '
      'FROM GES_CABECERAS_E_FAC_DGII D'
      'JOIN GES_CABECERAS_E S ON (D.ID_E = S.ID_E)'
      'JOIN GES_CABECERAS_E_FAC F ON (D.ID_E = F.ID_E)'
      'WHERE S.EMPRESA = :EMPRESA AND'
      '      S.EJERCICIO = :EJERCICIO AND'
      '      S.CANAL = :CANAL AND'
      '      S.SERIE = :SERIE AND'
      '      S.TIPO = '#39'FAP'#39)
    SelectSQL.Strings = (
      
        'SELECT D.*, S.EMPRESA, S.EJERCICIO, S.CANAL, S.SERIE, S.TIPO, S.' +
        'RIG, S.FECHA, F.TOTAL_FACTURA, F.MODO_IVA, F.PROVEEDOR,'
      '       F.Z_PREFIJO_NCF, F.Z_CONTADOR_NCF, F.Z_TIPO_NCF  '
      'FROM GES_CABECERAS_E_FAC_DGII D'
      'JOIN GES_CABECERAS_E S ON (D.ID_E = S.ID_E)'
      'JOIN GES_CABECERAS_E_FAC F ON (D.ID_E = F.ID_E)'
      'WHERE S.EMPRESA = :EMPRESA AND'
      '      S.EJERCICIO = :EJERCICIO AND'
      '      S.CANAL = :CANAL AND'
      '      S.SERIE = :SERIE AND'
      '      S.TIPO = '#39'FAP'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    OnCalcFields = QMDocumentosCalcFields
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMDocumentosID_E: TIntegerField
      FieldName = 'ID_E'
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
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object QMDocumentosSECURITY_CODE: TFIBStringField
      DisplayLabel = 'Security Code'
      FieldName = 'SECURITY_CODE'
    end
    object QMDocumentosSEQUENCE_CONSUMED: TIntegerField
      DisplayLabel = 'Sequ Consumed'
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
      DisplayLabel = 'Doc Stamp URL'
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object QMDocumentosTRACK_ID: TFIBStringField
      DisplayLabel = 'Track ID'
      FieldName = 'TRACK_ID'
      Size = 40
    end
    object QMDocumentosENVIO_RESPUESTA_JSON: TMemoField
      DisplayLabel = 'Env Resp Json'
      FieldName = 'ENVIO_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosCONSULTA_RESPUESTA_JSON: TMemoField
      DisplayLabel = 'Consulta Rresp Json'
      FieldName = 'CONSULTA_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosGOVERMENT_RESPONSE: TFIBStringField
      DisplayLabel = 'Goverment Response'
      FieldName = 'GOVERMENT_RESPONSE'
      Size = 256
    end
    object QMDocumentosMENSAJE_ERROR_ENVIO_ECF: TFIBStringField
      DisplayLabel = 'Mensaje Error Env ECF'
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
    object QMDocumentosMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField
      DisplayLabel = 'Mensaje Error Consulta ECF'
      FieldName = 'MENSAJE_ERROR_CONSULTA_ECF'
      Size = 500
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
    object QMDocumentosTOTAL_FACTURA: TFloatField
      DisplayLabel = 'Total Factura'
      FieldName = 'TOTAL_FACTURA'
    end
    object QMDocumentosMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMDocumentosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
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
    object QMDocumentosCODIGO_ERROR_ENVIO: TFIBStringField
      FieldName = 'CODIGO_ERROR_ENVIO'
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
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 256
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
    Left = 328
    Top = 8
  end
  object DSQMDocumentos: TDataSource
    DataSet = QMDocumentos
    Left = 112
    Top = 8
  end
end
