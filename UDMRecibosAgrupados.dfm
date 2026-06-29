object DMRecibosAgrupados: TDMRecibosAgrupados
  OldCreateOrder = False
  OnCreate = DMRecibosAgrupadosCreate
  Left = 589
  Top = 334
  Height = 120
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 152
    Top = 16
  end
  object xAgrupados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select'
      'doc.empresa, doc.ejercicio, doc.canal, doc.signo, doc.registro,'
      'car.signo as signo_rec, doc.registro_rec, doc.linea_rec,'
      'det.vencimiento, det.liquido as liquido_det,'
      'car.doc_numero, car.doc_serie, car.doc_fecha, car.doc_tipo,'
      'car.liquido, doc.ejercicio_rec, car.moneda'
      'from emp_cartera_documento doc'
      'join emp_cartera_detalle det'
      'on(doc.id_cartera_detalle = det.id_cartera_detalle)'
      'join emp_cartera car'
      'on(car.id_cartera = det.id_cartera)'
      'where'
      'doc.empresa = ?empresa and'
      'doc.ejercicio_rec <= ?ejercicio_rec and'
      'doc.ejercicio = ?ejercicio and'
      'doc.canal = ?canal and'
      'doc.signo = ?signo and'
      'doc.registro = ?registro')
    UniDirectional = False
    Left = 26
    Top = 16
    object xAgrupadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgrupadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Agr.'
      FieldName = 'EJERCICIO'
    end
    object xAgrupadosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAgrupadosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xAgrupadosREGISTRO: TIntegerField
      DisplayLabel = 'Reg. Agr.'
      FieldName = 'REGISTRO'
    end
    object xAgrupadosREGISTRO_REC: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO_REC'
    end
    object xAgrupadosLINEA_REC: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA_REC'
    end
    object xAgrupadosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xAgrupadosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xAgrupadosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xAgrupadosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xAgrupadosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xAgrupadosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xAgrupadosEJERCICIO_REC: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_REC'
    end
    object xAgrupadosliquido_moneda: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'liquido_moneda'
      OnGetText = xAgrupadosliquido_monedaGetText
      Calculated = True
    end
    object xAgrupadosMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAgrupadosSIGNO_REC: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_REC'
      Size = 1
    end
    object xAgrupadosLIQUIDO_DET: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO_DET'
    end
  end
  object DSxAgrupados: TDataSource
    DataSet = xAgrupados
    Left = 94
    Top = 16
  end
end
