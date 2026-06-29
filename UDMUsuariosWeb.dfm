object DMUsuariosWeb: TDMUsuariosWeb
  OldCreateOrder = False
  OnCreate = DMUsuariosWebCreate
  Left = 426
  Top = 213
  Height = 421
  Width = 411
  object QMUsuariosWeb: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS_WEB'
      'WHERE'
      '  USUARIOID=?old_USUARIOID ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS_WEB'
      
        '  (USUARIOID,'#13#10'CONTRASENYA,EMAIL,NOMBRE,TELEFONO,TIPO_USUARIO,AC' +
        'EPTAR,ID_CLIENTE_AGENTE,STOCK,VISTA,WEB_EMPRESA,'#13#10'WEB_EJERCICIO,' +
        'WEB_CANAL,WEB_SERIE,WEB_ALMACEN,WEB_TARIFA,WEB_APLICA_TARIFA,USU' +
        'ARIO,ID_USUARIO,DIRECCION_AMPLIADA,CONFIGURACION,'#13#10'ID_EMPLEADO,S' +
        'ECCION,HOJA_TRABAJO_VER_MAQUINA,IMAGEN,DATE_INS,DATE_UPD,TERCERO' +
        ',DIRECCION,CONTACTO,WEB_ALMACEN_DST)'
      'VALUES'
      
        '  (?USUARIOID,'#13#10'?CONTRASENYA,?EMAIL,?NOMBRE,?TELEFONO,?TIPO_USUA' +
        'RIO,?ACEPTAR,?ID_CLIENTE_AGENTE,?STOCK,?VISTA,?WEB_EMPRESA,'#13#10'?WE' +
        'B_EJERCICIO,?WEB_CANAL,?WEB_SERIE,?WEB_ALMACEN,?WEB_TARIFA,?WEB_' +
        'APLICA_TARIFA,?USUARIO,?ID_USUARIO,?DIRECCION_AMPLIADA,?CONFIGUR' +
        'ACION,'#13#10'?ID_EMPLEADO,?SECCION,?HOJA_TRABAJO_VER_MAQUINA,?IMAGEN,' +
        '?DATE_INS,?DATE_UPD,?TERCERO,?DIRECCION,?CONTACTO,?WEB_ALMACEN_D' +
        'ST)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS_WEB'
      'WHERE'
      '  USUARIOID=?USUARIOID ')
    SelectSQL.Strings = (
      'SELECT * FROM USUARIOS_WEB'
      'ORDER BY USUARIOID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE USUARIOS_WEB'
      'SET'
      '  CONTRASENYA=?CONTRASENYA '
      '  ,EMAIL=?EMAIL '
      '  ,NOMBRE=?NOMBRE '
      '  ,TELEFONO=?TELEFONO '
      '  ,TIPO_USUARIO=?TIPO_USUARIO '
      '  ,ACEPTAR=?ACEPTAR '
      '  ,ID_CLIENTE_AGENTE=?ID_CLIENTE_AGENTE '
      '  ,STOCK=?STOCK '
      '  ,VISTA=?VISTA '
      '  ,WEB_EMPRESA=?WEB_EMPRESA '
      '  ,WEB_EJERCICIO=?WEB_EJERCICIO '
      '  ,WEB_CANAL=?WEB_CANAL '
      '  ,WEB_SERIE=?WEB_SERIE '
      '  ,WEB_ALMACEN=?WEB_ALMACEN '
      '  ,WEB_TARIFA=?WEB_TARIFA '
      '  ,WEB_APLICA_TARIFA=?WEB_APLICA_TARIFA '
      '  ,USUARIO=?USUARIO '
      '  ,ID_USUARIO=?ID_USUARIO '
      '  ,DIRECCION_AMPLIADA=?DIRECCION_AMPLIADA '
      '  ,CONFIGURACION=?CONFIGURACION '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,SECCION=?SECCION '
      '  ,HOJA_TRABAJO_VER_MAQUINA=?HOJA_TRABAJO_VER_MAQUINA '
      '  ,IMAGEN=?IMAGEN '
      '  ,DATE_INS=?DATE_INS '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,TERCERO=?TERCERO '
      '  ,DIRECCION=?DIRECCION '
      '  ,CONTACTO=?CONTACTO '
      '  ,WEB_ALMACEN_DST=?WEB_ALMACEN_DST '
      'WHERE'
      '  USUARIOID=?USUARIOID ')
    AfterOpen = QMUsuariosWebAfterOpen
    AfterPost = QMUsuariosWebAfterPost
    BeforeClose = QMUsuariosWebBeforeClose
    OnCalcFields = QMUsuariosWebCalcFields
    OnNewRecord = QMUsuariosWebNewRecord
    ClavesPrimarias.Strings = (
      'USUARIOID')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'USUARIOS_WEB'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMUsuariosWebUSUARIOID: TFIBStringField
      DisplayLabel = 'Id Usuario'
      FieldName = 'USUARIOID'
    end
    object QMUsuariosWebCONTRASENYA: TFIBStringField
      DisplayLabel = 'Contrase'#241'a'
      FieldName = 'CONTRASENYA'
    end
    object QMUsuariosWebEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMUsuariosWebNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMUsuariosWebTELEFONO: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object QMUsuariosWebTIPO_USUARIO: TIntegerField
      DisplayLabel = 'Tipo Usuario'
      FieldName = 'TIPO_USUARIO'
    end
    object QMUsuariosWebACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object QMUsuariosWebID_CLIENTE_AGENTE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CLIENTE_AGENTE'
      OnChange = QMUsuariosWebID_CLIENTE_AGENTEChange
    end
    object QMUsuariosWebSTOCK: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMUsuariosWebVISTA: TFIBStringField
      DisplayLabel = 'Visita'
      FieldName = 'VISTA'
      Size = 3
    end
    object QMUsuariosWebWEB_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'WEB_EMPRESA'
      OnChange = QMUsuariosWebWEB_EMPRESAChange
    end
    object QMUsuariosWebWEB_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'WEB_EJERCICIO'
    end
    object QMUsuariosWebWEB_CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'WEB_CANAL'
    end
    object QMUsuariosWebWEB_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'WEB_SERIE'
      Size = 10
    end
    object QMUsuariosWebWEB_ALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'WEB_ALMACEN'
      Size = 3
    end
    object QMUsuariosWebWEB_ALMACEN_DST: TFIBStringField
      DisplayLabel = 'Almacen Dst.'
      FieldName = 'WEB_ALMACEN_DST'
      Size = 3
    end
    object QMUsuariosWebWEB_TARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'WEB_TARIFA'
      Size = 3
    end
    object QMUsuariosWebWEB_APLICA_TARIFA: TIntegerField
      DisplayLabel = 'Aplica Ter.'
      FieldName = 'WEB_APLICA_TARIFA'
    end
    object QMUsuariosWebUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMUsuariosWebID_USUARIO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_USUARIO'
    end
    object QMUsuariosWebDIRECCION_AMPLIADA: TBlobField
      DisplayLabel = 'Direccion Ampliada'
      FieldName = 'DIRECCION_AMPLIADA'
      Size = 8
    end
    object QMUsuariosWebCONFIGURACION: TIntegerField
      DisplayLabel = 'Configuracion'
      FieldName = 'CONFIGURACION'
    end
    object QMUsuariosWebID_EMPLEADO: TIntegerField
      FieldName = 'ID_EMPLEADO'
    end
    object QMUsuariosWebSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMUsuariosWebHOJA_TRABAJO_VER_MAQUINA: TIntegerField
      DisplayLabel = 'Ver m'#225'quinas en hojas de trabajo'
      FieldName = 'HOJA_TRABAJO_VER_MAQUINA'
    end
    object QMUsuariosWebIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMUsuariosWebTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMUsuariosWebDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMUsuariosWebCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object QMUsuariosWebDATE_INS: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'DATE_INS'
    end
    object QMUsuariosWebNOMBRE_AGE_CLI_SIS: TStringField
      DisplayLabel = 'Nombre'
      FieldKind = fkCalculated
      FieldName = 'NOMBRE_AGE_CLI_SIS'
      Size = 60
      Calculated = True
    end
    object QMUsuariosWebDATE_UPD: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'DATE_UPD'
    end
  end
  object DSQMUsuariosWeb: TDataSource
    DataSet = QMUsuariosWeb
    Left = 200
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 336
    Top = 8
  end
  object xNombre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS_WEB'
      'WHERE'
      '  USUARIOID=?old_USUARIOID ')
    RefreshSQL.Strings = (
      
        'SELECT NOMBRE, USUARIO MAESTRO FROM SYS_USUARIOS WHERE USUARIO =' +
        ' :ID_CLIENTE_AGENTE')
    SelectSQL.Strings = (
      'SELECT NOMBRE, USUARIO MAESTRO, CAST(0 AS INTEGER) AS TERCERO '
      'FROM SYS_USUARIOS '
      'WHERE '
      'USUARIO = :ID_CLIENTE_AGENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMUsuariosWeb
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'usuarios_web'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object xNombreNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xNombreMAESTRO: TIntegerField
      DisplayLabel = 'Maestro'
      FieldName = 'MAESTRO'
    end
    object xNombreTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxNombre: TDataSource
    DataSet = xNombre
    Left = 200
    Top = 56
  end
  object xEmpresas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_EMPRESAS'
      'WHERE EMPRESA = ?WEB_EMPRESA')
    UniDirectional = False
    DataSource = DSQMUsuariosWeb
    Left = 56
    Top = 104
  end
  object DSxEmpresas: TDataSource
    DataSet = xEmpresas
    Left = 200
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 336
    Top = 56
  end
  object DSQMUsuariosWebDocs: TDataSource
    DataSet = QMUsuariosWebDocs
    Left = 200
    Top = 152
  end
  object QMUsuariosWebDocs: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS_WEB_DOCS'
      'WHERE'
      '  USUARIOID=?old_USUARIOID AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS_WEB_DOCS'
      '  (USUARIOID,TITULO_DOC,PERMISO_DOC,DEFECTO_DOC,TIPO)'
      'VALUES'
      '  (?USUARIOID,?TITULO_DOC,?PERMISO_DOC,?DEFECTO_DOC,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS_WEB_DOCS'
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM USUARIOS_WEB_DOCS'
      'WHERE USUARIOID=?USUARIOID'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE USUARIOS_WEB_DOCS'
      'SET'
      '  TITULO_DOC=?TITULO_DOC '
      '  ,PERMISO_DOC=?PERMISO_DOC '
      '  ,DEFECTO_DOC=?DEFECTO_DOC '
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMUsuariosWeb
    AfterPost = QMUsuariosWebDocsAfterPost
    ClavesPrimarias.Strings = (
      'USUARIOID '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'USUARIOS_WEB_DOCS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 152
    object QMUsuariosWebDocsUSUARIOID: TFIBStringField
      DisplayLabel = 'Id Usuario'
      FieldName = 'USUARIOID'
    end
    object QMUsuariosWebDocsTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMUsuariosWebDocsTITULO_DOC: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_DOC'
    end
    object QMUsuariosWebDocsPERMISO_DOC: TIntegerField
      DisplayLabel = 'Permiso'
      FieldName = 'PERMISO_DOC'
    end
    object QMUsuariosWebDocsDEFECTO_DOC: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO_DOC'
    end
  end
  object QMUsuariosWebMarcas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS_WEB_MARCAS'
      'WHERE'
      '  USUARIOID=?old_USUARIOID AND '
      '  ID_MARCA=?old_ID_MARCA ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS_WEB_MARCAS'
      '  (ID_MARCA,USUARIOID)'
      'VALUES'
      '  (?ID_MARCA,?USUARIOID)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS_WEB_MARCAS UWM'
      
        'LEFT JOIN ART_ARTICULOS_MOD_MARCAS AAM ON UWM.ID_MARCA=AAM.ID_MA' +
        'RCA '
      'WHERE'
      '  UWM.USUARIOID=?USUARIOID AND UWM.ID_MARCA=?ID_MARCA')
    SelectSQL.Strings = (
      'SELECT * FROM USUARIOS_WEB_MARCAS UWM'
      'LEFT JOIN ART_ARTICULOS_MOD_MARCAS AAM'
      'ON UWM.ID_MARCA=AAM.ID_MARCA'
      'WHERE UWM.USUARIOID=?USUARIOID'
      'ORDER BY UWM.ID_MARCA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE USUARIOS_WEB_MARCAS'
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  ID_MARCA=?ID_MARCA ')
    DataSource = DSQMUsuariosWeb
    OnNewRecord = QMUsuariosWebMarcasNewRecord
    ClavesPrimarias.Strings = (
      'USUARIOID '
      'ID_MARCA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'USUARIOS_WEB_MARCAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 200
    object QMUsuariosWebMarcasUSUARIOID: TFIBStringField
      DisplayLabel = 'Id Usuario'
      FieldName = 'USUARIOID'
    end
    object QMUsuariosWebMarcasID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object QMUsuariosWebMarcasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMUsuariosWebMarcas: TDataSource
    DataSet = QMUsuariosWebMarcas
    Left = 200
    Top = 200
  end
  object QMUsuariosWebModulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM WEB_MODULOS_USUARIO'
      'WHERE'
      '  USUARIOID=?old_USUARIOID AND '
      '  COD_MODULO=?old_COD_MODULO ')
    InsertSQL.Strings = (
      'INSERT INTO WEB_MODULOS_USUARIO'
      
        '  (COD_MODULO,USUARIOID,TITULO_MODULO_USR,DESC_MODULO_USR,ORDEN,' +
        'ADMINISTRADOR)'
      'VALUES'
      
        '  (?COD_MODULO,?USUARIOID,?TITULO_MODULO_USR,?DESC_MODULO_USR,?O' +
        'RDEN,?ADMINISTRADOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM WEB_MODULOS_USUARIO'
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  COD_MODULO=?COD_MODULO ')
    SelectSQL.Strings = (
      'SELECT * FROM WEB_MODULOS_USUARIO'
      'WHERE'
      '  USUARIOID=?USUARIOID '
      'ORDER BY '
      '  ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE WEB_MODULOS_USUARIO'
      'SET'
      '  TITULO_MODULO_USR=?TITULO_MODULO_USR '
      '  ,DESC_MODULO_USR=?DESC_MODULO_USR '
      '  ,ORDEN=?ORDEN '
      '  ,ADMINISTRADOR=?ADMINISTRADOR'
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  COD_MODULO=?COD_MODULO ')
    DataSource = DSQMUsuariosWeb
    OnNewRecord = QMUsuariosWebModulosNewRecord
    ClavesPrimarias.Strings = (
      'USUARIOID '
      'COD_MODULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'WEB_MODULOS_USUARIO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 248
    object QMUsuariosWebModulosUSUARIOID: TFIBStringField
      DisplayLabel = 'Id Usuario'
      FieldName = 'USUARIOID'
    end
    object QMUsuariosWebModulosCOD_MODULO: TFIBStringField
      DisplayLabel = 'Cod. M'#243'dulo'
      FieldName = 'COD_MODULO'
      OnChange = QMUsuariosWebModulosCOD_MODULOChange
      Size = 10
    end
    object QMUsuariosWebModulosTITULO_MODULO_USR: TFIBStringField
      DisplayLabel = 'T'#237'tulo M'#243'dulo'
      FieldName = 'TITULO_MODULO_USR'
    end
    object QMUsuariosWebModulosDESC_MODULO_USR: TFIBStringField
      DisplayLabel = 'Descripcion Web'
      FieldName = 'DESC_MODULO_USR'
      Size = 100
    end
    object QMUsuariosWebModulosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMUsuariosWebModulosADMINISTRADOR: TIntegerField
      DisplayLabel = 'Administrador'
      FieldName = 'ADMINISTRADOR'
    end
  end
  object DSUsuariosWebModulos: TDataSource
    DataSet = QMUsuariosWebModulos
    Left = 200
    Top = 248
  end
  object DSQMUsuariosWebFP: TDataSource
    DataSet = QMUsuariosWebFP
    Left = 200
    Top = 296
  end
  object QMUsuariosWebFP: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS_WEB_FORMAS_PAGO'
      'WHERE'
      '  USUARIOID=?old_USUARIOID AND '
      '  FORMA=?old_FORMA ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS_WEB_FORMAS_PAGO'
      '  (USUARIOID,'#13#10'FORMA)'
      'VALUES'
      '  (?USUARIOID,'#13#10'?FORMA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS_WEB_FORMAS_PAGO'
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  FORMA=?FORMA ')
    SelectSQL.Strings = (
      'SELECT * FROM USUARIOS_WEB_FORMAS_PAGO'
      'WHERE'
      'USUARIOID = ?USUARIOID'
      'ORDER BY FORMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE USUARIOS_WEB_FORMAS_PAGO'
      'WHERE'
      '  USUARIOID=?USUARIOID AND '
      '  FORMA=?FORMA ')
    DataSource = DSQMUsuariosWeb
    OnNewRecord = QMUsuariosWebFPNewRecord
    ClavesPrimarias.Strings = (
      'USUARIOID '
      'FORMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'USUARIOS_WEB_FORMAS_PAGO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 296
    object QMUsuariosWebFPUSUARIOID: TFIBStringField
      DisplayLabel = 'Id Usuario'
      FieldName = 'USUARIOID'
    end
    object QMUsuariosWebFPFORMA: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA'
      Size = 3
    end
    object QMUsuariosWebFPTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMUsuariosWebFPTITULOGetText
      Size = 40
      Calculated = True
    end
  end
end
