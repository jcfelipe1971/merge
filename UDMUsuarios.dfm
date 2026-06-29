object DMUsuarios: TDMUsuarios
  OldCreateOrder = False
  OnCreate = DMUsuariosCreate
  Left = 584
  Top = 212
  Height = 440
  Width = 317
  object DSQMUsuarios: TDataSource
    DataSet = QMUsuarios
    Left = 120
    Top = 8
  end
  object DSxEmpresa: TDataSource
    DataSet = xEmpresa
    Left = 120
    Top = 104
  end
  object QMUsuarios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS'
      'WHERE'
      '  USUARIO=?old_USUARIO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS'
      
        '  (FECHA_TRABAJO,COLOR_NAV_ACTIVO,COLOR_NAV_INACTIVO,COLOR_MENU_' +
        '1_ON,COLOR_MENU_1_OFF,COLOR_MENU_2_ON,COLOR_MENU_2_OFF,COLOR_ENL' +
        'ACE_ACTIVO,FECHA_CAMBIO_PASSW,ULT_MODIFICACION,FICHERO_FIRMA,SER' +
        'IE,COLOR_CAMPO_ID,AGENTE,MODIFICA_DOC,EMPLEADO,USUARIO,NIVEL,EMP' +
        'RESA,CANAL,EJERCICIO,ICONOS_SIMPLES,MEMORIZAR_FECHA,ACTIVO,MENU_' +
        'LEFT,MENU_TOP,PERFIL,MODO_CIERRA_FORM,MODO_ENTER,NOMBRE_CORREO,D' +
        'IR_CORREO,DELEGACION,EDI_HABILIDADO,CONTABILIDAD_RESTRINGIDA,ALB' +
        'ARAN_RESTRINGIDO,CUENTA_NUNCA_CADUCA,CUENTA_DESHABILITADA,DIAS_C' +
        'ADUCIDAD,TACTIL,RESTRINGIR_IMPORTE_MAX_PEP,RESTRINGIR_AGENTE,PUE' +
        'DE_FIRMAR,SMTP_SERVIDOR,SMTP_USUARIO,SMTP_PASSWORD,SMTP_AUTENTIF' +
        'ICAR,SMTP_TSL,VER_SOLO_ART_DISPONIBLE,GUARDA_FILTROS,DATOS_ABIER' +
        'TOS,ACCION_INICIO,SMTP_PUERTO,NOMBRE,CLAVE,LENGUA,CLAVE_FIRMA,AL' +
        'MACEN,NET2PHONE_EXTENSION,NET2PHONE_TOKEN,COPIA_OCULTA_CORREO)'
      'VALUES'
      
        '  (?FECHA_TRABAJO,?COLOR_NAV_ACTIVO,?COLOR_NAV_INACTIVO,?COLOR_M' +
        'ENU_1_ON,?COLOR_MENU_1_OFF,?COLOR_MENU_2_ON,?COLOR_MENU_2_OFF,?C' +
        'OLOR_ENLACE_ACTIVO,?FECHA_CAMBIO_PASSW,?ULT_MODIFICACION,?FICHER' +
        'O_FIRMA,?SERIE,?COLOR_CAMPO_ID,?AGENTE,?MODIFICA_DOC,?EMPLEADO,?' +
        'USUARIO,?NIVEL,?EMPRESA,?CANAL,?EJERCICIO,?ICONOS_SIMPLES,?MEMOR' +
        'IZAR_FECHA,?ACTIVO,?MENU_LEFT,?MENU_TOP,?PERFIL,?MODO_CIERRA_FOR' +
        'M,?MODO_ENTER,?NOMBRE_CORREO,?DIR_CORREO,?DELEGACION,?EDI_HABILI' +
        'DADO,?CONTABILIDAD_RESTRINGIDA,?ALBARAN_RESTRINGIDO,?CUENTA_NUNC' +
        'A_CADUCA,?CUENTA_DESHABILITADA,?DIAS_CADUCIDAD,?TACTIL,?RESTRING' +
        'IR_IMPORTE_MAX_PEP,?RESTRINGIR_AGENTE,?PUEDE_FIRMAR,?SMTP_SERVID' +
        'OR,?SMTP_USUARIO,?SMTP_PASSWORD,?SMTP_AUTENTIFICAR,?SMTP_TSL,?VE' +
        'R_SOLO_ART_DISPONIBLE,?GUARDA_FILTROS,?DATOS_ABIERTOS,?ACCION_IN' +
        'ICIO,?SMTP_PUERTO,?NOMBRE,?CLAVE,?LENGUA,?CLAVE_FIRMA,?ALMACEN,?' +
        'NET2PHONE_EXTENSION,?NET2PHONE_TOKEN,?COPIA_OCULTA_CORREO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS'
      'WHERE'
      '  USUARIO=?USUARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS'
      'WHERE '
      'ACTIVO = 1'
      'ORDER BY USUARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS'
      'SET'
      '  FECHA_TRABAJO=?FECHA_TRABAJO '
      '  ,COLOR_NAV_ACTIVO=?COLOR_NAV_ACTIVO '
      '  ,COLOR_NAV_INACTIVO=?COLOR_NAV_INACTIVO '
      '  ,COLOR_MENU_1_ON=?COLOR_MENU_1_ON '
      '  ,COLOR_MENU_1_OFF=?COLOR_MENU_1_OFF '
      '  ,COLOR_MENU_2_ON=?COLOR_MENU_2_ON '
      '  ,COLOR_MENU_2_OFF=?COLOR_MENU_2_OFF '
      '  ,COLOR_ENLACE_ACTIVO=?COLOR_ENLACE_ACTIVO '
      '  ,FECHA_CAMBIO_PASSW=?FECHA_CAMBIO_PASSW '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,FICHERO_FIRMA=?FICHERO_FIRMA '
      '  ,SERIE=?SERIE '
      '  ,COLOR_CAMPO_ID=?COLOR_CAMPO_ID '
      '  ,AGENTE=?AGENTE '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,NIVEL=?NIVEL '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,ICONOS_SIMPLES=?ICONOS_SIMPLES '
      '  ,MEMORIZAR_FECHA=?MEMORIZAR_FECHA '
      '  ,ACTIVO=?ACTIVO '
      '  ,MENU_LEFT=?MENU_LEFT '
      '  ,MENU_TOP=?MENU_TOP '
      '  ,PERFIL=?PERFIL '
      '  ,MODO_CIERRA_FORM=?MODO_CIERRA_FORM '
      '  ,MODO_ENTER=?MODO_ENTER '
      '  ,NOMBRE_CORREO=?NOMBRE_CORREO '
      '  ,DIR_CORREO=?DIR_CORREO '
      '  ,DELEGACION=?DELEGACION '
      '  ,EDI_HABILIDADO=?EDI_HABILIDADO '
      '  ,CONTABILIDAD_RESTRINGIDA=?CONTABILIDAD_RESTRINGIDA '
      '  ,ALBARAN_RESTRINGIDO=?ALBARAN_RESTRINGIDO '
      '  ,CUENTA_NUNCA_CADUCA=?CUENTA_NUNCA_CADUCA '
      '  ,CUENTA_DESHABILITADA=?CUENTA_DESHABILITADA '
      '  ,DIAS_CADUCIDAD=?DIAS_CADUCIDAD '
      '  ,TACTIL=?TACTIL '
      '  ,RESTRINGIR_IMPORTE_MAX_PEP=?RESTRINGIR_IMPORTE_MAX_PEP '
      '  ,RESTRINGIR_AGENTE=?RESTRINGIR_AGENTE '
      '  ,PUEDE_FIRMAR=?PUEDE_FIRMAR '
      '  ,SMTP_SERVIDOR=?SMTP_SERVIDOR '
      '  ,SMTP_USUARIO=?SMTP_USUARIO '
      '  ,SMTP_PASSWORD=?SMTP_PASSWORD '
      '  ,SMTP_AUTENTIFICAR=?SMTP_AUTENTIFICAR '
      '  ,SMTP_TSL=?SMTP_TSL '
      '  ,VER_SOLO_ART_DISPONIBLE=?VER_SOLO_ART_DISPONIBLE '
      '  ,GUARDA_FILTROS=?GUARDA_FILTROS '
      '  ,DATOS_ABIERTOS=?DATOS_ABIERTOS '
      '  ,ACCION_INICIO=?ACCION_INICIO '
      '  ,SMTP_PUERTO=?SMTP_PUERTO '
      '  ,NOMBRE=?NOMBRE '
      '  ,CLAVE=?CLAVE '
      '  ,LENGUA=?LENGUA '
      '  ,CLAVE_FIRMA=?CLAVE_FIRMA '
      '  ,ALMACEN=?ALMACEN '
      '  ,NET2PHONE_EXTENSION=?NET2PHONE_EXTENSION '
      '  ,NET2PHONE_TOKEN=?NET2PHONE_TOKEN '
      '  ,COPIA_OCULTA_CORREO=?COPIA_OCULTA_CORREO'
      'WHERE'
      '  USUARIO=?USUARIO ')
    AfterDelete = Graba
    AfterOpen = QMUsuariosAfterOpen
    AfterPost = QMUsuariosAfterPost
    BeforeClose = QMUsuariosBeforeClose
    BeforePost = QMUsuariosBeforePost
    OnNewRecord = QMUsuariosNewRecord
    ClavesPrimarias.Strings = (
      'USUARIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMUsuariosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      OnChange = QMUsuariosUSUARIOChange
    end
    object QMUsuariosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object QMUsuariosCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 31
    end
    object QMUsuariosNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMUsuariosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUsuariosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMUsuariosICONOS_SIMPLES: TIntegerField
      DisplayLabel = 'Iconos Simples'
      FieldName = 'ICONOS_SIMPLES'
    end
    object QMUsuariosFECHA_TRABAJO: TDateTimeField
      DisplayLabel = 'Fec. Trabajo'
      FieldName = 'FECHA_TRABAJO'
    end
    object QMUsuariosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMUsuariosMENU_LEFT: TIntegerField
      DisplayLabel = 'Menu Izq.'
      FieldName = 'MENU_LEFT'
    end
    object QMUsuariosMENU_TOP: TIntegerField
      DisplayLabel = 'Menu Top'
      FieldName = 'MENU_TOP'
    end
    object QMUsuariosPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      OnChange = QMUsuariosPERFILChange
    end
    object QMUsuariosMODO_CIERRA_FORM: TIntegerField
      DisplayLabel = 'Modo Cierra Form.'
      FieldName = 'MODO_CIERRA_FORM'
      OnChange = QMUsuariosMODO_CIERRA_FORMChange
    end
    object QMUsuariosMODO_ENTER: TIntegerField
      DisplayLabel = 'Modo Enter'
      FieldName = 'MODO_ENTER'
      OnChange = QMUsuariosMODO_ENTERChange
    end
    object QMUsuariosCOLOR_NAV_ACTIVO: TFloatField
      DisplayLabel = 'Color Nav. Act.'
      FieldName = 'COLOR_NAV_ACTIVO'
    end
    object QMUsuariosCOLOR_NAV_INACTIVO: TFloatField
      DisplayLabel = 'Color Nav. Inact.'
      FieldName = 'COLOR_NAV_INACTIVO'
    end
    object QMUsuariosCOLOR_MENU_1_ON: TFloatField
      DisplayLabel = 'Color Menu 1 Act.'
      FieldName = 'COLOR_MENU_1_ON'
    end
    object QMUsuariosCOLOR_MENU_1_OFF: TFloatField
      DisplayLabel = 'Color Menu 1 Inact.'
      FieldName = 'COLOR_MENU_1_OFF'
    end
    object QMUsuariosCOLOR_MENU_2_ON: TFloatField
      DisplayLabel = 'Color Menu 2 Act.'
      FieldName = 'COLOR_MENU_2_ON'
    end
    object QMUsuariosCOLOR_MENU_2_OFF: TFloatField
      DisplayLabel = 'Color Menu 2 Inact.'
      FieldName = 'COLOR_MENU_2_OFF'
    end
    object QMUsuariosNOMBRE_CORREO: TFIBStringField
      DisplayLabel = 'Nombre Correo'
      FieldName = 'NOMBRE_CORREO'
      Size = 60
    end
    object QMUsuariosDIR_CORREO: TFIBStringField
      DisplayLabel = 'Dir. Correo'
      FieldName = 'DIR_CORREO'
      Size = 100
    end
    object QMUsuariosMEMORIZAR_FECHA: TIntegerField
      DisplayLabel = 'Mem. Fecha'
      FieldName = 'MEMORIZAR_FECHA'
    end
    object QMUsuariosLENGUA: TFIBStringField
      DisplayLabel = 'Lengua'
      FieldName = 'LENGUA'
      Size = 3
    end
    object QMUsuariosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
      OnChange = QMUsuariosACTIVOChange
    end
    object QMUsuariosCOLOR_ENLACE_ACTIVO: TFloatField
      DisplayLabel = 'Color Enlace Act.'
      FieldName = 'COLOR_ENLACE_ACTIVO'
    end
    object QMUsuariosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMUsuariosALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMUsuariosDELEGACION: TIntegerField
      DisplayLabel = 'Delegaci'#243'n'
      FieldName = 'DELEGACION'
    end
    object QMUsuariosEDI_HABILIDADO: TIntegerField
      DisplayLabel = 'EDI habilitado'
      FieldName = 'EDI_HABILIDADO'
    end
    object QMUsuariosMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Modif. Doc.'
      FieldName = 'MODIFICA_DOC'
    end
    object QMUsuariosCONTABILIDAD_RESTRINGIDA: TIntegerField
      DisplayLabel = 'Contab. Restringida'
      FieldName = 'CONTABILIDAD_RESTRINGIDA'
    end
    object QMUsuariosALBARAN_RESTRINGIDO: TIntegerField
      DisplayLabel = 'Alb. Restringido'
      FieldName = 'ALBARAN_RESTRINGIDO'
    end
    object QMUsuariosAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMUsuariosCUENTA_NUNCA_CADUCA: TIntegerField
      DisplayLabel = 'Cta. Nunca Caduca'
      FieldName = 'CUENTA_NUNCA_CADUCA'
    end
    object QMUsuariosCUENTA_DESHABILITADA: TIntegerField
      DisplayLabel = 'Cuenta Deshab.'
      FieldName = 'CUENTA_DESHABILITADA'
    end
    object QMUsuariosFECHA_CAMBIO_PASSW: TDateTimeField
      DisplayLabel = 'Fec. Cambio Contrase'#241'a'
      FieldName = 'FECHA_CAMBIO_PASSW'
    end
    object QMUsuariosDIAS_CADUCIDAD: TIntegerField
      DisplayLabel = 'D'#237'as Caduc.'
      FieldName = 'DIAS_CADUCIDAD'
    end
    object QMUsuariosRESTRINGIR_IMPORTE_MAX_PEP: TIntegerField
      DisplayLabel = 'Restringir Imp. Max. Pedidos'
      FieldName = 'RESTRINGIR_IMPORTE_MAX_PEP'
    end
    object QMUsuariosTACTIL: TIntegerField
      DisplayLabel = 'T'#225'ctil'
      FieldName = 'TACTIL'
    end
    object QMUsuariosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMUsuariosRESTRINGIR_AGENTE: TIntegerField
      DisplayLabel = 'Restringir Agente'
      FieldName = 'RESTRINGIR_AGENTE'
    end
    object QMUsuariosCLAVE_FIRMA: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE_FIRMA'
      Size = 31
    end
    object QMUsuariosFICHERO_FIRMA: TBlobField
      DisplayLabel = 'Fichero'
      FieldName = 'FICHERO_FIRMA'
      Size = 8
    end
    object QMUsuariosPUEDE_FIRMAR: TIntegerField
      DisplayLabel = 'Puede Firmar'
      FieldName = 'PUEDE_FIRMAR'
    end
    object QMUsuariosSMTP_SERVIDOR: TFIBStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'SMTP_SERVIDOR'
      Size = 60
    end
    object QMUsuariosSMTP_PUERTO: TIntegerField
      DisplayLabel = 'Puerto'
      FieldName = 'SMTP_PUERTO'
    end
    object QMUsuariosSMTP_USUARIO: TFIBStringField
      DisplayLabel = 'Id. de usuario'
      FieldName = 'SMTP_USUARIO'
      Size = 100
    end
    object QMUsuariosSMTP_PASSWORD: TFIBStringField
      DisplayLabel = 'Contrase'#241'a'
      FieldName = 'SMTP_PASSWORD'
      Size = 100
    end
    object QMUsuariosSMTP_AUTENTIFICAR: TIntegerField
      DisplayLabel = 'Autenticaci'#243'n'
      FieldName = 'SMTP_AUTENTIFICAR'
    end
    object QMUsuariosSMTP_TSL: TIntegerField
      DisplayLabel = 'Cifrado TSL'
      FieldName = 'SMTP_TSL'
    end
    object QMUsuariosVER_SOLO_ART_DISPONIBLE: TIntegerField
      DisplayLabel = 'Ver Solo Art. Disponibles'
      FieldName = 'VER_SOLO_ART_DISPONIBLE'
    end
    object QMUsuariosDATOS_ABIERTOS: TIntegerField
      DisplayLabel = 'Datos Abiertos'
      FieldName = 'DATOS_ABIERTOS'
    end
    object QMUsuariosGUARDA_FILTROS: TIntegerField
      DisplayLabel = 'Guarda Filtros'
      FieldName = 'GUARDA_FILTROS'
    end
    object QMUsuariosACCION_INICIO: TFIBStringField
      DisplayLabel = 'Accion Inicio'
      FieldName = 'ACCION_INICIO'
      Size = 100
    end
    object QMUsuariosCOLOR_CAMPO_ID: TFloatField
      DisplayLabel = 'Color Campo ID'
      FieldName = 'COLOR_CAMPO_ID'
    end
    object QMUsuariosNET2PHONE_EXTENSION: TIntegerField
      DisplayLabel = 'Extension Net2Phone'
      FieldName = 'NET2PHONE_EXTENSION'
    end
    object QMUsuariosNET2PHONE_TOKEN: TFIBStringField
      DisplayLabel = 'Token Net2Phone'
      FieldName = 'NET2PHONE_TOKEN'
      Size = 512
    end
    object QMUsuariosCOPIA_OCULTA_CORREO: TStringField
      DisplayWidth = 250
      FieldName = 'COPIA_OCULTA_CORREO'
      Size = 250
    end
  end
  object DSxUsuariosPerfil: TDataSource
    DataSet = xUsuariosPerfil
    Left = 120
    Top = 248
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 8
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT T.NOMBRE_R_SOCIAL'
      'FROM SYS_EMPRESAS E '
      'JOIN SYS_TERCEROS T '
      'ON (E.TERCERO=T.TERCERO)'
      'WHERE E.EMPRESA=?EMPRESA'
      '')
    UniDirectional = False
    DataSource = DSQMUsuarios
    Left = 32
    Top = 104
  end
  object xUsuariosPerfil: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_USUARIOS_PERFIL'
      'WHERE PERFIL=?PERFIL')
    UniDirectional = False
    DataSource = DSQMUsuarios
    Left = 32
    Top = 248
  end
  object xCierraForm: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MODO_CIERRA_FORM'
      'WHERE MODO=?MODO_CIERRA_FORM')
    UniDirectional = False
    DataSource = DSQMUsuarios
    Left = 32
    Top = 152
  end
  object DSxCierraForm: TDataSource
    DataSet = xCierraForm
    Left = 120
    Top = 152
  end
  object xModoTab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MODO_TAB'
      'WHERE MODO=?MODO_ENTER')
    UniDirectional = False
    DataSource = DSQMUsuarios
    Left = 32
    Top = 200
  end
  object DSxModoTab: TDataSource
    DataSet = xModoTab
    Left = 120
    Top = 200
  end
  object xVerLog: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LOG_ENTRADAS_FILTRA(?usuario, ?filtro)')
    UniDirectional = False
    DataSource = DSQMUsuarios
    Opciones = []
    AutoSQLdeVistas = False
    Left = 32
    Top = 56
    object xVerLogENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVerLogF_ENTRADA: TDateTimeField
      DisplayLabel = 'Fec. Entrada'
      FieldName = 'F_ENTRADA'
    end
    object xVerLogF_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. Salida'
      FieldName = 'F_SALIDA'
    end
    object xVerLogUBICACION: TIntegerField
      DisplayLabel = 'Ubic.'
      FieldName = 'UBICACION'
    end
    object xVerLogMAQUINA: TFIBStringField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      Size = 31
    end
    object xVerLogLOGIN: TFIBStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Size = 31
    end
    object xVerLogNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
  end
  object DSxVerLog: TDataSource
    DataSet = xVerLog
    Left = 120
    Top = 56
  end
  object xModificaDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ut_bit(?PERMISO, ?POSICION)')
    UniDirectional = False
    Left = 192
    Top = 56
  end
  object DSQMPermisos: TDataSource
    DataSet = QMPermisos
    Left = 120
    Top = 296
  end
  object QMPermisos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO VER_PERMISOS_USUARIOS_TPV'
      '  (USUARIO,PERMISO,TITULO,LOGUEAR,ALMACENAR,AUTORIZADO)'
      'VALUES'
      '  (?USUARIO,?PERMISO,?TITULO,?LOGUEAR,?ALMACENAR,?AUTORIZADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PERMISOS_USUARIOS_TPV'
      'WHERE'
      '  USUARIO=?USUARIO AND '
      '  PERMISO=?PERMISO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PERMISOS_USUARIOS_TPV'
      'WHERE'
      '    USUARIO = ?USUARIO'
      'ORDER BY PERMISO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PERMISOS_USUARIOS_TPV'
      'SET'
      '  TITULO=?TITULO '
      '  ,LOGUEAR=?LOGUEAR '
      '  ,ALMACENAR=?ALMACENAR '
      '  ,AUTORIZADO=?AUTORIZADO '
      'WHERE'
      '  USUARIO=?USUARIO AND '
      '  PERMISO=?PERMISO ')
    DataSource = DSQMUsuarios
    AfterDelete = Graba
    ClavesPrimarias.Strings = (
      'USUARIO '
      'PERMISO ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PERMISOS_USUARIOS_TPV'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 296
    object QMPermisosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMPermisosPERMISO: TIntegerField
      DisplayLabel = 'Permiso'
      FieldName = 'PERMISO'
    end
    object QMPermisosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMPermisosLOGUEAR: TIntegerField
      DisplayLabel = #191'Loguear?'
      FieldName = 'LOGUEAR'
    end
    object QMPermisosALMACENAR: TIntegerField
      DisplayLabel = #191'Almacenar?'
      FieldName = 'ALMACENAR'
    end
    object QMPermisosAUTORIZADO: TIntegerField
      DisplayLabel = #191'Autorizado?'
      FieldName = 'AUTORIZADO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 256
    Top = 8
  end
  object xUsuariosWeb: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *  FROM USUARIOS_WEB'
      'WHERE '
      'ID_USUARIO=?ID_USUARIO')
    SelectSQL.Strings = (
      'SELECT *  FROM USUARIOS_WEB'
      'WHERE '
      'USUARIO=?USUARIO')
    UniDirectional = False
    DataSource = DSQMUsuarios
    Left = 32
    Top = 344
    object xUsuariosWebUSUARIOID: TFIBStringField
      DisplayLabel = 'Usuario Id'
      FieldName = 'USUARIOID'
    end
    object xUsuariosWebEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xUsuariosWebNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xUsuariosWebTELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
    end
    object xUsuariosWebTIPO_USUARIO: TIntegerField
      DisplayLabel = 'Tipo Usuario'
      FieldName = 'TIPO_USUARIO'
    end
    object xUsuariosWebACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xUsuariosWebID_CLIENTE_AGENTE: TIntegerField
      DisplayLabel = 'Id Cliente/Agente'
      FieldName = 'ID_CLIENTE_AGENTE'
    end
    object xUsuariosWebSTOCK: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object xUsuariosWebVISTA: TFIBStringField
      DisplayLabel = 'Vista'
      FieldName = 'VISTA'
      Size = 3
    end
    object xUsuariosWebWEB_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'WEB_EMPRESA'
    end
    object xUsuariosWebWEB_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'WEB_EJERCICIO'
    end
    object xUsuariosWebWEB_CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'WEB_CANAL'
    end
    object xUsuariosWebWEB_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'WEB_SERIE'
      Size = 10
    end
    object xUsuariosWebWEB_ALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'WEB_ALMACEN'
      Size = 3
    end
    object xUsuariosWebWEB_TARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'WEB_TARIFA'
      Size = 3
    end
    object xUsuariosWebWEB_APLICA_TARIFA: TIntegerField
      DisplayLabel = 'Aplica Tarifa'
      FieldName = 'WEB_APLICA_TARIFA'
    end
    object xUsuariosWebUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xUsuariosWebID_USUARIO: TIntegerField
      DisplayLabel = 'Id Usuario Web'
      FieldName = 'ID_USUARIO'
    end
    object xUsuariosWebDIRECCION_AMPLIADA: TBlobField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION_AMPLIADA'
      Size = 8
    end
    object xUsuariosWebCONFIGURACION: TIntegerField
      DisplayLabel = 'Configuracion'
      FieldName = 'CONFIGURACION'
    end
    object xUsuariosWebID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xUsuariosWebSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xUsuariosWebHOJA_TRABAJO_VER_MAQUINA: TIntegerField
      DisplayLabel = 'Hoja Trabajo Ver Maq.'
      FieldName = 'HOJA_TRABAJO_VER_MAQUINA'
    end
    object xUsuariosWebIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object xUsuariosWebTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xUsuariosWebDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
  end
  object DSxUsuariosWeb: TDataSource
    DataSet = xUsuariosWeb
    Left = 120
    Top = 344
  end
end
