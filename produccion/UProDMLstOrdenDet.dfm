object ProDMLstOrdenDet: TProDMLstOrdenDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 333
  Top = 329
  Height = 498
  Width = 635
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 192
    Top = 16
  end
  object xMinCompuestoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(compuesto) as min_d FROM PRO_ORD '
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL AND SERIES=?SERIE'
      ' ')
    UniDirectional = False
    Left = 52
    Top = 60
    object xMinCompuestoDMIN_D: TFIBStringField
      DisplayLabel = 'Min. D.'
      FieldName = 'MIN_D'
      Size = 15
    end
  end
  object DSxMaxCompuestoD: TDataSource
    DataSet = xMinCompuestoD
    Left = 160
    Top = 60
  end
  object xMaxCompuestoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT max(compuesto) as max_h FROM PRO_ORD'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL AND SERIES=?SERIE ')
    UniDirectional = False
    Left = 52
    Top = 115
    object xMaxCompuestoHMAX_H: TFIBStringField
      DisplayLabel = 'Max. H.'
      FieldName = 'MAX_H'
      Size = 15
    end
  end
  object DSxMaxCompuestoH: TDataSource
    DataSet = xMaxCompuestoH
    Left = 168
    Top = 115
  end
  object frListadoOrdenDet: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Escandallos'
    RebuildPrinter = False
    OnGetValue = frListadoOrdenDetGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 388
    Top = 16
    ReportForm = {19000000}
  end
  object QMLstOrdenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord'
      
        'where empresa=?empresa and compuesto>=?compuesto_ini and compues' +
        'to<=?compuesto_fin'
      
        'and cliente>=?cliente_ini and cliente<=?cliente_fin and fecha_or' +
        'd>=?fecha_ini and fecha_ord<=?fecha_fin'
      'order by empresa,compuesto')
    UniDirectional = False
    Left = 344
    Top = 144
    object QMLstOrdenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLstOrdenesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMLstOrdenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMLstOrdenesSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMLstOrdenesRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMLstOrdenesSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMLstOrdenesALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMLstOrdenesALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMLstOrdenesALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMLstOrdenesFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORD'
    end
    object QMLstOrdenesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMLstOrdenesCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMLstOrdenesESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMLstOrdenesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMLstOrdenesPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMLstOrdenesLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMLstOrdenesFECHA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PED'
    end
    object QMLstOrdenesUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QMLstOrdenesUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Man.'
      FieldName = 'UNI_MANUAL'
    end
    object QMLstOrdenesUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QMLstOrdenesPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMLstOrdenesMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMLstOrdenesUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object QMLstOrdenesUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QMLstOrdenesFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMLstOrdenesFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMLstOrdenesFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMLstOrdenesCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QMLstOrdenesCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object QMLstOrdenesCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object QMLstOrdenesCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre.'
      FieldName = 'COSTE_MO_PRE'
    end
    object QMLstOrdenesCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QMLstOrdenesCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre.'
      FieldName = 'COSTE_TEX_PRE'
    end
    object QMLstOrdenesCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object QMLstOrdenesCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMLstOrdenesCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object QMLstOrdenesCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object QMLstOrdenesCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object QMLstOrdenesCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QMLstOrdenesCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object QMLstOrdenesCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object QMLstOrdenesCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldName = 'COSTE_UNITARIO'
    end
    object QMLstOrdenesPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMLstOrdenesHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object QMLstOrdenesMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Uni.'
      FieldName = 'MARGEN_UNI'
    end
    object QMLstOrdenesMARGEN_TOTAL: TFloatField
      DisplayLabel = 'Margen Total'
      FieldName = 'MARGEN_TOTAL'
    end
    object QMLstOrdenesOBSERVACIONES: TMemoField
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMLstOrdenesVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Bueno 1'
      FieldName = 'VISTOBUENO1'
    end
    object QMLstOrdenesVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Bueno 2'
      FieldName = 'VISTOBUENO2'
    end
    object QMLstOrdenesVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Bueno 3'
      FieldName = 'VISTOBUENO3'
    end
    object QMLstOrdenesSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMLstOrdenesMARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Margen Uni/100'
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object QMLstOrdenesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMLstOrdenesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMLstOrdenesTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanz.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMLstOrdenesID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMLstOrdenesTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object QMLstOrdenesID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMLstOrdenesISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QMLstOrdenesISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMLstOrdenesISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMLstOrdenesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMLstOrdenesPADRE_SUBORDEN: TIntegerField
      DisplayLabel = 'Padre Suborden'
      FieldName = 'PADRE_SUBORDEN'
    end
    object QMLstOrdenesCONT_SUBORDEN: TIntegerField
      DisplayLabel = 'Cont. Suborden'
      FieldName = 'CONT_SUBORDEN'
    end
    object QMLstOrdenesREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMLstOrdenesCOSTE_COMPRAS: TFloatField
      DisplayLabel = 'Coste Compras'
      FieldName = 'COSTE_COMPRAS'
    end
    object QMLstOrdenesHORAS_OPERARIO: TFloatField
      DisplayLabel = 'Horas Operario'
      FieldName = 'HORAS_OPERARIO'
    end
    object QMLstOrdenesHORAS_MAQUINA: TFloatField
      DisplayLabel = 'Horas Maq.'
      FieldName = 'HORAS_MAQUINA'
    end
    object QMLstOrdenesID_DESPIECE: TIntegerField
      DisplayLabel = 'ID Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMLstOrdenesID_ORDEN_SUBORDEN: TIntegerField
      DisplayLabel = 'ID Orden SubOrd.'
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object QMLstOrdenesSELECCIONADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'SELECCIONADA'
    end
    object QMLstOrdenesPREVALECE_ALM_ORDEN: TIntegerField
      DisplayLabel = 'Prevalece Alm. Ord.'
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object QMLstOrdenesCERRAR_SUBORDENES: TIntegerField
      DisplayLabel = 'Cerrar Subord.'
      FieldName = 'CERRAR_SUBORDENES'
    end
    object QMLstOrdenesIMPORTAR_OP: TIntegerField
      DisplayLabel = 'Importar OP'
      FieldName = 'IMPORTAR_OP'
    end
    object QMLstOrdenesCASO_OP: TIntegerField
      DisplayLabel = 'Caso OP'
      FieldName = 'CASO_OP'
    end
    object QMLstOrdenesRESERVA_STOCK_OP: TIntegerField
      DisplayLabel = 'Reserva Stock OP'
      FieldName = 'RESERVA_STOCK_OP'
    end
    object QMLstOrdenesMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMLstOrdenesMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMLstOrdenesMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMLstOrdenesMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMLstOrdenesDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMLstOrdenesRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMLstOrdenesDIF_COSTE_FIJO: TFloatField
      DisplayLabel = 'Dif. Coste Fijo'
      FieldName = 'DIF_COSTE_FIJO'
    end
    object QMLstOrdenesDIF_COSTE_MAT: TFloatField
      DisplayLabel = 'Dif. Coste Mat.'
      FieldName = 'DIF_COSTE_MAT'
    end
    object QMLstOrdenesDIF_COSTE_MO: TFloatField
      DisplayLabel = 'Dif. Coste MO'
      FieldName = 'DIF_COSTE_MO'
    end
    object QMLstOrdenesDIF_COSTE_MAQ: TFloatField
      DisplayLabel = 'Dif. Coste Maq.'
      FieldName = 'DIF_COSTE_MAQ'
    end
    object QMLstOrdenesDIF_COSTE_TEXT: TFloatField
      DisplayLabel = 'Dif. Coste Text'
      FieldName = 'DIF_COSTE_TEXT'
    end
    object QMLstOrdenesDIF_COSTE_VAR: TFloatField
      DisplayLabel = 'Dif. Coste Var.'
      FieldName = 'DIF_COSTE_VAR'
    end
    object QMLstOrdenesCOSTE_COMPRAS_PRE: TFloatField
      DisplayLabel = 'Coste Compras Pre.'
      FieldName = 'COSTE_COMPRAS_PRE'
    end
    object QMLstOrdenesDIF_COSTE_COMPRAS: TFloatField
      DisplayLabel = 'Dif. Coste Compras'
      FieldName = 'DIF_COSTE_COMPRAS'
    end
    object QMLstOrdenesDIF_COSTE_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Total'
      FieldName = 'DIF_COSTE_TOTAL'
    end
    object QMLstOrdenesCOMPUESTOS_VIRTUALES: TIntegerField
      DisplayLabel = 'Comp. Virt.'
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object QMLstOrdenesSEGUIR_SIN_STOCK: TIntegerField
      DisplayLabel = 'Seguir sin stock'
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object QMLstOrdenesMARGEN_TOTAL_PRE: TFloatField
      DisplayLabel = 'Margen Total Pre.'
      FieldName = 'MARGEN_TOTAL_PRE'
    end
    object QMLstOrdenesMARGEN_UNI_CIEN_PRE: TFloatField
      DisplayLabel = 'Margen Uni/100 Pre'
      FieldName = 'MARGEN_UNI_CIEN_PRE'
    end
    object QMLstOrdenesCOSTE_UNITARIO_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Pre.'
      FieldName = 'COSTE_UNITARIO_PRE'
    end
    object QMLstOrdenesMARGEN_UNI_PRE: TFloatField
      DisplayLabel = 'Margen Unit. Pre.'
      FieldName = 'MARGEN_UNI_PRE'
    end
    object QMLstOrdenesPRECIO_VENTA_PRE: TFloatField
      DisplayLabel = 'Precio Venta Pre.'
      FieldName = 'PRECIO_VENTA_PRE'
    end
    object QMLstOrdenesPRECIO_VENTA_TOT_PRE: TFloatField
      DisplayLabel = 'Precio Venta Tot. Pre.'
      FieldName = 'PRECIO_VENTA_TOT_PRE'
    end
    object QMLstOrdenesPRECIO_VENTA_TOT_REAL: TFloatField
      DisplayLabel = 'Precio Venta Tot. Real'
      FieldName = 'PRECIO_VENTA_TOT_REAL'
    end
    object QMLstOrdenesDIF_COSTE_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Marg. Tot.'
      FieldName = 'DIF_COSTE_MARGEN_TOTAL'
    end
    object QMLstOrdenesDIF_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif. Margen Total'
      FieldName = 'DIF_MARGEN_TOTAL'
    end
    object QMLstOrdenesDIF_MARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Dif. Margen Uni/100'
      FieldName = 'DIF_MARGEN_UNI_CIEN'
    end
    object QMLstOrdenesDIF_PRECIO_VENTA_UNI: TFloatField
      DisplayLabel = 'Dif. Precio Venta Unit.'
      FieldName = 'DIF_PRECIO_VENTA_UNI'
    end
    object QMLstOrdenesDIF_COSTE_UNI: TFloatField
      DisplayLabel = 'Dif. Coste Unit.'
      FieldName = 'DIF_COSTE_UNI'
    end
    object QMLstOrdenesDIF_MARGEN_UNI: TFloatField
      DisplayLabel = 'Dif. Margen Unit.'
      FieldName = 'DIF_MARGEN_UNI'
    end
    object QMLstOrdenesDIF_PRECIO_VENTA_TOT: TFloatField
      DisplayLabel = 'Dif. Precio Venta Tot.'
      FieldName = 'DIF_PRECIO_VENTA_TOT'
    end
    object QMLstOrdenesHORAS_OPERARIO_PRE: TFloatField
      DisplayLabel = 'Horas Operario Pre.'
      FieldName = 'HORAS_OPERARIO_PRE'
    end
    object QMLstOrdenesHORAS_MAQUINA_PRE: TFloatField
      DisplayLabel = 'Horas Maquina Pre'
      FieldName = 'HORAS_MAQUINA_PRE'
    end
    object QMLstOrdenesDIF_HORAS_MAQUINA: TFloatField
      DisplayLabel = 'Dif. Horas M'
      FieldName = 'DIF_HORAS_MAQUINA'
    end
    object QMLstOrdenesDIF_HORAS_OPERARIO: TFloatField
      DisplayLabel = 'Dif. Horas Oper.'
      FieldName = 'DIF_HORAS_OPERARIO'
    end
    object QMLstOrdenesRECUPERADO_MARCAJE: TIntegerField
      DisplayLabel = 'Recup. Marcaje'
      FieldName = 'RECUPERADO_MARCAJE'
    end
  end
  object DSLstOrdenes: TDataSource
    DataSet = QMLstOrdenes
    Left = 444
    Top = 144
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from sys_empresas'
      'where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 292
    Top = 17
  end
  object xTituloCompuestoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_articulos '
      'where empresa=?empresa and articulo=?compuesto')
    UniDirectional = False
    Left = 280
    Top = 212
    object xTituloCompuestoDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTituloCompuestoD: TDataSource
    DataSet = xTituloCompuestoD
    Left = 388
    Top = 212
  end
  object xTituloClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_clientes'
      'where empresa=?empresa and ejercicio=?ejercicio and'
      'canal=?canal and cliente=?cliente')
    UniDirectional = False
    Left = 280
    Top = 304
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTituloClienteD: TDataSource
    DataSet = xTituloClienteD
    Left = 388
    Top = 304
  end
  object xMinClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(cliente) as min_d FROM PRO_ORD WHERE '
      'EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND SERIES=?SERIE')
    UniDirectional = False
    Left = 52
    Top = 172
    object xMinClienteDMIN_D: TIntegerField
      DisplayLabel = 'Min. D.'
      FieldName = 'MIN_D'
    end
  end
  object DSxMinClienteD: TDataSource
    DataSet = xMinClienteD
    Left = 160
    Top = 172
  end
  object xMaxClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT max(cliente) as max_h FROM PRO_ORD'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND SERIES=?SERIE')
    UniDirectional = False
    Left = 52
    Top = 227
    object xMaxClienteHMAX_H: TIntegerField
      DisplayLabel = 'Max. H.'
      FieldName = 'MAX_H'
    end
  end
  object DSxMaxClienteH: TDataSource
    DataSet = xMaxClienteH
    Left = 168
    Top = 227
  end
  object xTituloCompuestoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_articulos '
      'where empresa=?empresa and articulo=?compuesto')
    UniDirectional = False
    Left = 280
    Top = 256
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTituloCompuestoH: TDataSource
    DataSet = xTituloCompuestoH
    Left = 388
    Top = 256
  end
  object xTituloClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_clientes'
      'where empresa=?empresa and ejercicio=?ejercicio and'
      'canal=?canal and cliente=?cliente')
    UniDirectional = False
    Left = 276
    Top = 352
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTituloClienteH: TDataSource
    DataSet = xTituloClienteH
    Left = 384
    Top = 352
  end
  object xFechaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(fecha_ord) as min_d FROM PRO_ORD WHERE '
      'EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND SERIES=?SERIE')
    UniDirectional = False
    Left = 48
    Top = 280
    object xFechaDMIN_D: TDateTimeField
      DisplayLabel = 'Min. D.'
      FieldName = 'MIN_D'
    end
  end
  object DSxFechaD: TDataSource
    DataSet = xFechaD
    Left = 156
    Top = 280
  end
  object xFechaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT max(fecha_ord) as max_h FROM PRO_ORD'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND SERIES=?SERIE')
    UniDirectional = False
    Left = 48
    Top = 335
    object xFechaHMAX_H: TDateTimeField
      DisplayLabel = 'Max. H.'
      FieldName = 'MAX_H'
    end
  end
  object DSxFechaH: TDataSource
    DataSet = xFechaH
    Left = 164
    Top = 335
  end
  object frDBOrdenes: TfrDBDataSet
    DataSource = DSLstOrdenes
    Left = 352
    Top = 84
  end
end
