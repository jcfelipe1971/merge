object DMPresencia: TDMPresencia
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 293
  Top = 208
  Height = 342
  Width = 536
  object QMProCabPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERA_PRESENCIA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERA_PRESENCIA'
      
        '  (DESCRIPCION_HORARIO,DESCRIPCION_CALENDARIO,EMPRESA,EJERCICIO,' +
        'CANAL,SERIE,TIPO,RIG,ID_CAB_PRESENCIA,OPERARIO,FECHA,HORARIO,NOT' +
        'AS,ESTADO,TIEMPO_TOTAL,ID_EMPLEADO,CALENDARIO,NOMBRE_R_SOCIAL)'
      'VALUES'
      
        '  (?DESCRIPCION_HORARIO,?DESCRIPCION_CALENDARIO,?EMPRESA,?EJERCI' +
        'CIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_CAB_PRESENCIA,?OPERARIO,?FECHA,' +
        '?HORARIO,?NOTAS,?ESTADO,?TIEMPO_TOTAL,?ID_EMPLEADO,?CALENDARIO,?' +
        'NOMBRE_R_SOCIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERA_PRESENCIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERA_PRESENCIA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO'
      'ORDER BY FECHA, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERA_PRESENCIA'
      'SET'
      '  DESCRIPCION_HORARIO=?DESCRIPCION_HORARIO '
      '  ,DESCRIPCION_CALENDARIO=?DESCRIPCION_CALENDARIO '
      '  ,ID_CAB_PRESENCIA=?ID_CAB_PRESENCIA '
      '  ,OPERARIO=?OPERARIO '
      '  ,FECHA=?FECHA '
      '  ,HORARIO=?HORARIO '
      '  ,NOTAS=?NOTAS '
      '  ,ESTADO=?ESTADO '
      '  ,TIEMPO_TOTAL=?TIEMPO_TOTAL '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,CALENDARIO=?CALENDARIO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    Plan.Strings = (
      ' ')
    AfterOpen = QMProCabPreAfterOpen
    BeforeClose = QMProCabPreBeforeClose
    BeforePost = QMProCabPreBeforePost
    OnNewRecord = QMProCabPreNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERA_PRESENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMProCabPreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCabPreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCabPreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCabPreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProCabPreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProCabPreRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMProCabPreOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
      OnChange = QMProCabPreOPERARIOChange
    end
    object QMProCabPreFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProCabPreID_CAB_PRESENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_CAB_PRESENCIA'
    end
    object QMProCabPreHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMProCabPreNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProCabPreESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProCabPreTIEMPO_TOTAL: TDateTimeField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOTAL'
    end
    object QMProCabPreNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Empleado'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProCabPreID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMProCabPreCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMProCabPreDESCRIPCION_HORARIO: TFIBStringField
      DisplayLabel = 'Desc. Horario'
      FieldName = 'DESCRIPCION_HORARIO'
      Size = 100
    end
    object QMProCabPreDESCRIPCION_CALENDARIO: TFIBStringField
      DisplayLabel = 'Desc. Calendario'
      FieldName = 'DESCRIPCION_CALENDARIO'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 8
  end
  object DSQMProCabPre: TDataSource
    DataSet = QMProCabPre
    Left = 136
    Top = 8
  end
  object QMProDetPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DET_PRESENCIA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DET_PRESENCIA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_DET_PRESENC' +
        'IA,ID_CAB_PRESENCIA,TIPO_PRE,ID_INCIDENCIA,'#13#10'NOTAS,ESTADO,HORA_E' +
        'NTRADA,HORA_SALIDA,TIEMPO,TIEMPO_DEC,ID_IMPORTACION_ENTRADA,ID_I' +
        'MPORTACION_SALIDA,HORA_ENTRADA_ORIGINAL,HORA_SALIDA_ORIGINAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_DET' +
        '_PRESENCIA,?ID_CAB_PRESENCIA,?TIPO_PRE,?ID_INCIDENCIA,'#13#10'?NOTAS,?' +
        'ESTADO,?HORA_ENTRADA,?HORA_SALIDA,?TIEMPO,?TIEMPO_DEC,?ID_IMPORT' +
        'ACION_ENTRADA,?ID_IMPORTACION_SALIDA,?HORA_ENTRADA_ORIGINAL,?HOR' +
        'A_SALIDA_ORIGINAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DET_PRESENCIA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_DET_PRESENCIA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIG = :RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DET_PRESENCIA'
      'SET'
      '  ID_DET_PRESENCIA=?ID_DET_PRESENCIA '
      '  ,ID_CAB_PRESENCIA=?ID_CAB_PRESENCIA '
      '  ,TIPO_PRE=?TIPO_PRE '
      '  ,ID_INCIDENCIA=?ID_INCIDENCIA '
      '  ,NOTAS=?NOTAS '
      '  ,ESTADO=?ESTADO '
      '  ,HORA_ENTRADA=?HORA_ENTRADA '
      '  ,HORA_SALIDA=?HORA_SALIDA '
      '  ,TIEMPO=?TIEMPO '
      '  ,TIEMPO_DEC=?TIEMPO_DEC '
      '  ,ID_IMPORTACION_ENTRADA=?ID_IMPORTACION_ENTRADA '
      '  ,ID_IMPORTACION_SALIDA=?ID_IMPORTACION_SALIDA '
      '  ,HORA_ENTRADA_ORIGINAL=?HORA_ENTRADA_ORIGINAL '
      '  ,HORA_SALIDA_ORIGINAL=?HORA_SALIDA_ORIGINAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMProCabPre
    Plan.Strings = (
      ' ')
    AfterPost = QMProDetPreAfterPost
    BeforePost = QMProDetPreBeforePost
    OnNewRecord = QMProDetPreNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DET_PRESENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMProDetPreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProDetPreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetPreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProDetPreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProDetPreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProDetPreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMProDetPreLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetPreID_DET_PRESENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_DET_PRESENCIA'
    end
    object QMProDetPreID_CAB_PRESENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_CAB_PRESENCIA'
    end
    object QMProDetPreTIPO_PRE: TFIBStringField
      DisplayLabel = 'Tipo Pre.'
      FieldName = 'TIPO_PRE'
      Size = 3
    end
    object QMProDetPreNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProDetPreESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProDetPreID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Incid.'
      FieldName = 'ID_INCIDENCIA'
    end
    object QMProDetPreHORA_ENTRADA: TDateTimeField
      DisplayLabel = 'Hora Inicio'
      FieldName = 'HORA_ENTRADA'
      OnGetText = QMProDetPreHORA_ENTRADAGetText
      OnSetText = QMProDetPreHORA_ENTRADASetText
      EditMask = '!90:00;1;_'
    end
    object QMProDetPreHORA_SALIDA: TDateTimeField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_SALIDA'
      OnGetText = QMProDetPreHORA_SALIDAGetText
      OnSetText = QMProDetPreHORA_SALIDASetText
      EditMask = '!90:00;1;_'
    end
    object QMProDetPreTIEMPO: TDateTimeField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMProDetPreTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object QMProDetPreTIT_INCIDENCIA: TStringField
      DisplayLabel = 'Titulo Incid.'
      FieldKind = fkCalculated
      FieldName = 'TIT_INCIDENCIA'
      OnGetText = QMProDetPreTIT_INCIDENCIAGetText
      Size = 60
      Calculated = True
    end
    object QMProDetPreHORA_ENTRADA_ORIGINAL: TDateTimeField
      DisplayLabel = 'Hora Inicio (Orig)'
      FieldName = 'HORA_ENTRADA_ORIGINAL'
      ReadOnly = True
    end
    object QMProDetPreHORA_SALIDA_ORIGINAL: TDateTimeField
      DisplayLabel = 'Hora Fin (Orig)'
      FieldName = 'HORA_SALIDA_ORIGINAL'
      ReadOnly = True
    end
    object QMProDetPreID_IMPORTACION_ENTRADA: TIntegerField
      DisplayLabel = 'Id Import. Entrada'
      FieldName = 'ID_IMPORTACION_ENTRADA'
    end
    object QMProDetPreID_IMPORTACION_SALIDA: TIntegerField
      DisplayLabel = 'Id Import. Salida'
      FieldName = 'ID_IMPORTACION_SALIDA'
    end
  end
  object DSQMProDetPre: TDataSource
    DataSet = QMProDetPre
    Left = 136
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 352
    Top = 8
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 272
    Top = 56
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'UltimaFecha'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Marcatges '
      'WHERE Marcatges.[MAR_Data] > :UltimaFecha'
      'order by Marcatges.[MAR_Data]')
    Left = 352
    Top = 56
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT C.*, T.NOMBRE_R_SOCIAL'
      'FROM PRO_CAB_PRESENCIA C'
      
        'LEFT JOIN OPE_EMPLEADO E ON (C.EMPRESA = E.EMPRESA AND C.OPERARI' +
        'O = E.EMPLEADO)'
      'LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = E.TERCERO)'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIG = :RIG')
    SelectSQL.Strings = (
      'SELECT C.*, T.NOMBRE_R_SOCIAL'
      'FROM PRO_CAB_PRESENCIA C'
      
        'LEFT JOIN OPE_EMPLEADO E ON (C.EMPRESA = E.EMPRESA AND C.OPERARI' +
        'O = E.EMPLEADO)'
      'LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = E.TERCERO)'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIG = :RIG')
    UniDirectional = False
    DataSource = DSQMProCabPre
    Left = 32
    Top = 200
    object xInfoActualizadaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoActualizadaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejerccio'
      FieldName = 'EJERCICIO'
    end
    object xInfoActualizadaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoActualizadaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xInfoActualizadaTIPO: TFIBStringField
      DisplayLabel = 'tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xInfoActualizadaRIG: TIntegerField
      DisplayLabel = 'Nro Reg.'
      FieldName = 'RIG'
    end
    object xInfoActualizadaID_CAB_PRESENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_CAB_PRESENCIA'
    end
    object xInfoActualizadaOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object xInfoActualizadaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xInfoActualizadaHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object xInfoActualizadaNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaTIEMPO_TOTAL: TDateTimeField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOTAL'
    end
    object xInfoActualizadaID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xInfoActualizadaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Empleado'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 136
    Top = 200
  end
  object QMMarcajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_PRESENCIA_MARCAJE'
      'WHERE'
      '  ID_OPE_PRESENCIA_MARCAJE=?old_ID_OPE_PRESENCIA_MARCAJE ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_PRESENCIA_MARCAJE'
      
        '  (ID_OPE_PRESENCIA_MARCAJE,'#13#10'FECHA_MARCAJE,IDENTIFICADOR_EMPLEA' +
        'DO,IDENTIFICADOR_DISPOSITIVO,IDENTIFICADOR_TIPO_MARCAJE,IDENTIFI' +
        'CADOR_INCIDENCIA,LATITUD,LONGITUD,ID_EMPLEADO,ID_DISPOSITIVO,TIP' +
        'O_MARCAJE,'#13#10'ID_INCIDENCIA,ESTADO,ERROR_AL_PROCESAR,ID_CAB_PRESEN' +
        'CIA,ID_DET_PRESENCIA,ENTRADA_AGRUPACION)'
      'VALUES'
      
        '  (?ID_OPE_PRESENCIA_MARCAJE,'#13#10'?FECHA_MARCAJE,?IDENTIFICADOR_EMP' +
        'LEADO,?IDENTIFICADOR_DISPOSITIVO,?IDENTIFICADOR_TIPO_MARCAJE,?ID' +
        'ENTIFICADOR_INCIDENCIA,?LATITUD,?LONGITUD,?ID_EMPLEADO,?ID_DISPO' +
        'SITIVO,?TIPO_MARCAJE,'#13#10'?ID_INCIDENCIA,?ESTADO,?ERROR_AL_PROCESAR' +
        ',?ID_CAB_PRESENCIA,?ID_DET_PRESENCIA,?ENTRADA_AGRUPACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_PRESENCIA_MARCAJE'
      'WHERE'
      '  ID_OPE_PRESENCIA_MARCAJE=?ID_OPE_PRESENCIA_MARCAJE ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_PRESENCIA_MARCAJE'
      'WHERE'
      'ID_CAB_PRESENCIA = :ID_CAB_PRESENCIA'
      'ORDER BY FECHA_MARCAJE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_PRESENCIA_MARCAJE'
      'SET'
      '  FECHA_MARCAJE=?FECHA_MARCAJE '
      '  ,IDENTIFICADOR_EMPLEADO=?IDENTIFICADOR_EMPLEADO '
      '  ,IDENTIFICADOR_DISPOSITIVO=?IDENTIFICADOR_DISPOSITIVO '
      '  ,IDENTIFICADOR_TIPO_MARCAJE=?IDENTIFICADOR_TIPO_MARCAJE '
      '  ,IDENTIFICADOR_INCIDENCIA=?IDENTIFICADOR_INCIDENCIA '
      '  ,LATITUD=?LATITUD '
      '  ,LONGITUD=?LONGITUD '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,ID_DISPOSITIVO=?ID_DISPOSITIVO '
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE '
      '  ,ID_INCIDENCIA=?ID_INCIDENCIA '
      '  ,ESTADO=?ESTADO '
      '  ,ERROR_AL_PROCESAR=?ERROR_AL_PROCESAR '
      '  ,ID_CAB_PRESENCIA=?ID_CAB_PRESENCIA '
      '  ,ID_DET_PRESENCIA=?ID_DET_PRESENCIA '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      'WHERE'
      '  ID_OPE_PRESENCIA_MARCAJE=?ID_OPE_PRESENCIA_MARCAJE ')
    DataSource = DSQMProCabPre
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_OPE_PRESENCIA_MARCAJE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_PRESENCIA_MARCAJE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 104
    object QMMarcajesID_OPE_PRESENCIA_MARCAJE: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_OPE_PRESENCIA_MARCAJE'
    end
    object QMMarcajesFECHA_MARCAJE: TDateTimeField
      DisplayLabel = 'Fec. Marcaje'
      FieldName = 'FECHA_MARCAJE'
    end
    object QMMarcajesIDENTIFICADOR_EMPLEADO: TFIBStringField
      DisplayLabel = 'Identif. Empleado'
      FieldName = 'IDENTIFICADOR_EMPLEADO'
      Size = 25
    end
    object QMMarcajesIDENTIFICADOR_DISPOSITIVO: TFIBStringField
      DisplayLabel = 'Identif. Dispositivo'
      FieldName = 'IDENTIFICADOR_DISPOSITIVO'
      Size = 25
    end
    object QMMarcajesIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Identif. Tipo Marcaje'
      FieldName = 'IDENTIFICADOR_TIPO_MARCAJE'
      Size = 25
    end
    object QMMarcajesIDENTIFICADOR_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Identif. Inicidencia'
      FieldName = 'IDENTIFICADOR_INCIDENCIA'
      Size = 25
    end
    object QMMarcajesLATITUD: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'LATITUD'
    end
    object QMMarcajesLONGITUD: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'LONGITUD'
    end
    object QMMarcajesID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMMarcajesID_DISPOSITIVO: TIntegerField
      DisplayLabel = 'Id Dispositivo'
      FieldName = 'ID_DISPOSITIVO'
    end
    object QMMarcajesTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object QMMarcajesID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Id Incidencia'
      FieldName = 'ID_INCIDENCIA'
    end
    object QMMarcajesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMMarcajesERROR_AL_PROCESAR: TFIBStringField
      DisplayLabel = 'Error al Procesar'
      FieldName = 'ERROR_AL_PROCESAR'
      Size = 100
    end
    object QMMarcajesID_CAB_PRESENCIA: TIntegerField
      DisplayLabel = 'Id Cab. Presencia'
      FieldName = 'ID_CAB_PRESENCIA'
    end
    object QMMarcajesID_DET_PRESENCIA: TIntegerField
      DisplayLabel = 'Id Det. Presencia'
      FieldName = 'ID_DET_PRESENCIA'
    end
    object QMMarcajesENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Seleccionado'
      FieldName = 'ENTRADA_AGRUPACION'
    end
  end
  object DSQMMarcajes: TDataSource
    DataSet = QMMarcajes
    Left = 136
    Top = 104
  end
end
