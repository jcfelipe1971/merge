object DMLstItbis: TDMLstItbis
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 481
  Top = 202
  Height = 155
  Width = 305
  object DSxmovItbis: TDataSource
    DataSet = xMovItbis
    Left = 156
    Top = 28
  end
  object xMovItbis: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select det.empresa, det.ejercicio, det.canal,det.registro, car.c' +
        'od_cli_pro, det.vencimiento,'
      
        ' det.liquido, car.doc_numero, car.doc_serie, car.doc_fecha, det.' +
        'estado_recibo, det.recibido,det.documento,'
      
        ' det.cambio, det.id_cartera, det.id_cartera_detalle, car.id_doc,' +
        ' det.retencion, det.tipo_retencion,'
      
        ' fac.num_factura, acr.num_factura , dret.importe_retencion, dret' +
        '.importe_isr, dret.doc_fecha, dret.cuenta_itbis, dret.cuenta_isr' +
        ', dret.resto,'
      
        ' prov.tipo_ncf, prov.tercero, terc.nombre_comercial, terc.nif, t' +
        'erc.telefono01'
      ' from emp_cartera_detalle det'
      ' join emp_cartera car'
      ' on'
      ' det.id_cartera = car.id_cartera'
      ' left join con_cuentas_ges_fp fp'
      ' on'
      
        ' det.empresa=fp.empresa and det.ejercicio=fp.ejercicio and det.c' +
        'anal=fp.canal and car.forma_pago=fp.forma_pago'
      ' left join ges_cabeceras_e_fac fac'
      ' on'
      
        ' car.empresa=fac.empresa and car.ejercicio=fac.ejercicio and fac' +
        '.tipo='#39'FAP'#39' and car.canal=fac.canal and car.id_doc=fac.id_e'
      ' left join ges_cabeceras_e_fcr acr'
      ' on'
      
        ' car.empresa=acr.empresa and car.ejercicio=acr.ejercicio and acr' +
        '.tipo='#39'FCR'#39' and car.canal=acr.canal and car.id_doc=acr.id_e'
      ' left join emp_cartera_detalle_ret dret'
      ' on'
      ' det.id_cartera_detalle=dret.id_cartera_detalle'
      ' '
      'left join EMP_PROVEEDORES prov'
      ' on'
      ' car.cod_cli_pro =prov.proveedor'
      ''
      ' left join sys_terceros Terc'
      ' on'
      ' prov.tercero =terc.tercero')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 76
    Top = 32
    object xMovItbisEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMovItbisEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMovItbisCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMovItbisREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xMovItbisCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object xMovItbisVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xMovItbisLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xMovItbisDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xMovItbisDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xMovItbisDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xMovItbisESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xMovItbisRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xMovItbisDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xMovItbisCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xMovItbisID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cart.'
      FieldName = 'ID_CARTERA'
    end
    object xMovItbisID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xMovItbisID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object xMovItbisRETENCION: TIntegerField
      DisplayLabel = 'Retenci'#243'n'
      FieldName = 'RETENCION'
    end
    object xMovItbisTIPO_RETENCION: TIntegerField
      DisplayLabel = 'Tipo Ret.'
      FieldName = 'TIPO_RETENCION'
    end
    object xMovItbisNUM_FACTURA: TFIBStringField
      DisplayLabel = 'N'#250'm. Fac.'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object xMovItbisNUM_FACTURA1: TFIBStringField
      DisplayLabel = 'N'#250'm Fac. 1'
      FieldName = 'NUM_FACTURA1'
      Size = 40
    end
    object xMovItbisIMPORTE_RETENCION: TFloatField
      DisplayLabel = 'Importe Ret.'
      FieldName = 'IMPORTE_RETENCION'
    end
    object xMovItbisIMPORTE_ISR: TFloatField
      DisplayLabel = 'Importe ISR'
      FieldName = 'IMPORTE_ISR'
    end
    object xMovItbisDOC_FECHA1: TDateTimeField
      DisplayLabel = 'Fecha Doc. 1'
      FieldName = 'DOC_FECHA1'
    end
    object xMovItbisCUENTA_ITBIS: TFIBStringField
      DisplayLabel = 'Cta. Itbis'
      FieldName = 'CUENTA_ITBIS'
      Size = 15
    end
    object xMovItbisCUENTA_ISR: TFIBStringField
      DisplayLabel = 'Cta. ISR'
      FieldName = 'CUENTA_ISR'
      Size = 15
    end
    object xMovItbisRESTO: TFloatField
      DisplayLabel = 'Resto'
      FieldName = 'RESTO'
    end
    object xMovItbisTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object xMovItbisTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xMovItbisNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xMovItbisNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xMovItbisTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO01'
    end
  end
end
