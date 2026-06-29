object DMUsuarioCuenta: TDMUsuarioCuenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 428
  Top = 402
  Height = 195
  Width = 160
  object QMUsuario: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS'
      'WHERE'
      '  USUARIO=?USUARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS'
      'WHERE USUARIO=?USUARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS'
      'SET'
      '  DIR_CORREO=?DIR_CORREO '
      '  ,NOMBRE_CORREO=?NOMBRE_CORREO '
      '  ,CLAVE=?CLAVE'
      '  ,FECHA_CAMBIO_PASSW=?FECHA_CAMBIO_PASSW '
      'WHERE'
      '  USUARIO=?USUARIO ')
    AfterPost = Graba
    BeforeEdit = QMUsuarioBeforeEdit
    BeforePost = QMUsuarioBeforePost
    ClavesPrimarias.Strings = (
      'USUARIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 16
    Top = 68
    object QMUsuarioUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMUsuarioNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object QMUsuarioCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 31
    end
    object QMUsuarioNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMUsuarioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUsuarioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMUsuarioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMUsuarioICONOS_SIMPLES: TIntegerField
      DisplayLabel = 'Iconos Simples'
      FieldName = 'ICONOS_SIMPLES'
    end
    object QMUsuarioFECHA_TRABAJO: TDateTimeField
      DisplayLabel = 'Fec. Trabajo'
      FieldName = 'FECHA_TRABAJO'
    end
    object QMUsuarioMEMORIZAR_FECHA: TIntegerField
      DisplayLabel = 'Mem. Fecha'
      FieldName = 'MEMORIZAR_FECHA'
    end
    object QMUsuarioLENGUA: TFIBStringField
      DisplayLabel = 'Lengua'
      FieldName = 'LENGUA'
      Size = 3
    end
    object QMUsuarioACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMUsuarioMENU_LEFT: TIntegerField
      DisplayLabel = 'Menu Izq.'
      FieldName = 'MENU_LEFT'
    end
    object QMUsuarioMENU_TOP: TIntegerField
      DisplayLabel = 'Menu Top'
      FieldName = 'MENU_TOP'
    end
    object QMUsuarioPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMUsuarioMODO_CIERRA_FORM: TIntegerField
      DisplayLabel = 'Modo Cierra Form.'
      FieldName = 'MODO_CIERRA_FORM'
    end
    object QMUsuarioMODO_ENTER: TIntegerField
      DisplayLabel = 'Modo Enter'
      FieldName = 'MODO_ENTER'
    end
    object QMUsuarioCOLOR_NAV_ACTIVO: TFloatField
      DisplayLabel = 'Color Nav. Act.'
      FieldName = 'COLOR_NAV_ACTIVO'
    end
    object QMUsuarioCOLOR_NAV_INACTIVO: TFloatField
      DisplayLabel = 'Color Nav. Inact.'
      FieldName = 'COLOR_NAV_INACTIVO'
    end
    object QMUsuarioCOLOR_MENU_1_ON: TFloatField
      DisplayLabel = 'Color Menu 1 Act.'
      FieldName = 'COLOR_MENU_1_ON'
    end
    object QMUsuarioCOLOR_MENU_1_OFF: TFloatField
      DisplayLabel = 'Color Menu 1 Inact.'
      FieldName = 'COLOR_MENU_1_OFF'
    end
    object QMUsuarioCOLOR_MENU_2_ON: TFloatField
      DisplayLabel = 'Color Menu 2 Act.'
      FieldName = 'COLOR_MENU_2_ON'
    end
    object QMUsuarioCOLOR_MENU_2_OFF: TFloatField
      DisplayLabel = 'Color Menu 2 Inact.'
      FieldName = 'COLOR_MENU_2_OFF'
    end
    object QMUsuarioNOMBRE_CORREO: TFIBStringField
      DisplayLabel = 'Nombre Correo'
      FieldName = 'NOMBRE_CORREO'
      Size = 60
    end
    object QMUsuarioDIR_CORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'DIR_CORREO'
      Size = 100
    end
    object QMUsuarioCOLOR_ENLACE_ACTIVO: TFloatField
      DisplayLabel = 'Color Enlace Act.'
      FieldName = 'COLOR_ENLACE_ACTIVO'
    end
    object QMUsuarioAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMUsuarioMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Modif. Doc.'
      FieldName = 'MODIFICA_DOC'
    end
    object QMUsuarioCUENTA_NUNCA_CADUCA: TIntegerField
      DisplayLabel = 'Cta. Nunca Caduca'
      FieldName = 'CUENTA_NUNCA_CADUCA'
    end
    object QMUsuarioCUENTA_DESHABILITADA: TIntegerField
      DisplayLabel = 'Cuenta Deshab.'
      FieldName = 'CUENTA_DESHABILITADA'
    end
    object QMUsuarioFECHA_CAMBIO_PASSW: TDateTimeField
      DisplayLabel = 'Fec. Cambio Contrase'
      FieldName = 'FECHA_CAMBIO_PASSW'
    end
    object QMUsuarioDIAS_CADUCIDAD: TIntegerField
      DisplayLabel = 'Dia Caducidad'
      FieldName = 'DIAS_CADUCIDAD'
    end
  end
  object DSQMUsuario: TDataSource
    DataSet = QMUsuario
    Left = 88
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 16
    Top = 12
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 12
  end
end
