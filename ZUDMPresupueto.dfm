object ZDMPresupuesto: TZDMPresupuesto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 434
  Top = 450
  Height = 437
  Width = 609
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 204
    Top = 16
  end
  object QMPresupuesto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_EMP_PRESUPUESTO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  N_PRESUPUETO=?old_N_PRESUPUETO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_EMP_PRESUPUESTO'
      
        '  (COMISION,CODIGO_SITUACION_PRES,CODIGO_FORMA_ENVIO,CODIGO_PRES' +
        'ENTACION,CODIGO_TINTA,CODIGO_MATERIAL,CODIGO_ADHESIVO,NOTAS,GAST' +
        'OS_INICIALES,ESCALADO_COTIZ4,ESCALADO_COTIZ3,ESCALADO_COTIZ2,ESC' +
        'ALADO_COTIZ1,ESCALADO_CANT4,ESCALADO_CANT3,ESCALADO_CANT2,ESCALA' +
        'DO_CANT1,AVANCE,ANCHO,FECHA_EMISION,AGENTES,CLIENTE,N_PRESUPUETO' +
        ',TERCERO,IMAGEN_ETIQUETA,GASTOS_INICIALES_DESCR,COMENTARIOS,DESC' +
        'RIPCION,CANAL,EJERCICIO,EMPRESA,WEB,CONTACTO,TIPO_AUX_SITUACION_' +
        'PRES,TIPO_AUX_FORMA_ENVIO,TIPO_AUX_PRESENTACION,TIPO_AUX_TINTA,T' +
        'IPO_AUX_MATERIAL,TIPO_AUX_ADHESIVO,'
      
        'NOMBRE_CONTACTO,TITULO_CLIENTE,EMAIL_CLIENTE,APELLIDOS_CONTACTO,' +
        'TIPO_COTIZACION,ESCALADO_CANT5,ESCALADO_COTIZ5,ESCALADO_CANT6,ES' +
        'CALADO_COTIZ6,GASTOS_TROQUEL1,GASTOS_TROQUEL1_DESCR,GASTOS_TROQU' +
        'EL2,GASTOS_TROQUEL2_DESCR,ESTAMPACION,RELIEVE,REIMPRESION,BARNIZ' +
        ',DIAMETRO_INT,DIAMETRO_EXT,ETIQUETA_ROLLO,ETIQUETA_ANCHO,POSICIO' +
        'N_SALIDA,OBSERVACIONES_ETIQUETA,WEB_CLIENTE,TELEFONO_CLIENTE,FAX' +
        '_CLIENTE,CIF_CLIENTE,DIRECCION_CLIENTE,CP_CLIENTE,POBLACION,FORM' +
        'A_PAGO,ENTIDAD,SUCURSAL,DC,CC,ARTICULO_MATERIAL,'
      
        'ARTICULO_ADHESIVO,ARTICULO_BARNIZ,ARTICULO_CAJA,ARTICULO_TINTA1,' +
        'ARTICULO_TINTA2,ARTICULO_TINTA3,ARTICULO_TINTA4,ARTICULO_TINTA5,' +
        'ARTICULO_TINTA6,ARTICULO_TINTA7,ARTICULO_TINTA8,'
      
        ' P_COSTE_CAJA ,P_COSTE_BARNIZ ,P_COSTE_ADHESIVO ,P_COSTE_MATERIA' +
        'L,P_COSTE_TINTA1 ,P_COSTE_TINTA2 ,P_COSTE_TINTA3 ,P_COSTE_TINTA4' +
        ' ,P_COSTE_TINTA5 ,P_COSTE_TINTA6 ,P_COSTE_TINTA7 ,P_COSTE_TINTA8' +
        ','
      
        'ARTICULO_PORTES,P_COSTE_PORTES,RECURSO,P_COSTE_RECURSO,NUM_TINTA' +
        'S,PORCENTAJE)'
      'VALUES'
      
        '  (?COMISION,?CODIGO_SITUACION_PRES,?CODIGO_FORMA_ENVIO,?CODIGO_' +
        'PRESENTACION,?CODIGO_TINTA,?CODIGO_MATERIAL,?CODIGO_ADHESIVO,?NO' +
        'TAS,?GASTOS_INICIALES,?ESCALADO_COTIZ4,?ESCALADO_COTIZ3,?ESCALAD' +
        'O_COTIZ2,?ESCALADO_COTIZ1,?ESCALADO_CANT4,?ESCALADO_CANT3,?ESCAL' +
        'ADO_CANT2,?ESCALADO_CANT1,?AVANCE,?ANCHO,?FECHA_EMISION,?AGENTES' +
        ',?CLIENTE,?N_PRESUPUETO,?TERCERO,?IMAGEN_ETIQUETA,?GASTOS_INICIA' +
        'LES_DESCR,?COMENTARIOS,?DESCRIPCION,?CANAL,?EJERCICIO,?EMPRESA,?' +
        'WEB,?CONTACTO,?TIPO_AUX_SITUACION_PRES,?TIPO_AUX_FORMA_ENVIO,?TI' +
        'PO_AUX_PRESENTACION,?TIPO_AUX_TINTA,?TIPO_AUX_MATERIAL,?TIPO_AUX' +
        '_ADHESIVO,'
      
        '?NOMBRE_CONTACTO,?TITULO_CLIENTE,?EMAIL_CLIENTE,?APELLIDOS_CONTA' +
        'CTO,?TIPO_COTIZACION,?ESCALADO_CANT5,?ESCALADO_COTIZ5,?ESCALADO_' +
        'CANT6,?ESCALADO_COTIZ6,?GASTOS_TROQUEL1,?GASTOS_TROQUEL1_DESCR,?' +
        'GASTOS_TROQUEL2,?GASTOS_TROQUEL2_DESCR,?ESTAMPACION,?RELIEVE,?RE' +
        'IMPRESION,?BARNIZ,?DIAMETRO_INT,?DIAMETRO_EXT,?ETIQUETA_ROLLO,?E' +
        'TIQUETA_ANCHO,?POSICION_SALIDA,?OBSERVACIONES_ETIQUETA,?WEB_CLIE' +
        'NTE,?TELEFONO_CLIENTE,?FAX_CLIENTE,?CIF_CLIENTE,?DIRECCION_CLIEN' +
        'TE,?CP_CLIENTE,?POBLACION,?FORMA_PAGO,?ENTIDAD,?SUCURSAL,?DC,?CC' +
        ',?ARTICULO_MATERIAL,'
      
        '?ARTICULO_ADHESIVO,?ARTICULO_BARNIZ,?ARTICULO_CAJA,?ARTICULO_TIN' +
        'TA1,?ARTICULO_TINTA2,?ARTICULO_TINTA3,?ARTICULO_TINTA4,?ARTICULO' +
        '_TINTA5,?ARTICULO_TINTA6,?ARTICULO_TINTA7,?ARTICULO_TINTA8,'
      
        '?P_COSTE_CAJA,?P_COSTE_BARNIZ ,?P_COSTE_ADHESIVO ,?P_COSTE_MATER' +
        'IAL ,?P_COSTE_TINTA1 ,?P_COSTE_TINTA2 ,?P_COSTE_TINTA3 ,?P_COSTE' +
        '_TINTA4 ,?P_COSTE_TINTA5 ,?P_COSTE_TINTA6 ,?P_COSTE_TINTA7 ,?P_C' +
        'OSTE_TINTA8,'
      
        '?ARTICULO_PORTES,?P_COSTE_PORTES,?RECURSO,?P_COSTE_RECURSO,?CANT' +
        'IDAD,?PORCENTAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_EMP_PRESUPUESTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  N_PRESUPUETO=?N_PRESUPUETO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_EMP_PRESUPUESTO'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL'
      'ORDER BY N_PRESUPUETO, FECHA_EMISION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_EMP_PRESUPUESTO'
      'SET'
      '  COMISION=?COMISION '
      '  ,CODIGO_SITUACION_PRES=?CODIGO_SITUACION_PRES '
      '  ,CODIGO_FORMA_ENVIO=?CODIGO_FORMA_ENVIO '
      '  ,CODIGO_PRESENTACION=?CODIGO_PRESENTACION '
      '  ,CODIGO_TINTA=?CODIGO_TINTA '
      '  ,CODIGO_MATERIAL=?CODIGO_MATERIAL '
      '  ,CODIGO_ADHESIVO=?CODIGO_ADHESIVO '
      '  ,NOTAS=?NOTAS '
      '  ,GASTOS_INICIALES=?GASTOS_INICIALES '
      '  ,ESCALADO_COTIZ4=?ESCALADO_COTIZ4 '
      '  ,ESCALADO_COTIZ3=?ESCALADO_COTIZ3 '
      '  ,ESCALADO_COTIZ2=?ESCALADO_COTIZ2 '
      '  ,ESCALADO_COTIZ1=?ESCALADO_COTIZ1 '
      '  ,ESCALADO_CANT4=?ESCALADO_CANT4 '
      '  ,ESCALADO_CANT3=?ESCALADO_CANT3 '
      '  ,ESCALADO_CANT2=?ESCALADO_CANT2 '
      '  ,ESCALADO_CANT1=?ESCALADO_CANT1 '
      '  ,AVANCE=?AVANCE '
      '  ,ANCHO=?ANCHO '
      '  ,FECHA_EMISION=?FECHA_EMISION '
      '  ,AGENTES=?AGENTES '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,IMAGEN_ETIQUETA=?IMAGEN_ETIQUETA '
      '  ,GASTOS_INICIALES_DESCR=?GASTOS_INICIALES_DESCR '
      '  ,COMENTARIOS=?COMENTARIOS '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,WEB=?WEB '
      '  ,CONTACTO=?CONTACTO '
      '  ,TIPO_AUX_SITUACION_PRES=?TIPO_AUX_SITUACION_PRES '
      '  ,TIPO_AUX_FORMA_ENVIO=?TIPO_AUX_FORMA_ENVIO '
      '  ,TIPO_AUX_PRESENTACION=?TIPO_AUX_PRESENTACION '
      '  ,TIPO_AUX_TINTA=?TIPO_AUX_TINTA '
      '  ,TIPO_AUX_MATERIAL=?TIPO_AUX_MATERIAL '
      '  ,TIPO_AUX_ADHESIVO=?TIPO_AUX_ADHESIVO '
      '  ,NOMBRE_CONTACTO=?NOMBRE_CONTACTO '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,EMAIL_CLIENTE=?EMAIL_CLIENTE '
      '  ,APELLIDOS_CONTACTO=?APELLIDOS_CONTACTO '
      '  ,TIPO_COTIZACION=?TIPO_COTIZACION'
      '  ,ESCALADO_CANT5=?ESCALADO_CANT5'
      '  ,ESCALADO_COTIZ5=?ESCALADO_COTIZ5'
      '  ,ESCALADO_CANT6=?ESCALADO_CANT6'
      '  ,ESCALADO_COTIZ6=?ESCALADO_COTIZ6'
      '  ,GASTOS_TROQUEL1=?GASTOS_TROQUEL1'
      '  ,GASTOS_TROQUEL1_DESCR=?GASTOS_TROQUEL1_DESCR'
      '  ,GASTOS_TROQUEL2=?GASTOS_TROQUEL2'
      '  ,GASTOS_TROQUEL2_DESCR=?GASTOS_TROQUEL2_DESCR'
      '  ,ESTAMPACION=?ESTAMPACION'
      '  ,RELIEVE=?RELIEVE'
      '  ,REIMPRESION=?REIMPRESION'
      '  ,BARNIZ=?BARNIZ'
      '  ,DIAMETRO_INT=?DIAMETRO_INT'
      '  ,DIAMETRO_EXT=?DIAMETRO_EXT'
      '  ,ETIQUETA_ROLLO=?ETIQUETA_ROLLO'
      '  ,ETIQUETA_ANCHO=?ETIQUETA_ANCHO'
      '  ,POSICION_SALIDA=?POSICION_SALIDA'
      '  ,OBSERVACIONES_ETIQUETA=?OBSERVACIONES_ETIQUETA'
      '  ,WEB_CLIENTE=?WEB_CLIENTE'
      '  ,TELEFONO_CLIENTE=?TELEFONO_CLIENTE'
      '  ,FAX_CLIENTE=?FAX_CLIENTE'
      '  ,CIF_CLIENTE=?CIF_CLIENTE'
      '  ,DIRECCION_CLIENTE=?DIRECCION_CLIENTE'
      '  ,CP_CLIENTE=?CP_CLIENTE'
      '  ,POBLACION=?POBLACION'
      '  ,FORMA_PAGO=?FORMA_PAGO'
      '  ,ENTIDAD=?ENTIDAD'
      '  ,SUCURSAL=?SUCURSAL'
      '  ,DC=?DC'
      '  ,CC=?CC'
      '  ,ARTICULO_MATERIAL=?ARTICULO_MATERIAL'
      '  ,ARTICULO_BARNIZ=?ARTICULO_BARNIZ'
      '  ,ARTICULO_ADHESIVO=?ARTICULO_ADHESIVO'
      ' ,ARTICULO_CAJA=?ARTICULO_CAJA'
      ' ,ARTICULO_TINTA1=?ARTICULO_TINTA1'
      ' ,ARTICULO_TINTA2=?ARTICULO_TINTA2'
      ' ,ARTICULO_TINTA3=?ARTICULO_TINTA3'
      ' ,ARTICULO_TINTA4=?ARTICULO_TINTA4'
      ' ,ARTICULO_TINTA5=?ARTICULO_TINTA5'
      ' ,ARTICULO_TINTA6=?ARTICULO_TINTA6'
      ' ,ARTICULO_TINTA7=?ARTICULO_TINTA7'
      ' ,ARTICULO_TINTA8=?ARTICULO_TINTA8'
      ' ,P_COSTE_CAJA=?P_COSTE_CAJA'
      ' ,P_COSTE_BARNIZ=?P_COSTE_BARNIZ'
      ' ,P_COSTE_ADHESIVO=?P_COSTE_ADHESIVO'
      ' ,P_COSTE_MATERIAL=?P_COSTE_MATERIAL'
      ' ,P_COSTE_TINTA1=?P_COSTE_TINTA1'
      ' ,P_COSTE_TINTA2=?P_COSTE_TINTA2'
      ' ,P_COSTE_TINTA3=?P_COSTE_TINTA3'
      ' ,P_COSTE_TINTA4=?P_COSTE_TINTA4'
      ' ,P_COSTE_TINTA5=?P_COSTE_TINTA5'
      ' ,P_COSTE_TINTA6=?P_COSTE_TINTA6'
      ' ,P_COSTE_TINTA7=?P_COSTE_TINTA7'
      ' ,P_COSTE_TINTA8=?P_COSTE_TINTA8'
      ' ,ARTICULO_PORTES=?ARTICULO_PORTES'
      ' ,P_COSTE_PORTES=?P_COSTE_PORTES'
      ' ,RECURSO=?RECURSO'
      ' ,P_COSTE_RECURSO=?P_COSTE_RECURSO'
      ' ,NUM_TINTAS=?CANTIDAD'
      ' ,PORCENTAJE=?PORCENTAJE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  N_PRESUPUETO=?N_PRESUPUETO ')
    AfterDelete = graba
    AfterOpen = QMPresupuestoAfterOpen
    AfterPost = graba
    BeforeClose = QMPresupuestoBeforeClose
    BeforePost = QMPresupuestoBeforePost
    BeforeScroll = QMPresupuestoBeforeScroll
    OnNewRecord = QMPresupuestoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'N_PRESUPUETO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_EMP_PRESUPUESTO'
    UpdateTransaction = TLocal
    Left = 40
    Top = 12
    object QMPresupuestoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPresupuestoN_PRESUPUETO: TIntegerField
      DisplayLabel = 'Presupuesto'
      FieldName = 'N_PRESUPUETO'
    end
    object QMPresupuestoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPresupuestoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPresupuestoFECHA_EMISION: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_EMISION'
    end
    object QMPresupuestoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMPresupuestoCLIENTEChange
    end
    object QMPresupuestoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMPresupuestoANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMPresupuestoAVANCE: TFloatField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object QMPresupuestoCOMENTARIOS: TFIBStringField
      DisplayLabel = 'Comentarios'
      FieldName = 'COMENTARIOS'
      Size = 60
    end
    object QMPresupuestoESCALADO_CANT1: TFloatField
      DisplayLabel = 'Escalado Cant. 1'
      FieldName = 'ESCALADO_CANT1'
    end
    object QMPresupuestoESCALADO_CANT2: TFloatField
      DisplayLabel = 'Escalado Cant. 2'
      FieldName = 'ESCALADO_CANT2'
    end
    object QMPresupuestoESCALADO_CANT3: TFloatField
      DisplayLabel = 'Escalado Cant. 3'
      FieldName = 'ESCALADO_CANT3'
    end
    object QMPresupuestoESCALADO_CANT4: TFloatField
      DisplayLabel = 'Escalado Cant. 4'
      FieldName = 'ESCALADO_CANT4'
    end
    object QMPresupuestoESCALADO_COTIZ1: TFloatField
      DisplayLabel = 'Escalado Cotiz. 1'
      FieldName = 'ESCALADO_COTIZ1'
    end
    object QMPresupuestoESCALADO_COTIZ2: TFloatField
      DisplayLabel = 'Escalado Cotiz. 2'
      FieldName = 'ESCALADO_COTIZ2'
    end
    object QMPresupuestoESCALADO_COTIZ3: TFloatField
      DisplayLabel = 'Escalado Cotiz. 3'
      FieldName = 'ESCALADO_COTIZ3'
    end
    object QMPresupuestoESCALADO_COTIZ4: TFloatField
      DisplayLabel = 'Escalado Cotiz. 4'
      FieldName = 'ESCALADO_COTIZ4'
    end
    object QMPresupuestoGASTOS_INICIALES: TFloatField
      DisplayLabel = 'Gastos Ini.'
      FieldName = 'GASTOS_INICIALES'
    end
    object QMPresupuestoGASTOS_INICIALES_DESCR: TFIBStringField
      DisplayLabel = 'Gastos Ini. Desc.'
      FieldName = 'GASTOS_INICIALES_DESCR'
      Size = 100
    end
    object QMPresupuestoIMAGEN_ETIQUETA: TFIBStringField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN_ETIQUETA'
      Size = 100
    end
    object QMPresupuestoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPresupuestoTIPO_AUX_ADHESIVO: TFIBStringField
      DisplayLabel = 'Tipo Adhesivo'
      FieldName = 'TIPO_AUX_ADHESIVO'
      Size = 3
    end
    object QMPresupuestoCODIGO_ADHESIVO: TFIBStringField
      DisplayLabel = 'Adhesivo'
      FieldName = 'CODIGO_ADHESIVO'
      OnChange = QMPresupuestoCODIGO_ADHESIVOChange
      Size = 8
    end
    object QMPresupuestoDescAdhesivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescAdhesivo'
      OnGetText = QMPresupuestoDescAdhesivoGetText
      Size = 40
      Calculated = True
    end
    object QMPresupuestoTIPO_AUX_MATERIAL: TFIBStringField
      DisplayLabel = 'Tipo Aux. Material'
      FieldName = 'TIPO_AUX_MATERIAL'
      Size = 3
    end
    object QMPresupuestoCODIGO_MATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'CODIGO_MATERIAL'
      OnChange = QMPresupuestoCODIGO_MATERIALChange
      Size = 8
    end
    object QMPresupuestoDescMaterial: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescMaterial'
      OnGetText = QMPresupuestoDescMaterialGetText
      Size = 40
      Calculated = True
    end
    object QMPresupuestoTIPO_AUX_TINTA: TFIBStringField
      DisplayLabel = 'Tipo Aux. Tinta'
      FieldName = 'TIPO_AUX_TINTA'
      Size = 3
    end
    object QMPresupuestoCODIGO_TINTA: TFIBStringField
      DisplayLabel = 'Tinta'
      FieldName = 'CODIGO_TINTA'
      OnChange = QMPresupuestoCODIGO_TINTAChange
      Size = 8
    end
    object QMPresupuestoDescTinta: TStringField
      DisplayLabel = 'Desc. Tinta'
      FieldKind = fkCalculated
      FieldName = 'DescTinta'
      OnGetText = QMPresupuestoDescTintaGetText
      Size = 40
      Calculated = True
    end
    object QMPresupuestoTIPO_AUX_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Aux. Presentacion'
      FieldName = 'TIPO_AUX_PRESENTACION'
      Size = 3
    end
    object QMPresupuestoCODIGO_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Presentaci'#243'n'
      FieldName = 'CODIGO_PRESENTACION'
      OnChange = QMPresupuestoCODIGO_PRESENTACIONChange
      Size = 8
    end
    object QMPresupuestoDescPresentacion: TStringField
      DisplayLabel = 'Desc. Presentacion'
      FieldKind = fkCalculated
      FieldName = 'DescPresentacion'
      OnGetText = QMPresupuestoDescPresentacionGetText
      Size = 40
      Calculated = True
    end
    object QMPresupuestoTIPO_AUX_FORMA_ENVIO: TFIBStringField
      DisplayLabel = 'Tipo Aux. Forma Envio'
      FieldName = 'TIPO_AUX_FORMA_ENVIO'
      Size = 3
    end
    object QMPresupuestoCODIGO_FORMA_ENVIO: TFIBStringField
      DisplayLabel = 'Forma Envio'
      FieldName = 'CODIGO_FORMA_ENVIO'
      OnChange = QMPresupuestoCODIGO_FORMA_ENVIOChange
      Size = 8
    end
    object QMPresupuestoDescFormaEnv: TStringField
      DisplayLabel = 'Desc. Forma Envio'
      FieldKind = fkCalculated
      FieldName = 'DescFormaEnv'
      OnGetText = QMPresupuestoDescFormaEnvGetText
      Size = 40
      Calculated = True
    end
    object QMPresupuestoTIPO_AUX_SITUACION_PRES: TFIBStringField
      DisplayLabel = 'Tipo Aux. Situacion Pres.'
      FieldName = 'TIPO_AUX_SITUACION_PRES'
      Size = 3
    end
    object QMPresupuestoCODIGO_SITUACION_PRES: TFIBStringField
      DisplayLabel = 'Situaci'#243'n Pres.'
      FieldName = 'CODIGO_SITUACION_PRES'
      OnChange = QMPresupuestoCODIGO_SITUACION_PRESChange
      Size = 8
    end
    object QMPresupuestoDescSituacionPres: TStringField
      DisplayLabel = 'Desc. Situacion Pres.'
      FieldKind = fkCalculated
      FieldName = 'DescSituacionPres'
      OnGetText = QMPresupuestoDescSituacionPresGetText
      Size = 40
      Calculated = True
    end
    object QMPresupuestoAGENTES: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTES'
      OnChange = QMPresupuestoAGENTESChange
    end
    object QMPresupuestoCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMPresupuestoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMPresupuestoCONTACTO: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'CONTACTO'
      OnChange = QMPresupuestoCONTACTOChange
    end
    object QMPresupuestoWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMPresupuestoTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMPresupuestoEMAIL_CLIENTE: TFIBStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL_CLIENTE'
      Size = 40
    end
    object QMPresupuestoNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 40
    end
    object QMPresupuestoAPELLIDOS_CONTACTO: TFIBStringField
      DisplayLabel = 'Apellidos Contacto'
      FieldName = 'APELLIDOS_CONTACTO'
      Size = 40
    end
    object QMPresupuestoTIPO_COTIZACION: TIntegerField
      DisplayLabel = 'Tipo Cotizacion'
      FieldName = 'TIPO_COTIZACION'
    end
    object QMPresupuestoESCALADO_CANT5: TFloatField
      DisplayLabel = 'Escalado Cant. 5'
      FieldName = 'ESCALADO_CANT5'
    end
    object QMPresupuestoESCALADO_COTIZ5: TFloatField
      DisplayLabel = 'Escalado Cotiz. 5'
      FieldName = 'ESCALADO_COTIZ5'
    end
    object QMPresupuestoESCALADO_CANT6: TFloatField
      DisplayLabel = 'Escalado Cant. 6'
      FieldName = 'ESCALADO_CANT6'
    end
    object QMPresupuestoESCALADO_COTIZ6: TFloatField
      DisplayLabel = 'Escalado Cotiz. 6'
      FieldName = 'ESCALADO_COTIZ6'
    end
    object QMPresupuestoGASTOS_TROQUEL1: TFloatField
      DisplayLabel = 'Gastos Troquel 1'
      FieldName = 'GASTOS_TROQUEL1'
    end
    object QMPresupuestoGASTOS_TROQUEL1_DESCR: TFIBStringField
      DisplayLabel = 'Desc. Gastos Troquel 1'
      FieldName = 'GASTOS_TROQUEL1_DESCR'
      Size = 100
    end
    object QMPresupuestoGASTOS_TROQUEL2: TFloatField
      DisplayLabel = 'Gastos Troquel 2'
      FieldName = 'GASTOS_TROQUEL2'
    end
    object QMPresupuestoGASTOS_TROQUEL2_DESCR: TFIBStringField
      DisplayLabel = 'Desc. Gastos Troquel 2'
      FieldName = 'GASTOS_TROQUEL2_DESCR'
      Size = 100
    end
    object QMPresupuestoESTAMPACION: TIntegerField
      DisplayLabel = 'Estampacion'
      FieldName = 'ESTAMPACION'
    end
    object QMPresupuestoRELIEVE: TIntegerField
      DisplayLabel = 'Relieve'
      FieldName = 'RELIEVE'
    end
    object QMPresupuestoREIMPRESION: TIntegerField
      DisplayLabel = 'Reimpresion'
      FieldName = 'REIMPRESION'
    end
    object QMPresupuestoBARNIZ: TIntegerField
      DisplayLabel = 'Barniz'
      FieldName = 'BARNIZ'
    end
    object QMPresupuestoDIAMETRO_INT: TFloatField
      DisplayLabel = 'Diametro Int.'
      FieldName = 'DIAMETRO_INT'
    end
    object QMPresupuestoDIAMETRO_EXT: TFloatField
      DisplayLabel = 'Diametro Ext.'
      FieldName = 'DIAMETRO_EXT'
    end
    object QMPresupuestoETIQUETA_ROLLO: TFloatField
      DisplayLabel = 'Etiq. Rollo'
      FieldName = 'ETIQUETA_ROLLO'
    end
    object QMPresupuestoETIQUETA_ANCHO: TFloatField
      DisplayLabel = 'Etiq. Ancho'
      FieldName = 'ETIQUETA_ANCHO'
    end
    object QMPresupuestoPOSICION_SALIDA: TFIBStringField
      DisplayLabel = 'Posicion Salida'
      FieldName = 'POSICION_SALIDA'
      Size = 15
    end
    object QMPresupuestoOBSERVACIONES_ETIQUETA: TFIBStringField
      DisplayLabel = 'Obs. Etiq.'
      FieldName = 'OBSERVACIONES_ETIQUETA'
      Size = 100
    end
    object QMPresupuestoWEB_CLIENTE: TFIBStringField
      DisplayLabel = 'WEB Cliente'
      FieldName = 'WEB_CLIENTE'
      Size = 60
    end
    object QMPresupuestoTELEFONO_CLIENTE: TFIBStringField
      DisplayLabel = 'Tel. Cliente'
      FieldName = 'TELEFONO_CLIENTE'
    end
    object QMPresupuestoFAX_CLIENTE: TFIBStringField
      DisplayLabel = 'FAX Cliente'
      FieldName = 'FAX_CLIENTE'
    end
    object QMPresupuestoCIF_CLIENTE: TFIBStringField
      DisplayLabel = 'NIF Cliente'
      FieldName = 'CIF_CLIENTE'
    end
    object QMPresupuestoDIRECCION_CLIENTE: TFIBStringField
      DisplayLabel = 'Dir. Cliente'
      FieldName = 'DIRECCION_CLIENTE'
      Size = 60
    end
    object QMPresupuestoCP_CLIENTE: TFIBStringField
      DisplayLabel = 'C.P.'
      FieldName = 'CP_CLIENTE'
      Size = 10
    end
    object QMPresupuestoPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object QMPresupuestoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 40
    end
    object QMPresupuestoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object QMPresupuestoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object QMPresupuestoDC: TFIBStringField
      DisplayLabel = 'D.C.'
      FieldName = 'DC'
      Size = 2
    end
    object QMPresupuestoCC: TFIBStringField
      DisplayLabel = 'Cuenta Corriente'
      FieldName = 'CC'
    end
    object QMPresupuestoID_DETALLES_OFERTAS_V: TIntegerField
      DisplayLabel = 'ID Det. Ofe. V.'
      FieldName = 'ID_DETALLES_OFERTAS_V'
    end
    object QMPresupuestoARTICULO_MATERIAL: TFIBStringField
      DisplayLabel = 'Art. Material'
      FieldName = 'ARTICULO_MATERIAL'
      OnChange = QMPresupuestoARTICULO_MATERIALChange
      Size = 15
    end
    object QMPresupuestoARTICULO_ADHESIVO: TFIBStringField
      DisplayLabel = 'Art. Adhesivo'
      FieldName = 'ARTICULO_ADHESIVO'
      OnChange = QMPresupuestoARTICULO_ADHESIVOChange
      Size = 15
    end
    object QMPresupuestoARTICULO_CAJA: TFIBStringField
      DisplayLabel = 'Art. Caja'
      FieldName = 'ARTICULO_CAJA'
      OnChange = QMPresupuestoARTICULO_CAJAChange
      Size = 15
    end
    object QMPresupuestoARTICULO_BARNIZ: TFIBStringField
      DisplayLabel = 'Art. Barniz'
      FieldName = 'ARTICULO_BARNIZ'
      OnChange = QMPresupuestoARTICULO_BARNIZChange
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA1: TFIBStringField
      DisplayLabel = 'Art. Tinta 1'
      FieldName = 'ARTICULO_TINTA1'
      OnChange = QMPresupuestoARTICULO_TINTA1Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA2: TFIBStringField
      DisplayLabel = 'Art. Tinta 2'
      FieldName = 'ARTICULO_TINTA2'
      OnChange = QMPresupuestoARTICULO_TINTA2Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA3: TFIBStringField
      DisplayLabel = 'Art. Tinta 3'
      FieldName = 'ARTICULO_TINTA3'
      OnChange = QMPresupuestoARTICULO_TINTA3Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA4: TFIBStringField
      DisplayLabel = 'Art. Tinta 4'
      FieldName = 'ARTICULO_TINTA4'
      OnChange = QMPresupuestoARTICULO_TINTA4Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA5: TFIBStringField
      DisplayLabel = 'Art. Tinta 5'
      FieldName = 'ARTICULO_TINTA5'
      OnChange = QMPresupuestoARTICULO_TINTA5Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA6: TFIBStringField
      DisplayLabel = 'Art. Tinta 6'
      FieldName = 'ARTICULO_TINTA6'
      OnChange = QMPresupuestoARTICULO_TINTA6Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA7: TFIBStringField
      DisplayLabel = 'Art. Tinta 7'
      FieldName = 'ARTICULO_TINTA7'
      OnChange = QMPresupuestoARTICULO_TINTA7Change
      Size = 15
    end
    object QMPresupuestoARTICULO_TINTA8: TFIBStringField
      DisplayLabel = 'Art. Tinta 8'
      FieldName = 'ARTICULO_TINTA8'
      OnChange = QMPresupuestoARTICULO_TINTA8Change
      Size = 15
    end
    object QMPresupuestoDescArtMat: TStringField
      DisplayLabel = 'Desc. Material'
      FieldKind = fkCalculated
      FieldName = 'DescArtMat'
      OnGetText = QMPresupuestoDescArtMatGetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtAdh: TStringField
      DisplayLabel = 'Desc. Adhesivo'
      FieldKind = fkCalculated
      FieldName = 'DescArtAdh'
      OnGetText = QMPresupuestoDescArtAdhGetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtBarniz: TStringField
      DisplayLabel = 'Desc. Barniz'
      FieldKind = fkCalculated
      FieldName = 'DescArtBarniz'
      OnGetText = QMPresupuestoDescArtBarnizGetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescartCaja: TStringField
      DisplayLabel = 'Desc. Caja'
      FieldKind = fkCalculated
      FieldName = 'DescartCaja'
      OnGetText = QMPresupuestoDescartCajaGetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtTinta1: TStringField
      DisplayLabel = 'Desc. Tinta 1'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta1'
      OnGetText = QMPresupuestoDescArtTinta1GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtTinta2: TStringField
      DisplayLabel = 'Desc. Tinta 2'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta2'
      OnGetText = QMPresupuestoDescArtTinta2GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtTinta3: TStringField
      DisplayLabel = 'Desc. Tinta 3'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta3'
      OnGetText = QMPresupuestoDescArtTinta3GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDesctArtTinta4: TStringField
      DisplayLabel = 'Desc. Tinta 4'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta4'
      OnGetText = QMPresupuestoDesctArtTinta4GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtTinta5: TStringField
      DisplayLabel = 'Desc. Tinta 5'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta5'
      OnGetText = QMPresupuestoDescArtTinta5GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDesctArtTinta6: TStringField
      DisplayLabel = 'Desc. Tinta 6'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta6'
      OnGetText = QMPresupuestoDesctArtTinta6GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtTinta7: TStringField
      DisplayLabel = 'Desc. Tinta 7'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta7'
      OnGetText = QMPresupuestoDescArtTinta7GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoDescArtTinta8: TStringField
      DisplayLabel = 'Desc. Tinta 8'
      FieldKind = fkCalculated
      FieldName = 'DescArtTinta8'
      OnGetText = QMPresupuestoDescArtTinta8GetText
      Size = 60
      Calculated = True
    end
    object QMPresupuestoP_COSTE_CAJA: TFloatField
      DisplayLabel = 'P. Coste Caja'
      FieldName = 'P_COSTE_CAJA'
    end
    object QMPresupuestoP_COSTE_ADHESIVO: TFloatField
      DisplayLabel = 'P. Coste Adhesivo'
      FieldName = 'P_COSTE_ADHESIVO'
    end
    object QMPresupuestoP_COSTE_BARNIZ: TFloatField
      DisplayLabel = 'P. Coste Barniz'
      FieldName = 'P_COSTE_BARNIZ'
    end
    object QMPresupuestoP_COSTE_MATERIAL: TFloatField
      DisplayLabel = 'P. Coste Material'
      FieldName = 'P_COSTE_MATERIAL'
    end
    object QMPresupuestoP_COSTE_TINTA1: TFloatField
      DisplayLabel = 'P. Coste Tinta 1'
      FieldName = 'P_COSTE_TINTA1'
    end
    object QMPresupuestoP_COSTE_TINTA2: TFloatField
      DisplayLabel = 'P. Coste Tinta 2'
      FieldName = 'P_COSTE_TINTA2'
    end
    object QMPresupuestoP_COSTE_TINTA3: TFloatField
      DisplayLabel = 'P. Coste Tinta 3'
      FieldName = 'P_COSTE_TINTA3'
    end
    object QMPresupuestoP_COSTE_TINTA4: TFloatField
      DisplayLabel = 'P. Coste Tinta 4'
      FieldName = 'P_COSTE_TINTA4'
    end
    object QMPresupuestoP_COSTE_TINTA5: TFloatField
      DisplayLabel = 'P. Coste Tinta 5'
      FieldName = 'P_COSTE_TINTA5'
    end
    object QMPresupuestoP_COSTE_TINTA6: TFloatField
      DisplayLabel = 'P. Coste Tinta 6'
      FieldName = 'P_COSTE_TINTA6'
    end
    object QMPresupuestoP_COSTE_TINTA7: TFloatField
      DisplayLabel = 'P. Coste Tinta 7'
      FieldName = 'P_COSTE_TINTA7'
    end
    object QMPresupuestoP_COSTE_TINTA8: TFloatField
      DisplayLabel = 'P. Coste Tinta 8'
      FieldName = 'P_COSTE_TINTA8'
    end
    object QMPresupuestoARTICULO_PORTES: TFIBStringField
      DisplayLabel = 'Art. Portes'
      FieldName = 'ARTICULO_PORTES'
      OnChange = QMPresupuestoARTICULO_PORTESChange
      Size = 15
    end
    object QMPresupuestoP_COSTE_PORTES: TFloatField
      DisplayLabel = 'P. Coste Portes'
      FieldName = 'P_COSTE_PORTES'
    end
    object QMPresupuestoRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMPresupuestoRECURSOChange
      Size = 5
    end
    object QMPresupuestoP_COSTE_RECURSO: TFloatField
      DisplayLabel = 'P. Coste Recurso'
      FieldName = 'P_COSTE_RECURSO'
    end
    object QMPresupuestoDescRecurso: TStringField
      DisplayLabel = 'Desc. Recurso'
      FieldKind = fkCalculated
      FieldName = 'DescRecurso'
      OnGetText = QMPresupuestoDescRecursoGetText
      Calculated = True
    end
    object QMPresupuestoDescArtPortes: TStringField
      DisplayLabel = 'Desc. Portes'
      FieldKind = fkCalculated
      FieldName = 'DescArtPortes'
      OnGetText = QMPresupuestoDescArtPortesGetText
      Calculated = True
    end
    object QMPresupuestoNUM_TINTAS: TFloatField
      DisplayLabel = 'Num. Tintas'
      FieldName = 'NUM_TINTAS'
    end
    object QMPresupuestoPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMPresupuesto: TDataSource
    DataSet = QMPresupuesto
    Left = 136
    Top = 16
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from VER_clientes_odbc'
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al)and(num_cliente=?cliente))'
      '')
    UniDirectional = False
    DataSource = DSQMPresupuesto
    Left = 36
    Top = 116
    object xClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClientesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xClientesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xClientesNUM_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'NUM_CLIENTE'
    end
    object xClientesNUM_TERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'NUM_TERCERO'
    end
    object xClientesCUENTA_CONTABLE: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CONTABLE'
      Size = 15
    end
    object xClientesNOMBRE_SOCIAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_SOCIAL'
      Size = 60
    end
    object xClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xClientesNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xClientesTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xClientesTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xClientesFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object xClientesE_MAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'E_MAIL'
      Size = 40
    end
    object xClientesWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xClientesBANCO: TFIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 40
    end
    object xClientesENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xClientesSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xClientesDC: TFIBStringField
      DisplayLabel = 'D.C.'
      FieldName = 'DC'
      Size = 2
    end
    object xClientesTIPO_DIRECCION: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DIRECCION'
      Size = 3
    end
    object xClientesDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 40
    end
    object xClientesDIRECCION2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIRECCION2'
      Size = 40
    end
    object xClientesDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xClientesDIR_ESCALERA: TFIBStringField
      DisplayLabel = 'Escalera'
      FieldName = 'DIR_ESCALERA'
      Size = 4
    end
    object xClientesDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xClientesDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xClientesDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xClientesDIR_COMPLETA2: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA2'
      Size = 76
    end
    object xClientesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xClientesPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object xClientesPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xClientesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object xClientesCC: TFIBStringField
      DisplayLabel = 'Cuenta Corriente'
      FieldName = 'CC'
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 136
    Top = 117
  end
  object xMaestros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TABLAS_AUXILIARES'
      'where tipo_aux = ?tipo_aux and codigo=?codigo')
    UniDirectional = False
    Left = 34
    Top = 281
    object xMaestrosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xMaestrosTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object xMaestrosCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 8
    end
    object xMaestrosCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xMaestrosPORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
  end
  object xAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from ver_agentes where empresa=?empresa and agente=?age' +
        'ntes')
    UniDirectional = False
    DataSource = DSQMPresupuesto
    Left = 36
    Top = 168
    object xAgentesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgentesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAgentesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAgentesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAgentesCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
  end
  object DSxAgentes: TDataSource
    DataSet = xAgentes
    Left = 136
    Top = 168
  end
  object frPresupuesto: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPresupuestoGetValue
    OnBeforePrint = frPresupuestoEnterRect
    OnEnterRect = frPresupuestoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 268
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDSPresup: TfrDBDataSet
    DataSource = DSxLstPresup
    Left = 348
    Top = 16
  end
  object DSxLstPresup: TDataSource
    DataSet = xLstPresupuestos
    Left = 508
    Top = 16
  end
  object xContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_terceros_contactos '
      '  where tercero=?tercero and contacto=?contacto')
    UniDirectional = False
    DataSource = DSQMPresupuesto
    Left = 36
    Top = 224
    object xContactoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xContactoCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xContactoNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object xContactoAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
    object xContactoMOVIL: TFIBStringField
      DisplayLabel = 'Movil'
      FieldName = 'MOVIL'
    end
    object xContactoTELEFONO: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object xContactoFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object xContactoEXTENSION: TFIBStringField
      DisplayLabel = 'Ext.'
      FieldName = 'EXTENSION'
      Size = 5
    end
    object xContactoCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 40
    end
    object xContactoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSContacto: TDataSource
    DataSet = xContacto
    Left = 140
    Top = 224
  end
  object xLstPresupuestos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_EMP_PRESUPUESTO'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'and n_presupueto=?n_presupuesto')
    UniDirectional = False
    Left = 440
    Top = 16
    object xLstPresupuestosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstPresupuestosN_PRESUPUETO: TIntegerField
      DisplayLabel = 'Presupuesto'
      FieldName = 'N_PRESUPUETO'
    end
    object xLstPresupuestosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xLstPresupuestosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLstPresupuestosFECHA_EMISION: TDateTimeField
      DisplayLabel = 'Fec. Emision'
      FieldName = 'FECHA_EMISION'
    end
    object xLstPresupuestosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xLstPresupuestosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xLstPresupuestosANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object xLstPresupuestosAVANCE: TFloatField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object xLstPresupuestosCOMENTARIOS: TFIBStringField
      DisplayLabel = 'Comentarios'
      FieldName = 'COMENTARIOS'
      Size = 60
    end
    object xLstPresupuestosESCALADO_CANT1: TFloatField
      DisplayLabel = 'Escalado Cant. 1'
      FieldName = 'ESCALADO_CANT1'
    end
    object xLstPresupuestosESCALADO_CANT2: TFloatField
      DisplayLabel = 'Escalado Cant. 2'
      FieldName = 'ESCALADO_CANT2'
    end
    object xLstPresupuestosESCALADO_CANT3: TFloatField
      DisplayLabel = 'Escalado Cant. 3'
      FieldName = 'ESCALADO_CANT3'
    end
    object xLstPresupuestosESCALADO_CANT4: TFloatField
      DisplayLabel = 'Escalado Cant. 4'
      FieldName = 'ESCALADO_CANT4'
    end
    object xLstPresupuestosESCALADO_COTIZ1: TFloatField
      DisplayLabel = 'Escalado Cotiz. 1'
      FieldName = 'ESCALADO_COTIZ1'
    end
    object xLstPresupuestosESCALADO_COTIZ2: TFloatField
      DisplayLabel = 'Escalado Cotiz. 2'
      FieldName = 'ESCALADO_COTIZ2'
    end
    object xLstPresupuestosESCALADO_COTIZ3: TFloatField
      DisplayLabel = 'Escalado Cotiz. 3'
      FieldName = 'ESCALADO_COTIZ3'
    end
    object xLstPresupuestosESCALADO_COTIZ4: TFloatField
      DisplayLabel = 'Escalado Cotiz. 4'
      FieldName = 'ESCALADO_COTIZ4'
    end
    object xLstPresupuestosGASTOS_INICIALES: TFloatField
      DisplayLabel = 'Gastos Ini.'
      FieldName = 'GASTOS_INICIALES'
    end
    object xLstPresupuestosGASTOS_INICIALES_DESCR: TFIBStringField
      DisplayLabel = 'Gastos Ini. Desc.'
      FieldName = 'GASTOS_INICIALES_DESCR'
      Size = 100
    end
    object xLstPresupuestosIMAGEN_ETIQUETA: TFIBStringField
      DisplayLabel = 'Img. Etiq.'
      FieldName = 'IMAGEN_ETIQUETA'
      Size = 100
    end
    object xLstPresupuestosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xLstPresupuestosTIPO_AUX_ADHESIVO: TFIBStringField
      DisplayLabel = 'Tipo Adhesivo'
      FieldName = 'TIPO_AUX_ADHESIVO'
      Size = 3
    end
    object xLstPresupuestosCODIGO_ADHESIVO: TFIBStringField
      DisplayLabel = 'Adhesivo'
      FieldName = 'CODIGO_ADHESIVO'
      Size = 8
    end
    object xLstPresupuestosTIPO_AUX_MATERIAL: TFIBStringField
      DisplayLabel = 'Tipo Aux. Material'
      FieldName = 'TIPO_AUX_MATERIAL'
      Size = 3
    end
    object xLstPresupuestosCODIGO_MATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'CODIGO_MATERIAL'
      Size = 8
    end
    object xLstPresupuestosTIPO_AUX_TINTA: TFIBStringField
      DisplayLabel = 'Tipo Aux. Tinta'
      FieldName = 'TIPO_AUX_TINTA'
      Size = 3
    end
    object xLstPresupuestosCODIGO_TINTA: TFIBStringField
      DisplayLabel = 'Tinta'
      FieldName = 'CODIGO_TINTA'
      Size = 8
    end
    object xLstPresupuestosTIPO_AUX_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Aux. Presentacion'
      FieldName = 'TIPO_AUX_PRESENTACION'
      Size = 3
    end
    object xLstPresupuestosCODIGO_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Presentaci'
      FieldName = 'CODIGO_PRESENTACION'
      Size = 8
    end
    object xLstPresupuestosTIPO_AUX_FORMA_ENVIO: TFIBStringField
      DisplayLabel = 'Tipo Aux. Forma Envio'
      FieldName = 'TIPO_AUX_FORMA_ENVIO'
      Size = 3
    end
    object xLstPresupuestosCODIGO_FORMA_ENVIO: TFIBStringField
      DisplayLabel = 'Forma Envio'
      FieldName = 'CODIGO_FORMA_ENVIO'
      Size = 8
    end
    object xLstPresupuestosTIPO_AUX_SITUACION_PRES: TFIBStringField
      DisplayLabel = 'Tipo Aux. Situacion Pres.'
      FieldName = 'TIPO_AUX_SITUACION_PRES'
      Size = 3
    end
    object xLstPresupuestosCODIGO_SITUACION_PRES: TFIBStringField
      DisplayLabel = 'Situacion'
      FieldName = 'CODIGO_SITUACION_PRES'
      Size = 8
    end
    object xLstPresupuestosAGENTES: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTES'
    end
    object xLstPresupuestosCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xLstPresupuestosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xLstPresupuestosCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xLstPresupuestosWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object xLstPresupuestosTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xLstPresupuestosEMAIL_CLIENTE: TFIBStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL_CLIENTE'
      Size = 40
    end
    object xLstPresupuestosNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 40
    end
    object xLstPresupuestosAPELLIDOS_CONTACTO: TFIBStringField
      DisplayLabel = 'Apellidos Contacto'
      FieldName = 'APELLIDOS_CONTACTO'
      Size = 40
    end
    object xLstPresupuestosTIPO_COTIZACION: TIntegerField
      DisplayLabel = 'Tipo Cotizacion'
      FieldName = 'TIPO_COTIZACION'
    end
    object xLstPresupuestosESCALADO_CANT5: TFloatField
      DisplayLabel = 'Escalado Cant. 5'
      FieldName = 'ESCALADO_CANT5'
    end
    object xLstPresupuestosESCALADO_COTIZ5: TFloatField
      DisplayLabel = 'Escalado Cotiz. 5'
      FieldName = 'ESCALADO_COTIZ5'
    end
    object xLstPresupuestosESCALADO_CANT6: TFloatField
      DisplayLabel = 'Escalado Cant. 6'
      FieldName = 'ESCALADO_CANT6'
    end
    object xLstPresupuestosESCALADO_COTIZ6: TFloatField
      DisplayLabel = 'Escalado Cotiz. 6'
      FieldName = 'ESCALADO_COTIZ6'
    end
    object xLstPresupuestosGASTOS_TROQUEL1: TFloatField
      DisplayLabel = 'Gastos Troquel 1'
      FieldName = 'GASTOS_TROQUEL1'
    end
    object xLstPresupuestosGASTOS_TROQUEL1_DESCR: TFIBStringField
      DisplayLabel = 'Desc. Gastos Troquel 1'
      FieldName = 'GASTOS_TROQUEL1_DESCR'
      Size = 100
    end
    object xLstPresupuestosGASTOS_TROQUEL2: TFloatField
      DisplayLabel = 'Gastos Troquel 2'
      FieldName = 'GASTOS_TROQUEL2'
    end
    object xLstPresupuestosGASTOS_TROQUEL2_DESCR: TFIBStringField
      DisplayLabel = 'Desc. Gastos Troquel 2'
      FieldName = 'GASTOS_TROQUEL2_DESCR'
      Size = 100
    end
    object xLstPresupuestosESTAMPACION: TIntegerField
      DisplayLabel = 'Estampacion'
      FieldName = 'ESTAMPACION'
    end
    object xLstPresupuestosRELIEVE: TIntegerField
      DisplayLabel = 'Relieve'
      FieldName = 'RELIEVE'
    end
  end
  object SPDuplicar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure z_duplicar_presupuesto '
      '(?empresa, ?presupuesto_ori, ?ejercicio_dest,?canal_dest)')
    Transaction = TLocal
    AutoTrans = True
    Left = 444
    Top = 76
  end
  object DSxClientesFormaPago: TDataSource
    DataSet = xClientesFormaPago
    Left = 320
    Top = 245
  end
  object xClientesFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo'
      
        'from VER_clientes cli join sys_formas_pago pag on (cli.forma_pag' +
        'o=pag.forma)'
      ''
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al)and(cliente=?cliente))'
      '')
    UniDirectional = False
    DataSource = DSQMPresupuesto
    Left = 230
    Top = 244
    object xClientesFormaPagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object ZxUpdatePresupuesto: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update z_emp_presupuesto'
      'set id_detalles_ofertas_v=?id_detalles_ofertas_v'
      'where n_presupueto=?n_presupueto')
    Transaction = TLocal
    AutoTrans = True
    Left = 444
    Top = 176
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 510
    Top = 78
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo_largo as titulo,p_coste'
      'from art_articulos'
      'where (empresa=?empresa)  and articulo=?articulo')
    UniDirectional = False
    DataSource = DSQMPresupuesto
    Left = 54
    Top = 340
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xArticulosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 120
    Top = 341
  end
  object SPCrearOfertaEscandallo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure z_crea_escandallo_oferta(?empresa,?articulo_ma' +
        'terial,?articulo_barniz,?entrada,?cliente,'
      
        '?articulo_caja,?articulo_adhesivo,?articulo_tinta1,?articulo_tin' +
        'ta2,?articulo_tinta3,?articulo_tinta4,?articulo_tinta5,?articulo' +
        '_tinta6,'
      
        '?articulo_tinta7,?articulo_tinta8,?n_presupuesto,?articulo_porte' +
        's,?articulo_recurso)')
    Transaction = TLocal
    AutoTrans = True
    Left = 444
    Top = 124
  end
  object DSMaestros: TDataSource
    DataSet = xMaestros
    Left = 140
    Top = 284
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_EMP_PRESUPUESTO_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  N_PRESUPUESTO=?old_N_PRESUPUESTO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_EMP_PRESUPUESTO_DET'
      
        '  (EMPRESA,N_PRESUPUESTO,LINEA,CANTIDAD,MAQUINA,TINTA,ANCHO,AVAN' +
        'CE,SEPARACION,FIGURAS,CAMBIO_BOBINAS,ARREGLO,CAMBIOS,ANCHO_BOBIN' +
        'A,NUMERO_CAJAS,'
      
        '  RECURSO ,IMPORTE_RECURSO,HORAS_PREPARACION_MAQUINA,VALOR_HORAS' +
        '_CAMBIO ,ML_CAMBIO_COLOR,ML_CAMBIO_BOBINA,ML_CAMBIO_PLANCHA,LONG' +
        'ITUD_BOBINA,'
      
        '  ML_CAMBIO_BOBINA_CTE,ML_PREPARACION,ID_ESC,VALOR_ML_CAMBIO_PLA' +
        'NCHA,GRAMOS_TINTA,GRAMOS_BARNIZ,TIEMPO_PREPARACION,PVP)'
      'VALUES'
      
        '  (?EMPRESA,?N_PRESUPUESTO,?LINEA,?CANTIDAD,?MAQUINA,?TINTA,?ANC' +
        'HO,?AVANCE,?SEPARACION,?FIGURAS,?CAMBIO_BOBINAS,?ARREGLO,?CAMBIO' +
        'S,?ANCHO_BOBINA,?NUMERO_CAJAS,'
      
        '   ?RECURSO,?IMPORTE_RECURSO,?HORAS_PREPARACION_MAQUINA,?VALOR_H' +
        'ORAS_CAMBIO,?ML_CAMBIO_COLOR,?ML_CAMBIO_BOBINA,?ML_CAMBIO_PLANCH' +
        'A,?LONGITUD_BOBINA,'
      
        '   ?ML_CAMBIO_BOBINA_CTE,?ML_PREPARACION,?ID_ESC,?VALOR_ML_CAMBI' +
        'O_PLANCHA,?GRAMOS_TINTA,?GRAMOS_BARNIZ,?TIEMPO_PREPARACION,?PVP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_EMP_PRESUPUESTO_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  N_PRESUPUESTO=?N_PRESUPUESTO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_EMP_PRESUPUESTO_DET'
      'where empresa=?empresa and n_presupuesto=?n_presupueto')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_EMP_PRESUPUESTO_DET'
      'SET'
      '  CANTIDAD=?CANTIDAD '
      '  ,MAQUINA=?MAQUINA '
      '  ,TINTA=?TINTA '
      '  ,ANCHO=?ANCHO '
      '  ,AVANCE=?AVANCE '
      '  ,SEPARACION=?SEPARACION '
      '  ,FIGURAS=?FIGURAS '
      '  ,CAMBIO_BOBINAS=?CAMBIO_BOBINAS '
      '  ,ARREGLO=?ARREGLO '
      '  ,CAMBIOS=?CAMBIOS '
      '  ,ANCHO_BOBINA=?ANCHO_BOBINA '
      '  ,NUMERO_CAJAS=?NUMERO_CAJAS '
      '  ,RECURSO=?RECURSO'
      '  ,IMPORTE_RECURSO=?IMPORTE_RECURSO'
      '  ,HORAS_PREPARACION_MAQUINA=?HORAS_PREPARACION_MAQUINA'
      '  ,VALOR_HORAS_CAMBIO=?VALOR_HORAS_CAMBIO'
      '  ,ML_PREPARACION=?ML_PREPARACION'
      '  ,ML_CAMBIO_COLOR=?ML_CAMBIO_COLOR'
      '  ,ML_CAMBIO_BOBINA=?ML_CAMBIO_BOBINA'
      '  ,LONGITUD_BOBINA=?LONGITUD_BOBINA'
      '  ,ML_CAMBIO_BOBINA_CTE=?ML_CAMBIO_BOBINA_CTE'
      '  ,ID_ESC=?ID_ESC'
      '  ,VALOR_ML_CAMBIO_PLANCHA=?VALOR_ML_CAMBIO_PLANCHA'
      '  ,GRAMOS_TINTA=?GRAMOS_TINTA'
      '  ,GRAMOS_BARNIZ=?GRAMOS_BARNIZ'
      '  ,TIEMPO_PREPARACION=?TIEMPO_PREPARACION'
      '  ,PVP=?PVP'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  N_PRESUPUESTO=?N_PRESUPUESTO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMPresupuesto
    AfterDelete = graba
    AfterOpen = QMDetalleAfterOpen
    AfterPost = graba
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'N_PRESUPUESTO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_EMP_PRESUPUESTO_DET'
    UpdateTransaction = TLocal
    Left = 44
    Top = 68
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleN_PRESUPUESTO: TIntegerField
      DisplayLabel = 'Nro Presupuesto'
      FieldName = 'N_PRESUPUESTO'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetalleMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      OnChange = QMDetalleMAQUINAChange
    end
    object QMDetalleTINTA: TIntegerField
      DisplayLabel = 'Tinta'
      FieldName = 'TINTA'
      OnChange = QMDetalleTINTAChange
    end
    object QMDetalleANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMDetalleAVANCE: TFloatField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object QMDetalleSEPARACION: TFloatField
      DisplayLabel = 'Separacion'
      FieldName = 'SEPARACION'
    end
    object QMDetalleFIGURAS: TFloatField
      DisplayLabel = 'Figuras'
      FieldName = 'FIGURAS'
    end
    object QMDetalleCAMBIO_BOBINAS: TFloatField
      DisplayLabel = 'Cambio Bobinas'
      FieldName = 'CAMBIO_BOBINAS'
    end
    object QMDetalleARREGLO: TFloatField
      DisplayLabel = 'Arreglo'
      FieldName = 'ARREGLO'
    end
    object QMDetalleCAMBIOS: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIOS'
    end
    object QMDetalleANCHO_BOBINA: TFloatField
      DisplayLabel = 'Ancho Bobina'
      FieldName = 'ANCHO_BOBINA'
    end
    object QMDetalleNUMERO_CAJAS: TFloatField
      DisplayLabel = 'Nro. Cajas'
      FieldName = 'NUMERO_CAJAS'
    end
    object QMDetalleANCHO_TOTAL: TFloatField
      DisplayLabel = 'Ancho Total'
      FieldName = 'ANCHO_TOTAL'
    end
    object QMDetalleVALOR_CAMBIO_BOBINA: TFloatField
      DisplayLabel = 'Valor Cambio Bobinas'
      FieldName = 'VALOR_CAMBIO_BOBINA'
    end
    object QMDetalleVALOR_CAMBIO: TFloatField
      DisplayLabel = 'Valor Cambio'
      FieldName = 'VALOR_CAMBIO'
    end
    object QMDetalleM2: TFloatField
      DisplayLabel = 'm2'
      FieldName = 'M2'
    end
    object QMDetalleCAMBIO_COLOR: TFloatField
      DisplayLabel = 'Cambio Color'
      FieldName = 'CAMBIO_COLOR'
    end
    object QMDetalleID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMDetalleHORAS_CAMBIOS: TFloatField
      DisplayLabel = 'Horas Cambios'
      FieldName = 'HORAS_CAMBIOS'
    end
    object QMDetalleCOSTE_CAMBIO_BOBINAS: TFloatField
      DisplayLabel = 'Coste Cambio Bobina'
      FieldName = 'COSTE_CAMBIO_BOBINAS'
    end
    object QMDetalleTOTAL_HORAS: TFloatField
      DisplayLabel = 'Total Horas'
      FieldName = 'TOTAL_HORAS'
    end
    object QMDetallePRECIO_HORAS_IMPRESION: TFloatField
      DisplayLabel = 'Precio Horas Impresion'
      FieldName = 'PRECIO_HORAS_IMPRESION'
    end
    object QMDetalleIMPORTE_RECURSO: TFloatField
      DisplayLabel = 'Importe Recurso'
      FieldName = 'IMPORTE_RECURSO'
    end
    object QMDetalleVALOR_HORAS_CAMBIO: TFloatField
      DisplayLabel = 'Valor Horas Camnio'
      FieldName = 'VALOR_HORAS_CAMBIO'
    end
    object QMDetalleML_TIRAJE: TFloatField
      DisplayLabel = 'ML Tiraje'
      FieldName = 'ML_TIRAJE'
    end
    object QMDetalleML_CAMBIO_BOBINA: TFloatField
      DisplayLabel = 'ML Cambio Bobina'
      FieldName = 'ML_CAMBIO_BOBINA'
    end
    object QMDetalleML_CAMBIO_COLOR: TFloatField
      DisplayLabel = 'ML Cambio Color'
      FieldName = 'ML_CAMBIO_COLOR'
    end
    object QMDetalleML_PREPARACION: TFloatField
      DisplayLabel = 'ML Preparacion'
      FieldName = 'ML_PREPARACION'
    end
    object QMDetalleML_CAMBIO_PLANCHA: TFloatField
      DisplayLabel = 'ML Cambio Plancha'
      FieldName = 'ML_CAMBIO_PLANCHA'
    end
    object QMDetalleLONGITUD_BOBINA: TFloatField
      DisplayLabel = 'Long. Bobina'
      FieldName = 'LONGITUD_BOBINA'
    end
    object QMDetalleML_CAMBIO_BOBINA_CTE: TFloatField
      DisplayLabel = 'ML Cambio Bobina Cte.'
      FieldName = 'ML_CAMBIO_BOBINA_CTE'
    end
    object QMDetalleVALOR_ML_CAMBIO_PLANCHA: TFloatField
      DisplayLabel = 'Valor ML Cambio Plancha'
      FieldName = 'VALOR_ML_CAMBIO_PLANCHA'
    end
    object QMDetalleML_TOTAL: TFloatField
      DisplayLabel = 'ML Total'
      FieldName = 'ML_TOTAL'
    end
    object QMDetalleGRAMOS_TINTA: TFloatField
      DisplayLabel = 'Gramos Tinta'
      FieldName = 'GRAMOS_TINTA'
    end
    object QMDetalleGRAMOS_BARNIZ: TFloatField
      DisplayLabel = 'Gramos Barniz'
      FieldName = 'GRAMOS_BARNIZ'
    end
    object QMDetalleKGS_TINTA: TFloatField
      DisplayLabel = 'Kg. Tinta'
      FieldName = 'KGS_TINTA'
    end
    object QMDetalleKGS_BARNIZ: TFloatField
      DisplayLabel = 'Kg. Barniz'
      FieldName = 'KGS_BARNIZ'
    end
    object QMDetalleHORAS_PREPARACION_MAQUINA: TFloatField
      DisplayLabel = 'Horas Reparacion Maquina'
      FieldName = 'HORAS_PREPARACION_MAQUINA'
    end
    object QMDetalleTIEMPO_PREPARACION: TFloatField
      DisplayLabel = 'Tiempo Reparacion'
      FieldName = 'TIEMPO_PREPARACION'
    end
    object QMDetalleHORAS_IMPRESION: TFloatField
      DisplayLabel = 'Horas Impresion'
      FieldName = 'HORAS_IMPRESION'
    end
    object QMDetalleHORAS_CAMBIO_POLIMEROS: TFloatField
      DisplayLabel = 'Horas Cambio Polimeros'
      FieldName = 'HORAS_CAMBIO_POLIMEROS'
    end
    object QMDetalleHORAS_CAMBIO_BOBINAS: TFloatField
      DisplayLabel = 'Horas Cambio Bobinas'
      FieldName = 'HORAS_CAMBIO_BOBINAS'
    end
    object QMDetalleRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMDetalleRECURSOChange
      Size = 5
    end
    object QMDetallePVP: TFloatField
      DisplayLabel = 'P.V.P.'
      FieldName = 'PVP'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 136
    Top = 64
  end
  object SPLineaSegDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) linea from z_emp_presupuesto_det '
      'where (empresa=?empresa and n_presupuesto=?n_presupuesto)')
    Transaction = TLocal
    AutoTrans = True
    Left = 444
    Top = 232
  end
  object xRecursos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo,importe'
      'from pro_recursos'
      'where (empresa=?empresa)  and recurso=?recurso')
    UniDirectional = False
    DataSource = DSQMPresupuesto
    Left = 226
    Top = 188
    object xRecursosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xRecursosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSxRecursos: TDataSource
    DataSet = xRecursos
    Left = 296
    Top = 189
  end
  object SPBorrarOfertaEscandallo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure z_borra_escandallo_oferta(?empresa,?n_presupue' +
        'sto)')
    Transaction = TLocal
    AutoTrans = True
    Left = 516
    Top = 136
  end
  object Precio_Recurso: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure Pro_Precio_Recurso'
      '  (?EMPRESA,?RECURSO,?FECHA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 224
    Top = 96
  end
  object Tinta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'select cambio_color,gramos_tinta,gramos_barniz,horas_preparacion' +
        ' from z_maquinas_det where empresa=?empresa and'
      'codmaq=?codmaq and tinta=?tinta')
    Transaction = TLocal
    AutoTrans = True
    Left = 284
    Top = 92
  end
  object Constantes: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'select longitud_bobina,ml_cambio_bobina,horas_cambio_bobina from' +
        ' z_eti_constantes where empresa=?empresa ')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 96
  end
  object Maquina: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'select ml_cambio_plancha from z_maquinas_cab where empresa=?empr' +
        'esa and'
      'codmaq=?codmaq ')
    Transaction = TLocal
    AutoTrans = True
    Left = 284
    Top = 140
  end
  object ProMaquina: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select recurso from pro_maquinas_c where empresa=?empresa and'
      'codmaq=?codmaq ')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 144
  end
end
