object ZDMLstPresupuestos: TZDMLstPresupuestos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 429
  Top = 243
  Height = 279
  Width = 409
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 135
    Top = 22
  end
  object frHYPresup: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 24
    ReportForm = {19000000}
  end
  object frDBDSPresup: TfrDBDataSet
    DataSource = DSxLstPresup
    Left = 40
    Top = 80
  end
  object DSxLstPresup: TDataSource
    DataSet = xListadoPresup
    Left = 40
    Top = 132
  end
  object xListadoPresup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT pr.*,'
      'aux.descripcion AS desc_situacion, age.titulo AS desc_agente'
      'FROM z_emp_presupuesto pr'
      'LEFT JOIN ver_agentes age ON '
      '  (pr.empresa=age.empresa AND'
      '   pr.agentes=age.agente)'
      'LEFT JOIN z_sys_tablas_auxiliares aux ON'
      '  (pr.tipo_aux_situacion_pres=aux.tipo_aux AND '
      '   pr.codigo_situacion_pres=aux.codigo)'
      'WHERE pr.empresa=:empresa AND pr.fecha_emision>=:fdesde AND'
      'pr.fecha_emision<=:fhasta'
      'ORDER BY pr.agentes')
    UniDirectional = False
    AfterOpen = xListadoPresupAfterOpen
    BeforeClose = xListadoPresupBeforeClose
    Left = 40
    Top = 188
    object xListadoPresupN_PRESUPUETO: TIntegerField
      DisplayLabel = 'Presupuesto'
      FieldName = 'N_PRESUPUETO'
    end
    object xListadoPresupFECHA_EMISION: TDateTimeField
      DisplayLabel = 'Fec. Emision'
      FieldName = 'FECHA_EMISION'
    end
    object xListadoPresupCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xListadoPresupTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xListadoPresupAGENTES: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTES'
    end
    object xListadoPresupCODIGO_SITUACION_PRES: TFIBStringField
      DisplayLabel = 'Situacion'
      FieldName = 'CODIGO_SITUACION_PRES'
      Size = 8
    end
    object xListadoPresupDESC_SITUACION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_SITUACION'
      Size = 40
    end
    object xListadoPresupDESC_AGENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_AGENTE'
      Size = 60
    end
    object xListadoPresupEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xListadoPresupEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xListadoPresupCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xListadoPresupDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xListadoPresupANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object xListadoPresupAVANCE: TFloatField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object xListadoPresupCOMENTARIOS: TFIBStringField
      DisplayLabel = 'Comentarios'
      FieldName = 'COMENTARIOS'
      Size = 60
    end
    object xListadoPresupESCALADO_CANT1: TFloatField
      DisplayLabel = 'Escalado Cant. 1'
      FieldName = 'ESCALADO_CANT1'
    end
    object xListadoPresupESCALADO_CANT2: TFloatField
      DisplayLabel = 'Escalado Cant. 2'
      FieldName = 'ESCALADO_CANT2'
    end
    object xListadoPresupESCALADO_CANT3: TFloatField
      DisplayLabel = 'Escalado Cant. 3'
      FieldName = 'ESCALADO_CANT3'
    end
    object xListadoPresupESCALADO_CANT4: TFloatField
      DisplayLabel = 'Escalado Cant. 4'
      FieldName = 'ESCALADO_CANT4'
    end
    object xListadoPresupESCALADO_COTIZ1: TFloatField
      DisplayLabel = 'Escalado Cotiz. 1'
      FieldName = 'ESCALADO_COTIZ1'
    end
    object xListadoPresupESCALADO_COTIZ2: TFloatField
      DisplayLabel = 'Escalado Cotiz. 2'
      FieldName = 'ESCALADO_COTIZ2'
    end
    object xListadoPresupESCALADO_COTIZ3: TFloatField
      DisplayLabel = 'Escalado Cotiz. 3'
      FieldName = 'ESCALADO_COTIZ3'
    end
    object xListadoPresupESCALADO_COTIZ4: TFloatField
      DisplayLabel = 'Escalado Cotiz. 4'
      FieldName = 'ESCALADO_COTIZ4'
    end
    object xListadoPresupGASTOS_INICIALES: TFloatField
      DisplayLabel = 'Gastos Ini.'
      FieldName = 'GASTOS_INICIALES'
    end
    object xListadoPresupGASTOS_INICIALES_DESCR: TFIBStringField
      DisplayLabel = 'Gastos Ini. Desc.'
      FieldName = 'GASTOS_INICIALES_DESCR'
      Size = 100
    end
    object xListadoPresupIMAGEN_ETIQUETA: TFIBStringField
      DisplayLabel = 'Img. Etiq.'
      FieldName = 'IMAGEN_ETIQUETA'
      Size = 100
    end
    object xListadoPresupNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xListadoPresupTIPO_AUX_ADHESIVO: TFIBStringField
      DisplayLabel = 'Tipo Adhesivo'
      FieldName = 'TIPO_AUX_ADHESIVO'
      Size = 3
    end
    object xListadoPresupCODIGO_ADHESIVO: TFIBStringField
      DisplayLabel = 'Adhesivo'
      FieldName = 'CODIGO_ADHESIVO'
      Size = 8
    end
    object xListadoPresupTIPO_AUX_MATERIAL: TFIBStringField
      DisplayLabel = 'Tipo Aux. Material'
      FieldName = 'TIPO_AUX_MATERIAL'
      Size = 3
    end
    object xListadoPresupCODIGO_MATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'CODIGO_MATERIAL'
      Size = 8
    end
    object xListadoPresupTIPO_AUX_TINTA: TFIBStringField
      DisplayLabel = 'Tipo Aux. Tinta'
      FieldName = 'TIPO_AUX_TINTA'
      Size = 3
    end
    object xListadoPresupCODIGO_TINTA: TFIBStringField
      DisplayLabel = 'Tinta'
      FieldName = 'CODIGO_TINTA'
      Size = 8
    end
    object xListadoPresupTIPO_AUX_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Aux. Presentacion'
      FieldName = 'TIPO_AUX_PRESENTACION'
      Size = 3
    end
    object xListadoPresupCODIGO_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Presentaci'
      FieldName = 'CODIGO_PRESENTACION'
      Size = 8
    end
    object xListadoPresupTIPO_AUX_FORMA_ENVIO: TFIBStringField
      DisplayLabel = 'Tipo Aux. Forma Envio'
      FieldName = 'TIPO_AUX_FORMA_ENVIO'
      Size = 3
    end
    object xListadoPresupCODIGO_FORMA_ENVIO: TFIBStringField
      DisplayLabel = 'Forma Envio'
      FieldName = 'CODIGO_FORMA_ENVIO'
      Size = 8
    end
    object xListadoPresupTIPO_AUX_SITUACION_PRES: TFIBStringField
      DisplayLabel = 'Tipo Aux. Situacion Pres.'
      FieldName = 'TIPO_AUX_SITUACION_PRES'
      Size = 3
    end
    object xListadoPresupCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xListadoPresupTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xListadoPresupCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xListadoPresupWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object xListadoPresupEMAIL_CLIENTE: TFIBStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL_CLIENTE'
      Size = 40
    end
    object xListadoPresupNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 40
    end
    object xListadoPresupAPELLIDOS_CONTACTO: TFIBStringField
      DisplayLabel = 'Apellidos Contacto'
      FieldName = 'APELLIDOS_CONTACTO'
      Size = 40
    end
    object xListadoPresupTIPO_COTIZACION: TIntegerField
      DisplayLabel = 'Tipo Cotizacion'
      FieldName = 'TIPO_COTIZACION'
    end
    object xListadoPresupESCALADO_CANT5: TFloatField
      DisplayLabel = 'Escalado Cant. 5'
      FieldName = 'ESCALADO_CANT5'
    end
    object xListadoPresupESCALADO_COTIZ5: TFloatField
      DisplayLabel = 'Escalado Cotiz. 5'
      FieldName = 'ESCALADO_COTIZ5'
    end
    object xListadoPresupESCALADO_CANT6: TFloatField
      DisplayLabel = 'Escalado Cant. 6'
      FieldName = 'ESCALADO_CANT6'
    end
    object xListadoPresupESCALADO_COTIZ6: TFloatField
      DisplayLabel = 'Escalado Cotiz. 6'
      FieldName = 'ESCALADO_COTIZ6'
    end
    object xListadoPresupGASTOS_TROQUEL1: TFloatField
      DisplayLabel = 'Gastos Troquel 1'
      FieldName = 'GASTOS_TROQUEL1'
    end
    object xListadoPresupGASTOS_TROQUEL1_DESCR: TFIBStringField
      DisplayLabel = 'Desc. Gastos Troquel 1'
      FieldName = 'GASTOS_TROQUEL1_DESCR'
      Size = 100
    end
    object xListadoPresupGASTOS_TROQUEL2: TFloatField
      DisplayLabel = 'Gastos Troquel 2'
      FieldName = 'GASTOS_TROQUEL2'
    end
    object xListadoPresupGASTOS_TROQUEL2_DESCR: TFIBStringField
      DisplayLabel = 'Desc. Gastos Troquel 2'
      FieldName = 'GASTOS_TROQUEL2_DESCR'
      Size = 100
    end
    object xListadoPresupESTAMPACION: TIntegerField
      DisplayLabel = 'Estampacion'
      FieldName = 'ESTAMPACION'
    end
    object xListadoPresupRELIEVE: TIntegerField
      DisplayLabel = 'Relieve'
      FieldName = 'RELIEVE'
    end
    object xListadoPresupREIMPRESION: TIntegerField
      DisplayLabel = 'Reimpresion'
      FieldName = 'REIMPRESION'
    end
    object xListadoPresupBARNIZ: TIntegerField
      DisplayLabel = 'Barniz'
      FieldName = 'BARNIZ'
    end
    object xListadoPresupDIAMETRO_INT: TFloatField
      DisplayLabel = 'Diam. Int.'
      FieldName = 'DIAMETRO_INT'
    end
    object xListadoPresupDIAMETRO_EXT: TFloatField
      DisplayLabel = 'Diam. Ext.'
      FieldName = 'DIAMETRO_EXT'
    end
    object xListadoPresupETIQUETA_ROLLO: TFloatField
      DisplayLabel = 'Etiq. Rollo'
      FieldName = 'ETIQUETA_ROLLO'
    end
    object xListadoPresupETIQUETA_ANCHO: TFloatField
      DisplayLabel = 'Etiq. Ancho'
      FieldName = 'ETIQUETA_ANCHO'
    end
    object xListadoPresupPOSICION_SALIDA: TFIBStringField
      DisplayLabel = 'Pos. S.'
      FieldName = 'POSICION_SALIDA'
      Size = 15
    end
    object xListadoPresupOBSERVACIONES_ETIQUETA: TFIBStringField
      DisplayLabel = 'Notas Etiq.'
      FieldName = 'OBSERVACIONES_ETIQUETA'
      Size = 100
    end
    object xListadoPresupWEB_CLIENTE: TFIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'WEB_CLIENTE'
      Size = 60
    end
    object xListadoPresupTELEFONO_CLIENTE: TFIBStringField
      DisplayLabel = 'Tel. Cliente'
      FieldName = 'TELEFONO_CLIENTE'
    end
    object xListadoPresupFAX_CLIENTE: TFIBStringField
      DisplayLabel = 'FAX Cliente'
      FieldName = 'FAX_CLIENTE'
    end
    object xListadoPresupCIF_CLIENTE: TFIBStringField
      DisplayLabel = 'NIF Cliente'
      FieldName = 'CIF_CLIENTE'
    end
    object xListadoPresupDIRECCION_CLIENTE: TFIBStringField
      DisplayLabel = 'Dir. Cliente'
      FieldName = 'DIRECCION_CLIENTE'
      Size = 60
    end
    object xListadoPresupCP_CLIENTE: TFIBStringField
      DisplayLabel = 'C.P.'
      FieldName = 'CP_CLIENTE'
      Size = 10
    end
    object xListadoPresupPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object xListadoPresupFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 40
    end
    object xListadoPresupENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xListadoPresupSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xListadoPresupDC: TFIBStringField
      DisplayLabel = 'D.C.'
      FieldName = 'DC'
      Size = 2
    end
    object xListadoPresupCC: TFIBStringField
      DisplayLabel = 'Cuenta Corriente'
      FieldName = 'CC'
    end
  end
  object xDescAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ver_agentes'
      'WHERE empresa=:empresa AND agente=:agente')
    UniDirectional = False
    Left = 328
    Top = 64
    object xDescAgenteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDescAgenteAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xDescAgenteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDescAgenteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDescAgenteCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
  end
  object DSxDescAgente: TDataSource
    DataSet = xDescAgente
    Left = 328
    Top = 124
  end
  object xDescSituacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM z_sys_tablas_auxiliares'
      'WHERE tipo_aux=:tipo_aux AND codigo=:codigo')
    UniDirectional = False
    Left = 236
    Top = 60
    object xDescSituacionTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object xDescSituacionCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 8
    end
    object xDescSituacionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSxDescSit: TDataSource
    DataSet = xDescSituacion
    Left = 240
    Top = 128
  end
  object xTitCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_clientes'
      
        'where empresa=:empresa and ejercicio=:ejercicio and canal=:canal' +
        ' '
      'and cliente=:cliente')
    UniDirectional = False
    Left = 136
    Top = 188
    object xTitClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xTitClienteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTitClienteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTitClienteNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
end
