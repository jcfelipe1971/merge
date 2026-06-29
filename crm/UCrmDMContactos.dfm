object CrmDMContactos: TCrmDMContactos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 550
  Top = 165
  Height = 668
  Width = 908
  object DSQMContactos: TDataSource
    DataSet = QMContactos
    Left = 40
    Top = 56
  end
  object DSQMPersonas: TDataSource
    DataSet = QMPersonas
    Left = 136
    Top = 56
  end
  object QMPersonas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACTOS_PERSONAS'
      'WHERE'
      '  ID_CONTACTO=?old_ID_CONTACTO AND '
      '  NUM_PERSONA=?old_NUM_PERSONA ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACTOS_PERSONAS'
      
        '  (ID_CONTACTO,'#13#10'NUM_PERSONA,NOMBRE,APELLIDOS,TELEFONO,MOVIL,FAX' +
        ',EXTENSION,EMAIL,NOTAS,ID_PERSONA,'#13#10'CARGO,ENVIO_EMAIL,FECHA_EXPO' +
        'RTACION_CORREO,BREVO,ID_CONTACTO_PERSONA_BREVO)'
      'VALUES'
      
        '  (?ID_CONTACTO,'#13#10'?NUM_PERSONA,?NOMBRE,?APELLIDOS,?TELEFONO,?MOV' +
        'IL,?FAX,?EXTENSION,?EMAIL,?NOTAS,?ID_PERSONA,'#13#10'?CARGO,?ENVIO_EMA' +
        'IL,?FECHA_EXPORTACION_CORREO,?BREVO,?ID_CONTACTO_PERSONA_BREVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_PERSONAS'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  NUM_PERSONA=?NUM_PERSONA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_PERSONAS'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO '
      'ORDER BY NUM_PERSONA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONTACTOS_PERSONAS'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,APELLIDOS=?APELLIDOS '
      '  ,TELEFONO=?TELEFONO '
      '  ,MOVIL=?MOVIL '
      '  ,FAX=?FAX '
      '  ,EXTENSION=?EXTENSION '
      '  ,EMAIL=?EMAIL '
      '  ,NOTAS=?NOTAS '
      '  ,ID_PERSONA=?ID_PERSONA '
      '  ,CARGO=?CARGO '
      '  ,ENVIO_EMAIL=?ENVIO_EMAIL '
      '  ,FECHA_EXPORTACION_CORREO=?FECHA_EXPORTACION_CORREO '
      '  ,BREVO=?BREVO '
      '  ,ID_CONTACTO_PERSONA_BREVO=?ID_CONTACTO_PERSONA_BREVO '
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  NUM_PERSONA=?NUM_PERSONA ')
    DataSource = DSQMContactos
    OnNewRecord = QMPersonasNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONTACTO '
      'NUM_PERSONA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONTACTOS_PERSONAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 136
    Top = 8
    object QMPersonasID_CONTACTO: TIntegerField
      DisplayLabel = 'Id. Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object QMPersonasNUM_PERSONA: TIntegerField
      DisplayLabel = 'N'#250'm. Persona'
      FieldName = 'NUM_PERSONA'
    end
    object QMPersonasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object QMPersonasAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
    object QMPersonasTELEFONO: TFIBStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
    end
    object QMPersonasMOVIL: TFIBStringField
      DisplayLabel = 'M'#243'vil'
      FieldName = 'MOVIL'
    end
    object QMPersonasFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object QMPersonasEXTENSION: TFIBStringField
      DisplayLabel = 'Extension'
      FieldName = 'EXTENSION'
      Size = 5
    end
    object QMPersonasEMAIL: TFIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMPersonasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPersonasENVIO_EMAIL: TIntegerField
      DisplayLabel = 'Envia E-mail'
      FieldName = 'ENVIO_EMAIL'
    end
    object QMPersonasFECHA_EXPORTACION_CORREO: TDateTimeField
      DisplayLabel = 'Fec. Exportacion Email'
      FieldName = 'FECHA_EXPORTACION_CORREO'
    end
    object QMPersonasBREVO: TIntegerField
      DisplayLabel = 'Brevo'
      FieldName = 'BREVO'
    end
    object QMPersonasID_CONTACTO_PERSONA_BREVO: TIntegerField
      DisplayLabel = 'Id Contacto Brevo'
      FieldName = 'ID_CONTACTO_PERSONA_BREVO'
    end
    object QMPersonasID_PERSONA: TIntegerField
      DisplayLabel = 'Id Persona'
      FieldName = 'ID_PERSONA'
    end
    object QMPersonasCARGO: TFIBStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 35
    end
  end
  object QMContactos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_VER_CONTACTOS'
      'WHERE'
      '  ID_CONTACTO=?old_ID_CONTACTO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_VER_CONTACTOS'
      
        '  (FECHA_ALTA,DIR_LOCALIDAD,NOTAS,COMENTARIO,CODPOSTAL,LATITUD,L' +
        'ONGITUD,ULT_MODIFICACION,IMAGEN,ID_CONTACTO,NUM_CONTACTO,TERCERO' +
        ',ID_LOCAL,CLIENTE,AMBITO,ID_AGENTE,AGENTE,ENTRADA,CODIGO_IMAGEN,' +
        'ID_GALERIA,EMPRESA,NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL,TIPO_RAZON,N' +
        'IF,TELEFONO01,TELEFONO02,TELEFAX,DIR_NOMBRE,EMAIL,WEB,RUTA_IMAGE' +
        'N,LINK_GOOGLE,ACTIVITAT_ECONOMICA,TITULO,PROVINCIA,TITULO_PAIS,D' +
        'ESC_AGENTE,CLI_PROV_IMP,IPAD_VISIBLE,DIRECCION,NOMBRE_CORTO,ORIG' +
        'EN_CONTACTO,FORMA_DE_PAGO_IMP,PAIS,ZONA,MARCA_CONTACTO,FORMATO,D' +
        'IAS_ENTRE_VISITAS,HORARIO_1_DESDE,HORARIO_1_HASTA,HORARIO_2_DESD' +
        'E,HORARIO_2_HASTA,FECHA_ULTIMA_VISITA,ID_RUTA)'
      'VALUES'
      
        '  (?FECHA_ALTA,?DIR_LOCALIDAD,?NOTAS,?COMENTARIO,?CODPOSTAL,?LAT' +
        'ITUD,?LONGITUD,?ULT_MODIFICACION,?IMAGEN,?ID_CONTACTO,?NUM_CONTA' +
        'CTO,?TERCERO,?ID_LOCAL,?CLIENTE,?AMBITO,?ID_AGENTE,?AGENTE,?ENTR' +
        'ADA,?CODIGO_IMAGEN,?ID_GALERIA,?EMPRESA,?NOMBRE_R_SOCIAL,?NOMBRE' +
        '_COMERCIAL,?TIPO_RAZON,?NIF,?TELEFONO01,?TELEFONO02,?TELEFAX,?DI' +
        'R_NOMBRE,?EMAIL,?WEB,?RUTA_IMAGEN,?LINK_GOOGLE,?ACTIVITAT_ECONOM' +
        'ICA,?TITULO,?PROVINCIA,?TITULO_PAIS,?DESC_AGENTE,?CLI_PROV_IMP,?' +
        'IPAD_VISIBLE,?DIRECCION,?NOMBRE_CORTO,?ORIGEN_CONTACTO,?FORMA_DE' +
        '_PAGO_IMP,?PAIS,?ZONA,?MARCA_CONTACTO,?FORMATO,?DIAS_ENTRE_VISIT' +
        'AS,?HORARIO_1_DESDE,?HORARIO_1_HASTA,?HORARIO_2_DESDE,?HORARIO_2' +
        '_HASTA,?FECHA_ULTIMA_VISITA,?ID_RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_VER_CONTACTOS'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_VER_CONTACTOS'
      'ORDER BY ID_CONTACTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE CRM_VER_CONTACTOS'
      'SET'
      '  FECHA_ALTA=?FECHA_ALTA '
      '  ,DIR_LOCALIDAD=?DIR_LOCALIDAD '
      '  ,NOTAS=?NOTAS '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,CODPOSTAL=?CODPOSTAL '
      '  ,LATITUD=?LATITUD '
      '  ,LONGITUD=?LONGITUD '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,IMAGEN=?IMAGEN '
      '  ,NUM_CONTACTO=?NUM_CONTACTO '
      '  ,TERCERO=?TERCERO '
      '  ,ID_LOCAL=?ID_LOCAL '
      '  ,CLIENTE=?CLIENTE '
      '  ,AMBITO=?AMBITO '
      '  ,ID_AGENTE=?ID_AGENTE '
      '  ,AGENTE=?AGENTE '
      '  ,ENTRADA=?ENTRADA '
      '  ,CODIGO_IMAGEN=?CODIGO_IMAGEN '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,EMPRESA=?EMPRESA '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,TIPO_RAZON=?TIPO_RAZON '
      '  ,NIF=?NIF '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,DIR_NOMBRE=?DIR_NOMBRE '
      '  ,EMAIL=?EMAIL '
      '  ,WEB=?WEB '
      '  ,RUTA_IMAGEN=?RUTA_IMAGEN '
      '  ,LINK_GOOGLE=?LINK_GOOGLE '
      '  ,ACTIVITAT_ECONOMICA=?ACTIVITAT_ECONOMICA '
      '  ,TITULO=?TITULO '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,TITULO_PAIS=?TITULO_PAIS '
      '  ,DESC_AGENTE=?DESC_AGENTE '
      '  ,CLI_PROV_IMP=?CLI_PROV_IMP '
      '  ,IPAD_VISIBLE=?IPAD_VISIBLE '
      '  ,DIRECCION=?DIRECCION '
      '  ,NOMBRE_CORTO=?NOMBRE_CORTO '
      '  ,ORIGEN_CONTACTO=?ORIGEN_CONTACTO '
      '  ,FORMA_DE_PAGO_IMP=?FORMA_DE_PAGO_IMP '
      '  ,PAIS=?PAIS '
      '  ,ZONA=?ZONA '
      '  ,MARCA_CONTACTO=?MARCA_CONTACTO '
      '  ,FORMATO=?FORMATO '
      '  ,DIAS_ENTRE_VISITAS=?DIAS_ENTRE_VISITAS '
      '  ,HORARIO_1_DESDE=?HORARIO_1_DESDE '
      '  ,HORARIO_1_HASTA=?HORARIO_1_HASTA '
      '  ,HORARIO_2_DESDE=?HORARIO_2_DESDE '
      '  ,HORARIO_2_HASTA=?HORARIO_2_HASTA '
      '  ,FECHA_ULTIMA_VISITA=?FECHA_ULTIMA_VISITA '
      '  ,ID_RUTA=?ID_RUTA '
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO ')
    AfterOpen = QMContactosAfterOpen
    BeforeClose = QMContactosBeforeClose
    BeforePost = QMContactosBeforePost
    OnNewRecord = QMContactosNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONTACTO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_VER_CONTACTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMContactosID_CONTACTO: TIntegerField
      DisplayLabel = 'Id. Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object QMContactosNUM_CONTACTO: TIntegerField
      DisplayLabel = 'N'#250'm. Contacto'
      FieldName = 'NUM_CONTACTO'
    end
    object QMContactosFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMContactosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMContactosTERCEROChange
    end
    object QMContactosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMContactosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMContactosNOMBRE_CORTO: TFIBStringField
      DisplayLabel = 'Nombre Corto'
      FieldName = 'NOMBRE_CORTO'
      Size = 15
    end
    object QMContactosTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Raz'#243'n'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object QMContactosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMContactosTELEFONO01: TFIBStringField
      DisplayLabel = 'Telefono 01'
      FieldName = 'TELEFONO01'
    end
    object QMContactosTELEFONO02: TFIBStringField
      DisplayLabel = 'Telefono 02'
      FieldName = 'TELEFONO02'
    end
    object QMContactosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object QMContactosDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direcci'#243'n'
      DisplayWidth = 200
      FieldName = 'DIR_NOMBRE'
      Size = 200
    end
    object QMContactosDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      OnChange = QMContactosDIR_LOCALIDADChange
      Size = 8
    end
    object QMContactosID_LOCAL: TIntegerField
      DisplayLabel = 'ID Loc.'
      FieldName = 'ID_LOCAL'
    end
    object QMContactosEMAIL: TFIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMContactosWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object QMContactosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMContactosCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMContactosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMContactosCLIENTEChange
    end
    object QMContactosRUTA_IMAGEN: TFIBStringField
      DisplayLabel = 'Ruta Imagen'
      FieldName = 'RUTA_IMAGEN'
      Size = 200
    end
    object QMContactosORIGEN_CONTACTO: TFIBStringField
      DisplayLabel = 'Orig. Contacto'
      FieldName = 'ORIGEN_CONTACTO'
      Size = 3
    end
    object QMContactosLINK_GOOGLE: TFIBStringField
      DisplayLabel = 'Link Google'
      FieldName = 'LINK_GOOGLE'
      Size = 200
    end
    object QMContactosAMBITO: TIntegerField
      DisplayLabel = 'Ambito'
      FieldName = 'AMBITO'
    end
    object QMContactosACTIVITAT_ECONOMICA: TFIBStringField
      DisplayLabel = 'Act. Economica'
      FieldName = 'ACTIVITAT_ECONOMICA'
      Size = 200
    end
    object QMContactosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMContactosCODPOSTAL: TFIBStringField
      DisplayLabel = 'C. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object QMContactosPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMContactosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object QMContactosAGENTE: TIntegerField
      DisplayLabel = 'ID Agente'
      FieldName = 'AGENTE'
    end
    object QMContactosFORMA_DE_PAGO_IMP: TFIBStringField
      DisplayLabel = 'F. PAgo'
      FieldName = 'FORMA_DE_PAGO_IMP'
      Size = 3
    end
    object QMContactosCLI_PROV_IMP: TFIBStringField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'CLI_PROV_IMP'
      Size = 40
    end
    object QMContactosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContactosDESC_AGENTE: TFIBStringField
      DisplayLabel = 'Desc. Agente'
      FieldName = 'DESC_AGENTE'
      Size = 60
    end
    object QMContactosTITULO_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'TITULO_PAIS'
      Size = 60
    end
    object QMContactosZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMContactosIPAD_VISIBLE: TIntegerField
      DisplayLabel = 'Visible IPad'
      FieldName = 'IPAD_VISIBLE'
    end
    object QMContactosMARCA_CONTACTO: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_CONTACTO'
      Size = 1
    end
    object QMContactosLATITUD: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'LATITUD'
    end
    object QMContactosLONGITUD: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
    object QMContactosULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modif.'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMContactosIMAGEN: TBlobField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
      Size = 8
    end
    object QMContactosFORMATO: TFIBStringField
      DisplayLabel = 'Formato'
      FieldName = 'FORMATO'
      Size = 5
    end
    object QMContactosORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldKind = fkCalculated
      FieldName = 'ORIGEN'
      Calculated = True
    end
    object QMContactosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMContactosCODIGO_IMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'CODIGO_IMAGEN'
    end
    object QMContactosID_GALERIA: TIntegerField
      DisplayLabel = 'Id. Galeria'
      FieldName = 'ID_GALERIA'
    end
    object QMContactosDIRECCION: TIntegerField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
    end
    object QMContactosDIAS_ENTRE_VISITAS: TIntegerField
      DisplayLabel = 'Dias e/visitas'
      FieldName = 'DIAS_ENTRE_VISITAS'
    end
    object QMContactosFECHA_ULTIMA_VISITA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Visita'
      FieldName = 'FECHA_ULTIMA_VISITA'
    end
    object QMContactosHORARIO_1_DESDE: TDateTimeField
      DisplayLabel = 'Horario 1 Desde'
      FieldName = 'HORARIO_1_DESDE'
    end
    object QMContactosHORARIO_1_HASTA: TDateTimeField
      DisplayLabel = 'Horario 1 Hasta'
      FieldName = 'HORARIO_1_HASTA'
    end
    object QMContactosHORARIO_2_DESDE: TDateTimeField
      DisplayLabel = 'Horario 2 Desde'
      FieldName = 'HORARIO_2_DESDE'
    end
    object QMContactosHORARIO_2_HASTA: TDateTimeField
      DisplayLabel = 'Horario 2 Hasta'
      FieldName = 'HORARIO_2_HASTA'
    end
    object QMContactosID_RUTA: TIntegerField
      DisplayLabel = 'Id Ruta'
      FieldName = 'ID_RUTA'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 808
    Top = 8
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM CRM_VER_AGRUPACIONES_CON'
      'where id_contacto = ?id_contacto'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 232
    Top = 344
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'C'#39' and '
      'agrupacion not in '
      '  (select agrupacion from crm_contactos_agrupaciones '
      '    where id_contacto = ?id_contacto)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 232
    Top = 392
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 328
    Top = 392
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 328
    Top = 344
  end
  object QMAcciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACTOS_ACCIONES'
      'WHERE'
      '  ID_CONTACTO=?old_ID_CONTACTO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACTOS_ACCIONES'
      
        '  (ID_CONTACTO,'#13#10'LINEA,EMPRESA_AGENTE,AGENTE,FECHA_ACCION,TIPO_A' +
        'CCION,DESCRIPCION_ACCION,NOTAS,FIN_ACCION,FECHA_PROX_ACCION,TIPO' +
        '_PROX_ACCION,'#13#10'DESCRIPCION_PROX_ACCION,HORA_PROX_ACCION,ID_ACCIO' +
        'N,DOC_ACCION,DOC_EMPRESAS,DOC_CANAL,DOC_SERIES,DOC_EJERCICIO,PRO' +
        'GRESO,IMPORTE,'#13#10'MONEDA,ID_ACCION_CAB,ULT_MODIFICACION,ID_FICHA_T' +
        'ECNICA)'
      'VALUES'
      
        '  (?ID_CONTACTO,'#13#10'?LINEA,?EMPRESA_AGENTE,?AGENTE,?FECHA_ACCION,?' +
        'TIPO_ACCION,?DESCRIPCION_ACCION,?NOTAS,?FIN_ACCION,?FECHA_PROX_A' +
        'CCION,?TIPO_PROX_ACCION,'#13#10'?DESCRIPCION_PROX_ACCION,?HORA_PROX_AC' +
        'CION,?ID_ACCION,?DOC_ACCION,?DOC_EMPRESAS,?DOC_CANAL,?DOC_SERIES' +
        ',?DOC_EJERCICIO,?PROGRESO,?IMPORTE,'#13#10'?MONEDA,?ID_ACCION_CAB,?ULT' +
        '_MODIFICACION,?ID_FICHA_TECNICA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_ACCIONES'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CRM_CONTACTOS_ACCIONES'
      'WHERE'
      'ID_CONTACTO = :ID_CONTACTO AND'
      '((AGENTE = :AGENTE_USUARIO) OR (:AGENTE_USUARIO = 0))'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONTACTOS_ACCIONES'
      'SET'
      '  EMPRESA_AGENTE=?EMPRESA_AGENTE '
      '  ,AGENTE=?AGENTE '
      '  ,FECHA_ACCION=?FECHA_ACCION '
      '  ,TIPO_ACCION=?TIPO_ACCION '
      '  ,DESCRIPCION_ACCION=?DESCRIPCION_ACCION '
      '  ,NOTAS=?NOTAS '
      '  ,FIN_ACCION=?FIN_ACCION '
      '  ,FECHA_PROX_ACCION=?FECHA_PROX_ACCION '
      '  ,TIPO_PROX_ACCION=?TIPO_PROX_ACCION '
      '  ,DESCRIPCION_PROX_ACCION=?DESCRIPCION_PROX_ACCION '
      '  ,HORA_PROX_ACCION=?HORA_PROX_ACCION '
      '  ,ID_ACCION=?ID_ACCION '
      '  ,DOC_ACCION=?DOC_ACCION '
      '  ,DOC_EMPRESAS=?DOC_EMPRESAS '
      '  ,DOC_CANAL=?DOC_CANAL '
      '  ,DOC_SERIES=?DOC_SERIES '
      '  ,DOC_EJERCICIO=?DOC_EJERCICIO '
      '  ,PROGRESO=?PROGRESO '
      '  ,IMPORTE=?IMPORTE '
      '  ,MONEDA=?MONEDA '
      '  ,ID_ACCION_CAB=?ID_ACCION_CAB '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMContactos
    AfterDelete = QMAccionesAfterPost
    AfterOpen = QMAccionesAfterOpen
    AfterPost = QMAccionesAfterPost
    AfterScroll = QMAccionesAfterScroll
    BeforeClose = QMAccionesBeforeClose
    OnNewRecord = QMAccionesNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONTACTO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONTACTOS_ACCIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 8
    object QMAccionesID_CONTACTO: TIntegerField
      DisplayLabel = 'Id. Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object QMAccionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMAccionesEMPRESA_AGENTE: TIntegerField
      DisplayLabel = 'Empresa Agente'
      FieldName = 'EMPRESA_AGENTE'
    end
    object QMAccionesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAccionesFECHA_ACCION: TDateTimeField
      DisplayLabel = 'Fecha Acci'#243'n'
      FieldName = 'FECHA_ACCION'
    end
    object QMAccionesTIPO_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Acci'#243'n'
      FieldName = 'TIPO_ACCION'
      OnChange = QMAccionesTIPO_ACCIONChange
      Size = 3
    end
    object QMAccionesDESCRIPCION_ACCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n Acci'#243'n'
      FieldName = 'DESCRIPCION_ACCION'
      Size = 60
    end
    object QMAccionesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAccionesFIN_ACCION: TIntegerField
      DisplayLabel = 'Fin Acci'#243'n'
      FieldName = 'FIN_ACCION'
      OnChange = QMAccionesFIN_ACCIONChange
    end
    object QMAccionesFECHA_PROX_ACCION: TDateTimeField
      DisplayLabel = 'Fecha Pr'#243'x. Acci'#243'n'
      FieldName = 'FECHA_PROX_ACCION'
    end
    object QMAccionesTIPO_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Pr'#243'x. Acci'#243'n'
      FieldName = 'TIPO_PROX_ACCION'
      OnChange = QMAccionesTIPO_PROX_ACCIONChange
      Size = 3
    end
    object QMAccionesDESCRIPCION_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n Pr'#243'x. Acci'#243'n'
      FieldName = 'DESCRIPCION_PROX_ACCION'
      Size = 60
    end
    object QMAccionesHORA_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Hora Prox. Accion'
      FieldName = 'HORA_PROX_ACCION'
      Size = 15
    end
    object QMAccionesID_ACCION: TIntegerField
      DisplayLabel = 'ID Accion'
      FieldName = 'ID_ACCION'
    end
    object QMAccionesDOC_ACCION: TIntegerField
      DisplayLabel = 'Accion Doc.'
      FieldName = 'DOC_ACCION'
      OnChange = QMAccionesDOC_ACCIONChange
    end
    object QMAccionesDOC_EMPRESAS: TIntegerField
      DisplayLabel = 'Empresa Doc.'
      FieldName = 'DOC_EMPRESAS'
    end
    object QMAccionesDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object QMAccionesDOC_SERIES: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIES'
      Size = 10
    end
    object QMAccionesDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object QMAccionesID_ACCION_CAB: TIntegerField
      DisplayLabel = 'ID Accion Cab.'
      FieldName = 'ID_ACCION_CAB'
    end
    object QMAccionesPROGRESO: TIntegerField
      DisplayLabel = 'Progreso'
      FieldName = 'PROGRESO'
    end
    object QMAccionesID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Fic. Tecnica'
      FieldName = 'ID_FICHA_TECNICA'
    end
  end
  object DSQMAcciones: TDataSource
    DataSet = QMAcciones
    Left = 328
    Top = 56
  end
  object xLocalidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad = ?dir_localidad')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 232
    Top = 200
    object xLocalidadLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xLocalidadTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xLocalidadCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xLocalidadPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xLocalidadINE: TFIBStringField
      DisplayLabel = 'I.N.E.'
      FieldName = 'INE'
      Size = 2
    end
    object xLocalidadPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object xLocalidadC_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'C_PAIS'
      Size = 3
    end
    object xLocalidadIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xLocalidadID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
  end
  object DSxLocalidad: TDataSource
    DataSet = xLocalidad
    Left = 328
    Top = 200
  end
  object xRazones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_TERCEROS_RAZONES'
      'where razon=?tipo_razon')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 232
    Top = 152
    object xRazonesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxRazones: TDataSource
    DataSet = xRazones
    Left = 328
    Top = 152
  end
  object xAgenteAccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT agente, titulo FROM VER_AGENTES '
      'where empresa=?empresa_agente and agente=?agente')
    UniDirectional = False
    DataSource = DSQMAcciones
    Left = 40
    Top = 152
    object xAgenteAccionAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAgenteAccionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxAgenteAccion: TDataSource
    DataSet = xAgenteAccion
    Left = 136
    Top = 152
  end
  object QMAccionesDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      '  ID_CONTACTO=?old_ID_CONTACTO AND '
      '  LINEA_CAB=?old_LINEA_CAB AND '
      '  ORDEN=?old_ORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACTOS_ACCIONES_DET'
      
        '  (ID_CONTACTO,'#13#10'LINEA_CAB,ORDEN,ID_ACCION_DET,ID_ACCION,FECHA,D' +
        'ESCRIPCION_SEGUIMIENTO,HORA_ACCION,NOTAS,FIN_SEG,ID_SEG_SIGUIENT' +
        'E,'#13#10'FECHA_SEG_SIGUIENTE,DESCRIPCION_ACCION,ID_UBICACION,PROGRESO' +
        ',ID_EKEVENT,HORARIO_DESDE,HORARIO_HASTA,EMPRESA_AGENTE,AGENTE,TI' +
        'PO_SEG,'#13#10'ULT_MODIFICACION)'
      'VALUES'
      
        '  (?ID_CONTACTO,'#13#10'?LINEA_CAB,?ORDEN,?ID_ACCION_DET,?ID_ACCION,?F' +
        'ECHA,?DESCRIPCION_SEGUIMIENTO,?HORA_ACCION,?NOTAS,?FIN_SEG,?ID_S' +
        'EG_SIGUIENTE,'#13#10'?FECHA_SEG_SIGUIENTE,?DESCRIPCION_ACCION,?ID_UBIC' +
        'ACION,?PROGRESO,?ID_EKEVENT,?HORARIO_DESDE,?HORARIO_HASTA,?EMPRE' +
        'SA_AGENTE,?AGENTE,?TIPO_SEG,'#13#10'?ULT_MODIFICACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA_CAB=?LINEA_CAB AND '
      '  ORDEN=?ORDEN ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      'ID_CONTACTO = :ID_CONTACTO AND'
      'LINEA_CAB = :LINEA'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONTACTOS_ACCIONES_DET'
      'SET'
      '  ID_ACCION_DET=?ID_ACCION_DET '
      '  ,ID_ACCION=?ID_ACCION '
      '  ,FECHA=?FECHA '
      '  ,DESCRIPCION_SEGUIMIENTO=?DESCRIPCION_SEGUIMIENTO '
      '  ,HORA_ACCION=?HORA_ACCION '
      '  ,NOTAS=?NOTAS '
      '  ,FIN_SEG=?FIN_SEG '
      '  ,ID_SEG_SIGUIENTE=?ID_SEG_SIGUIENTE '
      '  ,FECHA_SEG_SIGUIENTE=?FECHA_SEG_SIGUIENTE '
      '  ,DESCRIPCION_ACCION=?DESCRIPCION_ACCION '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,PROGRESO=?PROGRESO '
      '  ,ID_EKEVENT=?ID_EKEVENT '
      '  ,HORARIO_DESDE=?HORARIO_DESDE '
      '  ,HORARIO_HASTA=?HORARIO_HASTA '
      '  ,EMPRESA_AGENTE=?EMPRESA_AGENTE '
      '  ,AGENTE=?AGENTE '
      '  ,TIPO_SEG=?TIPO_SEG '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA_CAB=?LINEA_CAB AND '
      '  ORDEN=?ORDEN ')
    DataSource = DSQMAcciones
    AfterDelete = QMAccionesAfterPost
    AfterEdit = QMAccionesDetAfterEdit
    AfterOpen = QMAccionesDetAfterOpen
    AfterPost = QMAccionesAfterPost
    BeforeClose = QMAccionesDetBeforeClose
    BeforeEdit = QMAccionesDetBeforeEdit
    BeforePost = QMAccionesDetBeforePost
    OnNewRecord = QMAccionesDetNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONTACTO '
      'LINEA_CAB '
      'ORDEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONTACTOS_ACCIONES_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 8
    object QMAccionesDetID_ACCION_DET: TIntegerField
      DisplayLabel = 'ID Det. Acci'#243'n'
      FieldName = 'ID_ACCION_DET'
    end
    object QMAccionesDetID_ACCION: TIntegerField
      DisplayLabel = 'ID Acci'#243'n'
      FieldName = 'ID_ACCION'
    end
    object QMAccionesDetORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMAccionesDetFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMAccionesDetHORA_ACCION: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA_ACCION'
      Size = 15
    end
    object QMAccionesDetNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAccionesDetID_CONTACTO: TIntegerField
      DisplayLabel = 'ID Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object QMAccionesDetLINEA_CAB: TIntegerField
      DisplayLabel = 'L'#237'nea Cab.'
      FieldName = 'LINEA_CAB'
    end
    object QMAccionesDetFIN_SEG: TIntegerField
      DisplayLabel = 'Fin Seguimiento'
      FieldName = 'FIN_SEG'
    end
    object QMAccionesDetID_SEG_SIGUIENTE: TIntegerField
      DisplayLabel = 'ID Seg. Siguiente'
      FieldName = 'ID_SEG_SIGUIENTE'
    end
    object QMAccionesDetFECHA_SEG_SIGUIENTE: TDateTimeField
      DisplayLabel = 'Fecha Seg. Siguiente'
      FieldName = 'FECHA_SEG_SIGUIENTE'
    end
    object QMAccionesDetTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tipo Seguimiento'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
    object QMAccionesDetDESCRIPCION_SEGUIMIENTO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION_SEGUIMIENTO'
      Size = 60
    end
    object QMAccionesDetPROGRESO: TIntegerField
      DisplayLabel = 'Progreso'
      FieldName = 'PROGRESO'
    end
    object QMAccionesDetHORARIO_DESDE: TDateTimeField
      DisplayLabel = 'Horairo Desde'
      FieldName = 'HORARIO_DESDE'
    end
    object QMAccionesDetHORARIO_HASTA: TDateTimeField
      DisplayLabel = 'Horario Hasta'
      FieldName = 'HORARIO_HASTA'
    end
  end
  object DSQMAccionesDet: TDataSource
    DataSet = QMAccionesDet
    Left = 424
    Top = 56
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select dir.dir_localidad from sys_terceros ter'
      
        'left join sys_terceros_direcciones dir on ter.tercero = dir.terc' +
        'ero'
      'where '
      'ter.tercero=?tercero and '
      'dir.dir_defecto=1')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 232
    Top = 440
    object xDireccionesDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 328
    Top = 440
  end
  object DSRelContactoAmbito: TDataSource
    DataSet = QMRelContactoAmbito
    Left = 232
    Top = 56
  end
  object QMRelContactoAmbito: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_AMBITOS_CONTACTO'
      'WHERE'
      '  ID_CRM_AMBITO=?old_ID_CRM_AMBITO AND '
      '  ID_CRM_CONTACTO=?old_ID_CRM_CONTACTO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_AMBITOS_CONTACTO'
      '  (ID_CRM_CONTACTO,ID_CRM_AMBITO)'
      'VALUES'
      '  (?ID_CRM_CONTACTO,?ID_CRM_AMBITO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_AMBITOS_CONTACTO'
      'WHERE'
      '  ID_CRM_AMBITO=?ID_CRM_AMBITO AND '
      '  ID_CRM_CONTACTO=?ID_CRM_CONTACTO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_AMBITOS_CONTACTO'
      'where '
      'id_crm_contacto=?id_contacto'
      'ORDER BY ID_CRM_AMBITO, ID_CRM_CONTACTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE CRM_AMBITOS_CONTACTO'
      'WHERE'
      '  ID_CRM_AMBITO=?ID_CRM_AMBITO AND '
      '  ID_CRM_CONTACTO=?ID_CRM_CONTACTO ')
    DataSource = DSQMContactos
    OnNewRecord = QMRelContactoAmbitoNewRecord
    ClavesPrimarias.Strings = (
      'ID_CRM_AMBITO '
      'ID_CRM_CONTACTO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_AMBITOS_CONTACTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 232
    Top = 8
    object QMRelContactoAmbitoID_CRM_CONTACTO: TIntegerField
      DisplayLabel = 'Ambito'
      FieldName = 'ID_CRM_CONTACTO'
    end
    object QMRelContactoAmbitoID_CRM_AMBITO: TIntegerField
      DisplayLabel = 'Ambito'
      FieldName = 'ID_CRM_AMBITO'
      OnChange = QMRelContactoAmbitoID_CRM_AMBITOChange
    end
    object QMRelContactoAmbitoDesc_Ambito: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'Desc_Ambito'
      OnGetText = QMRelContactoAmbitoDesc_AmbitoGetText
      Size = 40
      Calculated = True
    end
  end
  object xAmbito: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select descripcion from crm_sys_ambitos'
      'where ambito=?ambito')
    UniDirectional = False
    Left = 232
    Top = 488
    object xAmbitoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSxAmbito: TDataSource
    DataSet = xAmbito
    Left = 328
    Top = 488
  end
  object xTituloAgr: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_AGRUPACIONES'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    Left = 232
    Top = 248
    object xTituloAgrTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTituloAgr: TDataSource
    DataSet = xTituloAgr
    Left = 328
    Top = 248
  end
  object xTituloAmb: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT descripcion FROM crm_sys_ambitos'
      'where ambito=?ambito')
    UniDirectional = False
    Left = 232
    Top = 296
    object xTituloAmbDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSxTituloAmb: TDataSource
    DataSet = xTituloAmb
    Left = 328
    Top = 296
  end
  object xVentasCRM: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select v.*,art.codigo,art.descripcion,art.cantidad from crm_vent' +
        'as v'
      'left join crm_articulo art on (v.id_articulo=art.id_articulo)'
      'where id_contacto=?id_contacto')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 40
    Top = 248
    object xVentasCRMID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xVentasCRMID_CONTACTO: TIntegerField
      DisplayLabel = 'ID Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object xVentasCRMID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Articulo'
      FieldName = 'ID_ARTICULO'
    end
    object xVentasCRMFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVentasCRMDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xVentasCRMCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 15
    end
    object xVentasCRMCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSxVentasCRM: TDataSource
    DataSet = xVentasCRM
    Left = 128
    Top = 248
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 808
    Top = 56
  end
  object DSQMSeguimientos: TDataSource
    DataSet = xSeguimientos
    Left = 328
    Top = 536
  end
  object xSeguimientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      'S.ID_CONTACTO,'
      'S.LINEA_CAB,'
      'S.ORDEN,'
      'S.ID_ACCION_DET,'
      'S.ID_ACCION,'
      'S.FECHA,'
      'S.DESCRIPCION_SEGUIMIENTO,'
      'S.HORA_ACCION,'
      'S.TIPO_SEG,'
      'A.DESCRIPCION_ACCION'
      'FROM CRM_CONTACTOS_ACCIONES_DET S'
      'JOIN CRM_CONTACTOS_ACCIONES A'
      'ON S.ID_ACCION = A.ID_ACCION'
      'WHERE'
      'S.ID_ACCION_DET = :ID_ACCION_DET'
      ''
      ''
      '')
    SelectSQL.Strings = (
      'SELECT'
      'S.ID_CONTACTO,'
      'S.LINEA_CAB,'
      'S.ORDEN,'
      'S.ID_ACCION_DET,'
      'S.ID_ACCION,'
      'S.FECHA,'
      'S.DESCRIPCION_SEGUIMIENTO,'
      'S.HORA_ACCION,'
      'S.TIPO_SEG,'
      'A.DESCRIPCION_ACCION'
      'FROM CRM_CONTACTOS_ACCIONES_DET S'
      'JOIN CRM_CONTACTOS_ACCIONES A'
      'ON S.ID_ACCION = A.ID_ACCION'
      'WHERE'
      'ID_CONTACTO = :ID_CONTACTO'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSQMContactos
    Left = 232
    Top = 536
    object xSeguimientosID_CONTACTO: TIntegerField
      DisplayLabel = 'Id Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object xSeguimientosLINEA_CAB: TIntegerField
      DisplayLabel = 'Lin. Cab.'
      FieldName = 'LINEA_CAB'
    end
    object xSeguimientosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xSeguimientosID_ACCION_DET: TIntegerField
      DisplayLabel = 'Id Seg.'
      FieldName = 'ID_ACCION_DET'
    end
    object xSeguimientosID_ACCION: TIntegerField
      DisplayLabel = 'Id Accion'
      FieldName = 'ID_ACCION'
    end
    object xSeguimientosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xSeguimientosDESCRIPCION_SEGUIMIENTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_SEGUIMIENTO'
      Size = 60
    end
    object xSeguimientosHORA_ACCION: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA_ACCION'
      Size = 15
    end
    object xSeguimientosTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tipo Seg.'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
    object xSeguimientosDESCRIPCION_ACCION: TFIBStringField
      DisplayLabel = 'Desc. Accion'
      FieldName = 'DESCRIPCION_ACCION'
      Size = 60
    end
  end
  object xAccionDetAsuntos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CRM_CONTACTOS_ACC_DET_ASU'
      'WHERE'
      '  ID_ACCION_DET=?old_ID_ACCION_DET AND '
      '  ID_ASUNTO=?old_ID_ASUNTO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CRM_CONTACTOS_ACC_DET_ASU'
      '  (ID_ACCION_DET,ID_ASUNTO,TITULO)'
      'VALUES'
      '  (?ID_ACCION_DET,?ID_ASUNTO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CRM_CONTACTOS_ACC_DET_ASU'
      'WHERE'
      '  ID_ACCION_DET=?ID_ACCION_DET AND '
      '  ID_ASUNTO=?ID_ASUNTO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CRM_CONTACTOS_ACC_DET_ASU'
      'WHERE'
      '  ID_ACCION_DET=?ID_ACCION_DET '
      'ORDER BY TITULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE VER_CRM_CONTACTOS_ACC_DET_ASU'
      'SET'
      '  ID_ASUNTO=?new_ID_ASUNTO '
      'WHERE'
      '  ID_ACCION_DET=?ID_ACCION_DET AND '
      '  ID_ASUNTO=?old_ID_ASUNTO ')
    DataSource = DSQMAccionesDet
    OnNewRecord = xAccionDetAsuntosNewRecord
    ClavesPrimarias.Strings = (
      'ID_ACCION_DET '
      'ID_ASUNTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CRM_CONTACTOS_ACC_DET_ASU'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 528
    Top = 8
    object xAccionDetAsuntosID_ACCION_DET: TIntegerField
      DisplayLabel = 'Id Seguimiento'
      FieldName = 'ID_ACCION_DET'
    end
    object xAccionDetAsuntosID_ASUNTO: TIntegerField
      DisplayLabel = 'Id Asunto'
      FieldName = 'ID_ASUNTO'
    end
    object xAccionDetAsuntosTITULO: TFIBStringField
      DisplayLabel = 'Asunto'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAccionDetAsuntos: TDataSource
    DataSet = xAccionDetAsuntos
    Left = 528
    Top = 56
  end
  object DSxVentas: TDataSource
    DataSet = xVentas
    Left = 536
    Top = 152
  end
  object xVentas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S'
      'WHERE'
      'ID_S = :ID_S'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'CLIENTE = :CLIENTE AND'
      'TERCERO = :TERCERO /* PARA UTILIZAR INDICES */'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSQMContactos
    Opciones = []
    AutoSQLdeVistas = False
    Left = 448
    Top = 152
    object xVentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVentasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xVentasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVentasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xVentasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVentasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVentasDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xVentasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xVentasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xVentasCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xVentasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xVentasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVentasBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xVentasLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xVentasBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xVentasI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xVentasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xVentasM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xVentasC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object xVentasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xVentasS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xVentasS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xVentasB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xVentasDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xVentasDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xVentasB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xVentasI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xVentasPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xVentasI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xVentasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xVentasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xVentasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Autom.'
      FieldName = 'PROCESO_AUTO'
    end
    object xVentasI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xVentasI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xVentasPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xVentasI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Can.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xVentasS_BASES_CANAL: TFloatField
      DisplayLabel = 'S. Bases Can.'
      FieldName = 'S_BASES_CANAL'
    end
    object xVentasS_CUOTA_IVA_CANAL: TFloatField
      DisplayLabel = 'S. Cuota IVA Can.'
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object xVentasS_CUOTA_RE_CANAL: TFloatField
      DisplayLabel = 'S. Cuota Ret. Can.'
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object xVentasLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xVentasCHG_MONEDA: TIntegerField
      DisplayLabel = 'Chg. Mon.'
      FieldName = 'CHG_MONEDA'
    end
    object xVentasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xVentasID_S: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S'
    end
    object xVentasPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cliente'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object xVentasZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object xVentasCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xVentasI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xVentasPOR_PORTES: TFloatField
      DisplayLabel = 'Porc. Portes'
      FieldName = 'POR_PORTES'
    end
    object xVentasTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Porte'
      FieldName = 'TIPO_PORTES'
    end
    object xVentasRANGO: TIntegerField
      DisplayLabel = 'Rango Porte'
      FieldName = 'RANGO'
    end
    object xVentasINDICE: TIntegerField
      DisplayLabel = 'Indice Porte'
      FieldName = 'INDICE'
    end
    object xVentasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xVentasTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
  end
  object DSxVentasDetalle: TDataSource
    DataSet = xVentasDetalle
    Left = 536
    Top = 200
  end
  object xVentasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      
        'SELECT C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.S' +
        'U_REFERENCIA, C.FORMA_PAGO, C.CAMPANYA, C.ESTADO,'
      
        '       C.POR_FINANCIACION, C.PORTES, C.TARIFA, C.FECHA_ENTREGA, ' +
        'C.IDIOMA, C.CONTACTO, C.ADJUNTO, C.I_PORTES,'
      
        '       C.POR_PORTES, C.TIPO_PORTES, C.RANGO, C.INDICE, C.CAMBIO_' +
        'FIJO, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION,'
      '       C.TRANSPORTISTA, C.BANCO, D.*, CC.CODIGO_CLIENTE,'
      '       CASE C.TIPO'
      '         WHEN '#39'PEC'#39' THEN'
      '             DP.U_PENDIENTES'
      '         WHEN '#39'ALB'#39' THEN'
      '             DA.UNIDADES_A_FACTURAR'
      '         ELSE 0'
      '       END AS U_PENDIENTES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI CC ON C.EMPRESA = CC.EMPRESA AND ' +
        'D.ARTICULO = CC.ARTICULO AND C.CLIENTE = CC.CLIENTE'
      
        'LEFT JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETAL' +
        'LES_S'
      
        'LEFT JOIN GES_DETALLES_S_ALB DA ON D.ID_DETALLES_S = DA.ID_DETAL' +
        'LES_S'
      'WHERE'
      'D.ID_DETALLES_S = :ID_DETALLE_S'
      ' ')
    SelectSQL.Strings = (
      
        'SELECT C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.S' +
        'U_REFERENCIA, C.FORMA_PAGO, C.CAMPANYA, C.ESTADO,'
      
        '       C.POR_FINANCIACION, C.PORTES, C.TARIFA, C.FECHA_ENTREGA, ' +
        'C.IDIOMA, C.CONTACTO, C.ADJUNTO, C.I_PORTES,'
      
        '       C.POR_PORTES, C.TIPO_PORTES, C.RANGO, C.INDICE, C.CAMBIO_' +
        'FIJO, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION,'
      '       C.TRANSPORTISTA, C.BANCO, D.*, CC.CODIGO_CLIENTE,'
      '       CASE C.TIPO'
      '         WHEN '#39'PEC'#39' THEN'
      '             DP.U_PENDIENTES'
      '         WHEN '#39'ALB'#39' THEN'
      '             DA.UNIDADES_A_FACTURAR'
      '         ELSE 0'
      '       END AS U_PENDIENTES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI CC ON C.EMPRESA = CC.EMPRESA AND ' +
        'D.ARTICULO = CC.ARTICULO AND C.CLIENTE = CC.CLIENTE'
      
        'LEFT JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETAL' +
        'LES_S'
      
        'LEFT JOIN GES_DETALLES_S_ALB DA ON D.ID_DETALLES_S = DA.ID_DETAL' +
        'LES_S'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CLIENTE = :CLIENTE AND'
      'C.TERCERO = :TERCERO /* PARA UTILIZAR INDICES */'
      'ORDER BY C.FECHA DESC')
    UniDirectional = False
    DataSource = DSQMContactos
    Opciones = []
    AutoSQLdeVistas = False
    Left = 448
    Top = 200
    object xVentasDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVentasDetalleRIG: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'RIG'
    end
    object xVentasDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen Cab.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVentasDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xVentasDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVentasDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVentasDetalleDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xVentasDetalleSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xVentasDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xVentasDetalleCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xVentasDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVentasDetalleAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xVentasDetalleDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object xVentasDetalleDTO_CIAL: TFloatField
      DisplayLabel = 'Dto . Cial'
      FieldName = 'DTO_CIAL'
    end
    object xVentasDetallePOR_FINANCIACION: TFloatField
      DisplayLabel = 'Porc. Financiacion'
      FieldName = 'POR_FINANCIACION'
    end
    object xVentasDetallePORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xVentasDetalleTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xVentasDetalleID_S: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S'
    end
    object xVentasDetalleFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object xVentasDetalleIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xVentasDetalleCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xVentasDetallePOR_PORTES: TFloatField
      DisplayLabel = 'Porc. Portes'
      FieldName = 'POR_PORTES'
    end
    object xVentasDetalleTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xVentasDetalleRANGO: TIntegerField
      DisplayLabel = 'Rango Portes'
      FieldName = 'RANGO'
    end
    object xVentasDetalleINDICE: TIntegerField
      DisplayLabel = 'Inidice Portes'
      FieldName = 'INDICE'
    end
    object xVentasDetalleCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xVentasDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xVentasDetallePEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cliente'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object xVentasDetalleZ_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'Z_CONTACTO'
    end
    object xVentasDetalleZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object xVentasDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xVentasDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVentasDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xVentasDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xVentasDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xVentasDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Pezas x Bultos'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object xVentasDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DESCUENTO'
    end
    object xVentasDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xVentasDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xVentasDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xVentasDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xVentasDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object xVentasDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xVentasDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xVentasDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xVentasDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xVentasDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object xVentasDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xVentasDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'Base Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xVentasDetalleC_IVA: TFloatField
      DisplayLabel = 'IVA Linea'
      FieldName = 'C_IVA'
    end
    object xVentasDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Recargo'
      FieldName = 'C_RECARGO'
    end
    object xVentasDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xVentasDetalleIVA_INCLUIDO: TIntegerField
      DisplayLabel = 'IVA Incl.'
      FieldName = 'IVA_INCLUIDO'
    end
    object xVentasDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xVentasDetalleB_COMISION_CANAL: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION_CANAL'
    end
    object xVentasDetalleEJER_MOV: TIntegerField
      DisplayLabel = 'Ejer. Mov.'
      FieldName = 'EJER_MOV'
    end
    object xVentasDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object xVentasDetalleNO_FABRICACION_KRI: TFIBStringField
      DisplayLabel = 'Nro. Fabr.'
      FieldName = 'NO_FABRICACION_KRI'
      Size = 15
    end
    object xVentasDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xVentasDetalleID_D_S_GR: TIntegerField
      DisplayLabel = 'Id. TyC'
      FieldName = 'ID_D_S_GR'
    end
    object xVentasDetalleID_A_M_C_T: TIntegerField
      DisplayLabel = 'Id. Mod.'
      FieldName = 'ID_A_M_C_T'
    end
    object xVentasDetalleID_C_A: TIntegerField
      DisplayLabel = 'Id. C. A.'
      FieldName = 'ID_C_A'
    end
    object xVentasDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xVentasDetalleID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'Id. Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object xVentasDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Titulo Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object xVentasDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVentasDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Lin.'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object xVentasDetalleORIGEN: TIntegerField
      DisplayLabel = 'Orig.'
      FieldName = 'ORIGEN'
    end
    object xVentasDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object xVentasDetalleID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object xVentasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Ext.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object xVentasDetalleCERTIFICADO: TIntegerField
      DisplayLabel = 'Certif.'
      FieldName = 'CERTIFICADO'
    end
    object xVentasDetalleCERT_NEGATIVO: TIntegerField
      DisplayLabel = 'Cert. Negativo'
      FieldName = 'CERT_NEGATIVO'
    end
    object xVentasDetalleLINEA_RELACION: TIntegerField
      DisplayLabel = 'Lin. Relacion'
      FieldName = 'LINEA_RELACION'
    end
    object xVentasDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object xVentasDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xVentasDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object xVentasDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Obs.'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object xVentasDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVentasDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote Simple'
      FieldName = 'LOTE_SIMPLE'
    end
    object xVentasDetalleID_DESPIECE: TIntegerField
      DisplayLabel = 'Id Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object xVentasDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object xVentasDetalleT_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'T_COSTE'
    end
    object xVentasDetalleMANIPULACION: TIntegerField
      DisplayLabel = 'Manip.'
      FieldName = 'MANIPULACION'
    end
    object xVentasDetalleCODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Art. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object xVentasDetalleADJUNTO: TFIBStringField
      DisplayLabel = 'Adjunto'
      FieldName = 'ADJUNTO'
      Size = 200
    end
    object xVentasDetalleI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xVentasDetalleTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object xVentasDetalleBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xVentasDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xVentasDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xVentasDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xVentasDetalleI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xVentasDetalleI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xVentasDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xVentasDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVentasDetalleNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xVentasDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object xVentasDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Comision Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object xVentasDetalleMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object xVentasDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object xVentasDetalleULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'ULT_MODIFICACION'
    end
    object xVentasDetalleID_REGISTRO: TIntegerField
      DisplayLabel = 'Id Registro'
      FieldName = 'ID_REGISTRO'
    end
    object xVentasDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'I.S.P.'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xVentasDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object xVentasDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xVentasDetalleM_BRUTO: TFloatField
      DisplayLabel = 'Marg. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xVentasDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xVentasDetallePESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
    end
    object xVentasDetallePESO_REAL: TFloatField
      DisplayLabel = 'Peso Real'
      FieldName = 'PESO_REAL'
    end
    object xVentasDetalleU_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'U_PENDIENTES'
    end
  end
end
