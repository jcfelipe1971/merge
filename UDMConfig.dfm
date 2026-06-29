object DMConfig: TDMConfig
  OldCreateOrder = True
  OnCreate = DMConfigCreate
  OnDestroy = DMConfigDestroy
  Left = 546
  Top = 190
  Height = 497
  Width = 680
  object DSQMTeclas: TDataSource
    DataSet = QMTeclas
    Left = 144
    Top = 16
  end
  object QMTeclas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS_TECLAS'
      'WHERE'
      '  USUARIO=?old_USUARIO AND '
      '  TECLA=?old_TECLA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS_TECLAS'
      '  (COMBINACION,TECLA,USUARIO)'
      'VALUES'
      '  (?COMBINACION,?TECLA,?USUARIO)')
    RefreshSQL.Strings = (
      
        'SELECT ST.TITULO, SUT.TECLA, SUT.COMBINACION, ST.PROPIEDAD_ASOCI' +
        'ADA'
      'FROM SYS_USUARIOS_TECLAS SUT'
      'JOIN SYS_TECLAS ST ON SUT.TECLA = ST.TECLA'
      'WHERE'
      '  SUT.USUARIO=?USUARIO AND '
      '  SUT.TECLA=?TECLA ')
    SelectSQL.Strings = (
      
        'SELECT ST.TITULO, SUT.TECLA, SUT.COMBINACION, ST.PROPIEDAD_ASOCI' +
        'ADA'
      'FROM SYS_USUARIOS_TECLAS SUT'
      'JOIN SYS_TECLAS ST ON SUT.TECLA = ST.TECLA'
      'WHERE'
      'SUT.USUARIO = :USUARIO'
      'ORDER BY SUT.TECLA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS_TECLAS'
      'SET'
      '  COMBINACION=?COMBINACION '
      'WHERE'
      '  USUARIO=?USUARIO AND '
      '  TECLA=?TECLA ')
    AfterScroll = QMTeclasAfterScroll
    BeforeOpen = QMTeclasBeforeOpen
    OnCalcFields = QMTeclasCalcFields
    ClavesPrimarias.Strings = (
      'USUARIO '
      'TECLA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS_TECLAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMTeclasCOMBINACION: TIntegerField
      DisplayLabel = 'Combinaci'#243'n'
      FieldName = 'COMBINACION'
    end
    object QMTeclasCOMBINACION_STR: TStringField
      DisplayLabel = 'Combinaci'#243'n'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'COMBINACION_STR'
      Calculated = True
    end
    object QMTeclasTECLA: TIntegerField
      DisplayLabel = 'Tecla'
      FieldName = 'TECLA'
    end
    object QMTeclasPROPIEDAD_ASOCIADA: TFIBStringField
      DisplayLabel = 'Propiedad Asociada'
      FieldName = 'PROPIEDAD_ASOCIADA'
      Size = 15
    end
    object QMTeclasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xContadores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from e_contadores_lista(?empresa,?ejercicio)')
    UniDirectional = False
    BeforeOpen = xContadoresBeforeOpen
    Left = 48
    Top = 64
    object xContadoresTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xContadoresCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xContadoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xContadoresSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xContadoresL_EMP: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'L_EMP'
    end
    object xContadoresL_EJE: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'L_EJE'
    end
    object xContadoresL_CAN: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'L_CAN'
    end
    object xContadoresL_SER: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'L_SER'
    end
    object xContadoresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxContadores: TDataSource
    DataSet = xContadores
    Left = 144
    Top = 64
  end
  object QTreeEmpresas: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select  empresa,titulo from sys_empresas order by empresa')
    Transaction = TLocal
    Left = 248
    Top = 16
  end
  object QTreeCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ver_canales_activos'
      'where empresa=?empresa and ejercicio=?ejercicio order by canal')
    Transaction = TLocal
    Left = 248
    Top = 160
  end
  object QTreeSeries: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select  serie,titulo from ver_canales_series '
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'order by serie')
    Transaction = TLocal
    Left = 248
    Top = 64
  end
  object QTreeEjercicios: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from emp_ejercicios '
      'where empresa=?empresa and activo=1 order by ejercicio')
    Transaction = TLocal
    Left = 248
    Top = 112
  end
  object xVerEstado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ESTADO_ACTUAL'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL')
    UniDirectional = False
    Left = 48
    Top = 112
  end
  object DSxVerEstado: TDataSource
    DataSet = xVerEstado
    Left = 144
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 344
    Top = 16
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO FROM SYS_MONEDAS')
    UniDirectional = False
    Left = 48
    Top = 160
    object xMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 160
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 344
    Top = 64
  end
  object DSxKriConfiguracion: TDataSource
    DataSet = xKriConfiguracion
    Left = 144
    Top = 208
  end
  object xKriConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM KRI_CONFIGURACION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO KRI_CONFIGURACION'
      '  (ID,ESTADO,DESCRIPCION)'
      'VALUES'
      '  (?ID,?ESTADO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM KRI_CONFIGURACION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM KRI_CONFIGURACION '
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE KRI_CONFIGURACION'
      'SET'
      '  ESTADO=?ESTADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  ID=?ID ')
    AfterPost = xKriConfiguracionAfterPost
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'KRI_CONFIGURACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 208
    object xKriConfiguracionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xKriConfiguracionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object xKriConfiguracionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
  end
  object DSxDicNavegadores: TDataSource
    DataSet = xDicNavegadores
    Left = 144
    Top = 256
  end
  object DSxDicGrids: TDataSource
    DataSet = xDicGrids
    Left = 144
    Top = 304
  end
  object xDicNavegadores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DIC_NAVEGADORES'
      'WHERE'
      '  FORMULARIO=?old_FORMULARIO AND '
      '  NAVEGADOR=?old_NAVEGADOR AND '
      '  PERFIL=?old_PERFIL ')
    InsertSQL.Strings = (
      'INSERT INTO DIC_NAVEGADORES'
      '  (BOTONES,PERFIL,NAVEGADOR,FORMULARIO)'
      'VALUES'
      '  (?BOTONES,?PERFIL,?NAVEGADOR,?FORMULARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_NAVEGADORES'
      'WHERE'
      '  FORMULARIO=?FORMULARIO AND '
      '  NAVEGADOR=?NAVEGADOR AND '
      '  PERFIL=?PERFIL ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_NAVEGADORES'
      'ORDER BY PERFIL, FORMULARIO, NAVEGADOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DIC_NAVEGADORES'
      'SET'
      '  BOTONES=?BOTONES '
      'WHERE'
      '  FORMULARIO=?FORMULARIO AND '
      '  NAVEGADOR=?NAVEGADOR AND '
      '  PERFIL=?PERFIL ')
    ClavesPrimarias.Strings = (
      'FORMULARIO '
      'NAVEGADOR '
      'PERFIL ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DIC_NAVEGADORES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 256
    object xDicNavegadoresFORMULARIO: TFIBStringField
      DisplayLabel = 'Formulario'
      FieldName = 'FORMULARIO'
      Size = 60
    end
    object xDicNavegadoresNAVEGADOR: TFIBStringField
      DisplayLabel = 'Navegador'
      FieldName = 'NAVEGADOR'
      Size = 60
    end
    object xDicNavegadoresPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object xDicNavegadoresBOTONES: TFIBStringField
      DisplayLabel = 'Botones'
      FieldName = 'BOTONES'
    end
  end
  object xDicGrids: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DIC_GRIDS'
      'WHERE'
      '  FORMULARIO=?old_FORMULARIO AND '
      '  GRID=?old_GRID AND '
      '  PERFIL=?old_PERFIL ')
    InsertSQL.Strings = (
      'INSERT INTO DIC_GRIDS'
      '  (RESTRICCION,PERFIL,GRID,FORMULARIO)'
      'VALUES'
      '  (?RESTRICCION,?PERFIL,?GRID,?FORMULARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_GRIDS'
      'WHERE'
      '  FORMULARIO=?FORMULARIO AND '
      '  GRID=?GRID AND '
      '  PERFIL=?PERFIL ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_GRIDS'
      'ORDER BY PERFIL, FORMULARIO, GRID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DIC_GRIDS'
      'SET'
      '  RESTRICCION=?RESTRICCION '
      'WHERE'
      '  FORMULARIO=?FORMULARIO AND '
      '  GRID=?GRID AND '
      '  PERFIL=?PERFIL ')
    ClavesPrimarias.Strings = (
      'FORMULARIO '
      'GRID '
      'PERFIL ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DIC_GRIDS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 304
    object xDicGridsFORMULARIO: TFIBStringField
      DisplayLabel = 'Formulario'
      FieldName = 'FORMULARIO'
      Size = 60
    end
    object xDicGridsGRID: TFIBStringField
      DisplayLabel = 'Grid'
      FieldName = 'GRID'
      Size = 60
    end
    object xDicGridsPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object xDicGridsRESTRICCION: TFIBStringField
      DisplayLabel = 'Restricci'#243'n'
      FieldName = 'RESTRICCION'
    end
  end
  object HYBackup: THYIBBackup
    MostrarProgreso = True
    IndexRestore = True
    ShowLog = True
    Left = 343
    Top = 112
  end
  object DSxDicPagecontrols: TDataSource
    DataSet = xDicPagecontrols
    Left = 144
    Top = 352
  end
  object xDicPagecontrols: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DIC_PAGECONTROLS'
      'WHERE'
      '  PERFIL=?old_PERFIL AND '
      '  TABSHEET=?old_TABSHEET AND '
      '  PAGECONTROL=?old_PAGECONTROL AND '
      '  FORMULARIO=?old_FORMULARIO ')
    InsertSQL.Strings = (
      'INSERT INTO DIC_PAGECONTROLS'
      '  (FORMULARIO,PAGECONTROL,TABSHEET,PERFIL,RESTRICCION)'
      'VALUES'
      '  (?FORMULARIO,?PAGECONTROL,?TABSHEET,?PERFIL,?RESTRICCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_PAGECONTROLS'
      'WHERE'
      '  PERFIL=?PERFIL AND '
      '  TABSHEET=?TABSHEET AND '
      '  PAGECONTROL=?PAGECONTROL AND '
      '  FORMULARIO=?FORMULARIO ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_PAGECONTROLS'
      'ORDER BY PERFIL, FORMULARIO, TABSHEET, PAGECONTROL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DIC_PAGECONTROLS'
      'SET'
      '  RESTRICCION=?RESTRICCION '
      'WHERE'
      '  PERFIL=?PERFIL AND '
      '  TABSHEET=?TABSHEET AND '
      '  PAGECONTROL=?PAGECONTROL AND '
      '  FORMULARIO=?FORMULARIO ')
    ClavesPrimarias.Strings = (
      'PERFIL '
      'TABSHEET '
      'PAGECONTROL '
      'FORMULARIO ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DIC_PAGECONTROLS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 352
    object xDicPagecontrolsFORMULARIO: TFIBStringField
      DisplayLabel = 'Formulario'
      FieldName = 'FORMULARIO'
      Size = 60
    end
    object xDicPagecontrolsPAGECONTROL: TFIBStringField
      DisplayLabel = 'Page Control'
      FieldName = 'PAGECONTROL'
      Size = 60
    end
    object xDicPagecontrolsTABSHEET: TFIBStringField
      DisplayLabel = 'TabSheet'
      FieldName = 'TABSHEET'
      Size = 60
    end
    object xDicPagecontrolsPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object xDicPagecontrolsRESTRICCION: TFIBStringField
      DisplayLabel = 'Restriccion'
      FieldName = 'RESTRICCION'
    end
  end
  object QMParamDef: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PARAMETROS_DEFINICION'
      'WHERE'
      '  PARAMETRO=?old_PARAMETRO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PARAMETROS_DEFINICION'
      
        '  (PARAMETRO,DESCRIPCION,TIPO,LONGITUD,VALORES_POSIBLES,VALOR_DE' +
        'F,NIVEL,AYUDA,DETALLE)'
      'VALUES'
      
        '  (?PARAMETRO,?DESCRIPCION,?TIPO,?LONGITUD,?VALORES_POSIBLES,?VA' +
        'LOR_DEF,?NIVEL,?AYUDA,?DETALLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PARAMETROS_DEFINICION'
      'WHERE'
      '  PARAMETRO=?PARAMETRO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PARAMETROS_DEFINICION'
      'WHERE (NIVEL <= ?NIVEL)'
      'ORDER BY PARAMETRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PARAMETROS_DEFINICION'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,TIPO=?TIPO '
      '  ,LONGITUD=?LONGITUD '
      '  ,VALORES_POSIBLES=?VALORES_POSIBLES '
      '  ,VALOR_DEF=?VALOR_DEF '
      '  ,NIVEL=?NIVEL '
      '  ,AYUDA=?AYUDA '
      '  ,DETALLE=?DETALLE '
      'WHERE'
      '  PARAMETRO=?PARAMETRO ')
    OnNewRecord = QMParamDefNewRecord
    ClavesPrimarias.Strings = (
      'PARAMETRO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PARAMETROS_DEFINICION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 16
    object QMParamDefPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
    end
    object QMParamDefDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMParamDefTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMParamDefLONGITUD: TIntegerField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
    object QMParamDefVALORES_POSIBLES: TFIBStringField
      DisplayLabel = 'Valores Posibles'
      DisplayWidth = 60
      FieldName = 'VALORES_POSIBLES'
      Size = 60
    end
    object QMParamDefVALOR_DEF: TFIBStringField
      DisplayLabel = 'Valor Defecto'
      DisplayWidth = 60
      FieldName = 'VALOR_DEF'
      Size = 60
    end
    object QMParamDefNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMParamDefAYUDA: TFIBStringField
      DisplayLabel = 'Ayuda'
      FieldName = 'AYUDA'
      Size = 60
    end
    object QMParamDefDETALLE: TBlobField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 8
    end
  end
  object QMParamGen: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PARAMETROS'
      
        '  (USUARIO_MODIFICADO,FECHA_MODIFICADO,DESCRIPCION,AYUDA,NIVEL,I' +
        'D,TIPO,EMPRESA,SERIE,PERFIL,PARAMETRO,VALOR,USUARIO_ALTA,FECHA_A' +
        'LTA)'
      'VALUES'
      
        '  (?USUARIO_MODIFICADO,?FECHA_MODIFICADO,?DESCRIPCION,?AYUDA,?NI' +
        'VEL,?ID,?TIPO,?EMPRESA,?SERIE,?PERFIL,?PARAMETRO,?VALOR,?USUARIO' +
        '_ALTA,?FECHA_ALTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PARAMETROS'
      'WHERE '
      '  (TIPO = '#39'000'#39') AND '
      '  (NIVEL <= ?NIVEL) '
      'ORDER BY PARAMETRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PARAMETROS'
      'SET'
      '  USUARIO_MODIFICADO=?USUARIO_MODIFICADO '
      '  ,FECHA_MODIFICADO=?FECHA_MODIFICADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,AYUDA=?AYUDA '
      '  ,NIVEL=?NIVEL '
      '  ,TIPO=?TIPO '
      '  ,EMPRESA=?EMPRESA '
      '  ,SERIE=?SERIE '
      '  ,PERFIL=?PERFIL '
      '  ,PARAMETRO=?PARAMETRO '
      '  ,VALOR=?VALOR '
      '  ,USUARIO_ALTA=?USUARIO_ALTA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMParamGenBeforePost
    OnNewRecord = QMParamGenNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PARAMETROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 64
    object QMParamGenTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMParamGenEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMParamGenSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMParamGenPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMParamGenPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
      OnChange = QMParamGenPARAMETROChange
    end
    object QMParamGenVALOR: TFIBStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      OnChange = QMParamGenVALORChange
      Size = 60
    end
    object QMParamGenUSUARIO_ALTA: TFIBStringField
      DisplayLabel = 'Usuario Alta'
      FieldName = 'USUARIO_ALTA'
      Size = 31
    end
    object QMParamGenFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMParamGenUSUARIO_MODIFICADO: TFIBStringField
      DisplayLabel = 'Usuario Modif.'
      FieldName = 'USUARIO_MODIFICADO'
      Size = 31
    end
    object QMParamGenFECHA_MODIFICADO: TDateTimeField
      DisplayLabel = 'Fecha Modif.'
      FieldName = 'FECHA_MODIFICADO'
    end
    object QMParamGenDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMParamGenAYUDA: TFIBStringField
      DisplayLabel = 'Ayuda'
      FieldName = 'AYUDA'
      Size = 60
    end
    object QMParamGenNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMParamGenID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object DSQMParamDef: TDataSource
    DataSet = QMParamDef
    Left = 528
    Top = 16
  end
  object DSQMParamGen: TDataSource
    DataSet = QMParamGen
    Left = 528
    Top = 64
  end
  object QMParamEmp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PARAMETROS'
      
        '  (USUARIO_MODIFICADO,FECHA_MODIFICADO,DESCRIPCION,AYUDA,NIVEL,I' +
        'D,TIPO,EMPRESA,SERIE,PERFIL,PARAMETRO,VALOR,USUARIO_ALTA,FECHA_A' +
        'LTA)'
      'VALUES'
      
        '  (?USUARIO_MODIFICADO,?FECHA_MODIFICADO,?DESCRIPCION,?AYUDA,?NI' +
        'VEL,?ID,?TIPO,?EMPRESA,?SERIE,?PERFIL,?PARAMETRO,?VALOR,?USUARIO' +
        '_ALTA,?FECHA_ALTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PARAMETROS'
      'WHERE '
      '  (TIPO = '#39'001'#39') AND '
      '  (NIVEL <= ?NIVEL)'
      'ORDER BY EMPRESA, PARAMETRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PARAMETROS'
      'SET'
      '  USUARIO_MODIFICADO=?USUARIO_MODIFICADO '
      '  ,FECHA_MODIFICADO=?FECHA_MODIFICADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,AYUDA=?AYUDA '
      '  ,NIVEL=?NIVEL '
      '  ,TIPO=?TIPO '
      '  ,EMPRESA=?EMPRESA '
      '  ,SERIE=?SERIE '
      '  ,PERFIL=?PERFIL '
      '  ,PARAMETRO=?PARAMETRO '
      '  ,VALOR=?VALOR '
      '  ,USUARIO_ALTA=?USUARIO_ALTA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMParamEmpBeforePost
    OnNewRecord = QMParamEmpNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PARAMETROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 112
    object QMParamEmpTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMParamEmpEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      OnChange = QMParamEmpEMPRESAChange
    end
    object QMParamEmpSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMParamEmpPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMParamEmpPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
      OnChange = QMParamEmpPARAMETROChange
    end
    object QMParamEmpVALOR: TFIBStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      OnChange = QMParamEmpVALORChange
      Size = 60
    end
    object QMParamEmpUSUARIO_ALTA: TFIBStringField
      DisplayLabel = 'Usuario Alta'
      FieldName = 'USUARIO_ALTA'
      Size = 31
    end
    object QMParamEmpFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMParamEmpUSUARIO_MODIFICADO: TFIBStringField
      DisplayLabel = 'Usuario Modif.'
      FieldName = 'USUARIO_MODIFICADO'
      Size = 31
    end
    object QMParamEmpFECHA_MODIFICADO: TDateTimeField
      DisplayLabel = 'Fecha Modif.'
      FieldName = 'FECHA_MODIFICADO'
    end
    object QMParamEmpDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMParamEmpAYUDA: TFIBStringField
      DisplayLabel = 'Ayuda'
      FieldName = 'AYUDA'
      Size = 60
    end
    object QMParamEmpNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMParamEmpID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMParamEmpTITULO_EMPRESA: TFIBStringField
      DisplayLabel = 'Titulo Empresa'
      FieldName = 'TITULO_EMPRESA'
      Size = 60
    end
    object QMParamEmpTITULO_SERIE: TFIBStringField
      DisplayLabel = 'Titulo Serie'
      FieldName = 'TITULO_SERIE'
      Size = 40
    end
    object QMParamEmpTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Titulo Perfil'
      FieldName = 'TITULO_PERFIL'
      Size = 35
    end
  end
  object QMParamSer: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PARAMETROS'
      
        '  (USUARIO_MODIFICADO,FECHA_MODIFICADO,DESCRIPCION,AYUDA,NIVEL,I' +
        'D,TIPO,EMPRESA,SERIE,PERFIL,PARAMETRO,VALOR,USUARIO_ALTA,FECHA_A' +
        'LTA)'
      'VALUES'
      
        '  (?USUARIO_MODIFICADO,?FECHA_MODIFICADO,?DESCRIPCION,?AYUDA,?NI' +
        'VEL,?ID,?TIPO,?EMPRESA,?SERIE,?PERFIL,?PARAMETRO,?VALOR,?USUARIO' +
        '_ALTA,?FECHA_ALTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PARAMETROS'
      'WHERE '
      '  (TIPO = '#39'002'#39') AND '
      '  (NIVEL <= ?NIVEL)'
      'ORDER BY EMPRESA, SERIE, PARAMETRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PARAMETROS'
      'SET'
      '  USUARIO_MODIFICADO=?USUARIO_MODIFICADO '
      '  ,FECHA_MODIFICADO=?FECHA_MODIFICADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,AYUDA=?AYUDA '
      '  ,NIVEL=?NIVEL '
      '  ,TIPO=?TIPO '
      '  ,EMPRESA=?EMPRESA '
      '  ,SERIE=?SERIE '
      '  ,PERFIL=?PERFIL '
      '  ,PARAMETRO=?PARAMETRO '
      '  ,VALOR=?VALOR '
      '  ,USUARIO_ALTA=?USUARIO_ALTA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMParamSerBeforePost
    OnNewRecord = QMParamSerNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PARAMETROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 160
    object QMParamSerTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMParamSerEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      OnChange = QMParamSerEMPRESAChange
    end
    object QMParamSerSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      OnChange = QMParamSerSERIEChange
      Size = 10
    end
    object QMParamSerPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMParamSerPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
      OnChange = QMParamSerPARAMETROChange
    end
    object QMParamSerVALOR: TFIBStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      OnChange = QMParamSerVALORChange
      Size = 60
    end
    object QMParamSerUSUARIO_ALTA: TFIBStringField
      DisplayLabel = 'Usuario Alta'
      FieldName = 'USUARIO_ALTA'
      Size = 31
    end
    object QMParamSerFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMParamSerUSUARIO_MODIFICADO: TFIBStringField
      DisplayLabel = 'Usuario Modif.'
      FieldName = 'USUARIO_MODIFICADO'
      Size = 31
    end
    object QMParamSerFECHA_MODIFICADO: TDateTimeField
      DisplayLabel = 'Fecha Modif.'
      FieldName = 'FECHA_MODIFICADO'
    end
    object QMParamSerDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMParamSerAYUDA: TFIBStringField
      DisplayLabel = 'Ayuda'
      FieldName = 'AYUDA'
      Size = 60
    end
    object QMParamSerNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMParamSerID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMParamSerTITULO_EMPRESA: TFIBStringField
      DisplayLabel = 'Titulo Empresa'
      FieldName = 'TITULO_EMPRESA'
      Size = 60
    end
    object QMParamSerTITULO_SERIE: TFIBStringField
      DisplayLabel = 'Titulo Serie'
      FieldName = 'TITULO_SERIE'
      Size = 40
    end
    object QMParamSerTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Titulo Perfil'
      FieldName = 'TITULO_PERFIL'
      Size = 35
    end
  end
  object QMParamPer: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PARAMETROS'
      
        '  (USUARIO_MODIFICADO,FECHA_MODIFICADO,DESCRIPCION,AYUDA,NIVEL,I' +
        'D,TIPO,EMPRESA,SERIE,PERFIL,PARAMETRO,VALOR,USUARIO_ALTA,FECHA_A' +
        'LTA)'
      'VALUES'
      
        '  (?USUARIO_MODIFICADO,?FECHA_MODIFICADO,?DESCRIPCION,?AYUDA,?NI' +
        'VEL,?ID,?TIPO,?EMPRESA,?SERIE,?PERFIL,?PARAMETRO,?VALOR,?USUARIO' +
        '_ALTA,?FECHA_ALTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PARAMETROS'
      'WHERE '
      '  (TIPO = '#39'003'#39') AND '
      '  (NIVEL <= ?NIVEL)'
      'ORDER BY PERFIL, PARAMETRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PARAMETROS'
      'SET'
      '  USUARIO_MODIFICADO=?USUARIO_MODIFICADO '
      '  ,FECHA_MODIFICADO=?FECHA_MODIFICADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,AYUDA=?AYUDA '
      '  ,NIVEL=?NIVEL '
      '  ,TIPO=?TIPO '
      '  ,EMPRESA=?EMPRESA '
      '  ,SERIE=?SERIE '
      '  ,PERFIL=?PERFIL '
      '  ,PARAMETRO=?PARAMETRO '
      '  ,VALOR=?VALOR '
      '  ,USUARIO_ALTA=?USUARIO_ALTA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMParamPerBeforePost
    OnNewRecord = QMParamPerNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PARAMETROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 208
    object QMParamPerTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMParamPerEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMParamPerSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMParamPerPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      OnChange = QMParamPerPERFILChange
    end
    object QMParamPerPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
      OnChange = QMParamPerPARAMETROChange
    end
    object QMParamPerVALOR: TFIBStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      OnChange = QMParamPerVALORChange
      Size = 60
    end
    object QMParamPerUSUARIO_ALTA: TFIBStringField
      DisplayLabel = 'Usuario Alta'
      FieldName = 'USUARIO_ALTA'
      Size = 31
    end
    object QMParamPerFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMParamPerUSUARIO_MODIFICADO: TFIBStringField
      DisplayLabel = 'Usuario Modif.'
      FieldName = 'USUARIO_MODIFICADO'
      Size = 31
    end
    object QMParamPerFECHA_MODIFICADO: TDateTimeField
      DisplayLabel = 'Fecha Modif.'
      FieldName = 'FECHA_MODIFICADO'
    end
    object QMParamPerDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMParamPerAYUDA: TFIBStringField
      DisplayLabel = 'Ayuda'
      FieldName = 'AYUDA'
      Size = 60
    end
    object QMParamPerNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMParamPerID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMParamPerTITULO_EMPRESA: TFIBStringField
      DisplayLabel = 'Titulo Empresa'
      FieldName = 'TITULO_EMPRESA'
      Size = 60
    end
    object QMParamPerTITULO_SERIE: TFIBStringField
      DisplayLabel = 'Titulo Serie'
      FieldName = 'TITULO_SERIE'
      Size = 40
    end
    object QMParamPerTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Titulo Perfil'
      FieldName = 'TITULO_PERFIL'
      Size = 35
    end
  end
  object DSQMParamEmp: TDataSource
    DataSet = QMParamEmp
    Left = 528
    Top = 112
  end
  object DSQMParamSer: TDataSource
    DataSet = QMParamSer
    Left = 528
    Top = 160
  end
  object DSQMParamPer: TDataSource
    DataSet = QMParamPer
    Left = 528
    Top = 208
  end
  object QMParamUsu: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PARAMETROS'
      
        '  (USUARIO_MODIFICADO,FECHA_MODIFICADO,DESCRIPCION,AYUDA,NIVEL,I' +
        'D,TIPO,EMPRESA,SERIE,PERFIL,PARAMETRO,VALOR,USUARIO_ALTA,FECHA_A' +
        'LTA,USUARIO)'
      'VALUES'
      
        '  (?USUARIO_MODIFICADO,?FECHA_MODIFICADO,?DESCRIPCION,?AYUDA,?NI' +
        'VEL,?ID,?TIPO,?EMPRESA,?SERIE,?PERFIL,?PARAMETRO,?VALOR,?USUARIO' +
        '_ALTA,?FECHA_ALTA,?USUARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PARAMETROS'
      'WHERE '
      '  (TIPO = '#39'004'#39') AND '
      '  (NIVEL <= ?NIVEL)'
      'ORDER BY USUARIO, PARAMETRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PARAMETROS'
      'SET'
      '  USUARIO_MODIFICADO=?USUARIO_MODIFICADO '
      '  ,FECHA_MODIFICADO=?FECHA_MODIFICADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,AYUDA=?AYUDA '
      '  ,NIVEL=?NIVEL '
      '  ,TIPO=?TIPO '
      '  ,EMPRESA=?EMPRESA '
      '  ,SERIE=?SERIE '
      '  ,PERFIL=?PERFIL '
      '  ,PARAMETRO=?PARAMETRO '
      '  ,VALOR=?VALOR '
      '  ,USUARIO_ALTA=?USUARIO_ALTA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,USUARIO=?USUARIO '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMParamUsuBeforePost
    OnNewRecord = QMParamUsuNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PARAMETROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 424
    Top = 256
    object QMParamUsuTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMParamUsuEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMParamUsuSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMParamUsuPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMParamUsuUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      OnChange = QMParamUsuUSUARIOChange
    end
    object QMParamUsuPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
      OnChange = QMParamUsuPARAMETROChange
    end
    object QMParamUsuVALOR: TFIBStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      OnChange = QMParamUsuVALORChange
      Size = 60
    end
    object QMParamUsuUSUARIO_ALTA: TFIBStringField
      DisplayLabel = 'Usuario Alta'
      FieldName = 'USUARIO_ALTA'
      Size = 31
    end
    object QMParamUsuFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fecha Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMParamUsuUSUARIO_MODIFICADO: TFIBStringField
      DisplayLabel = 'Usuario Modificacion'
      FieldName = 'USUARIO_MODIFICADO'
      Size = 31
    end
    object QMParamUsuFECHA_MODIFICADO: TDateTimeField
      DisplayLabel = 'Fecha Modificacion'
      FieldName = 'FECHA_MODIFICADO'
    end
    object QMParamUsuDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMParamUsuAYUDA: TFIBStringField
      DisplayLabel = 'Ayuda'
      FieldName = 'AYUDA'
      Size = 60
    end
    object QMParamUsuNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMParamUsuID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMParamUsuTITULO_EMPRESA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_EMPRESA'
      Size = 60
    end
    object QMParamUsuTITULO_SERIE: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_SERIE'
      Size = 40
    end
    object QMParamUsuTITULO_PERFIL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_PERFIL'
      Size = 35
    end
    object QMParamUsuTITULO_USUARIO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_USUARIO'
      Size = 31
    end
  end
  object DSQMParamUsu: TDataSource
    DataSet = QMParamUsu
    Left = 528
    Top = 256
  end
end
