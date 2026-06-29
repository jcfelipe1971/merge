object DMReparaciones: TDMReparaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 493
  Top = 157
  Height = 730
  Width = 621
  object QMCabReparar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      '  IDCABREPARAR=?old_IDCABREPARAR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_REPAR_CAB_REPARACIONES'
      
        '  (IDCABREPARAR,'#13#10'EMPRESA,EJERCICIO,CLIENTE,NOMBRE_R_SOCIAL_CLIE' +
        'NTE,NOMBRE_COMERCIAL_CLIENTE,TERCERO,EQUIPO,MARCA,MODELO,NUM_SER' +
        'IE,'#13#10'CONDICION,OT,TECNICO,FECHA_AVISO,FECHA_ENTRADA,FECHA_SALIDA' +
        ',OBSERVACIONES_CLIENTE,TIPO_ACTUACION,TRABAJO_REALIZADO,ESTADO,'#13 +
        #10'CARGO_COSTE,ID_NUM_SERIE,TOTAL_COSTE,ESTADO_REPAR,CANAL,REPARAC' +
        'ION,ID_FICHA_TECNICA,ID_S,SERIE_DOC,KILOMETROS,'#13#10'SERIE,FECHA_PRE' +
        'V_SALIDA,CONTACTO_EMAIL,CONTACTO_NOMBRE,CONTACTO_TELEFONO,KILOME' +
        'TROS_ENTRADA,SITUACION,ID_S_ORIGEN,PROYECTO,TIPO,'#13#10'CONTACTO_LATI' +
        'TUD,CONTACTO_LONGITUD,CONTACTO_LOCALIDAD,CONTACTO_DIR_NOMBRE,CON' +
        'TACTO_DIR_NOMBRE_2,HORARIO_1_DESDE,HORARIO_1_HASTA,HORARIO_2_DES' +
        'DE,HORARIO_2_HASTA,DIRECCION_DOCUMENTO,'#13#10'ID_REP_RECEPCION,NOMBRE' +
        '_COMERCIAL,NOMBRE_R_SOCIAL,TITULO_ESTADO,TITULO_SITUACION,TITULO' +
        '_TIPO_REPARACION,TITULO_TIPO_ACTUACION,TITULO_PROYECTO,TITULO_LO' +
        'CALIDAD,CODIGO_POSTAL,'#13#10'EJERCICIO_ORIGEN,CANAL_ORIGEN,SERIE_ORIG' +
        'EN,TIPO_ORIGEN,RIG_ORIGEN,EJERCICIO_DESTINO,CANAL_DESTINO,SERIE_' +
        'DESTINO,TIPO_DESTINO,RIG_DESTINO,'#13#10'MATRICULA,COMBUSTIBLE,ID_EMPL' +
        'EADO,EMPLEADO,NOMBRE_EMPLEADO,FECHA,TESTIGO_AVERIA,ESTADO_PLACAS' +
        '_MATRICULA,ESTADO_CRISTALES,ESTADO_ESCOBILLAS,'#13#10'ANTENA,PILOTOS_Y' +
        '_FAROS,APERTURA_PUERTAS_DELANTERAS,APERTURA_PUERTAS_TRASERAS,ELE' +
        'VALUNAS_DELATEROS,ELEVALUNAS_TRASEROS,RETROVISORES,COMENTARIO_ES' +
        'TADO,TRABAJOS_A_REALIZAR,ID_GALERIA_RECEPCION,'#13#10'COMENTARIOS_CLIE' +
        'NTE,AUTORIZA_PRESUPUESTO,AUTORIZA_PRUEBAS,PIEZAS_DEL_CLIENTE,REC' +
        'OGER_PIEZAS_SUSTITUIDAS,ID_FIRMA,FECHA_HORA_CIERRE,ID_INSPECCION' +
        '_ITV,ID_EMPLEADO_ITV,EMPLEADO_ITV,'#13#10'NOMBRE_EMPLEADO_ITV,FECHA_HO' +
        'RA_CIERRE_ITV,TIEMPO_PRODUCCION,FORMA_PAGO)'
      'VALUES'
      
        '  (?IDCABREPARAR,'#13#10'?EMPRESA,?EJERCICIO,?CLIENTE,?NOMBRE_R_SOCIAL' +
        '_CLIENTE,?NOMBRE_COMERCIAL_CLIENTE,?TERCERO,?EQUIPO,?MARCA,?MODE' +
        'LO,?NUM_SERIE,'#13#10'?CONDICION,?OT,?TECNICO,?FECHA_AVISO,?FECHA_ENTR' +
        'ADA,?FECHA_SALIDA,?OBSERVACIONES_CLIENTE,?TIPO_ACTUACION,?TRABAJ' +
        'O_REALIZADO,?ESTADO,'#13#10'?CARGO_COSTE,?ID_NUM_SERIE,?TOTAL_COSTE,?E' +
        'STADO_REPAR,?CANAL,?REPARACION,?ID_FICHA_TECNICA,?ID_S,?SERIE_DO' +
        'C,?KILOMETROS,'#13#10'?SERIE,?FECHA_PREV_SALIDA,?CONTACTO_EMAIL,?CONTA' +
        'CTO_NOMBRE,?CONTACTO_TELEFONO,?KILOMETROS_ENTRADA,?SITUACION,?ID' +
        '_S_ORIGEN,?PROYECTO,?TIPO,'#13#10'?CONTACTO_LATITUD,?CONTACTO_LONGITUD' +
        ',?CONTACTO_LOCALIDAD,?CONTACTO_DIR_NOMBRE,?CONTACTO_DIR_NOMBRE_2' +
        ',?HORARIO_1_DESDE,?HORARIO_1_HASTA,?HORARIO_2_DESDE,?HORARIO_2_H' +
        'ASTA,?DIRECCION_DOCUMENTO,'#13#10'?ID_REP_RECEPCION,?NOMBRE_COMERCIAL,' +
        '?NOMBRE_R_SOCIAL,?TITULO_ESTADO,?TITULO_SITUACION,?TITULO_TIPO_R' +
        'EPARACION,?TITULO_TIPO_ACTUACION,?TITULO_PROYECTO,?TITULO_LOCALI' +
        'DAD,?CODIGO_POSTAL,'#13#10'?EJERCICIO_ORIGEN,?CANAL_ORIGEN,?SERIE_ORIG' +
        'EN,?TIPO_ORIGEN,?RIG_ORIGEN,?EJERCICIO_DESTINO,?CANAL_DESTINO,?S' +
        'ERIE_DESTINO,?TIPO_DESTINO,?RIG_DESTINO,'#13#10'?MATRICULA,?COMBUSTIBL' +
        'E,?ID_EMPLEADO,?EMPLEADO,?NOMBRE_EMPLEADO,?FECHA,?TESTIGO_AVERIA' +
        ',?ESTADO_PLACAS_MATRICULA,?ESTADO_CRISTALES,?ESTADO_ESCOBILLAS,'#13 +
        #10'?ANTENA,?PILOTOS_Y_FAROS,?APERTURA_PUERTAS_DELANTERAS,?APERTURA' +
        '_PUERTAS_TRASERAS,?ELEVALUNAS_DELATEROS,?ELEVALUNAS_TRASEROS,?RE' +
        'TROVISORES,?COMENTARIO_ESTADO,?TRABAJOS_A_REALIZAR,?ID_GALERIA_R' +
        'ECEPCION,'#13#10'?COMENTARIOS_CLIENTE,?AUTORIZA_PRESUPUESTO,?AUTORIZA_' +
        'PRUEBAS,?PIEZAS_DEL_CLIENTE,?RECOGER_PIEZAS_SUSTITUIDAS,?ID_FIRM' +
        'A,?FECHA_HORA_CIERRE,?ID_INSPECCION_ITV,?ID_EMPLEADO_ITV,?EMPLEA' +
        'DO_ITV,'#13#10'?NOMBRE_EMPLEADO_ITV,?FECHA_HORA_CIERRE_ITV,?TIEMPO_PRO' +
        'DUCCION,?FORMA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      '  IDCABREPARAR=?IDCABREPARAR ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT * FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      '(EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE'
      ')'
      'OR'
      '(EMPRESA=?EMPRESA AND'
      'EJERCICIO<?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'ESTADO <> 5'
      ')'
      'ORDER BY IDCABREPARAR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_REPAR_CAB_REPARACIONES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL_CLIENTE=?NOMBRE_R_SOCIAL_CLIENTE '
      '  ,NOMBRE_COMERCIAL_CLIENTE=?NOMBRE_COMERCIAL_CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,EQUIPO=?EQUIPO '
      '  ,MARCA=?MARCA '
      '  ,MODELO=?MODELO '
      '  ,NUM_SERIE=?NUM_SERIE '
      '  ,CONDICION=?CONDICION '
      '  ,OT=?OT '
      '  ,TECNICO=?TECNICO '
      '  ,FECHA_AVISO=?FECHA_AVISO '
      '  ,FECHA_ENTRADA=?FECHA_ENTRADA '
      '  ,FECHA_SALIDA=?FECHA_SALIDA '
      '  ,OBSERVACIONES_CLIENTE=?OBSERVACIONES_CLIENTE '
      '  ,TIPO_ACTUACION=?TIPO_ACTUACION '
      '  ,TRABAJO_REALIZADO=?TRABAJO_REALIZADO '
      '  ,ESTADO=?ESTADO '
      '  ,CARGO_COSTE=?CARGO_COSTE '
      '  ,ID_NUM_SERIE=?ID_NUM_SERIE '
      '  ,TOTAL_COSTE=?TOTAL_COSTE '
      '  ,ESTADO_REPAR=?ESTADO_REPAR '
      '  ,CANAL=?CANAL '
      '  ,REPARACION=?REPARACION '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,ID_S=?ID_S '
      '  ,SERIE_DOC=?SERIE_DOC '
      '  ,KILOMETROS=?KILOMETROS '
      '  ,SERIE=?SERIE '
      '  ,FECHA_PREV_SALIDA=?FECHA_PREV_SALIDA '
      '  ,CONTACTO_EMAIL=?CONTACTO_EMAIL '
      '  ,CONTACTO_NOMBRE=?CONTACTO_NOMBRE '
      '  ,CONTACTO_TELEFONO=?CONTACTO_TELEFONO '
      '  ,KILOMETROS_ENTRADA=?KILOMETROS_ENTRADA '
      '  ,SITUACION=?SITUACION '
      '  ,ID_S_ORIGEN=?ID_S_ORIGEN '
      '  ,PROYECTO=?PROYECTO '
      '  ,TIPO=?TIPO '
      '  ,CONTACTO_LATITUD=?CONTACTO_LATITUD '
      '  ,CONTACTO_LONGITUD=?CONTACTO_LONGITUD '
      '  ,CONTACTO_LOCALIDAD=?CONTACTO_LOCALIDAD '
      '  ,CONTACTO_DIR_NOMBRE=?CONTACTO_DIR_NOMBRE '
      '  ,CONTACTO_DIR_NOMBRE_2=?CONTACTO_DIR_NOMBRE_2 '
      '  ,HORARIO_1_DESDE=?HORARIO_1_DESDE '
      '  ,HORARIO_1_HASTA=?HORARIO_1_HASTA '
      '  ,HORARIO_2_DESDE=?HORARIO_2_DESDE '
      '  ,HORARIO_2_HASTA=?HORARIO_2_HASTA '
      '  ,DIRECCION_DOCUMENTO=?DIRECCION_DOCUMENTO '
      '  ,ID_REP_RECEPCION=?ID_REP_RECEPCION '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,TITULO_ESTADO=?TITULO_ESTADO '
      '  ,TITULO_SITUACION=?TITULO_SITUACION '
      '  ,TITULO_TIPO_REPARACION=?TITULO_TIPO_REPARACION '
      '  ,TITULO_TIPO_ACTUACION=?TITULO_TIPO_ACTUACION '
      '  ,TITULO_PROYECTO=?TITULO_PROYECTO '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,EJERCICIO_ORIGEN=?EJERCICIO_ORIGEN '
      '  ,CANAL_ORIGEN=?CANAL_ORIGEN '
      '  ,SERIE_ORIGEN=?SERIE_ORIGEN '
      '  ,TIPO_ORIGEN=?TIPO_ORIGEN '
      '  ,RIG_ORIGEN=?RIG_ORIGEN '
      '  ,EJERCICIO_DESTINO=?EJERCICIO_DESTINO '
      '  ,CANAL_DESTINO=?CANAL_DESTINO '
      '  ,SERIE_DESTINO=?SERIE_DESTINO '
      '  ,TIPO_DESTINO=?TIPO_DESTINO '
      '  ,RIG_DESTINO=?RIG_DESTINO '
      '  ,MATRICULA=?MATRICULA '
      '  ,COMBUSTIBLE=?COMBUSTIBLE '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,NOMBRE_EMPLEADO=?NOMBRE_EMPLEADO '
      '  ,FECHA=?FECHA '
      '  ,TESTIGO_AVERIA=?TESTIGO_AVERIA '
      '  ,ESTADO_PLACAS_MATRICULA=?ESTADO_PLACAS_MATRICULA '
      '  ,ESTADO_CRISTALES=?ESTADO_CRISTALES '
      '  ,ESTADO_ESCOBILLAS=?ESTADO_ESCOBILLAS '
      '  ,ANTENA=?ANTENA '
      '  ,PILOTOS_Y_FAROS=?PILOTOS_Y_FAROS '
      '  ,APERTURA_PUERTAS_DELANTERAS=?APERTURA_PUERTAS_DELANTERAS '
      '  ,APERTURA_PUERTAS_TRASERAS=?APERTURA_PUERTAS_TRASERAS '
      '  ,ELEVALUNAS_DELATEROS=?ELEVALUNAS_DELATEROS '
      '  ,ELEVALUNAS_TRASEROS=?ELEVALUNAS_TRASEROS '
      '  ,RETROVISORES=?RETROVISORES '
      '  ,COMENTARIO_ESTADO=?COMENTARIO_ESTADO '
      '  ,TRABAJOS_A_REALIZAR=?TRABAJOS_A_REALIZAR '
      '  ,ID_GALERIA_RECEPCION=?ID_GALERIA_RECEPCION '
      '  ,COMENTARIOS_CLIENTE=?COMENTARIOS_CLIENTE '
      '  ,AUTORIZA_PRESUPUESTO=?AUTORIZA_PRESUPUESTO '
      '  ,AUTORIZA_PRUEBAS=?AUTORIZA_PRUEBAS '
      '  ,PIEZAS_DEL_CLIENTE=?PIEZAS_DEL_CLIENTE '
      '  ,RECOGER_PIEZAS_SUSTITUIDAS=?RECOGER_PIEZAS_SUSTITUIDAS '
      '  ,ID_FIRMA=?ID_FIRMA '
      '  ,FECHA_HORA_CIERRE=?FECHA_HORA_CIERRE '
      '  ,ID_INSPECCION_ITV=?ID_INSPECCION_ITV '
      '  ,ID_EMPLEADO_ITV=?ID_EMPLEADO_ITV '
      '  ,EMPLEADO_ITV=?EMPLEADO_ITV '
      '  ,NOMBRE_EMPLEADO_ITV=?NOMBRE_EMPLEADO_ITV '
      '  ,FECHA_HORA_CIERRE_ITV=?FECHA_HORA_CIERRE_ITV '
      '  ,TIEMPO_PRODUCCION=?TIEMPO_PRODUCCION '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      'WHERE'
      '  IDCABREPARAR=?IDCABREPARAR ')
    AfterDelete = Graba
    AfterOpen = QMCabRepararAfterOpen
    AfterPost = Graba
    BeforeClose = QMCabRepararBeforeClose
    BeforeEdit = QMCabRepararBeforeEdit
    BeforePost = QMCabRepararBeforePost
    OnNewRecord = QMCabRepararNewRecord
    ClavesPrimarias.Strings = (
      'IDCABREPARAR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_REPAR_CAB_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMCabRepararCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCabRepararCLIENTEChange
    end
    object QMCabRepararIDCABREPARAR: TIntegerField
      DisplayLabel = 'ID Cab. Rep.'
      FieldName = 'IDCABREPARAR'
    end
    object QMCabRepararEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabRepararEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabRepararTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabRepararEQUIPO: TFIBStringField
      DisplayLabel = 'Equipo'
      FieldName = 'EQUIPO'
      Size = 60
    end
    object QMCabRepararMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 60
    end
    object QMCabRepararMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 60
    end
    object QMCabRepararNUM_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NUM_SERIE'
      Size = 60
    end
    object QMCabRepararCONDICION: TFIBStringField
      DisplayLabel = 'Condicion'
      FieldName = 'CONDICION'
      Size = 60
    end
    object QMCabRepararOT: TFIBStringField
      DisplayLabel = 'O.T.'
      FieldName = 'OT'
      Size = 60
    end
    object QMCabRepararTECNICO: TFIBStringField
      DisplayLabel = 'Tecnico'
      FieldName = 'TECNICO'
      Size = 60
    end
    object QMCabRepararFECHA_AVISO: TDateTimeField
      DisplayLabel = 'Fecha Aviso'
      FieldName = 'FECHA_AVISO'
    end
    object QMCabRepararFECHA_ENTRADA: TDateTimeField
      DisplayLabel = 'Fecha Entrada'
      FieldName = 'FECHA_ENTRADA'
    end
    object QMCabRepararFECHA_SALIDA: TDateTimeField
      DisplayLabel = 'Fecha Salida'
      FieldName = 'FECHA_SALIDA'
    end
    object QMCabRepararOBSERVACIONES_CLIENTE: TBlobField
      DisplayLabel = 'Observ. Cli.'
      FieldName = 'OBSERVACIONES_CLIENTE'
      Size = 8
    end
    object QMCabRepararTIPO_ACTUACION: TIntegerField
      DisplayLabel = 'Tipo Act.'
      FieldName = 'TIPO_ACTUACION'
    end
    object QMCabRepararTRABAJO_REALIZADO: TMemoField
      DisplayLabel = 'Trabajo Realizado'
      FieldName = 'TRABAJO_REALIZADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabRepararESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabRepararCARGO_COSTE: TIntegerField
      DisplayLabel = 'Cargo Coste'
      FieldName = 'CARGO_COSTE'
    end
    object QMCabRepararID_NUM_SERIE: TIntegerField
      DisplayLabel = 'ID Nro. Serie'
      FieldName = 'ID_NUM_SERIE'
    end
    object QMCabRepararTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMCabRepararESTADO_REPAR: TIntegerField
      DisplayLabel = 'Estado Rep.'
      FieldName = 'ESTADO_REPAR'
    end
    object QMCabRepararCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabRepararREPARACION: TIntegerField
      DisplayLabel = 'Reparacion'
      FieldName = 'REPARACION'
    end
    object QMCabRepararID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMCabRepararID_S: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_S'
    end
    object QMCabRepararSERIE_DOC: TStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMCabRepararTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'T'#237'tulo Estado'
      FieldName = 'TITULO_ESTADO'
      Size = 40
    end
    object QMCabRepararKILOMETROS: TFIBStringField
      DisplayLabel = 'Kilometros'
      FieldName = 'KILOMETROS'
      Size = 60
    end
    object QMCabRepararSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabRepararFECHA_PREV_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. prev. Salida'
      FieldName = 'FECHA_PREV_SALIDA'
    end
    object QMCabRepararCONTACTO_EMAIL: TFIBStringField
      DisplayLabel = 'Email contacto'
      FieldName = 'CONTACTO_EMAIL'
      Size = 100
    end
    object QMCabRepararCONTACTO_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'CONTACTO_NOMBRE'
      Size = 60
    end
    object QMCabRepararCONTACTO_TELEFONO: TFIBStringField
      DisplayLabel = 'Tlf. Contacto'
      FieldName = 'CONTACTO_TELEFONO'
    end
    object QMCabRepararKILOMETROS_ENTRADA: TFloatField
      DisplayLabel = 'Kms. entrada'
      FieldName = 'KILOMETROS_ENTRADA'
    end
    object QMCabRepararSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMCabRepararPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMCabRepararPROYECTOChange
    end
    object QMCabRepararID_S_ORIGEN: TIntegerField
      DisplayLabel = 'Id Doc. Origen'
      FieldName = 'ID_S_ORIGEN'
    end
    object QMCabRepararTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCabRepararCONTACTO_LATITUD: TFloatField
      DisplayLabel = 'Contacto Latitud'
      FieldName = 'CONTACTO_LATITUD'
    end
    object QMCabRepararCONTACTO_LONGITUD: TFloatField
      DisplayLabel = 'Contacto Longitud'
      FieldName = 'CONTACTO_LONGITUD'
    end
    object QMCabRepararCONTACTO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Contacto Localidad'
      FieldName = 'CONTACTO_LOCALIDAD'
      Size = 8
    end
    object QMCabRepararCONTACTO_DIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Copntacto Direccion'
      FieldName = 'CONTACTO_DIR_NOMBRE'
      Size = 100
    end
    object QMCabRepararCONTACTO_DIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Contacto Direccion 2'
      FieldName = 'CONTACTO_DIR_NOMBRE_2'
      Size = 100
    end
    object QMCabRepararHORARIO_1_DESDE: TDateTimeField
      DisplayLabel = 'Horario 1 Desde'
      FieldName = 'HORARIO_1_DESDE'
    end
    object QMCabRepararHORARIO_1_HASTA: TDateTimeField
      DisplayLabel = 'Horario 1 Hasta'
      FieldName = 'HORARIO_1_HASTA'
    end
    object QMCabRepararHORARIO_2_DESDE: TDateTimeField
      DisplayLabel = 'Horario 2 Desde'
      FieldName = 'HORARIO_2_DESDE'
    end
    object QMCabRepararHORARIO_2_HASTA: TDateTimeField
      DisplayLabel = 'Horario 2 Hasta'
      FieldName = 'HORARIO_2_HASTA'
    end
    object QMCabRepararDIRECCION_DOCUMENTO: TIntegerField
      DisplayLabel = 'Direccion Doc'
      FieldName = 'DIRECCION_DOCUMENTO'
    end
    object QMCabRepararID_REP_RECEPCION: TIntegerField
      DisplayLabel = 'Id Recepcion'
      FieldName = 'ID_REP_RECEPCION'
    end
    object QMCabRepararNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabRepararNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabRepararTITULO_SITUACION: TFIBStringField
      DisplayLabel = 'Situacion Descripci'#243'n'
      FieldName = 'TITULO_SITUACION'
      Size = 40
    end
    object QMCabRepararTITULO_TIPO_REPARACION: TFIBStringField
      DisplayLabel = 'Tipo Reparacion'
      FieldName = 'TITULO_TIPO_REPARACION'
      Size = 25
    end
    object QMCabRepararTITULO_TIPO_ACTUACION: TFIBStringField
      DisplayLabel = 'Tipo  Actuaci'#243'n'
      FieldName = 'TITULO_TIPO_ACTUACION'
      Size = 25
    end
    object QMCabRepararTITULO_PROYECTO: TFIBStringField
      DisplayLabel = 'Titulo Proyecto'
      FieldName = 'TITULO_PROYECTO'
      Size = 60
    end
    object QMCabRepararTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Titulo Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object QMCabRepararCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C'#243'digo Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMCabRepararEJERCICIO_ORIGEN: TIntegerField
      DisplayLabel = 'Ejercicio Origen'
      FieldName = 'EJERCICIO_ORIGEN'
    end
    object QMCabRepararCANAL_ORIGEN: TIntegerField
      DisplayLabel = 'Canal Origen'
      FieldName = 'CANAL_ORIGEN'
    end
    object QMCabRepararSERIE_ORIGEN: TFIBStringField
      DisplayLabel = 'Serie Origen'
      FieldName = 'SERIE_ORIGEN'
      Size = 10
    end
    object QMCabRepararTIPO_ORIGEN: TFIBStringField
      DisplayLabel = 'Tipo Origen'
      FieldName = 'TIPO_ORIGEN'
      Size = 3
    end
    object QMCabRepararRIG_ORIGEN: TIntegerField
      DisplayLabel = 'Rig Origen'
      FieldName = 'RIG_ORIGEN'
    end
    object QMCabRepararEJERCICIO_DESTINO: TIntegerField
      DisplayLabel = 'Ejercicio Destino'
      FieldName = 'EJERCICIO_DESTINO'
    end
    object QMCabRepararCANAL_DESTINO: TIntegerField
      DisplayLabel = 'Canal Destino'
      FieldName = 'CANAL_DESTINO'
    end
    object QMCabRepararSERIE_DESTINO: TFIBStringField
      DisplayLabel = 'Serie Destino'
      FieldName = 'SERIE_DESTINO'
      Size = 10
    end
    object QMCabRepararTIPO_DESTINO: TFIBStringField
      DisplayLabel = 'Tipo Destino'
      FieldName = 'TIPO_DESTINO'
      Size = 3
    end
    object QMCabRepararRIG_DESTINO: TIntegerField
      DisplayLabel = 'Rig Destino'
      FieldName = 'RIG_DESTINO'
    end
    object QMCabRepararMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object QMCabRepararNOMBRE_R_SOCIAL_CLIENTE: TFIBStringField
      DisplayLabel = 'Razon Social Cliente'
      FieldName = 'NOMBRE_R_SOCIAL_CLIENTE'
      Size = 60
    end
    object QMCabRepararNOMBRE_COMERCIAL_CLIENTE: TFIBStringField
      DisplayLabel = 'Nombre Comercial Cliente'
      FieldName = 'NOMBRE_COMERCIAL_CLIENTE'
      Size = 60
    end
    object QMCabRepararCOMBUSTIBLE: TFloatField
      DisplayLabel = 'Combistible'
      FieldName = 'COMBUSTIBLE'
    end
    object QMCabRepararID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMCabRepararEMPLEADO: TIntegerField
      DisplayLabel = 'Cod. Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMCabRepararNOMBRE_EMPLEADO: TFIBStringField
      DisplayLabel = 'Empleado'
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 60
    end
    object QMCabRepararFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabRepararTESTIGO_AVERIA: TIntegerField
      DisplayLabel = 'Testigo Averia'
      FieldName = 'TESTIGO_AVERIA'
    end
    object QMCabRepararESTADO_PLACAS_MATRICULA: TIntegerField
      DisplayLabel = 'Estado Placas'
      FieldName = 'ESTADO_PLACAS_MATRICULA'
    end
    object QMCabRepararESTADO_CRISTALES: TIntegerField
      DisplayLabel = 'Estado Cristales'
      FieldName = 'ESTADO_CRISTALES'
    end
    object QMCabRepararESTADO_ESCOBILLAS: TIntegerField
      DisplayLabel = 'Estado Escobillas'
      FieldName = 'ESTADO_ESCOBILLAS'
    end
    object QMCabRepararANTENA: TIntegerField
      DisplayLabel = 'Antena'
      FieldName = 'ANTENA'
    end
    object QMCabRepararPILOTOS_Y_FAROS: TIntegerField
      DisplayLabel = 'Pilotos y Faros'
      FieldName = 'PILOTOS_Y_FAROS'
    end
    object QMCabRepararAPERTURA_PUERTAS_DELANTERAS: TIntegerField
      DisplayLabel = 'Apert. Puertas Delanteras'
      FieldName = 'APERTURA_PUERTAS_DELANTERAS'
    end
    object QMCabRepararAPERTURA_PUERTAS_TRASERAS: TIntegerField
      DisplayLabel = 'Apert. Puertas Traseras'
      FieldName = 'APERTURA_PUERTAS_TRASERAS'
    end
    object QMCabRepararELEVALUNAS_DELATEROS: TIntegerField
      DisplayLabel = 'Elevalunas Delanteros'
      FieldName = 'ELEVALUNAS_DELATEROS'
    end
    object QMCabRepararELEVALUNAS_TRASEROS: TIntegerField
      DisplayLabel = 'Elevalunas Traseros'
      FieldName = 'ELEVALUNAS_TRASEROS'
    end
    object QMCabRepararRETROVISORES: TIntegerField
      DisplayLabel = 'Retrovisories'
      FieldName = 'RETROVISORES'
    end
    object QMCabRepararCOMENTARIO_ESTADO: TMemoField
      DisplayLabel = 'Comentario Estado'
      FieldName = 'COMENTARIO_ESTADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabRepararTRABAJOS_A_REALIZAR: TMemoField
      DisplayLabel = 'Trabajos a Realizar'
      FieldName = 'TRABAJOS_A_REALIZAR'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabRepararID_GALERIA_RECEPCION: TIntegerField
      DisplayLabel = 'Id Galeria'
      FieldName = 'ID_GALERIA_RECEPCION'
    end
    object QMCabRepararCOMENTARIOS_CLIENTE: TMemoField
      DisplayLabel = 'Comentarios Cli.'
      FieldName = 'COMENTARIOS_CLIENTE'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabRepararAUTORIZA_PRESUPUESTO: TIntegerField
      DisplayLabel = 'Autoriza Presupuesto'
      FieldName = 'AUTORIZA_PRESUPUESTO'
    end
    object QMCabRepararAUTORIZA_PRUEBAS: TIntegerField
      DisplayLabel = 'Autoriza Pruebas'
      FieldName = 'AUTORIZA_PRUEBAS'
    end
    object QMCabRepararPIEZAS_DEL_CLIENTE: TIntegerField
      DisplayLabel = 'Piezaz del Cliente'
      FieldName = 'PIEZAS_DEL_CLIENTE'
    end
    object QMCabRepararRECOGER_PIEZAS_SUSTITUIDAS: TIntegerField
      DisplayLabel = 'Recoger Piezas'
      FieldName = 'RECOGER_PIEZAS_SUSTITUIDAS'
    end
    object QMCabRepararID_FIRMA: TIntegerField
      DisplayLabel = 'Id Firma'
      FieldName = 'ID_FIRMA'
    end
    object QMCabRepararFECHA_HORA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_HORA_CIERRE'
    end
    object QMCabRepararID_INSPECCION_ITV: TIntegerField
      DisplayLabel = 'Id Inspeccion ITV'
      FieldName = 'ID_INSPECCION_ITV'
    end
    object QMCabRepararID_EMPLEADO_ITV: TIntegerField
      DisplayLabel = 'Id Empleado ITV'
      FieldName = 'ID_EMPLEADO_ITV'
    end
    object QMCabRepararEMPLEADO_ITV: TIntegerField
      DisplayLabel = 'Empleado ITV'
      FieldName = 'EMPLEADO_ITV'
    end
    object QMCabRepararNOMBRE_EMPLEADO_ITV: TFIBStringField
      DisplayLabel = 'Nombre Empl. ITV'
      FieldName = 'NOMBRE_EMPLEADO_ITV'
      Size = 60
    end
    object QMCabRepararFECHA_HORA_CIERRE_ITV: TDateTimeField
      DisplayLabel = 'Fec. Cierre ITV'
      FieldName = 'FECHA_HORA_CIERRE_ITV'
    end
    object QMCabRepararTITULO_EMPLEADOS_TAREAS: TFIBStringField
      DisplayLabel = 'Lista Empleados Tareas'
      FieldName = 'TITULO_EMPLEADOS_TAREAS'
      Size = 256
    end
    object QMCabRepararTIEMPO_PRODUCCION: TFIBStringField
      DisplayLabel = 'Tiempo Produccion'
      FieldName = 'TIEMPO_PRODUCCION'
    end
    object QMCabRepararFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 256
    Top = 24
  end
  object DSCabReparar: TDataSource
    DataSet = QMCabReparar
    Left = 144
    Top = 24
  end
  object DSDetReparar: TDataSource
    DataSet = QMDetReparar
    Left = 144
    Top = 72
  end
  object QMDetReparar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM REPAR_DET_REPARACIONES'
      'WHERE'
      '  IDCABREPARAR=?old_IDCABREPARAR AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO REPAR_DET_REPARACIONES'
      
        '  (IDCABREPARAR,'#13#10'UNIDADES,ARTICULO,MATERIAL,PRECIO,TOTAL,LINEA,' +
        'PRECIO_VENTA,TIPO_IVA,EMPRESA,DESCUENTO,'#13#10'TITULO_ART,EJERCICIO,C' +
        'ANAL,IMPORTE_DESCUENTO,IMPORTE_IVA,LIQUIDO,PORCENTAJE_IVA,ID_DET' +
        'ALLES_E_ORIGEN,TIPO_LINEA,ID_P,'#13#10'ORIGEN,PROC_PROMOCION,IDDETREPA' +
        'R)'
      'VALUES'
      
        '  (?IDCABREPARAR,'#13#10'?UNIDADES,?ARTICULO,?MATERIAL,?PRECIO,?TOTAL,' +
        '?LINEA,?PRECIO_VENTA,?TIPO_IVA,?EMPRESA,?DESCUENTO,'#13#10'?TITULO_ART' +
        ',?EJERCICIO,?CANAL,?IMPORTE_DESCUENTO,?IMPORTE_IVA,?LIQUIDO,?POR' +
        'CENTAJE_IVA,?ID_DETALLES_E_ORIGEN,?TIPO_LINEA,?ID_P,'#13#10'?ORIGEN,?P' +
        'ROC_PROMOCION,?IDDETREPAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM REPAR_DET_REPARACIONES'
      'WHERE'
      '  IDCABREPARAR=?IDCABREPARAR AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM REPAR_DET_REPARACIONES'
      'WHERE'
      'IDCABREPARAR = ?IDCABREPARAR'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE REPAR_DET_REPARACIONES'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,ARTICULO=?ARTICULO '
      '  ,MATERIAL=?MATERIAL '
      '  ,PRECIO=?PRECIO '
      '  ,TOTAL=?TOTAL '
      '  ,PRECIO_VENTA=?PRECIO_VENTA '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,EMPRESA=?EMPRESA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,TITULO_ART=?TITULO_ART '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,IMPORTE_DESCUENTO=?IMPORTE_DESCUENTO '
      '  ,IMPORTE_IVA=?IMPORTE_IVA '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,PORCENTAJE_IVA=?PORCENTAJE_IVA '
      '  ,ID_DETALLES_E_ORIGEN=?ID_DETALLES_E_ORIGEN '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,ID_P=?ID_P '
      '  ,ORIGEN=?ORIGEN '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,IDDETREPAR=?IDDETREPAR '
      'WHERE'
      '  IDCABREPARAR=?IDCABREPARAR AND '
      '  LINEA=?LINEA ')
    DataSource = DSCabReparar
    AfterDelete = Graba
    AfterPost = Graba
    BeforeEdit = QMDetRepararBeforeEdit
    BeforeInsert = QMDetRepararBeforeInsert
    OnNewRecord = QMDetRepararNewRecord
    ClavesPrimarias.Strings = (
      'IDCABREPARAR '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'REPAR_DET_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMDetRepararARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMDetRepararARTICULOChange
      Size = 15
    end
    object QMDetRepararIDCABREPARAR: TIntegerField
      DisplayLabel = 'ID Cab. Rep.'
      FieldName = 'IDCABREPARAR'
    end
    object QMDetRepararUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMDetRepararUNIDADESChange
    end
    object QMDetRepararMATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
      Size = 60
    end
    object QMDetRepararPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetRepararTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      ReadOnly = True
    end
    object QMDetRepararLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetRepararPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMDetRepararTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetRepararEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetRepararDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetRepararTITULO_ART: TFIBStringField
      DisplayLabel = 'T'#237'tulo Art'#237'culo'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object QMDetRepararEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetRepararCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetRepararIMPORTEDTO: TFloatField
      DisplayLabel = 'Importe Dto.'
      FieldKind = fkCalculated
      FieldName = 'IMPORTEDTO'
      Calculated = True
    end
    object QMDetRepararIMPORTEIVA: TFloatField
      DisplayLabel = 'Importe IVA'
      FieldKind = fkCalculated
      FieldName = 'IMPORTEIVA'
      Calculated = True
    end
    object QMDetRepararBIMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldKind = fkCalculated
      FieldName = 'BIMPONIBLE'
      Calculated = True
    end
    object QMDetRepararTOTAL_LINEA: TFloatField
      DisplayLabel = 'Total Linea'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_LINEA'
      Calculated = True
    end
    object QMDetRepararIMPORTE_DESCUENTO: TFloatField
      DisplayLabel = 'Importe Dto.'
      FieldName = 'IMPORTE_DESCUENTO'
      ReadOnly = True
    end
    object QMDetRepararPORCENTAJE_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'PORCENTAJE_IVA'
      ReadOnly = True
    end
    object QMDetRepararIMPORTE_IVA: TFloatField
      DisplayLabel = 'Importe IVA'
      FieldName = 'IMPORTE_IVA'
      ReadOnly = True
    end
    object QMDetRepararLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
      ReadOnly = True
    end
    object QMDetRepararID_DETALLES_E_ORIGEN: TIntegerField
      DisplayLabel = 'Id Doc. Origen'
      FieldName = 'ID_DETALLES_E_ORIGEN'
    end
    object QMDetRepararTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetRepararID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMDetRepararORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetRepararPROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom'
      FieldName = 'PROC_PROMOCION'
    end
    object QMDetRepararIDDETREPAR: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'IDDETREPAR'
    end
  end
  object xLstCabReparar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT C.*,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      '        IDCABREPARAR = C.IDCABREPARAR) UNIDADES,'
      '       (SELECT SUM(UNIDADES * PRECIO_VENTA)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      '        IDCABREPARAR = C.IDCABREPARAR) TOTAL_LINEA,'
      '       (SELECT SUM(IMPORTE_DESCUENTO)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      '        IDCABREPARAR = C.IDCABREPARAR) IMPORTE_DESCUENTO,'
      
        '       (SELECT SUM((UNIDADES * PRECIO_VENTA) - ((UNIDADES * PREC' +
        'IO_VENTA) * DESCUENTO / 100))'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      '        IDCABREPARAR = C.IDCABREPARAR) BASE_IMPONIBLE,'
      '       (SELECT SUM(IMPORTE_IVA)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      '        IDCABREPARAR = C.IDCABREPARAR) IMPORTE_IVA,'
      '       (SELECT SUM(LIQUIDO)'
      '        FROM REPAR_DET_REPARACIONES'
      '        WHERE'
      '        IDCABREPARAR = C.IDCABREPARAR) LIQUIDO'
      'FROM VER_REPAR_CAB_REPARACIONES C'
      'WHERE'
      'IDCABREPARAR = :IDCABREPARAR')
    UniDirectional = False
    AfterOpen = xLstCabRepararAfterOpen
    BeforeClose = xLstCabRepararBeforeClose
    Left = 32
    Top = 312
  end
  object xLstDetReparar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM REPAR_DET_REPARACIONES'
      'WHERE'
      'IDCABREPARAR = :IDCABREPARAR AND '
      'LINEA = :LINEA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM REPAR_DET_REPARACIONES'
      'WHERE'
      'IDCABREPARAR = :IDCABREPARAR'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSxLstCabReparar
    AfterOpen = xLstDetRepararAfterOpen
    AfterScroll = xLstDetRepararAfterScroll
    BeforeClose = xLstDetRepararBeforeClose
    Left = 32
    Top = 360
  end
  object DSxLstCabReparar: TDataSource
    DataSet = xLstCabReparar
    Left = 144
    Top = 312
  end
  object DSxLstDetReparar: TDataSource
    DataSet = xLstDetReparar
    Left = 144
    Top = 360
  end
  object frDBCabReparar: TfrDBDataSet
    DataSource = DSxLstCabReparar
    Left = 256
    Top = 312
  end
  object frDBDetReparar: TfrDBDataSet
    DataSource = DSxLstDetReparar
    OpenDataSource = False
    Left = 256
    Top = 360
  end
  object frLstReparar: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de reparaciones'
    RebuildPrinter = False
    OnGetValue = frLstRepararGetValue
    OnBeforePrint = frLstRepararEnterRect
    OnEnterRect = frLstRepararEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 480
    Top = 24
    ReportForm = {19000000}
  end
  object xLstTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TER.*, PROV.TITULO TITULO_PROVINCIA'
      'FROM VER_TERCEROS_EDICION TER'
      
        'LEFT JOIN SYS_LOCALIDADES LOC ON TER.DIR_LOCALIDAD = LOC.LOCALID' +
        'AD'
      
        'LEFT JOIN SYS_PROVINCIAS PROV ON LOC.PAIS = PROV.PAIS AND LOC.PR' +
        'OVINCIA = PROV.PROVINCIA'
      'WHERE'
      'TER.TERCERO = :TERCERO')
    UniDirectional = False
    DataSource = DSxLstCabReparar
    Left = 32
    Top = 408
  end
  object DSxLstTerceros: TDataSource
    DataSet = xLstTerceros
    Left = 144
    Top = 408
  end
  object frDBTerceros: TfrDBDataSet
    DataSource = DSxLstTerceros
    OpenDataSource = False
    Left = 256
    Top = 408
  end
  object xNSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select nserie from art_articulos_serializacion'
      'where codigo=?id_num_serie')
    UniDirectional = False
    DataSource = DSCabReparar
    Left = 32
    Top = 168
    object xNSerieNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
  end
  object DSxNSerie: TDataSource
    DataSet = xNSerie
    Left = 144
    Top = 168
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 368
    Top = 24
  end
  object QMTotales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'WITH T'
      'AS (SELECT C.TOTAL_COSTE,'
      '           (SELECT SUM(UNIDADES)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) UNIDADES,'
      '           (SELECT SUM(UNIDADES * PRECIO_VENTA)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) TOTAL_LINEA,'
      '           (SELECT SUM(IMPORTE_DESCUENTO)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) IMPORTE_DESCUENTO,'
      
        '           (SELECT SUM((UNIDADES * PRECIO_VENTA) - ((UNIDADES * ' +
        'PRECIO_VENTA) * DESCUENTO / 100))'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) BASE_IMPONIBLE,'
      '           (SELECT SUM(IMPORTE_IVA)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) IMPORTE_IVA,'
      '           (SELECT SUM(LIQUIDO)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) LIQUIDO,'
      '           (SELECT SUM(UNIDADES * PRECIO)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) TOTAL_LINEA_COSTO'
      '    FROM REPAR_CAB_REPARACIONES C'
      '    WHERE'
      '    IDCABREPARAR = :IDCABREPARAR)'
      'SELECT T.*,'
      '       CASE T.BASE_IMPONIBLE'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (T.TOTAL_LINEA_COSTO / T.BASE_IMPONIBLE)'
      '       END MARGEN'
      'FROM T')
    SelectSQL.Strings = (
      'WITH T'
      'AS (SELECT C.TOTAL_COSTE,'
      '           (SELECT SUM(UNIDADES)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) UNIDADES,'
      '           (SELECT SUM(UNIDADES * PRECIO_VENTA)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) TOTAL_LINEA,'
      '           (SELECT SUM(IMPORTE_DESCUENTO)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) IMPORTE_DESCUENTO,'
      
        '           (SELECT SUM((UNIDADES * PRECIO_VENTA) - ((UNIDADES * ' +
        'PRECIO_VENTA) * DESCUENTO / 100))'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) BASE_IMPONIBLE,'
      '           (SELECT SUM(IMPORTE_IVA)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) IMPORTE_IVA,'
      '           (SELECT SUM(LIQUIDO)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) LIQUIDO,'
      '           (SELECT SUM(UNIDADES * PRECIO)'
      '            FROM REPAR_DET_REPARACIONES'
      '            WHERE'
      '            IDCABREPARAR = C.IDCABREPARAR) TOTAL_LINEA_COSTO'
      '    FROM REPAR_CAB_REPARACIONES C'
      '    WHERE'
      '    IDCABREPARAR = :IDCABREPARAR)'
      'SELECT T.*,'
      '       CASE T.BASE_IMPONIBLE'
      '         WHEN 0 THEN'
      '             0'
      '         ELSE (T.TOTAL_LINEA_COSTO / T.BASE_IMPONIBLE)'
      '       END MARGEN'
      'FROM T')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSCabReparar
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'REPAR_CAB_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 120
    object QMTotalesTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMTotalesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMTotalesTOTAL_LINEA: TFloatField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object QMTotalesIMPORTE_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Descuento'
      FieldName = 'IMPORTE_DESCUENTO'
    end
    object QMTotalesBRUTO: TFloatField
      DisplayLabel = 'Base Imp.'
      FieldName = 'BASE_IMPONIBLE'
    end
    object QMTotalesIMPORTE_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'IMPORTE_IVA'
    end
    object QMTotalesLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMTotalesTOTAL_LINEA_COSTO: TFloatField
      DisplayLabel = 'Total Costo'
      FieldName = 'TOTAL_LINEA_COSTO'
    end
    object QMTotalesMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSQMTotales: TDataSource
    DataSet = QMTotales
    Left = 144
    Top = 120
  end
  object xEmpleado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM REPAR_CAB_EMPLEADOS'
      'WHERE'
      '  IDCABREPARAR=?old_IDCABREPARAR AND '
      '  LINEA_TAREA=?old_LINEA_TAREA AND '
      '  ID_EMPLEADO=?old_ID_EMPLEADO ')
    InsertSQL.Strings = (
      'INSERT INTO REPAR_CAB_EMPLEADOS'
      '  (IDCABREPARAR,'#13#10'EMPRESA,EMPLEADO,ID_EMPLEADO,LINEA_TAREA)'
      'VALUES'
      '  (?IDCABREPARAR,'#13#10'?EMPRESA,?EMPLEADO,?ID_EMPLEADO,?LINEA_TAREA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM REPAR_CAB_EMPLEADOS'
      'WHERE'
      '  IDCABREPARAR=?IDCABREPARAR AND '
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  ID_EMPLEADO=?ID_EMPLEADO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM REPAR_CAB_EMPLEADOS'
      'WHERE'
      '  IDCABREPARAR = :IDCABREPARACION'
      'ORDER BY LINEA_TAREA, EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE REPAR_CAB_EMPLEADOS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EMPLEADO=?EMPLEADO '
      'WHERE'
      '  IDCABREPARAR=?IDCABREPARAR AND '
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  ID_EMPLEADO=?ID_EMPLEADO ')
    DataSource = DSxTarea
    BeforePost = xEmpleadoBeforePost
    OnNewRecord = xEmpleadoNewRecord
    ClavesPrimarias.Strings = (
      'IDCABREPARAR '
      'LINEA_TAREA '
      'ID_EMPLEADO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'REPAR_CAB_EMPLEADOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 256
    Top = 216
    object xEmpleadoIDCABREPARAR: TIntegerField
      DisplayLabel = 'Id Cab.'
      FieldName = 'IDCABREPARAR'
    end
    object xEmpleadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Mecanico'
      FieldName = 'EMPLEADO'
    end
    object xEmpleadoID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xEmpleadoTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = xEmpleadoTITULOGetText
      Size = 60
      Calculated = True
    end
    object xEmpleadoLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xEmpleadoTIEMPO_PRODUCCION: TFIBStringField
      DisplayLabel = 'Tiempo Produccion'
      FieldName = 'TIEMPO_PRODUCCION'
    end
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 368
    Top = 216
  end
  object xLstEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT C.*'
      'FROM REPAR_CAB_EMPLEADOS E'
      'JOIN VER_EMPLEADOS_CUENTAS C ON E.ID_EMPLEADO = C.ID_EMPLEADO'
      'WHERE'
      'E.IDCABREPARAR = :IDCABREPARAR AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL'
      'ORDER BY E.EMPLEADO')
    UniDirectional = False
    DataSource = DSxLstCabReparar
    Left = 32
    Top = 504
  end
  object DSxLstEmpleado: TDataSource
    DataSet = xLstEmpleado
    Left = 144
    Top = 504
  end
  object xSituacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 6
    RefreshSQL.Strings = (
      'SELECT SITUACION, TITULO FROM REPAR_SITUACIONES'
      'WHERE'
      'SITUACION = ?SITUACION')
    SelectSQL.Strings = (
      'SELECT SITUACION, TITULO FROM REPAR_SITUACIONES'
      'ORDER BY SITUACION')
    UniDirectional = False
    DataSource = DSCabReparar
    Left = 256
    Top = 168
    object xSituacionSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object xSituacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSituacion: TDataSource
    DataSet = xSituacion
    Left = 368
    Top = 168
  end
  object xLstFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF, FECHA, COMENTARIO FROM GES_FIRMAS'
      'WHERE'
      'TIPO = '#39'REP'#39' AND'
      'ID_DOC = :IDCABREPARAR AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSxLstCabReparar
    Left = 32
    Top = 456
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 144
    Top = 456
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    OpenDataSource = False
    Left = 256
    Top = 456
  end
  object QMFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF FROM GES_FIRMAS'
      'WHERE'
      'TIPO = '#39'REP'#39' AND'
      'ID_DOC = :IDCABREPARAR AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSCabReparar
    Left = 256
    Top = 120
    object QMFirmasID_FIRMA: TIntegerField
      DisplayLabel = 'Id Firma'
      FieldName = 'ID_FIRMA'
    end
    object QMFirmasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMFirmasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSQMFirmas: TDataSource
    DataSet = QMFirmas
    Left = 368
    Top = 120
  end
  object frxLstReparar: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 43614.8142370255
    ReportOptions.LastChange = 43614.8142370255
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxLstRepararBeforePrint
    OnGetValue = frxLstRepararGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 480
    Top = 72
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBxLstCabReparar: TfrxDBDataset
    UserName = 'frxDBxLstCabReparar'
    CloseDataSource = False
    DataSet = xLstCabReparar
    Left = 376
    Top = 312
  end
  object frxDBxLstDetReparar: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = xLstDetReparar
    Left = 376
    Top = 360
  end
  object frxDBxLstTerceros: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = xLstTerceros
    Left = 376
    Top = 408
  end
  object frxDBxLstFirmas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = xLstFirmas
    Left = 376
    Top = 456
  end
  object xLstFichaTecnica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_FICHA_TECNICA'
      'WHERE'
      'ID_FICHA_TECNICA = :ID_FICHA_TECNICA')
    UniDirectional = False
    DataSource = DSxLstCabReparar
    Left = 32
    Top = 552
  end
  object DSxLstFichaTecnica: TDataSource
    DataSet = xLstFichaTecnica
    Left = 144
    Top = 552
  end
  object xLstRecepcion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_REP_RECEPCION'
      'WHERE'
      'ID_REP_RECEPCION = :ID_REP_RECEPCION')
    UniDirectional = False
    DataSource = DSxLstCabReparar
    Left = 32
    Top = 600
  end
  object DSxLstRecepcion: TDataSource
    DataSet = xLstRecepcion
    Left = 144
    Top = 600
  end
  object xLstArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLstLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSxLstDetReparar
    Left = 32
    Top = 648
  end
  object DSxLstArticulo: TDataSource
    DataSet = xLstArticulo
    Left = 144
    Top = 648
  end
  object TLstLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 312
    Top = 24
  end
  object xTarea: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_REP_TAREA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  REPARACION=?old_REPARACION AND '
      '  LINEA_TAREA=?old_LINEA_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_REP_TAREA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,REPARACION,IDCABREPARACION,LI' +
        'NEA_TAREA,TAREA,TIPOTAREA,COMENTARIO,RECURSO,'#13#10'CANTIDAD,PRE_COS_' +
        'UNI_PRE,TOTAL_VAR_PRE,PRECIO_FIJO_PRE,TOTAL_PRE,PRE_COS_UNI_REAL' +
        ',TOTAL_VAR_REAL,PRECIO_FIJO_REAL,TOTAL_REAL,ESTADO,'#13#10'FECHA_FIN_T' +
        'AREA,IDENTIFICADOR,ENTRADA,CANTIDAD_UTIL,TIEMPO,TIEMPO_UTIL,TOTA' +
        'L_IMP,PRECIO_IMP,TOTAL,TOTAL_HORAS,'#13#10'TIEMPO_PRODUCCION,FECHA_INI' +
        'CIO_TAREA,SECCION,PRODUCIENDO,SITUACION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?REPARACION,?IDCABREPARAC' +
        'ION,?LINEA_TAREA,?TAREA,?TIPOTAREA,?COMENTARIO,?RECURSO,'#13#10'?CANTI' +
        'DAD,?PRE_COS_UNI_PRE,?TOTAL_VAR_PRE,?PRECIO_FIJO_PRE,?TOTAL_PRE,' +
        '?PRE_COS_UNI_REAL,?TOTAL_VAR_REAL,?PRECIO_FIJO_REAL,?TOTAL_REAL,' +
        '?ESTADO,'#13#10'?FECHA_FIN_TAREA,?IDENTIFICADOR,?ENTRADA,?CANTIDAD_UTI' +
        'L,?TIEMPO,?TIEMPO_UTIL,?TOTAL_IMP,?PRECIO_IMP,?TOTAL,?TOTAL_HORA' +
        'S,'#13#10'?TIEMPO_PRODUCCION,?FECHA_INICIO_TAREA,?SECCION,?PRODUCIENDO' +
        ',?SITUACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_REP_TAREA'
      'WHERE'
      '  IDENTIFICADOR = :IDENTIFICADOR')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_REP_TAREA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  REPARACION=?REPARACION'
      'ORDER BY LINEA_TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_REP_TAREA'
      'SET'
      '  IDCABREPARACION=?IDCABREPARACION '
      '  ,TAREA=?TAREA '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,RECURSO=?RECURSO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRE_COS_UNI_PRE=?PRE_COS_UNI_PRE '
      '  ,TOTAL_VAR_PRE=?TOTAL_VAR_PRE '
      '  ,PRECIO_FIJO_PRE=?PRECIO_FIJO_PRE '
      '  ,TOTAL_PRE=?TOTAL_PRE '
      '  ,PRE_COS_UNI_REAL=?PRE_COS_UNI_REAL '
      '  ,TOTAL_VAR_REAL=?TOTAL_VAR_REAL '
      '  ,PRECIO_FIJO_REAL=?PRECIO_FIJO_REAL '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,ESTADO=?ESTADO '
      '  ,FECHA_FIN_TAREA=?FECHA_FIN_TAREA '
      '  ,IDENTIFICADOR=?IDENTIFICADOR '
      '  ,ENTRADA=?ENTRADA '
      '  ,CANTIDAD_UTIL=?CANTIDAD_UTIL '
      '  ,TIEMPO=?TIEMPO '
      '  ,TIEMPO_UTIL=?TIEMPO_UTIL '
      '  ,TOTAL_IMP=?TOTAL_IMP '
      '  ,PRECIO_IMP=?PRECIO_IMP '
      '  ,TOTAL=?TOTAL '
      '  ,TOTAL_HORAS=?TOTAL_HORAS '
      '  ,TIEMPO_PRODUCCION=?TIEMPO_PRODUCCION '
      '  ,FECHA_INICIO_TAREA=?FECHA_INICIO_TAREA '
      '  ,SECCION=?SECCION '
      '  ,PRODUCIENDO=?PRODUCIENDO '
      '  ,SITUACION=?SITUACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  REPARACION=?REPARACION AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    DataSource = DSCabReparar
    BeforePost = xTareaBeforePost
    OnNewRecord = xTareaNewRecord
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_REP_TAREA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 216
    object xTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTareaREPARACION: TIntegerField
      DisplayLabel = 'Reparacion'
      FieldName = 'REPARACION'
    end
    object xTareaIDCABREPARACION: TIntegerField
      DisplayLabel = 'Id Rep.'
      FieldName = 'IDCABREPARACION'
    end
    object xTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_TAREA'
    end
    object xTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      OnChange = xTareaTIPOTAREAChange
      Size = 3
    end
    object xTareaCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Precio Cost. Uni Rep.'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object xTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Pre.'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object xTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Pre.'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object xTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Pre.'
      FieldName = 'TOTAL_PRE'
    end
    object xTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Pre. Cos. Uni. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xTareaFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fecha Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object xTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xTareaENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xTareaCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cant. Util'
      FieldName = 'CANTIDAD_UTIL'
    end
    object xTareaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object xTareaTIEMPO_UTIL: TFloatField
      DisplayLabel = 'Tiempo Util'
      FieldName = 'TIEMPO_UTIL'
    end
    object xTareaTOTAL_IMP: TFloatField
      DisplayLabel = 'Totla Imp.'
      FieldName = 'TOTAL_IMP'
    end
    object xTareaPRECIO_IMP: TFloatField
      DisplayLabel = 'Precio Imp.'
      FieldName = 'PRECIO_IMP'
    end
    object xTareaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xTareaTOTAL_HORAS: TFloatField
      DisplayLabel = 'Total Horas'
      FieldName = 'TOTAL_HORAS'
    end
    object xTareaTIEMPO_PRODUCCION: TFIBStringField
      DisplayLabel = 'Tiempo Produccion'
      FieldName = 'TIEMPO_PRODUCCION'
    end
    object xTareaFECHA_INICIO_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Inicio Tarea'
      FieldName = 'FECHA_INICIO_TAREA'
    end
    object xTareaSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xTareaPRODUCIENDO: TIntegerField
      DisplayLabel = 'Produciendo'
      FieldName = 'PRODUCIENDO'
    end
    object xTareaSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 144
    Top = 216
  end
end
