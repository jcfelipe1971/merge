object ZDMTraspasoMultiCanalMasivo: TZDMTraspasoMultiCanalMasivo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 414
  Top = 227
  Height = 283
  Width = 496
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 400
    Top = 16
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 152
    Top = 16
  end
  object xRecibosG: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT det.cta_pago,sum(det.liquido) as liquido'
      'FROM emp_cartera cab '
      
        'left join EMP_CARTERA_DETALLE det on (cab.id_cartera=det.id_cart' +
        'era)'
      'WHERE cab.empresa=?empresa and cab.ejercicio=?ejercicio '
      'and cab.canal=?canal and cab.signo='#39'C'#39' '
      '/*and cab.doc_serie>=?serie_or and cab.doc_serie<=?serie_or*/'
      'and cab.doc_serie=?serie_or'
      '/*and cab.id_doc>=?id_rigD and cab.id_doc<=?id_rigH*/'
      
        'and cab.fecha_registro>=?fecha_d and cab.fecha_registro<=?fecha_' +
        'h'
      'and det.liquido>0'
      'group by det.cta_pago'
      ''
      ''
      ''
      ''
      '/*SELECT CTA_PAGO, LIQUIDO FROM VER_EMP_CARTERA_DETALLE'
      'WHERE (ID_CARTERA = ?ID_CARTERA) '
      'ORDER BY VENCIMIENTO*/')
    UniDirectional = False
    Left = 56
    Top = 64
    object xRecibosGCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xRecibosGLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT sum(det.liquido) as suma_liquido'
      'FROM emp_cartera cab '
      
        'left join EMP_CARTERA_DETALLE det on (cab.id_cartera=det.id_cart' +
        'era)'
      'WHERE cab.empresa=?empresa and cab.ejercicio=?ejercicio '
      'and cab.canal=?canal and cab.signo='#39'C'#39' '
      '/*and cab.doc_serie>=?serie_or and cab.doc_serie<=?serie_or*/'
      'and cab.doc_serie=?serie_or'
      '/*and cab.id_doc>=?id_rigD and cab.id_doc<=?id_rigH*/'
      
        'and cab.fecha_registro>=?fecha_d and cab.fecha_registro<=?fecha_' +
        'h'
      'and det.liquido>0'
      'and det.cta_pago='#39'570000000'#39)
    UniDirectional = False
    Left = 56
    Top = 16
    object xRecibosSUMA_LIQUIDO: TFloatField
      DisplayLabel = 'Suma Liq.'
      FieldName = 'SUMA_LIQUIDO'
    end
  end
  object DSxRecibosG: TDataSource
    DataSet = xRecibosG
    Left = 152
    Top = 64
  end
  object xBuscarIDDetallesDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_detalles_s from ges_detalles_s'
      'where id_s=:id_s')
    UniDirectional = False
    Left = 280
    Top = 16
    object xBuscarIDDetallesDestinoID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
  end
  object xBuscarIDDetallesNou: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select max(id_detalles_s) from ges_detalles_s'
      'where id_s=:id_s')
    UniDirectional = False
    Left = 280
    Top = 64
    object xBuscarIDDetallesNouMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object QSelecciona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'CAB.DOC_NUMERO, CAB.ID_DOC, CAB.DOC_TIPO, GES.TRANSPORTISTA,'
      
        'GES.EMPRESA, GES.EJERCICIO, GES.SERIE, GES.CANAL, CAB.ID_CARTERA' +
        ','
      'DET.LIQUIDO, GES.FECHA, GES.TOTAL_A_COBRAR'
      'FROM EMP_CARTERA CAB'
      'LEFT JOIN EMP_CARTERA_DETALLE DET'
      'ON (CAB.ID_CARTERA = DET.ID_CARTERA)'
      'LEFT JOIN VER_CABECERAS_FACTURA GES'
      'ON (CAB.ID_DOC = GES.ID_S)'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA'
      'AND CAB.EJERCICIO = :EJERCICIO'
      'AND CAB.CANAL = :CANAL'
      'AND CAB.SIGNO = '#39'C'#39
      'AND CAB.DOC_SERIE = :SERIE'
      'AND CAB.FECHA_REGISTRO >= :FECHA_D'
      'AND CAB.FECHA_REGISTRO <= :FECHA_H'
      '/* AND CAB.ID_DOC >= :ID_RIGD AND CAB.ID_DOC <= :ID_RIGH */'
      'AND GES.TOTAL_A_COBRAR > 0'
      'AND DET.CTA_PAGO = :CC')
    UniDirectional = False
    Left = 56
    Top = 112
    object QSeleccionaDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QSeleccionaID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object QSeleccionaDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QSeleccionaTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QSeleccionaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QSeleccionaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QSeleccionaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QSeleccionaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QSeleccionaID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QSeleccionaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QSeleccionaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QSeleccionaTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
  end
  object DSSelecciona: TDataSource
    DataSet = QSelecciona
    Left = 152
    Top = 112
  end
  object xRecibosGAct: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DET.CTA_PAGO, DET.LIQUIDO'
      'FROM EMP_CARTERA CAB '
      'LEFT JOIN EMP_CARTERA_DETALLE DET'
      'ON (CAB.ID_CARTERA = DET.ID_CARTERA)'
      'WHERE'
      'CAB.EMPRESA = ?EMPRESA'
      'AND CAB.EJERCICIO = ?EJERCICIO'
      'AND CAB.CANAL = ?CANAL'
      'AND CAB.SIGNO = '#39'C'#39
      'AND CAB.DOC_SERIE = ?SERIE_OR'
      'AND CAB.ID_DOC = ?ID_RIG'
      'AND CAB.FECHA_REGISTRO >= ?FECHA_D'
      'AND CAB.FECHA_REGISTRO <= ?FECHA_H'
      'AND DET.LIQUIDO > 0')
    UniDirectional = False
    Left = 56
    Top = 160
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object DSxRecibosGAct: TDataSource
    DataSet = xRecibosGAct
    Left = 152
    Top = 160
  end
end
