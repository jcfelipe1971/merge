object IsoDMLstMedicion: TIsoDMLstMedicion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 404
  Top = 225
  Height = 383
  Width = 444
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 216
    Top = 40
  end
  object QLstSigRev: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT Cab.*,det.* FROM ISO_MEDICION_C Cab'
      'join iso_medicion_d det on (cab.rig=det.rig)'
      
        'where det.fecha_prox>=?fecha_desde and det.fecha_prox<=?fecha_ha' +
        'sta'
      'order by fecha_prox')
    UniDirectional = False
    Left = 24
    Top = 32
    object QLstSigRevRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QLstSigRevDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION'
      Size = 40
    end
    object QLstSigRevCODID: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODID'
    end
    object QLstSigRevFECHA_COMPRA: TDateTimeField
      DisplayLabel = 'Fec. Compra'
      FieldName = 'FECHA_COMPRA'
    end
    object QLstSigRevFABRICANTE: TFIBStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Size = 40
    end
    object QLstSigRevNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 10
    end
    object QLstSigRevDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QLstSigRevUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 40
    end
    object QLstSigRevPRCAL: TFIBStringField
      DisplayLabel = 'Pr. Cal.'
      FieldName = 'PRCAL'
      Size = 25
    end
    object QLstSigRevUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QLstSigRevRANGOM: TFIBStringField
      DisplayLabel = 'Rango'
      FieldName = 'RANGOM'
      Size = 25
    end
    object QLstSigRevDIVESCALA: TFIBStringField
      DisplayLabel = 'Div. Escala'
      FieldName = 'DIVESCALA'
      Size = 25
    end
    object QLstSigRevINCERTIDUMBRE: TFIBStringField
      DisplayLabel = 'Incertidumbre'
      FieldName = 'INCERTIDUMBRE'
      Size = 25
    end
    object QLstSigRevOBSERVACIONES: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QLstSigRevFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object QLstSigRevCERTIFICADO: TIntegerField
      DisplayLabel = 'Num. Certificado'
      FieldName = 'CERTIFICADO'
    end
    object QLstSigRevEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QLstSigRevRIG1: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG1'
    end
    object QLstSigRevFECHA_ULT: TDateTimeField
      DisplayLabel = 'Fec. Ult.'
      FieldName = 'FECHA_ULT'
    end
    object QLstSigRevFECHA_PROX: TDateTimeField
      DisplayLabel = 'Fec. Prox.'
      FieldName = 'FECHA_PROX'
    end
    object QLstSigRevRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 25
    end
    object QLstSigRevLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QLstSigRevLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQLstSigRev: TDataSource
    DataSet = QLstSigRev
    Left = 112
    Top = 32
  end
  object frDBSegRevision: TfrDBDataSet
    DataSource = DSQLstSigRev
    Left = 160
    Top = 112
  end
  object frIsoSegRevision: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de las Siguientes Revisiones'
    RebuildPrinter = False
    OnGetValue = frIsoSegRevisionGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 117
    ReportForm = {19000000}
  end
end
