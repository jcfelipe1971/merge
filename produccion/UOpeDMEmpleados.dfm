object OpeDMEmpleados: TOpeDMEmpleados
  OldCreateOrder = False
  OnCreate = OpeDMEmpleadosCreate
  OnDestroy = DataModuleDestroy
  Left = 686
  Top = 227
  Height = 657
  Width = 684
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 576
    Top = 16
  end
  object QMEmpleados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPLEADO=?old_EMPLEADO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMPLEADOS_CUENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,EMPLEADO,TERCERO,TITULO,PAIS_TERCER' +
        'O,TIPO_DOC_IDENT,NIF,TELEFONO01,TELEFONO02,'#13#10'CATEGORIA,CENTRO,DE' +
        'PARTAMENTO,SECCION,CALENDARIO,N_SEGURIDAD_SOCIAL,TIPO_CONTRATO,I' +
        'NI_CONTRATO,FIN_CONTRATO,FECHA_NACIMIENTO,'#13#10'ESTADO_CIVIL,NOTAS,I' +
        'MAGEN,CODIGO_TARJETA,USUARIO,IMPUTACION,RECURSO,TIPOIMPUTACION,H' +
        'ORARIO,ID_IMAGEN,'#13#10'TIPOTAREA,FORMACION_INI,EXPERIENCIA_PROF,ID_E' +
        'MPLEADO,FORMACIONESPHAB,CODIGO_GESTORIA,CTA_DEVENGO,CTA_RETENCIO' +
        'N,CTA_REMUNERACION,CTA_SEG_SOCIAL,'#13#10'CTA_ANTICIPO,CTA_SEG_SOCIAL_' +
        'EMPRESA,CTA_COBROS_ESPECIE_SOCIO,CTA_ING_SERVICIOS_SOCIALES,CTA_' +
        'COBROS_ESPECIE_AUTONOMO,CTA_CE_RETA,CTA_ICECES,CTA_EMBARGO,CTA_C' +
        'UENTA_CHL,CTA_PRESTAMO_CHL,'#13#10'CTA_LEYES_SOCIALES_CHL,CTA_FONASA_C' +
        'HL,CTA_IMPUESTO_UNICO_CHL,CTA_MUTUAL_CHL,CTA_GASTO_REMUNERACION_' +
        'CHL,CTA_MUTUAL_EMPRESA_CHL,CTA_SEGURO_CESANTIA_CHL,CTA_DESCUADRE' +
        '_CHL,CTA_DEVENGO_PGC,CTA_RETENCION_PGC,'#13#10'CTA_REMUNERACION_PGC,CT' +
        'A_SEG_SOCIAL_PGC,CTA_ANTICIPO_PGC,CTA_SEG_SOCIAL_EMPRESA_PGC,CTA' +
        '_COBROS_ESPECIE_SOCIO_PGC,CTA_ING_SERVICIOS_SOCIALES_PGC,CTA_COB' +
        'ROS_ESPECIE_AUTONOMO_PGC,CTA_CE_RETA_PGC,CTA_ICECES_PGC,CTA_EMBA' +
        'RGO_PGC,'#13#10'CTA_CUENTA_CHL_PGC,CTA_PRESTAMO_CHL_PGC,CTA_LEYES_SOCI' +
        'ALES_CHL_PGC,CTA_FONASA_CHL_PGC,CTA_IMPUESTO_UNICO_CHL_PGC,CTA_M' +
        'UTUAL_CHL_PGC,CTA_GASTO_REMUNERACION_CHL_PGC,CTA_MUTUAL_EMPRESA_' +
        'CHL_PGC,CTA_SEGURO_CESANTIA_CHL_PGC,CTA_DESCUADRE_CHL_PGC,'#13#10'ACTI' +
        'VO,MINUSVALIA,APTO,DIRECCION,DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2,DI' +
        'R_NOMBRE_3,DIR_NUMERO,DIR_BLOQUE_ESCALERA,'#13#10'DIR_PISO,DIR_PUERTA,' +
        'DIR_LOCALIDAD,TITULO_LOCALIDAD,CODIGO_POSTAL,PROVINCIA,PAIS,CLIE' +
        'NTE,TERCERO_CLIENTE,DIRECCION_CLIENTE,'#13#10'BANCO,PAIS_BANCO,ENTIDAD' +
        ',SUCURSAL,CONTROL,CUENTA,IBAN,BIC,GENERO,CONTACTO_NOMBRE,'#13#10'CONTA' +
        'CTO_PARENTESCO,CONTACTO_TELEFONO,EMAIL,FEC_ULTIMA_LLAMADA,SUSPEN' +
        'CION_CONTRATO,CONTRATO_SUSPENDIDO,PAIS_DIRECCION,REGION_DIRECCIO' +
        'N,PROVINCIA_DIRECCION,POBLACION_DIRECCION,'#13#10'CODIGO_POSTAL_DIRECC' +
        'ION,SUELDO_BASE,GRATIFICACION,NACIONALIDAD,AFP,ISAPRE,PLAN_ISAPR' +
        'E,FONASA,FECHA_INGRESO,CAJA_COMPENSACION,'#13#10'COLACION,MOVILIZACION' +
        ',GENERA_GRATIFICACION,APELLIDO_PATERNO,APELLIDO_MATERNO,NOMBRE,J' +
        'ORNADA,TIPO_JORNADA,HORAS,AREA,'#13#10'CENTRO_DE_COSTO,VENCIMIENTO_PLA' +
        'ZO_FIJO,MEDIO_DE_PAGO,TIPO_CUENTA,PROYECTO,LRE,REPAR_EMPRESA_DST' +
        ',REPAR_SERIE_DST)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?EMPLEADO,?TERCERO,?TITULO,?PAIS' +
        '_TERCERO,?TIPO_DOC_IDENT,?NIF,?TELEFONO01,?TELEFONO02,'#13#10'?CATEGOR' +
        'IA,?CENTRO,?DEPARTAMENTO,?SECCION,?CALENDARIO,?N_SEGURIDAD_SOCIA' +
        'L,?TIPO_CONTRATO,?INI_CONTRATO,?FIN_CONTRATO,?FECHA_NACIMIENTO,'#13 +
        #10'?ESTADO_CIVIL,?NOTAS,?IMAGEN,?CODIGO_TARJETA,?USUARIO,?IMPUTACI' +
        'ON,?RECURSO,?TIPOIMPUTACION,?HORARIO,?ID_IMAGEN,'#13#10'?TIPOTAREA,?FO' +
        'RMACION_INI,?EXPERIENCIA_PROF,?ID_EMPLEADO,?FORMACIONESPHAB,?COD' +
        'IGO_GESTORIA,?CTA_DEVENGO,?CTA_RETENCION,?CTA_REMUNERACION,?CTA_' +
        'SEG_SOCIAL,'#13#10'?CTA_ANTICIPO,?CTA_SEG_SOCIAL_EMPRESA,?CTA_COBROS_E' +
        'SPECIE_SOCIO,?CTA_ING_SERVICIOS_SOCIALES,?CTA_COBROS_ESPECIE_AUT' +
        'ONOMO,?CTA_CE_RETA,?CTA_ICECES,?CTA_EMBARGO,?CTA_CUENTA_CHL,?CTA' +
        '_PRESTAMO_CHL,'#13#10'?CTA_LEYES_SOCIALES_CHL,?CTA_FONASA_CHL,?CTA_IMP' +
        'UESTO_UNICO_CHL,?CTA_MUTUAL_CHL,?CTA_GASTO_REMUNERACION_CHL,?CTA' +
        '_MUTUAL_EMPRESA_CHL,?CTA_SEGURO_CESANTIA_CHL,?CTA_DESCUADRE_CHL,' +
        '?CTA_DEVENGO_PGC,?CTA_RETENCION_PGC,'#13#10'?CTA_REMUNERACION_PGC,?CTA' +
        '_SEG_SOCIAL_PGC,?CTA_ANTICIPO_PGC,?CTA_SEG_SOCIAL_EMPRESA_PGC,?C' +
        'TA_COBROS_ESPECIE_SOCIO_PGC,?CTA_ING_SERVICIOS_SOCIALES_PGC,?CTA' +
        '_COBROS_ESPECIE_AUTONOMO_PGC,?CTA_CE_RETA_PGC,?CTA_ICECES_PGC,?C' +
        'TA_EMBARGO_PGC,'#13#10'?CTA_CUENTA_CHL_PGC,?CTA_PRESTAMO_CHL_PGC,?CTA_' +
        'LEYES_SOCIALES_CHL_PGC,?CTA_FONASA_CHL_PGC,?CTA_IMPUESTO_UNICO_C' +
        'HL_PGC,?CTA_MUTUAL_CHL_PGC,?CTA_GASTO_REMUNERACION_CHL_PGC,?CTA_' +
        'MUTUAL_EMPRESA_CHL_PGC,?CTA_SEGURO_CESANTIA_CHL_PGC,?CTA_DESCUAD' +
        'RE_CHL_PGC,'#13#10'?ACTIVO,?MINUSVALIA,?APTO,?DIRECCION,?DIR_TIPO,?DIR' +
        '_NOMBRE,?DIR_NOMBRE_2,?DIR_NOMBRE_3,?DIR_NUMERO,?DIR_BLOQUE_ESCA' +
        'LERA,'#13#10'?DIR_PISO,?DIR_PUERTA,?DIR_LOCALIDAD,?TITULO_LOCALIDAD,?C' +
        'ODIGO_POSTAL,?PROVINCIA,?PAIS,?CLIENTE,?TERCERO_CLIENTE,?DIRECCI' +
        'ON_CLIENTE,'#13#10'?BANCO,?PAIS_BANCO,?ENTIDAD,?SUCURSAL,?CONTROL,?CUE' +
        'NTA,?IBAN,?BIC,?GENERO,?CONTACTO_NOMBRE,'#13#10'?CONTACTO_PARENTESCO,?' +
        'CONTACTO_TELEFONO,?EMAIL,?FEC_ULTIMA_LLAMADA,?SUSPENCION_CONTRAT' +
        'O,?CONTRATO_SUSPENDIDO,?PAIS_DIRECCION,?REGION_DIRECCION,?PROVIN' +
        'CIA_DIRECCION,?POBLACION_DIRECCION,'#13#10'?CODIGO_POSTAL_DIRECCION,?S' +
        'UELDO_BASE,?GRATIFICACION,?NACIONALIDAD,?AFP,?ISAPRE,?PLAN_ISAPR' +
        'E,?FONASA,?FECHA_INGRESO,?CAJA_COMPENSACION,'#13#10'?COLACION,?MOVILIZ' +
        'ACION,?GENERA_GRATIFICACION,?APELLIDO_PATERNO,?APELLIDO_MATERNO,' +
        '?NOMBRE,?JORNADA,?TIPO_JORNADA,?HORAS,?AREA,'#13#10'?CENTRO_DE_COSTO,?' +
        'VENCIMIENTO_PLAZO_FIJO,?MEDIO_DE_PAGO,?TIPO_CUENTA,?PROYECTO,?LR' +
        'E,?REPAR_EMPRESA_DST,?REPAR_SERIE_DST)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMPLEADOS_CUENTAS'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,TITULO=?TITULO '
      '  ,PAIS_TERCERO=?PAIS_TERCERO '
      '  ,TIPO_DOC_IDENT=?TIPO_DOC_IDENT '
      '  ,NIF=?NIF '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,CATEGORIA=?CATEGORIA '
      '  ,CENTRO=?CENTRO '
      '  ,DEPARTAMENTO=?DEPARTAMENTO '
      '  ,SECCION=?SECCION '
      '  ,CALENDARIO=?CALENDARIO '
      '  ,N_SEGURIDAD_SOCIAL=?N_SEGURIDAD_SOCIAL '
      '  ,TIPO_CONTRATO=?TIPO_CONTRATO '
      '  ,INI_CONTRATO=?INI_CONTRATO '
      '  ,FIN_CONTRATO=?FIN_CONTRATO '
      '  ,FECHA_NACIMIENTO=?FECHA_NACIMIENTO '
      '  ,ESTADO_CIVIL=?ESTADO_CIVIL '
      '  ,NOTAS=?NOTAS '
      '  ,IMAGEN=?IMAGEN '
      '  ,CODIGO_TARJETA=?CODIGO_TARJETA '
      '  ,USUARIO=?USUARIO '
      '  ,IMPUTACION=?IMPUTACION '
      '  ,RECURSO=?RECURSO '
      '  ,TIPOIMPUTACION=?TIPOIMPUTACION '
      '  ,HORARIO=?HORARIO '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,FORMACION_INI=?FORMACION_INI '
      '  ,EXPERIENCIA_PROF=?EXPERIENCIA_PROF '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,FORMACIONESPHAB=?FORMACIONESPHAB '
      '  ,CODIGO_GESTORIA=?CODIGO_GESTORIA '
      '  ,CTA_DEVENGO=?CTA_DEVENGO '
      '  ,CTA_RETENCION=?CTA_RETENCION '
      '  ,CTA_REMUNERACION=?CTA_REMUNERACION '
      '  ,CTA_SEG_SOCIAL=?CTA_SEG_SOCIAL '
      '  ,CTA_ANTICIPO=?CTA_ANTICIPO '
      '  ,CTA_SEG_SOCIAL_EMPRESA=?CTA_SEG_SOCIAL_EMPRESA '
      '  ,CTA_COBROS_ESPECIE_SOCIO=?CTA_COBROS_ESPECIE_SOCIO '
      '  ,CTA_ING_SERVICIOS_SOCIALES=?CTA_ING_SERVICIOS_SOCIALES '
      '  ,CTA_COBROS_ESPECIE_AUTONOMO=?CTA_COBROS_ESPECIE_AUTONOMO '
      '  ,CTA_CE_RETA=?CTA_CE_RETA '
      '  ,CTA_ICECES=?CTA_ICECES '
      '  ,CTA_EMBARGO=?CTA_EMBARGO '
      '  ,CTA_CUENTA_CHL=?CTA_CUENTA_CHL '
      '  ,CTA_PRESTAMO_CHL=?CTA_PRESTAMO_CHL '
      '  ,CTA_LEYES_SOCIALES_CHL=?CTA_LEYES_SOCIALES_CHL '
      '  ,CTA_FONASA_CHL=?CTA_FONASA_CHL '
      '  ,CTA_IMPUESTO_UNICO_CHL=?CTA_IMPUESTO_UNICO_CHL '
      '  ,CTA_MUTUAL_CHL=?CTA_MUTUAL_CHL '
      '  ,CTA_GASTO_REMUNERACION_CHL=?CTA_GASTO_REMUNERACION_CHL '
      '  ,CTA_MUTUAL_EMPRESA_CHL=?CTA_MUTUAL_EMPRESA_CHL '
      '  ,CTA_SEGURO_CESANTIA_CHL=?CTA_SEGURO_CESANTIA_CHL '
      '  ,CTA_DESCUADRE_CHL=?CTA_DESCUADRE_CHL '
      '  ,CTA_DEVENGO_PGC=?CTA_DEVENGO_PGC '
      '  ,CTA_RETENCION_PGC=?CTA_RETENCION_PGC '
      '  ,CTA_REMUNERACION_PGC=?CTA_REMUNERACION_PGC '
      '  ,CTA_SEG_SOCIAL_PGC=?CTA_SEG_SOCIAL_PGC '
      '  ,CTA_ANTICIPO_PGC=?CTA_ANTICIPO_PGC '
      '  ,CTA_SEG_SOCIAL_EMPRESA_PGC=?CTA_SEG_SOCIAL_EMPRESA_PGC '
      '  ,CTA_COBROS_ESPECIE_SOCIO_PGC=?CTA_COBROS_ESPECIE_SOCIO_PGC '
      
        '  ,CTA_ING_SERVICIOS_SOCIALES_PGC=?CTA_ING_SERVICIOS_SOCIALES_PG' +
        'C '
      
        '  ,CTA_COBROS_ESPECIE_AUTONOMO_PGC=?CTA_COBROS_ESPECIE_AUTONOMO_' +
        'PGC '
      '  ,CTA_CE_RETA_PGC=?CTA_CE_RETA_PGC '
      '  ,CTA_ICECES_PGC=?CTA_ICECES_PGC '
      '  ,CTA_EMBARGO_PGC=?CTA_EMBARGO_PGC '
      '  ,CTA_CUENTA_CHL_PGC=?CTA_CUENTA_CHL_PGC '
      '  ,CTA_PRESTAMO_CHL_PGC=?CTA_PRESTAMO_CHL_PGC '
      '  ,CTA_LEYES_SOCIALES_CHL_PGC=?CTA_LEYES_SOCIALES_CHL_PGC '
      '  ,CTA_FONASA_CHL_PGC=?CTA_FONASA_CHL_PGC '
      '  ,CTA_IMPUESTO_UNICO_CHL_PGC=?CTA_IMPUESTO_UNICO_CHL_PGC '
      '  ,CTA_MUTUAL_CHL_PGC=?CTA_MUTUAL_CHL_PGC '
      
        '  ,CTA_GASTO_REMUNERACION_CHL_PGC=?CTA_GASTO_REMUNERACION_CHL_PG' +
        'C '
      '  ,CTA_MUTUAL_EMPRESA_CHL_PGC=?CTA_MUTUAL_EMPRESA_CHL_PGC '
      '  ,CTA_SEGURO_CESANTIA_CHL_PGC=?CTA_SEGURO_CESANTIA_CHL_PGC '
      '  ,CTA_DESCUADRE_CHL_PGC=?CTA_DESCUADRE_CHL_PGC '
      '  ,ACTIVO=?ACTIVO '
      '  ,MINUSVALIA=?MINUSVALIA '
      '  ,APTO=?APTO '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_TIPO=?DIR_TIPO '
      '  ,DIR_NOMBRE=?DIR_NOMBRE '
      '  ,DIR_NOMBRE_2=?DIR_NOMBRE_2 '
      '  ,DIR_NOMBRE_3=?DIR_NOMBRE_3 '
      '  ,DIR_NUMERO=?DIR_NUMERO '
      '  ,DIR_BLOQUE_ESCALERA=?DIR_BLOQUE_ESCALERA '
      '  ,DIR_PISO=?DIR_PISO '
      '  ,DIR_PUERTA=?DIR_PUERTA '
      '  ,DIR_LOCALIDAD=?DIR_LOCALIDAD '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,PAIS=?PAIS '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO_CLIENTE=?TERCERO_CLIENTE '
      '  ,DIRECCION_CLIENTE=?DIRECCION_CLIENTE '
      '  ,BANCO=?BANCO '
      '  ,PAIS_BANCO=?PAIS_BANCO '
      '  ,ENTIDAD=?ENTIDAD '
      '  ,SUCURSAL=?SUCURSAL '
      '  ,CONTROL=?CONTROL '
      '  ,CUENTA=?CUENTA '
      '  ,IBAN=?IBAN '
      '  ,BIC=?BIC '
      '  ,GENERO=?GENERO '
      '  ,CONTACTO_NOMBRE=?CONTACTO_NOMBRE '
      '  ,CONTACTO_PARENTESCO=?CONTACTO_PARENTESCO '
      '  ,CONTACTO_TELEFONO=?CONTACTO_TELEFONO '
      '  ,EMAIL=?EMAIL '
      '  ,FEC_ULTIMA_LLAMADA=?FEC_ULTIMA_LLAMADA '
      '  ,SUSPENCION_CONTRATO=?SUSPENCION_CONTRATO '
      '  ,CONTRATO_SUSPENDIDO=?CONTRATO_SUSPENDIDO '
      '  ,PAIS_DIRECCION=?PAIS_DIRECCION '
      '  ,REGION_DIRECCION=?REGION_DIRECCION '
      '  ,PROVINCIA_DIRECCION=?PROVINCIA_DIRECCION '
      '  ,POBLACION_DIRECCION=?POBLACION_DIRECCION '
      '  ,CODIGO_POSTAL_DIRECCION=?CODIGO_POSTAL_DIRECCION '
      '  ,SUELDO_BASE=?SUELDO_BASE '
      '  ,GRATIFICACION=?GRATIFICACION '
      '  ,NACIONALIDAD=?NACIONALIDAD '
      '  ,AFP=?AFP '
      '  ,ISAPRE=?ISAPRE '
      '  ,PLAN_ISAPRE=?PLAN_ISAPRE '
      '  ,FONASA=?FONASA '
      '  ,FECHA_INGRESO=?FECHA_INGRESO '
      '  ,CAJA_COMPENSACION=?CAJA_COMPENSACION '
      '  ,COLACION=?COLACION '
      '  ,MOVILIZACION=?MOVILIZACION '
      '  ,GENERA_GRATIFICACION=?GENERA_GRATIFICACION '
      '  ,APELLIDO_PATERNO=?APELLIDO_PATERNO '
      '  ,APELLIDO_MATERNO=?APELLIDO_MATERNO '
      '  ,NOMBRE=?NOMBRE '
      '  ,JORNADA=?JORNADA '
      '  ,TIPO_JORNADA=?TIPO_JORNADA '
      '  ,HORAS=?HORAS '
      '  ,AREA=?AREA '
      '  ,CENTRO_DE_COSTO=?CENTRO_DE_COSTO '
      '  ,VENCIMIENTO_PLAZO_FIJO=?VENCIMIENTO_PLAZO_FIJO '
      '  ,MEDIO_DE_PAGO=?MEDIO_DE_PAGO '
      '  ,TIPO_CUENTA=?TIPO_CUENTA '
      '  ,PROYECTO=?PROYECTO '
      '  ,LRE=?LRE '
      '  ,REPAR_EMPRESA_DST=?REPAR_EMPRESA_DST '
      '  ,REPAR_SERIE_DST=?REPAR_SERIE_DST '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO ')
    AfterDelete = QMEmpleadosAfterDelete
    AfterOpen = QMEmpleadosAfterOpen
    BeforeClose = QMEmpleadosBeforeClose
    BeforePost = QMEmpleadosBeforePost
    OnNewRecord = QMEmpleadosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'EMPLEADO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMPLEADOS_CUENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMEmpleadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpleadosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpleadosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
      OnChange = QMEmpleadosEMPLEADOChange
    end
    object QMEmpleadosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMEmpleadosTERCEROChange
    end
    object QMEmpleadosCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMEmpleadosCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object QMEmpleadosDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMEmpleadosSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMEmpleadosCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMEmpleadosN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro. Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object QMEmpleadosTIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Tipo contrato'
      FieldName = 'TIPO_CONTRATO'
      Size = 3
    end
    object QMEmpleadosINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Ini. Contrato'
      FieldName = 'INI_CONTRATO'
    end
    object QMEmpleadosFIN_CONTRATO: TDateTimeField
      DisplayLabel = 'Fin Contrato'
      FieldName = 'FIN_CONTRATO'
    end
    object QMEmpleadosFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object QMEmpleadosESTADO_CIVIL: TFIBStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object QMEmpleadosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMEmpleadosIMAGEN: TMemoField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
      BlobType = ftMemo
      Size = 8
    end
    object QMEmpleadosCODIGO_TARJETA: TFIBStringField
      DisplayLabel = 'C'#243'digo Tarjeta'
      FieldName = 'CODIGO_TARJETA'
      Size = 25
    end
    object QMEmpleadosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMEmpleadosIMPUTACION: TIntegerField
      DisplayLabel = 'Imputaci'#243'n'
      FieldName = 'IMPUTACION'
      OnChange = QMEmpleadosIMPUTACIONChange
    end
    object QMEmpleadosRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMEmpleadosRECURSOChange
      Size = 5
    end
    object QMEmpleadosTIPOIMPUTACION: TIntegerField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPOIMPUTACION'
    end
    object QMEmpleadosHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMEmpleadosID_IMAGEN: TIntegerField
      DisplayLabel = 'ID Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object QMEmpleadosDescTercero: TStringField
      DisplayLabel = 'Nombre Tercero'
      FieldKind = fkCalculated
      FieldName = 'DescTercero'
      OnGetText = QMEmpleadosDescTerceroGetText
      Size = 60
      Calculated = True
    end
    object QMEmpleadosTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMEmpleadosFORMACION_INI: TBlobField
      DisplayLabel = 'Formaci'#243'n Ini.'
      FieldName = 'FORMACION_INI'
      Size = 8
    end
    object QMEmpleadosEXPERIENCIA_PROF: TBlobField
      DisplayLabel = 'Experiencia Prof.'
      FieldName = 'EXPERIENCIA_PROF'
      Size = 8
    end
    object QMEmpleadosFORMACIONESPHAB: TBlobField
      DisplayLabel = 'Formacion Especial/Habilidades'
      FieldName = 'FORMACIONESPHAB'
      Size = 8
    end
    object QMEmpleadosID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMEmpleadosCTA_DEVENGO: TFIBStringField
      DisplayLabel = 'Cta. Devengo'
      FieldName = 'CTA_DEVENGO'
      Size = 15
    end
    object QMEmpleadosCTA_RETENCION: TFIBStringField
      DisplayLabel = 'Cta. Retenci'#243'n'
      FieldName = 'CTA_RETENCION'
      Size = 15
    end
    object QMEmpleadosCTA_REMUNERACION: TFIBStringField
      DisplayLabel = 'Cta. Remuneracion'
      FieldName = 'CTA_REMUNERACION'
      Size = 15
    end
    object QMEmpleadosCTA_SEG_SOCIAL: TFIBStringField
      DisplayLabel = 'Cta. Seg. Social'
      FieldName = 'CTA_SEG_SOCIAL'
      Size = 15
    end
    object QMEmpleadosCTA_ANTICIPO: TFIBStringField
      DisplayLabel = 'Cta. Anticipo'
      FieldName = 'CTA_ANTICIPO'
      Size = 15
    end
    object QMEmpleadosCTA_EMBARGO: TFIBStringField
      DisplayLabel = 'Cta. Embargo'
      FieldName = 'CTA_EMBARGO'
      Size = 15
    end
    object QMEmpleadosCTA_DEVENGO_PGC: TIntegerField
      DisplayLabel = 'Cta. Devengo PGC'
      FieldName = 'CTA_DEVENGO_PGC'
    end
    object QMEmpleadosCTA_RETENCION_PGC: TIntegerField
      DisplayLabel = 'Cta. Retenci'#243'n PGC'
      FieldName = 'CTA_RETENCION_PGC'
    end
    object QMEmpleadosCTA_REMUNERACION_PGC: TIntegerField
      DisplayLabel = 'Cta. Remuneracion PGC'
      FieldName = 'CTA_REMUNERACION_PGC'
    end
    object QMEmpleadosCTA_SEG_SOCIAL_PGC: TIntegerField
      DisplayLabel = 'Cta. Seg. Social PGC'
      FieldName = 'CTA_SEG_SOCIAL_PGC'
    end
    object QMEmpleadosCTA_ANTICIPO_PGC: TIntegerField
      DisplayLabel = 'Cta. Anticipo PGC'
      FieldName = 'CTA_ANTICIPO_PGC'
    end
    object QMEmpleadosCTA_EMBARGO_PGC: TIntegerField
      DisplayLabel = 'Cta. Embargo PGC'
      FieldName = 'CTA_EMBARGO_PGC'
    end
    object QMEmpleadosTITULO: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEmpleadosCTA_SEG_SOCIAL_EMPRESA: TFIBStringField
      DisplayLabel = 'Cta. Seg. Social Empresa'
      FieldName = 'CTA_SEG_SOCIAL_EMPRESA'
      Size = 15
    end
    object QMEmpleadosCTA_SEG_SOCIAL_EMPRESA_PGC: TIntegerField
      DisplayLabel = 'Cta. Seg. Social Empresa PGC'
      FieldName = 'CTA_SEG_SOCIAL_EMPRESA_PGC'
    end
    object QMEmpleadosNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMEmpleadosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel'#233'fono 1'
      FieldName = 'TELEFONO01'
    end
    object QMEmpleadosTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel'#233'fono 2'
      FieldName = 'TELEFONO02'
    end
    object QMEmpleadosCODIGO_GESTORIA: TFIBStringField
      DisplayLabel = 'Cod. Gestoria'
      FieldName = 'CODIGO_GESTORIA'
      Size = 25
    end
    object QMEmpleadosCTA_COBROS_ESPECIE_SOCIO: TFIBStringField
      DisplayLabel = 'Cta. Cobr. Esp. Socio'
      FieldName = 'CTA_COBROS_ESPECIE_SOCIO'
      Size = 15
    end
    object QMEmpleadosCTA_ING_SERVICIOS_SOCIALES: TFIBStringField
      DisplayLabel = 'Cta. Ing. Serv. Soc.'
      FieldName = 'CTA_ING_SERVICIOS_SOCIALES'
      Size = 15
    end
    object QMEmpleadosCTA_CE_RETA: TFIBStringField
      DisplayLabel = 'Cta. CE RETA'
      FieldName = 'CTA_CE_RETA'
      Size = 15
    end
    object QMEmpleadosCTA_ICECES: TFIBStringField
      DisplayLabel = 'Cta. ICECES'
      FieldName = 'CTA_ICECES'
      Size = 15
    end
    object QMEmpleadosCTA_COBROS_ESPECIE_SOCIO_PGC: TIntegerField
      DisplayLabel = 'Cta. Cobr. Esp. Socio PGC'
      FieldName = 'CTA_COBROS_ESPECIE_SOCIO_PGC'
    end
    object QMEmpleadosCTA_ING_SERVICIOS_SOCIALES_PGC: TIntegerField
      DisplayLabel = 'Cta. Ing. Serv. Soc. PGC'
      FieldName = 'CTA_ING_SERVICIOS_SOCIALES_PGC'
    end
    object QMEmpleadosCTA_CE_RETA_PGC: TIntegerField
      DisplayLabel = 'Cta. CE RETA PGC'
      FieldName = 'CTA_CE_RETA_PGC'
    end
    object QMEmpleadosCTA_ICECES_PGC: TIntegerField
      DisplayLabel = 'Cta. ICECES PGC'
      FieldName = 'CTA_ICECES_PGC'
    end
    object QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO: TFIBStringField
      DisplayLabel = 'Cta. Cobr. Esp. Autonomo'
      FieldName = 'CTA_COBROS_ESPECIE_AUTONOMO'
      Size = 15
    end
    object QMEmpleadosCTA_COBROS_ESPECIE_AUTONOMO_PGC: TIntegerField
      DisplayLabel = 'Cta. Cobr. Esp. Autonomo PGC'
      FieldName = 'CTA_COBROS_ESPECIE_AUTONOMO_PGC'
    end
    object QMEmpleadosMINUSVALIA: TIntegerField
      DisplayLabel = 'Minusvalia'
      FieldName = 'MINUSVALIA'
    end
    object QMEmpleadosAPTO: TIntegerField
      DisplayLabel = 'Apto'
      FieldName = 'APTO'
    end
    object QMEmpleadosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMEmpleadosCLIENTEChange
    end
    object QMEmpleadosTERCERO_CLIENTE: TIntegerField
      DisplayLabel = 'Terc. Cliente'
      FieldName = 'TERCERO_CLIENTE'
    end
    object QMEmpleadosDIRECCION_CLIENTE: TIntegerField
      DisplayLabel = 'Dir. Cliente'
      FieldName = 'DIRECCION_CLIENTE'
    end
    object QMEmpleadosPAIS_TERCERO: TFIBStringField
      DisplayLabel = 'Pais Documento'
      FieldName = 'PAIS_TERCERO'
      Size = 3
    end
    object QMEmpleadosTIPO_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object QMEmpleadosDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMEmpleadosDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir. Nombre 1'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMEmpleadosDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. Nombre 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMEmpleadosDIR_NOMBRE_3: TFIBStringField
      DisplayLabel = 'Dir. Nombre 3'
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object QMEmpleadosDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object QMEmpleadosDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloque/Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object QMEmpleadosDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object QMEmpleadosDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object QMEmpleadosDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      OnChange = QMEmpleadosDIR_LOCALIDADChange
      Size = 8
    end
    object QMEmpleadosTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Tit. Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object QMEmpleadosCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMEmpleadosPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      DisplayWidth = 40
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMEmpleadosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMEmpleadosDIR_TIPO: TFIBStringField
      DisplayLabel = 'Dir. Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object QMEmpleadosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMEmpleadosENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object QMEmpleadosSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object QMEmpleadosCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object QMEmpleadosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
    end
    object QMEmpleadosIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object QMEmpleadosBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object QMEmpleadosGENERO: TFIBStringField
      DisplayLabel = 'Genero'
      FieldName = 'GENERO'
      Size = 1
    end
    object QMEmpleadosCONTACTO_NOMBRE: TFIBStringField
      DisplayLabel = 'Contacto Nombre'
      FieldName = 'CONTACTO_NOMBRE'
      Size = 256
    end
    object QMEmpleadosCONTACTO_PARENTESCO: TFIBStringField
      DisplayLabel = 'Contacto Parentesco'
      FieldName = 'CONTACTO_PARENTESCO'
      Size = 256
    end
    object QMEmpleadosCONTACTO_TELEFONO: TFIBStringField
      DisplayLabel = 'Contacto Telefono'
      FieldName = 'CONTACTO_TELEFONO'
    end
    object QMEmpleadosEMAIL: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMEmpleadosFEC_ULTIMA_LLAMADA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Llamada'
      FieldName = 'FEC_ULTIMA_LLAMADA'
    end
    object QMEmpleadosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEmpleadosSUSPENCION_CONTRATO: TDateTimeField
      DisplayLabel = 'Fec. Susp. Contato'
      FieldName = 'SUSPENCION_CONTRATO'
    end
    object QMEmpleadosCONTRATO_SUSPENDIDO: TIntegerField
      DisplayLabel = 'Contr. Suspendido'
      FieldName = 'CONTRATO_SUSPENDIDO'
    end
    object QMEmpleadosPAIS_DIRECCION: TFIBStringField
      DisplayLabel = 'Pais Dir.'
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object QMEmpleadosREGION_DIRECCION: TFIBStringField
      DisplayLabel = 'Region Dir.'
      FieldName = 'REGION_DIRECCION'
      Size = 15
    end
    object QMEmpleadosPOBLACION_DIRECCION: TFIBStringField
      DisplayLabel = 'Poblacion Dir.'
      FieldName = 'POBLACION_DIRECCION'
      OnChange = QMEmpleadosPOBLACION_DIRECCIONChange
      Size = 15
    end
    object QMEmpleadosCODIGO_POSTAL_DIRECCION: TFIBStringField
      DisplayLabel = 'Cod. Postal Dir.'
      FieldName = 'CODIGO_POSTAL_DIRECCION'
      Size = 10
    end
    object QMEmpleadosPROVINCIA_DIRECCION: TFIBStringField
      DisplayLabel = 'Provincia Dir.'
      FieldName = 'PROVINCIA_DIRECCION'
      Size = 2
    end
    object QMEmpleadosSUELDO_BASE: TFloatField
      DisplayLabel = 'S. Base'
      FieldName = 'SUELDO_BASE'
    end
    object QMEmpleadosGRATIFICACION: TFloatField
      DisplayLabel = 'Gratificacion'
      FieldName = 'GRATIFICACION'
    end
    object QMEmpleadosNACIONALIDAD: TFIBStringField
      DisplayLabel = 'Nacionalidad'
      FieldName = 'NACIONALIDAD'
      Size = 15
    end
    object QMEmpleadosAFP: TFIBStringField
      DisplayLabel = 'A.F.P.'
      FieldName = 'AFP'
      Size = 15
    end
    object QMEmpleadosISAPRE: TFIBStringField
      FieldName = 'ISAPRE'
      Size = 15
    end
    object QMEmpleadosPLAN_ISAPRE: TFloatField
      DisplayLabel = 'Plan ISAPRE'
      FieldName = 'PLAN_ISAPRE'
      OnGetText = QMEmpleadosPLAN_ISAPREGetText
    end
    object QMEmpleadosFONASA: TFloatField
      FieldName = 'FONASA'
    end
    object QMEmpleadosFECHA_INGRESO: TDateTimeField
      DisplayLabel = 'Fec. Ingreso'
      FieldName = 'FECHA_INGRESO'
    end
    object QMEmpleadosCAJA_COMPENSACION: TFIBStringField
      DisplayLabel = 'Caja Compensacion'
      FieldName = 'CAJA_COMPENSACION'
      Size = 15
    end
    object QMEmpleadosCOLACION: TFloatField
      DisplayLabel = 'Colacion'
      FieldName = 'COLACION'
    end
    object QMEmpleadosMOVILIZACION: TFloatField
      DisplayLabel = 'Movilizacion'
      FieldName = 'MOVILIZACION'
    end
    object QMEmpleadosGENERA_GRATIFICACION: TIntegerField
      DisplayLabel = 'Genera Gratificacion'
      FieldName = 'GENERA_GRATIFICACION'
    end
    object QMEmpleadosAPELLIDO_PATERNO: TFIBStringField
      DisplayLabel = 'Apellido Paterno'
      FieldName = 'APELLIDO_PATERNO'
      Size = 40
    end
    object QMEmpleadosAPELLIDO_MATERNO: TFIBStringField
      DisplayLabel = 'Apellido Materno'
      FieldName = 'APELLIDO_MATERNO'
      Size = 40
    end
    object QMEmpleadosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object QMEmpleadosJORNADA: TIntegerField
      DisplayLabel = 'Jornada'
      FieldName = 'JORNADA'
    end
    object QMEmpleadosTIPO_JORNADA: TIntegerField
      DisplayLabel = 'Tipo Jornada'
      FieldName = 'TIPO_JORNADA'
    end
    object QMEmpleadosHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object QMEmpleadosAREA: TIntegerField
      DisplayLabel = 'Area'
      FieldName = 'AREA'
    end
    object QMEmpleadosCENTRO_DE_COSTO: TIntegerField
      DisplayLabel = 'Centro de Costo'
      FieldName = 'CENTRO_DE_COSTO'
    end
    object QMEmpleadosVENCIMIENTO_PLAZO_FIJO: TDateTimeField
      DisplayLabel = 'Venc. Plazo Fijo'
      FieldName = 'VENCIMIENTO_PLAZO_FIJO'
    end
    object QMEmpleadosMEDIO_DE_PAGO: TFIBStringField
      DisplayLabel = 'Medio de Pago'
      FieldName = 'MEDIO_DE_PAGO'
      Size = 3
    end
    object QMEmpleadosTIPO_CUENTA: TIntegerField
      DisplayLabel = 'Tipos de Cuentas'
      FieldName = 'TIPO_CUENTA'
    end
    object QMEmpleadosCTA_CUENTA_CHL: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CTA_CUENTA_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_PRESTAMO_CHL: TFIBStringField
      DisplayLabel = 'Cuenta Pr'#233'stamo'
      FieldName = 'CTA_PRESTAMO_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_LEYES_SOCIALES_CHL: TFIBStringField
      DisplayLabel = 'Cuenta Leyes Sociales'
      FieldName = 'CTA_LEYES_SOCIALES_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_FONASA_CHL: TFIBStringField
      DisplayLabel = 'Cuenta Fonasa'
      FieldName = 'CTA_FONASA_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_PRESTAMO_CHL_PGC: TIntegerField
      DisplayLabel = 'Cuenta Prestamo PGC'
      FieldName = 'CTA_PRESTAMO_CHL_PGC'
    end
    object QMEmpleadosCTA_CUENTA_CHL_PGC: TIntegerField
      DisplayLabel = 'Cuenta PGC'
      FieldName = 'CTA_CUENTA_CHL_PGC'
    end
    object QMEmpleadosCTA_LEYES_SOCIALES_CHL_PGC: TIntegerField
      DisplayLabel = 'Cuenta Leyes Sociales PGC'
      FieldName = 'CTA_LEYES_SOCIALES_CHL_PGC'
    end
    object QMEmpleadosCTA_FONASA_CHL_PGC: TIntegerField
      DisplayLabel = 'Cuenta Fonasa PGC'
      FieldName = 'CTA_FONASA_CHL_PGC'
    end
    object QMEmpleadosCTA_IMPUESTO_UNICO_CHL: TFIBStringField
      DisplayLabel = 'Cuenta Impuesto Unico'
      FieldName = 'CTA_IMPUESTO_UNICO_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_MUTUAL_CHL: TFIBStringField
      DisplayLabel = 'Cuenta Mutual'
      FieldName = 'CTA_MUTUAL_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_IMPUESTO_UNICO_CHL_PGC: TIntegerField
      DisplayLabel = 'Cuenta Impuesto Unico PGC'
      FieldName = 'CTA_IMPUESTO_UNICO_CHL_PGC'
    end
    object QMEmpleadosCTA_MUTUAL_CHL_PGC: TIntegerField
      DisplayLabel = 'Cuenta Mutual PGC'
      FieldName = 'CTA_MUTUAL_CHL_PGC'
    end
    object QMEmpleadosCTA_GASTO_REMUNERACION_CHL: TFIBStringField
      DisplayLabel = 'Gasto Remuneraci'#243'n'
      FieldName = 'CTA_GASTO_REMUNERACION_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_MUTUAL_EMPRESA_CHL: TFIBStringField
      DisplayLabel = 'Mutual Empresa'
      FieldName = 'CTA_MUTUAL_EMPRESA_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_SEGURO_CESANTIA_CHL: TFIBStringField
      DisplayLabel = 'Seguro Cesant'#237'a'
      FieldName = 'CTA_SEGURO_CESANTIA_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_DESCUADRE_CHL: TFIBStringField
      DisplayLabel = 'Descuadre'
      FieldName = 'CTA_DESCUADRE_CHL'
      Size = 15
    end
    object QMEmpleadosCTA_GASTO_REMUNERACION_CHL_PGC: TIntegerField
      DisplayLabel = 'Gasto remuneraci'#243'n PGC'
      FieldName = 'CTA_GASTO_REMUNERACION_CHL_PGC'
    end
    object QMEmpleadosCTA_MUTUAL_EMPRESA_CHL_PGC: TIntegerField
      DisplayLabel = 'Mutual Empresa PGC'
      FieldName = 'CTA_MUTUAL_EMPRESA_CHL_PGC'
    end
    object QMEmpleadosCTA_SEGURO_CESANTIA_CHL_PGC: TIntegerField
      DisplayLabel = 'Seguro Cesant'#237'a  PGC'
      FieldName = 'CTA_SEGURO_CESANTIA_CHL_PGC'
    end
    object QMEmpleadosCTA_DESCUADRE_CHL_PGC: TIntegerField
      DisplayLabel = 'Descuadre PGC'
      FieldName = 'CTA_DESCUADRE_CHL_PGC'
    end
    object QMEmpleadosPAIS_BANCO: TFIBStringField
      DisplayLabel = 'Pais Banco'
      FieldName = 'PAIS_BANCO'
      Size = 3
    end
    object QMEmpleadosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMEmpleadosLRE: TFIBStringField
      FieldName = 'LRE'
      Size = 15
    end
    object QMEmpleadosREPAR_EMPRESA_DST: TIntegerField
      DisplayLabel = 'Empr. Dst. Reparacion'
      FieldName = 'REPAR_EMPRESA_DST'
    end
    object QMEmpleadosREPAR_SERIE_DST: TFIBStringField
      DisplayLabel = 'Serie Dst. Reparacion'
      FieldName = 'REPAR_SERIE_DST'
      Size = 10
    end
  end
  object DSQMEmpleados: TDataSource
    DataSet = QMEmpleados
    Left = 120
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_EMPLEADO_PRE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  IMPUTACION=?old_IMPUTACION AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_EMPLEADO_PRE'
      
        '  (EMPRESA,EMPLEADO,IMPUTACION,LINEA,DESCRIPCION,IMPORTE,FECHA_I' +
        'NI,FECHA_FIN,ACTIVO)'
      'VALUES'
      
        '  (?EMPRESA,?EMPLEADO,?IMPUTACION,?LINEA,?DESCRIPCION,?IMPORTE,?' +
        'FECHA_INI,?FECHA_FIN,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_EMPLEADO_PRE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  IMPUTACION=?IMPUTACION AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_EMPLEADO_PRE'
      'where empresa=?empresa and empleado=?empleado'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_EMPLEADO_PRE'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IMPORTE=?IMPORTE '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,ACTIVO=?ACTIVO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  IMPUTACION=?IMPUTACION AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleados
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'IMPUTACION '
      'EMPLEADO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_EMPLEADO_PRE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMDetalleIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputaci'#243'n'
      FieldName = 'IMPUTACION'
      OnChange = QMDetalleIMPUTACIONChange
      Size = 3
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMDetalleIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMDetalleFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INI'
    end
    object QMDetalleFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMDetalleACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMDetalleHoras: TIntegerField
      DisplayLabel = 'Horas'
      FieldKind = fkCalculated
      FieldName = 'HORAS'
      Calculated = True
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 64
  end
  object frEmpleados: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de empleados'
    RebuildPrinter = False
    OnGetValue = frEmpleadosGetValue
    OnBeforePrint = frEmpleadosEnterRect
    OnEnterRect = frEmpleadosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 344
    Top = 16
    ReportForm = {19000000}
  end
  object frDBQMDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 224
    Top = 64
  end
  object xRecurso: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_RECURSOS'
      'WHERE'
      '  RECURSO=?old_RECURSO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_RECURSOS'
      '  (EMPRESA,RECURSO,TITULO,UNIDAD,TIPORECURSO,IMPORTE)'
      'VALUES'
      '  (?EMPRESA,?RECURSO,?TITULO,?UNIDAD,?TIPORECURSO,?IMPORTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_RECURSOS'
      'WHERE'
      '  RECURSO=?RECURSO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_RECURSOS'
      'Where Empresa=?Empresa and Recurso=?Recurso')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_RECURSOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,UNIDAD=?UNIDAD '
      '  ,TIPORECURSO=?TIPORECURSO '
      '  ,IMPORTE=?IMPORTE '
      'WHERE'
      '  RECURSO=?RECURSO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleados
    ClavesPrimarias.Strings = (
      'RECURSO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_RECURSOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 576
    Top = 160
    object xRecursoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecursoRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object xRecursoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xRecursoUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object xRecursoTIPORECURSO: TFIBStringField
      DisplayLabel = 'Tipo Curso'
      FieldName = 'TIPORECURSO'
      Size = 3
    end
    object xRecursoIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object xImputacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion,imputacion from ope_sys_imputacion'
      'where imputacion=?imputacion')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 32
    Top = 160
    object xImputacionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xImputacionIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
  end
  object QMTipoImputacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from ope_empleado_pre'
      
        'where empresa=?empresa and empleado=?empleado and linea=?imputac' +
        'ion'
      '')
    UniDirectional = False
    DataSource = DSQMEmpleados
    Left = 32
    Top = 352
    object QMTipoImputacionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSQMTImputacion: TDataSource
    DataSet = QMTipoImputacion
    Left = 120
    Top = 352
  end
  object xTipoImputacionH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select impu.tipo_imputacion,timputa.horas '
      'from ope_sys_imputacion impu'
      
        'join ope_sys_tipos_imputacion timputa on (impu.tipo_imputacion=t' +
        'imputa.tipo_imputacion) '
      'where impu.imputacion=?imputacion')
    UniDirectional = False
    Left = 576
    Top = 112
    object xTipoImputacionHTIPO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPO_IMPUTACION'
      Size = 3
    end
    object xTipoImputacionHHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
  end
  object DSxImputacion: TDataSource
    DataSet = xImputacion
    Left = 120
    Top = 160
  end
  object QMFormacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_EMPLEADO_FORMACION'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_EMPLEADO_FORMACION'
      
        '  (EMPRESA,EMPLEADO,LINEA,FECHA,CURSO,LUGAR,EVALUACION,COSTE,ISO' +
        '_APROBADO,ISO_VERIFICADO,ISO_VALIDADO)'
      'VALUES'
      
        '  (?EMPRESA,?EMPLEADO,?LINEA,?FECHA,?CURSO,?LUGAR,?EVALUACION,?C' +
        'OSTE,?ISO_APROBADO,?ISO_VERIFICADO,?ISO_VALIDADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_EMPLEADO_FORMACION'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_EMPLEADO_FORMACION'
      'where empresa=?empresa and empleado=?empleado'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_EMPLEADO_FORMACION'
      'SET'
      '  FECHA=?FECHA '
      '  ,CURSO=?CURSO '
      '  ,LUGAR=?LUGAR '
      '  ,EVALUACION=?EVALUACION '
      '  ,COSTE=?COSTE '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleados
    OnNewRecord = QMFormacionNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'EMPLEADO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_EMPLEADO_FORMACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 208
    object QMFormacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFormacionEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMFormacionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFormacionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMFormacionCURSO: TIntegerField
      DisplayLabel = 'Curso'
      FieldName = 'CURSO'
      OnChange = QMFormacionCURSOChange
    end
    object QMFormacionLUGAR: TFIBStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR'
      Size = 60
    end
    object QMFormacionEVALUACION: TIntegerField
      DisplayLabel = 'Evaluacion'
      FieldName = 'EVALUACION'
    end
    object QMFormacionCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMFormacionISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QMFormacionISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMFormacionISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMFormacionDescCurso: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescCurso'
      OnGetText = QMFormacionDescCursoGetText
      Size = 60
      Calculated = True
    end
  end
  object DSFormacion: TDataSource
    DataSet = QMFormacion
    Left = 120
    Top = 208
  end
  object xDescCurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM iso_cursos'
      'where id_curso=?curso')
    UniDirectional = False
    DataSource = DSFormacion
    Left = 32
    Top = 256
    object xDescCursoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSDescCurso: TDataSource
    DataSet = xDescCurso
    Left = 120
    Top = 256
  end
  object frFormacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de formaci'#243'n'
    RebuildPrinter = False
    OnGetValue = frFormacionGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 344
    Top = 64
    ReportForm = {19000000}
  end
  object frDBQMFormacion: TfrDBDataSet
    DataSource = DSFormacion
    Left = 224
    Top = 208
  end
  object xDireccionEmp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * '
      'FROM SYS_TERCEROS te '
      'JOIN SYS_TERCEROS_DIRECCIONES di ON (te.TERCERO=di.TERCERO)'
      'JOIN SYS_LOCALIDADES LOC ON (DI.ID_LOCAL = LOC.ID_LOCAL)'
      'WHERE di.dir_defecto = 1 and te.tercero=?tercero')
    UniDirectional = False
    DataSource = DSQMEmpleados
    Left = 32
    Top = 400
    object xDireccionEmpTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDireccionEmpNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDireccionEmpNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xDireccionEmpTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xDireccionEmpNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xDireccionEmpFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xDireccionEmpNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xDireccionEmpTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xDireccionEmpTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xDireccionEmpTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xDireccionEmpEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xDireccionEmpWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xDireccionEmpIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object xDireccionEmpTERCERO1: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO1'
    end
    object xDireccionEmpDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xDireccionEmpDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xDireccionEmpDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xDireccionEmpDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xDireccionEmpDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xDireccionEmpDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xDireccionEmpDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xDireccionEmpDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xDireccionEmpDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDireccionEmpDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xDireccionEmpDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xDireccionEmpDIR_CLASE: TIntegerField
      DisplayLabel = 'Clase'
      FieldName = 'DIR_CLASE'
    end
    object xDireccionEmpDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object xDireccionEmpDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object xDireccionEmpDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
    object xDireccionEmpDIR_DEFECTO: TIntegerField
      DisplayLabel = 'Dir. Defecto'
      FieldName = 'DIR_DEFECTO'
    end
    object xDireccionEmpID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object xDireccionEmpLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xDireccionEmpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xDireccionEmpCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xDireccionEmpPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xDireccionEmpPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object xDireccionEmpID_LOCAL1: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_LOCAL1'
    end
  end
  object DSxDireccionEmp: TDataSource
    DataSet = xDireccionEmp
    Left = 120
    Top = 400
  end
  object frLstResumenEmpl: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado resumen de empleados'
    RebuildPrinter = False
    OnGetValue = frLstResumenEmplGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 344
    Top = 112
    ReportForm = {19000000}
  end
  object frDBLstResumenEmpl: TfrDBDataSet
    DataSource = DSQMEmpleados
    Left = 224
    Top = 16
  end
  object xVerCursoEmpl: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM ISO_VER_EMPL_CURSOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'ID_CURSO = :ID_CURSO AND '
      'ID_EMPLEADO = :ID_EMPLEADO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ISO_VER_EMPL_CURSOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ID_EMPLEADO = :EMPLEADO'
      'ORDER BY FECHA_INICIO')
    UniDirectional = False
    DataSource = DSQMEmpleados
    Left = 32
    Top = 304
    object xVerCursoEmplEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerCursoEmplEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerCursoEmplID_CURSO: TIntegerField
      DisplayLabel = 'ID Curso'
      FieldName = 'ID_CURSO'
    end
    object xVerCursoEmplID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xVerCursoEmplTITULO_EMPL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_EMPL'
      Size = 60
    end
    object xVerCursoEmplDESC_CURSO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n Curso'
      FieldName = 'DESC_CURSO'
      Size = 100
    end
    object xVerCursoEmplRESULTADO: TIntegerField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
    end
    object xVerCursoEmplDESC_RESULTADO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESC_RESULTADO'
      Size = 40
    end
    object xVerCursoEmplFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object xVerCursoEmplFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
  end
  object DSxVerCursoEmpl: TDataSource
    DataSet = xVerCursoEmpl
    Left = 120
    Top = 304
  end
  object frDBVerCursos: TfrDBDataSet
    DataSource = DSxVerCursoEmpl
    Left = 224
    Top = 304
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 576
    Top = 64
  end
  object xSecciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_EMPLEADO_SECCIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  SECCION=?old_SECCION ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_EMPLEADO_SECCIONES'
      '  (EMPLEADO,ID_EMPLEADO,EMPRESA,SECCION)'
      'VALUES'
      '  (?EMPLEADO,?ID_EMPLEADO,?EMPRESA,?SECCION)')
    RefreshSQL.Strings = (
      'SELECT E.*, S.DESCRIPCION'
      'FROM OPE_EMPLEADO_SECCIONES E'
      
        'JOIN OPE_SECCIONES S ON E.EMPRESA = S.EMPRESA AND E.SECCION = S.' +
        'SECCION'
      'WHERE'
      '  E.EMPRESA=?EMPRESA AND '
      '  E.EMPLEADO=?EMPLEADO AND '
      '  E.SECCION=?SECCION ')
    SelectSQL.Strings = (
      'SELECT E.*, S.DESCRIPCION'
      'FROM OPE_EMPLEADO_SECCIONES E'
      
        'JOIN OPE_SECCIONES S ON E.EMPRESA = S.EMPRESA AND E.SECCION = S.' +
        'SECCION'
      'WHERE'
      'E.EMPRESA = :EMPRESA AND'
      'E.EMPLEADO = :EMPLEADO'
      'ORDER BY E.EMPRESA, E.EMPLEADO, E.SECCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_EMPLEADO_SECCIONES'
      'SET'
      '  SECCION=?new_SECCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  SECCION=?old_SECCION ')
    DataSource = DSQMEmpleados
    OnNewRecord = xSeccionesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EMPLEADO '
      'SECCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_EMPLEADO_SECCIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 448
    object xSeccionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeccionesEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xSeccionesSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      OnChange = xSeccionesSECCIONChange
      Size = 3
    end
    object xSeccionesID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xSeccionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSSecciones: TDataSource
    DataSet = xSecciones
    Left = 120
    Top = 448
  end
  object xHorasCompensar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_EMPLEADO_HORAS_COMPENSAR'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_EMPLEADO_HORAS_COMPENSAR'
      
        '  (ID,EMPRESA,EMPLEADO,ID_EMPLEADO,FECHA,HORAS,TIPO,SALDO_HORAS,' +
        'ID_MARCAJE_PRESENCIA,COMENTARIO)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EMPLEADO,?ID_EMPLEADO,?FECHA,?HORAS,?TIPO,?SALD' +
        'O_HORAS,?ID_MARCAJE_PRESENCIA,?COMENTARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_EMPLEADO_HORAS_COMPENSAR'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_EMPLEADO_HORAS_COMPENSAR'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  EMPLEADO = ?EMPLEADO AND'
      '  FECHA >= ?FECHA_INI'
      'ORDER BY FECHA, ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_EMPLEADO_HORAS_COMPENSAR'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,FECHA=?FECHA '
      '  ,HORAS=?HORAS '
      '  ,TIPO=?TIPO '
      '  ,SALDO_HORAS=?SALDO_HORAS '
      '  ,ID_MARCAJE_PRESENCIA=?ID_MARCAJE_PRESENCIA '
      '  ,COMENTARIO=?COMENTARIO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMEmpleados
    AfterPost = xHorasCompensarAfterPost
    BeforePost = xHorasCompensarBeforePost
    OnNewRecord = xHorasCompensarNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_EMPLEADO_HORAS_COMPENSAR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 496
    object xHorasCompensarID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xHorasCompensarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xHorasCompensarEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xHorasCompensarID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xHorasCompensarFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xHorasCompensarHORAS: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object xHorasCompensarTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xHorasCompensarSALDO_HORAS: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO_HORAS'
    end
    object xHorasCompensarID_MARCAJE_PRESENCIA: TIntegerField
      DisplayLabel = 'Id Marcaje Presencia'
      FieldName = 'ID_MARCAJE_PRESENCIA'
    end
    object xHorasCompensarCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 60
    end
  end
  object DSxHorasCompensar: TDataSource
    DataSet = xHorasCompensar
    Left = 120
    Top = 496
  end
  object xContratos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMPLEADOS_CONTRATOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  CONTRATO=?old_CONTRATO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMPLEADOS_CONTRATOS'
      
        '  (EMPRESA,'#13#10'EMPLEADO,CONTRATO,ID_EMPLEADO,NUM_CONTRATO,FECHA_IN' +
        'ICIO_CONTRATO,FECHA_FIN_CONTRATO,FECHA_AVISO_FIN,ACTIVO,TIPO_CON' +
        'TRATO,DESC_TIPO_CONTRATO,'#13#10'COMENTARIO,DIAS_CONTRATO,FECHA_SUSPEN' +
        'CION_CONTRATO,SUSPENDIDO,CODIGO_FINALIZACION_CHL,MOTIVO_FINALIZA' +
        'CION,DESC_MOTIVO_FINALIZACION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EMPLEADO,?CONTRATO,?ID_EMPLEADO,?NUM_CONTRATO,?FE' +
        'CHA_INICIO_CONTRATO,?FECHA_FIN_CONTRATO,?FECHA_AVISO_FIN,?ACTIVO' +
        ',?TIPO_CONTRATO,?DESC_TIPO_CONTRATO,'#13#10'?COMENTARIO,?DIAS_CONTRATO' +
        ',?FECHA_SUSPENCION_CONTRATO,?SUSPENDIDO,?CODIGO_FINALIZACION_CHL' +
        ',?MOTIVO_FINALIZACION,?DESC_MOTIVO_FINALIZACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_CONTRATOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  CONTRATO=?CONTRATO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_CONTRATOS'
      'WHERE'
      '  EMPRESA = :EMPRESA AND'
      '  EMPLEADO = :EMPLEADO'
      'ORDER BY CONTRATO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMPLEADOS_CONTRATOS'
      'SET'
      '  ID_EMPLEADO=?ID_EMPLEADO '
      '  ,NUM_CONTRATO=?NUM_CONTRATO '
      '  ,FECHA_INICIO_CONTRATO=?FECHA_INICIO_CONTRATO '
      '  ,FECHA_FIN_CONTRATO=?FECHA_FIN_CONTRATO '
      '  ,FECHA_AVISO_FIN=?FECHA_AVISO_FIN '
      '  ,ACTIVO=?ACTIVO '
      '  ,TIPO_CONTRATO=?TIPO_CONTRATO '
      '  ,DESC_TIPO_CONTRATO=?DESC_TIPO_CONTRATO '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,DIAS_CONTRATO=?DIAS_CONTRATO '
      '  ,FECHA_SUSPENCION_CONTRATO=?FECHA_SUSPENCION_CONTRATO '
      '  ,SUSPENDIDO=?SUSPENDIDO '
      '  ,CODIGO_FINALIZACION_CHL=?CODIGO_FINALIZACION_CHL '
      '  ,MOTIVO_FINALIZACION=?MOTIVO_FINALIZACION '
      '  ,DESC_MOTIVO_FINALIZACION=?DESC_MOTIVO_FINALIZACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  CONTRATO=?CONTRATO ')
    DataSource = DSQMEmpleados
    AfterPost = xContratosAfterPost
    OnNewRecord = xContratosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EMPLEADO '
      'CONTRATO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMPLEADOS_CONTRATOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 344
    Top = 208
    object xContratosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xContratosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xContratosCONTRATO: TIntegerField
      DisplayLabel = 'Contrato'
      FieldName = 'CONTRATO'
    end
    object xContratosID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xContratosNUM_CONTRATO: TFIBStringField
      DisplayLabel = 'Nro. Contrato'
      FieldName = 'NUM_CONTRATO'
      Size = 25
    end
    object xContratosFECHA_INICIO_CONTRATO: TDateTimeField
      DisplayLabel = 'Fec. Inicio'
      FieldName = 'FECHA_INICIO_CONTRATO'
    end
    object xContratosFECHA_FIN_CONTRATO: TDateTimeField
      DisplayLabel = 'Fec. Final'
      FieldName = 'FECHA_FIN_CONTRATO'
    end
    object xContratosFECHA_AVISO_FIN: TDateTimeField
      DisplayLabel = 'Fec. Aviso'
      FieldName = 'FECHA_AVISO_FIN'
    end
    object xContratosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xContratosTIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'TIPO_CONTRATO'
      Size = 3
    end
    object xContratosDESC_TIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_TIPO_CONTRATO'
      Size = 40
    end
    object xContratosCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xContratosDIAS_CONTRATO: TFloatField
      DisplayLabel = 'Dias'
      FieldName = 'DIAS_CONTRATO'
    end
    object xContratosFECHA_SUSPENCION_CONTRATO: TDateTimeField
      DisplayLabel = 'Fec. Suspencion'
      FieldName = 'FECHA_SUSPENCION_CONTRATO'
    end
    object xContratosSUSPENDIDO: TIntegerField
      DisplayLabel = 'Suspendido'
      FieldName = 'SUSPENDIDO'
    end
    object xContratosMOTIVO_FINALIZACION: TFIBStringField
      DisplayLabel = 'Motivo Finalizacion'
      FieldName = 'MOTIVO_FINALIZACION'
      Size = 60
    end
    object xContratosCODIGO_FINALIZACION_CHL: TIntegerField
      DisplayLabel = 'Cod. Finalizacion'
      FieldName = 'CODIGO_FINALIZACION_CHL'
    end
    object xContratosDESC_MOTIVO_FINALIZACION: TFIBStringField
      DisplayLabel = 'Desc. Finalizacion'
      FieldName = 'DESC_MOTIVO_FINALIZACION'
      Size = 100
    end
  end
  object DSxContratos: TDataSource
    DataSet = xContratos
    Left = 432
    Top = 208
  end
  object xIncapacidadTransitoria: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_OPE_EMPLEADO_INCAP_TRANS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_OPE_EMPLEADO_INCAP_TRANS'
      
        '  (EMPRESA,EMPLEADO,ID_EMPLEADO,LINEA,FECHA_INICIO,FECHA_FIN,TIP' +
        'O,TITULO,COMENTARIO,NOMBRE_R_SOCIAL,NUM_SECUENCIA_FIE)'
      'VALUES'
      
        '  (?EMPRESA,?EMPLEADO,?ID_EMPLEADO,?LINEA,?FECHA_INICIO,?FECHA_F' +
        'IN,?TIPO,?TITULO,?COMENTARIO,?NOMBRE_R_SOCIAL,?NUM_SECUENCIA_FIE' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_OPE_EMPLEADO_INCAP_TRANS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_OPE_EMPLEADO_INCAP_TRANS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_OPE_EMPLEADO_INCAP_TRANS'
      'SET'
      '  ID_EMPLEADO=?ID_EMPLEADO '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,TIPO=?TIPO '
      '  ,TITULO=?TITULO '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NUM_SECUENCIA_FIE=?NUM_SECUENCIA_FIE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMEmpleados
    AfterPost = xIncapacidadTransitoriaAfterPost
    OnNewRecord = xIncapacidadTransitoriaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EMPLEADO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_OPE_EMPLEADO_INCAP_TRANS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 112
    object xIncapacidadTransitoriaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncapacidadTransitoriaEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xIncapacidadTransitoriaID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xIncapacidadTransitoriaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xIncapacidadTransitoriaFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object xIncapacidadTransitoriaFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object xIncapacidadTransitoriaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xIncapacidadTransitoriaTITULO: TFIBStringField
      DisplayLabel = 'Tipo Incapacidad'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 60
    end
    object xIncapacidadTransitoriaCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 60
    end
    object xIncapacidadTransitoriaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Empleado'
      FieldName = 'NOMBRE_R_SOCIAL'
      ReadOnly = True
      Size = 60
    end
    object xIncapacidadTransitoriaNUM_SECUENCIA_FIE: TFIBStringField
      DisplayLabel = 'Num. Secuencia FIE'
      FieldName = 'NUM_SECUENCIA_FIE'
    end
  end
  object DSxIncapacidadTransitoria: TDataSource
    DataSet = xIncapacidadTransitoria
    Left = 120
    Top = 112
  end
  object QMConCuenHab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CON_CUENTAS_GES_EMP_H'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CON_CUENTAS_GES_EMP_H'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,EMPLEADO,PERIODO,CODIGO,IMPORTE,GLO' +
        'SA,CUENTA,SIGNO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?EMPLEADO,?PERIODO,?CODIGO,?IMPO' +
        'RTE,?GLOSA,?CUENTA,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTAS_GES_EMP_H'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTAS_GES_EMP_H'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO '
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CON_CUENTAS_GES_EMP_H'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,GLOSA=?GLOSA '
      '  ,CUENTA=?CUENTA '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO AND '
      '  CODIGO=?CODIGO ')
    DataSource = DSQMEmpleados
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'EMPLEADO '
      'PERIODO '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CON_CUENTAS_GES_EMP_H'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 400
    object QMConCuenHabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConCuenHabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConCuenHabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConCuenHabEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMConCuenHabPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMConCuenHabCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMConCuenHabIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMConCuenHabGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMConCuenHabCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMConCuenHabSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
  end
  object DSQMConCuenHab: TDataSource
    DataSet = QMConCuenHab
    Left = 423
    Top = 401
  end
  object QMConCuenDes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CON_CUENTAS_GES_EMP_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CON_CUENTAS_GES_EMP_D'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,EMPLEADO,PERIODO,CODIGO,IMPORTE,GLO' +
        'SA,CUENTA,SIGNO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?EMPLEADO,?PERIODO,?CODIGO,?IMPO' +
        'RTE,?GLOSA,?CUENTA,?SIGNO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTAS_GES_EMP_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTAS_GES_EMP_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO '
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CON_CUENTAS_GES_EMP_D'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,GLOSA=?GLOSA '
      '  ,CUENTA=?CUENTA '
      '  ,SIGNO=?SIGNO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO AND '
      '  CODIGO=?CODIGO ')
    DataSource = DSQMEmpleados
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'EMPLEADO '
      'PERIODO '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CON_CUENTAS_GES_EMP_D'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 448
    object QMConCuenDesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConCuenDesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConCuenDesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConCuenDesEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMConCuenDesPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMConCuenDesCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMConCuenDesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMConCuenDesGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMConCuenDesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMConCuenDesSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
  end
  object DSQMConCuenDes: TDataSource
    DataSet = QMConCuenDes
    Left = 423
    Top = 449
  end
  object QMConCuenPar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CON_CUENTAS_GES_EMP_P'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  PERIODO=?old_PERIODO AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CON_CUENTAS_GES_EMP_P'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,EMPLEADO,PERIODO,CODIGO,IMPORTE,DAT' +
        'O_TEXTO,DATO_FECHA,GLOSA,TIPO_DATO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?EMPLEADO,?PERIODO,?CODIGO,?IMPO' +
        'RTE,?DATO_TEXTO,?DATO_FECHA,?GLOSA,?TIPO_DATO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTAS_GES_EMP_P'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CON_CUENTAS_GES_EMP_P'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO '
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CON_CUENTAS_GES_EMP_P'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,DATO_TEXTO=?DATO_TEXTO '
      '  ,DATO_FECHA=?DATO_FECHA '
      '  ,GLOSA=?GLOSA '
      '  ,TIPO_DATO=?TIPO_DATO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  PERIODO=?PERIODO AND '
      '  CODIGO=?CODIGO ')
    DataSource = DSQMEmpleados
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'EMPLEADO '
      'PERIODO '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CON_CUENTAS_GES_EMP_P'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 495
    object QMConCuenParEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConCuenParEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConCuenParCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConCuenParEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMConCuenParPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMConCuenParCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMConCuenParIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMConCuenParDATO_TEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'DATO_TEXTO'
      Size = 15
    end
    object QMConCuenParDATO_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'DATO_FECHA'
    end
    object QMConCuenParGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 100
    end
    object QMConCuenParTIPO_DATO: TFIBStringField
      DisplayLabel = 'Tipo Dato'
      FieldName = 'TIPO_DATO'
      Size = 15
    end
  end
  object DSQMConCuenPar: TDataSource
    DataSet = QMConCuenPar
    Left = 423
    Top = 496
  end
  object QMIncapacidad: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_INCAP_TRANSITORIA'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_INCAP_TRANSITORIA'
      '  (TITULO,TIPO,PARAMETRO_AUS)'
      'VALUES'
      '  (?TITULO,?TIPO, ?PARAMETRO_AUS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_INCAP_TRANSITORIA'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_INCAP_TRANSITORIA'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_INCAP_TRANSITORIA'
      'SET'
      '  TITULO=?TITULO, '
      '  PARAMETRO_AUS = ?PARAMETRO_AUS'
      'WHERE'
      '  TIPO=?TIPO ')
    OnNewRecord = QMIncapacidadNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_INCAP_TRANSITORIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 352
    object QMIncapacidadTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMIncapacidadTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMIncapacidadPARAMETRO_AUS: TFIBStringField
      DisplayLabel = 'Parametro AUS'
      FieldName = 'PARAMETRO_AUS'
      Size = 15
    end
  end
  object DSQMIncapacidad: TDataSource
    DataSet = QMIncapacidad
    Left = 423
    Top = 353
  end
  object QMNomCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      ''
      ' delete from  ver_emp_nominas_cabecera'
      '    where'
      '    ID=?old_ID ;')
    InsertSQL.Strings = (
      'insert into EMP_NOMINAS_CABECERA ('
      '  ID,'
      '  EMPRESA,'
      '  EJERCICIO,'
      '  CANAL,'
      '  EMPLEADO,'
      '  PERIODO,'
      '  CERRADO,'
      '  PAGADO,'
      '  LISTADO,'
      '  EJERCICIO_CIERRE,'
      '  FECHA_COBRO,'
      '  ENTRADA,'
      '  FECHA_INI_PERIODO,'
      '  ESTADO,'
      '  FECHA,'
      '  FECHA_FIN_PERIODO)'
      ''
      '  VALUES'
      '  ('
      '  ?ID,'
      '  ?EMPRESA,'
      '  ?EJERCICIO,'
      '  ?CANAL,'
      '  ?EMPLEADO,'
      '  ?PERIODO,'
      '  ?CERRADO,'
      '  ?PAGADO,'
      '  ?LISTADO,'
      '  ?EJERCICIO_CIERRE,'
      '  ?FECHA_COBRO,'
      '  ?ENTRADA,'
      '  ?FECHA_INI_PERIODO,'
      '  ?ESTADO,'
      '  ?FECHA,'
      '  ?FECHA_FIN_PERIODO);')
    RefreshSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = C.ID AND'
      '        CODIGO = '#39'H012'#39') IMPORTE_H012,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = C.ID AND'
      '        CODIGO = '#39'H020'#39') IMPORTE_H020,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = C.ID AND'
      '        CODIGO = '#39'D017'#39') IMPORTE_D017'
      'FROM VER_EMP_NOMINAS_CABECERA C'
      'WHERE'
      'C.ID = :ID')
    SelectSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = C.ID AND'
      '        CODIGO = '#39'H012'#39') TOTAL_HABERES,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = C.ID AND'
      '        CODIGO = '#39'H020'#39') TOTAL_LIQUIDO,'
      '       (SELECT IMPORTE'
      '        FROM EMP_NOMINAS_DET_HABERES'
      '        WHERE'
      '        ID_CABECERA = C.ID AND'
      '        CODIGO = '#39'D017'#39') TOTAL_DESCUENTOS'
      'FROM VER_EMP_NOMINAS_CABECERA C'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.EMPLEADO = :EMPLEADO'
      'ORDER BY C.PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update EMP_NOMINAS_CABECERA'
      '    set'
      '  EMPRESA = ?EMPRESA,'
      '  EJERCICIO = ?EJERCICIO,'
      '  CANAL =  ?CANAL,'
      '  EMPLEADO = ?EMPLEADO,'
      '  PERIODO = ?PERIODO,'
      '  CERRADO = ?CERRADO,'
      '  LISTADO = ?LISTADO ,'
      '  PAGADO = ?PAGADO,'
      '  EJERCICIO_CIERRE = ?EJERCICIO_CIERRE,'
      '  FECHA_COBRO = ?FECHA_COBRO ,'
      '  ENTRADA = ?ENTRADA,'
      '  FECHA_INI_PERIODO = ?FECHA_INI_PERIODO,'
      '  ESTADO = ?ESTADO,'
      '  FECHA = ?FECHA,'
      '  FECHA_FIN_PERIODO = ?FECHA_FIN_PERIODO'
      '  WHERE '
      '  ID = ?ID;')
    DataSource = DSQMEmpleados
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_CABECERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 288
    object QMNomCabID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNomCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNomCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNomCabEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMNomCabPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 40
    end
    object QMNomCabCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QMNomCabEJERCICIO_CIERRE: TIntegerField
      DisplayLabel = 'Ejercicio Cierre'
      FieldName = 'EJERCICIO_CIERRE'
    end
    object QMNomCabENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMNomCabFECHA_INI_PERIODO: TDateTimeField
      DisplayLabel = 'Fec. Ini. Periodo'
      FieldName = 'FECHA_INI_PERIODO'
    end
    object QMNomCabESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMNomCabFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMNomCabFECHA_FIN_PERIODO: TDateTimeField
      DisplayLabel = 'Fec. Fin Periodo'
      FieldName = 'FECHA_FIN_PERIODO'
    end
    object QMNomCabFECHA_COBRO: TDateTimeField
      DisplayLabel = 'Fec. Cobro'
      FieldName = 'FECHA_COBRO'
    end
    object QMNomCabTDEVENGO: TFloatField
      DisplayLabel = 'Total Devengo'
      FieldName = 'TDEVENGO'
    end
    object QMNomCabTDEDUCCION: TFloatField
      DisplayLabel = 'Total Deduccion'
      FieldName = 'TDEDUCCION'
    end
    object QMNomCabPERCIBIR: TFloatField
      DisplayLabel = 'Percibir'
      FieldName = 'PERCIBIR'
    end
    object QMNomCabNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMNomCabNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMNomCabCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMNomCabTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNomCabDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMNomCabSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMNomCabN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object QMNomCabINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Inicio Contrato'
      FieldName = 'INI_CONTRATO'
      EditMask = '!99/99/00;1;_'
    end
    object QMNomCabTITULO_PERIODO: TFIBStringField
      DisplayLabel = 'Desc. Periodo'
      FieldName = 'TITULO_PERIODO'
      Size = 40
    end
    object QMNomCabID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMNomCabLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMNomCabPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMNomCabRIC_CIERRE: TIntegerField
      DisplayLabel = 'RIC de Cierre'
      FieldName = 'RIC_CIERRE'
    end
    object QMNomCabEJERCICIO_PAGO: TIntegerField
      DisplayLabel = 'Ejercicio de Pago'
      FieldName = 'EJERCICIO_PAGO'
    end
    object QMNomCabRIC_PAGO: TIntegerField
      DisplayLabel = 'RIC de Pago'
      FieldName = 'RIC_PAGO'
    end
    object QMNomCabIMP_PAGADO: TFloatField
      DisplayLabel = 'Importe de Pago'
      FieldName = 'IMP_PAGADO'
    end
    object QMNomCabIMP_ANTICIPO: TFloatField
      DisplayLabel = 'Importe de Anticipo'
      FieldName = 'IMP_ANTICIPO'
    end
    object QMNomCabCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cuenta de Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMNomCabFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha de Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QMNomCabTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Liquido a Pagar'
      FieldName = 'TOTAL_LIQUIDO'
    end
    object QMNomCabTOTAL_HABERES: TFloatField
      DisplayLabel = 'Total Haberes'
      FieldName = 'TOTAL_HABERES'
    end
    object QMNomCabTOTAL_DESCUENTOS: TFloatField
      DisplayLabel = 'Total Descuentos'
      FieldName = 'TOTAL_DESCUENTOS'
    end
  end
  object DSQMNomCab: TDataSource
    DataSet = QMNomCab
    Left = 424
    Top = 288
  end
  object frxEmpleados: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 464
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxFormacion: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 464
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxLstResumenEmpl: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 464
    Top = 112
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
