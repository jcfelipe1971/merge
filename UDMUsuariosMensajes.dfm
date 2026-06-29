object DMUsuariosMensajes: TDMUsuariosMensajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 696
  Top = 197
  Height = 336
  Width = 422
  object QMUsuariosMensajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_USUARIOS_MENSAJES'
      'WHERE'
      '  AVISO=?old_AVISO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_USUARIOS_MENSAJES'
      
        '  (AVISO,FECHA_INI,TERCERO,USUARIO,FECHA_VAL,FECHA_RESPUESTA,URG' +
        'ENTE,ACTIVO,MENSAJE,RESULTADO,NOMBRE_USUARIO,TITULO_TERCERO)'
      'VALUES'
      
        '  (?AVISO,?FECHA_INI,?TERCERO,?USUARIO,?FECHA_VAL,?FECHA_RESPUES' +
        'TA,?URGENTE,?ACTIVO,?MENSAJE,?RESULTADO,?NOMBRE_USUARIO,?TITULO_' +
        'TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_USUARIOS_MENSAJES'
      'WHERE'
      '  AVISO=?AVISO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_USUARIOS_MENSAJES'
      'WHERE'
      '((:SOLO_PENDIENTES = 0) OR (ACTIVO = 1)) AND '
      'FECHA_VAL <= ?FECHA AND '
      '((USUARIO = :USUARIO) OR (AVISO IN (SELECT AVISO'
      '                                FROM SYS_USUARIOS_MENSAJES_DEST'
      '                                WHERE'
      '                                USUARIO = :USUARIO)))'
      'ORDER BY ACTIVO DESC, URGENTE DESC,FECHA_VAL DESC, AVISO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_USUARIOS_MENSAJES'
      'SET'
      '  FECHA_INI=?FECHA_INI '
      '  ,TERCERO=?TERCERO '
      '  ,USUARIO=?USUARIO '
      '  ,FECHA_VAL=?FECHA_VAL '
      '  ,FECHA_RESPUESTA=?FECHA_RESPUESTA '
      '  ,URGENTE=?URGENTE '
      '  ,ACTIVO=?ACTIVO '
      '  ,MENSAJE=?MENSAJE '
      '  ,RESULTADO=?RESULTADO '
      '  ,NOMBRE_USUARIO=?NOMBRE_USUARIO '
      '  ,TITULO_TERCERO=?TITULO_TERCERO '
      'WHERE'
      '  AVISO=?AVISO ')
    AfterDelete = QMUsuariosMensajesAfterDelete
    AfterOpen = QMUsuariosMensajesAfterOpen
    AfterPost = QMUsuariosMensajesAfterPost
    AfterScroll = QMUsuariosMensajesAfterScroll
    BeforeClose = QMUsuariosMensajesBeforeClose
    BeforeDelete = QMUsuariosMensajesBeforeDelete
    BeforePost = QMUsuariosMensajesBeforePost
    OnNewRecord = QMUsuariosMensajesNewRecord
    ClavesPrimarias.Strings = (
      'AVISO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_USUARIOS_MENSAJES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMUsuariosMensajesAVISO: TIntegerField
      DisplayLabel = 'Aviso'
      FieldName = 'AVISO'
    end
    object QMUsuariosMensajesFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha ini.'
      FieldName = 'FECHA_INI'
    end
    object QMUsuariosMensajesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMUsuariosMensajesTERCEROChange
    end
    object QMUsuariosMensajesUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      OnChange = QMUsuariosMensajesUSUARIOChange
    end
    object QMUsuariosMensajesFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fecha Resp.'
      FieldName = 'FECHA_RESPUESTA'
    end
    object QMUsuariosMensajesFECHA_VAL: TDateTimeField
      DisplayLabel = 'Fecha val.'
      FieldName = 'FECHA_VAL'
    end
    object QMUsuariosMensajesURGENTE: TIntegerField
      DisplayLabel = 'Urg.'
      FieldName = 'URGENTE'
    end
    object QMUsuariosMensajesACTIVO: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVO'
    end
    object QMUsuariosMensajesMENSAJE: TBlobField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 8
    end
    object QMUsuariosMensajesRESULTADO: TBlobField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 8
    end
    object QMUsuariosMensajesNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Nomb. Usu.'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
    object QMUsuariosMensajesTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'Titulo Terc.'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
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
  object xUsuario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE from sys_usuarios'
      '  where USUARIO=?USUARIO')
    UniDirectional = False
    DataSource = DSQMUsuariosMensajes
    Left = 56
    Top = 104
    object xUsuarioNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
  end
  object xUsuarioFin: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE from sys_usuarios'
      '  where USUARIO=?USUARIO')
    UniDirectional = False
    DataSource = DSQMUsuariosMensajesDest
    Left = 56
    Top = 152
    object xUsuarioFinNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE_R_SOCIAL from sys_terceros'
      ' where tercero=?TERCERO')
    UniDirectional = False
    DataSource = DSQMUsuariosMensajes
    Left = 56
    Top = 200
    object xTerceroNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSUsuario: TDataSource
    DataSet = xUsuario
    Left = 200
    Top = 104
  end
  object DSUsuarioFin: TDataSource
    DataSet = xUsuarioFin
    Left = 200
    Top = 152
  end
  object DSTercero: TDataSource
    DataSet = xTercero
    Left = 200
    Top = 200
  end
  object DSQMUsuariosMensajes: TDataSource
    DataSet = QMUsuariosMensajes
    Left = 200
    Top = 8
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
  object DSxAvisoImpresion: TDataSource
    DataSet = xAvisoImpresion
    Left = 200
    Top = 248
  end
  object xAvisoImpresion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS_MENSAJES'
      'WHERE'
      '  AVISO=?old_AVISO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS_MENSAJES'
      
        '  (RESULTADO,MENSAJE,FECHA_RESPUESTA,FECHA_VAL,FECHA_INI,TERCERO' +
        ',AVISO,ACTIVO,URGENTE,USUARIO,USUARIO_FIN)'
      'VALUES'
      
        '  (?RESULTADO,?MENSAJE,?FECHA_RESPUESTA,?FECHA_VAL,?FECHA_INI,?T' +
        'ERCERO,?AVISO,?ACTIVO,?URGENTE,?USUARIO,?USUARIO_FIN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS_MENSAJES'
      'WHERE'
      '  AVISO=?AVISO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS_MENSAJES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS_MENSAJES'
      'SET'
      '  RESULTADO=?RESULTADO '
      '  ,MENSAJE=?MENSAJE '
      '  ,FECHA_RESPUESTA=?FECHA_RESPUESTA '
      '  ,FECHA_VAL=?FECHA_VAL '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,TERCERO=?TERCERO '
      '  ,ACTIVO=?ACTIVO '
      '  ,URGENTE=?URGENTE '
      '  ,USUARIO=?USUARIO '
      '  ,USUARIO_FIN=?USUARIO_FIN '
      'WHERE'
      '  AVISO=?AVISO ')
    ClavesPrimarias.Strings = (
      'AVISO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS_MENSAJES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 248
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Avisos'
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    OnBeforePrint = frListadoBeforePrint
    OnEnterRect = frListadoBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 336
    Top = 104
    ReportForm = {19000000}
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 40001.4939042593
    ReportOptions.LastChange = 40001.4939042593
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxListadoBeforePrint
    OnGetValue = frxListadoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 336
    Top = 152
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBxAvisoImpresion: TfrDBDataSet
    DataSet = xAvisoImpresion
    Left = 336
    Top = 248
  end
  object QMUsuariosMensajesDest: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS_MENSAJES_DEST'
      'WHERE'
      '  USUARIO=?old_USUARIO AND '
      '  AVISO=?old_AVISO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS_MENSAJES_DEST'
      '  (AVISO,USUARIO,ACTIVO)'
      'VALUES'
      '  (?AVISO,?USUARIO,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS_MENSAJES_DEST'
      'WHERE'
      '  USUARIO=?USUARIO AND '
      '  AVISO=?AVISO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS_MENSAJES_DEST'
      'WHERE'
      'AVISO = ?AVISO '
      'ORDER BY USUARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS_MENSAJES_DEST'
      'SET'
      '  ACTIVO=?ACTIVO '
      'WHERE'
      '  USUARIO=?USUARIO AND '
      '  AVISO=?AVISO ')
    DataSource = DSQMUsuariosMensajes
    AfterOpen = QMUsuariosMensajesDestAfterOpen
    BeforeClose = QMUsuariosMensajesDestBeforeClose
    ClavesPrimarias.Strings = (
      'USUARIO '
      'AVISO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS_MENSAJES_DEST'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMUsuariosMensajesDestAVISO: TIntegerField
      FieldName = 'AVISO'
    end
    object QMUsuariosMensajesDestUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object QMUsuariosMensajesDestACTIVO: TIntegerField
      FieldName = 'ACTIVO'
    end
    object QMUsuariosMensajesDestNOMBRE_USUARIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRE_USUARIO'
      OnGetText = QMUsuariosMensajesDestNOMBRE_USUARIOGetText
      Size = 31
      Calculated = True
    end
  end
  object DSQMUsuariosMensajesDest: TDataSource
    DataSet = QMUsuariosMensajesDest
    Left = 200
    Top = 56
  end
end
