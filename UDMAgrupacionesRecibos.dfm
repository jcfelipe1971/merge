object DMAgrupacionesRecibos: TDMAgrupacionesRecibos
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
      'rec_version'
      'nowait')
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
      'distinct(doc.ejercicio), doc.canal, doc.signo, doc.registro,'
      'det.liquido, doc.registro_rec, car.fecha_registro,'
      'det.linea, det.vencimiento, det.moneda, det.liquido_canal'
      'from emp_cartera_documento doc'
      'join emp_cartera_detalle det'
      'on'
      'doc.id_cartera_detalle = det.id_cartera_detalle'
      'join emp_cartera car'
      'on'
      'det.id_cartera = car.id_cartera'
      '/*'
      'left join emp_cartera_texto txt'
      'on'
      'car.id_cartera = txt.id_cartera'
      '*/'
      'where'
      'doc.empresa = ?empresa and'
      'doc.ejercicio <= ?ejercicio and'
      'doc.ejercicio_rec = ?ejercicio_origen and'
      'doc.canal = ?canal and'
      'det.signo = ?signo and'
      'doc.registro_rec = ?registro'
      '')
    UniDirectional = False
    Left = 26
    Top = 16
    object xAgrupadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
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
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xAgrupadosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xAgrupadosREGISTRO_REC: TIntegerField
      DisplayLabel = 'Registro Rec.'
      FieldName = 'REGISTRO_REC'
    end
    object xAgrupadosFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xAgrupadosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xAgrupadosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xAgrupadosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAgrupadosliquido_moneda: TFloatField
      DisplayLabel = 'Importe'
      FieldKind = fkCalculated
      FieldName = 'liquido_moneda'
      OnGetText = xAgrupadosliquido_monedaGetText
      Calculated = True
    end
    object xAgrupadosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'L'#237'quido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
  end
  object DSxAgrupados: TDataSource
    DataSet = xAgrupados
    Left = 94
    Top = 16
  end
end
