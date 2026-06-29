object CrmDMConsultaAcciones: TCrmDMConsultaAcciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 489
  Top = 252
  Height = 550
  Width = 566
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 264
    Top = 24
  end
  object DSQMAccionesSeg: TDataSource
    DataSet = QMAccionesSeg
    Left = 136
    Top = 72
  end
  object xContactos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CRM_CONTACTOS'
      'WHERE'
      'ID_CONTACTO = :ID_CONTACTO')
    UniDirectional = False
    DataSource = DSxSeguimiento
    Left = 32
    Top = 120
    object xContactosID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object xContactosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xContactosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xContactosDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      DisplayWidth = 200
      FieldName = 'DIR_NOMBRE'
      Size = 200
    end
    object xContactosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xContactosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xContactosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSxContactos: TDataSource
    DataSet = xContactos
    Left = 136
    Top = 120
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
      'ID_ACCION = :ID_ACCION')
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
    Left = 32
    Top = 360
    object QMAccionesID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object QMAccionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMAccionesEMPRESA_AGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'EMPRESA_AGENTE'
    end
    object QMAccionesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAccionesFECHA_ACCION: TDateTimeField
      DisplayLabel = 'Fec. Accion'
      FieldName = 'FECHA_ACCION'
      DisplayFormat = 'dd/mm/yyy'
    end
    object QMAccionesTIPO_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Accion'
      FieldName = 'TIPO_ACCION'
      Size = 3
    end
    object QMAccionesDESCRIPCION_ACCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_ACCION'
      Size = 60
    end
    object QMAccionesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAccionesFIN_ACCION: TIntegerField
      DisplayLabel = 'Fin Accion'
      FieldName = 'FIN_ACCION'
    end
    object QMAccionesFECHA_PROX_ACCION: TDateTimeField
      DisplayLabel = 'Fec. Prox. Accion'
      FieldName = 'FECHA_PROX_ACCION'
    end
    object QMAccionesTIPO_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Prox. Accion'
      FieldName = 'TIPO_PROX_ACCION'
      Size = 3
    end
    object QMAccionesDESCRIPCION_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_PROX_ACCION'
      Size = 60
    end
    object QMAccionesHORA_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Hora Prox. Accion'
      FieldName = 'HORA_PROX_ACCION'
      Size = 15
    end
    object QMAccionesID_ACCION: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ACCION'
    end
    object QMAccionesDOC_ACCION: TIntegerField
      DisplayLabel = 'Doc. Accion'
      FieldName = 'DOC_ACCION'
    end
    object QMAccionesDOC_EMPRESAS: TIntegerField
      DisplayLabel = 'Doc. Empresa'
      FieldName = 'DOC_EMPRESAS'
    end
    object QMAccionesDOC_CANAL: TIntegerField
      DisplayLabel = 'Doc. Canal'
      FieldName = 'DOC_CANAL'
    end
    object QMAccionesDOC_SERIES: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIES'
      Size = 10
    end
    object QMAccionesDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Doc. Ejercicio'
      FieldName = 'DOC_EJERCICIO'
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
    Left = 136
    Top = 360
  end
  object xAccComercial: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CRM_CONTACTOS_ACCIONES'
      'WHERE'
      'ID_ACCION = :ID_ACCION')
    UniDirectional = False
    DataSource = DSxSeguimiento
    AfterOpen = xAccComercialAfterOpen
    BeforeClose = xAccComercialBeforeClose
    Left = 32
    Top = 264
    object xAccComercialFECHA_ACCION: TDateTimeField
      DisplayLabel = 'Fec. Accion'
      FieldName = 'FECHA_ACCION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAccComercialTIPO_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Accion'
      FieldName = 'TIPO_ACCION'
      Size = 3
    end
    object xAccComercialDESCRIPCION_ACCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_ACCION'
      Size = 60
    end
    object xAccComercialID_ACCION: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ACCION'
    end
    object xAccComercialID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object xAccComercialLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xAccComercialEMPRESA_AGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'EMPRESA_AGENTE'
    end
    object xAccComercialAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAccComercialNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xAccComercialFIN_ACCION: TIntegerField
      DisplayLabel = 'Fin Accion'
      FieldName = 'FIN_ACCION'
    end
    object xAccComercialFECHA_PROX_ACCION: TDateTimeField
      DisplayLabel = 'Fec. Prox. Accion'
      FieldName = 'FECHA_PROX_ACCION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAccComercialTIPO_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Prox. Accion'
      FieldName = 'TIPO_PROX_ACCION'
      Size = 3
    end
    object xAccComercialDESCRIPCION_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_PROX_ACCION'
      Size = 60
    end
    object xAccComercialHORA_PROX_ACCION: TFIBStringField
      DisplayLabel = 'Hora Prox. Accion'
      FieldName = 'HORA_PROX_ACCION'
      Size = 15
    end
    object xAccComercialDOC_ACCION: TIntegerField
      DisplayLabel = 'Documento Asociado'
      FieldName = 'DOC_ACCION'
    end
    object xAccComercialDOC_EMPRESAS: TIntegerField
      DisplayLabel = 'Empresa Doc.'
      FieldName = 'DOC_EMPRESAS'
    end
    object xAccComercialDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xAccComercialDOC_SERIES: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIES'
      Size = 10
    end
    object xAccComercialDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xAccComercialID_ACCION_CAB: TIntegerField
      DisplayLabel = 'Id Accion Cab.'
      FieldName = 'ID_ACCION_CAB'
    end
  end
  object DSxAccComercial: TDataSource
    DataSet = xAccComercial
    Left = 136
    Top = 264
  end
  object DSxSeguimiento: TDataSource
    DataSet = xSeguimiento
    Left = 136
    Top = 24
  end
  object QMAccionesSeg: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      '  ID_CONTACTO=?old_ID_CONTACTO AND '
      '  LINEA_CAB=?old_LINEA_CAB AND '
      '  ORDEN=?old_ORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACTOS_ACCIONES_DET'
      
        '  (FECHA_SEG_SIGUIENTE,FECHA,NOTAS,ID_SEG_SIGUIENTE,ID_CONTACTO,' +
        'LINEA_CAB,ORDEN,ID_ACCION_DET,ID_ACCION,FIN_SEG,DESCRIPCION_SEGU' +
        'IMIENTO,TIPO_SEG,HORA_ACCION)'
      'VALUES'
      
        '  (?FECHA_SEG_SIGUIENTE,?FECHA,?NOTAS,?ID_SEG_SIGUIENTE,?ID_CONT' +
        'ACTO,?LINEA_CAB,?ORDEN,?ID_ACCION_DET,?ID_ACCION,?FIN_SEG,?DESCR' +
        'IPCION_SEGUIMIENTO,?TIPO_SEG,?HORA_ACCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA_CAB=?LINEA_CAB AND '
      '  ORDEN=?ORDEN ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE '
      'ID_CONTACTO=?ID_CONTACTO AND '
      'LINEA_CAB=?LINEA_CAB AND '
      'ORDEN=?ORDEN ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONTACTOS_ACCIONES_DET'
      'SET'
      '  FECHA_SEG_SIGUIENTE=?FECHA_SEG_SIGUIENTE '
      '  ,FECHA=?FECHA '
      '  ,NOTAS=?NOTAS '
      '  ,ID_SEG_SIGUIENTE=?ID_SEG_SIGUIENTE '
      '  ,ID_ACCION_DET=?ID_ACCION_DET '
      '  ,ID_ACCION=?ID_ACCION '
      '  ,FIN_SEG=?FIN_SEG '
      '  ,DESCRIPCION_SEGUIMIENTO=?DESCRIPCION_SEGUIMIENTO '
      '  ,TIPO_SEG=?TIPO_SEG '
      '  ,HORA_ACCION=?HORA_ACCION '
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA_CAB=?LINEA_CAB AND '
      '  ORDEN=?ORDEN ')
    DataSource = DSxSeguimiento
    OnNewRecord = QMAccionesSegNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONTACTO '
      'LINEA_CAB '
      'ORDEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONTACTOS_ACCIONES_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMAccionesSegID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object QMAccionesSegLINEA_CAB: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_CAB'
    end
    object QMAccionesSegORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMAccionesSegID_ACCION_DET: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ACCION_DET'
    end
    object QMAccionesSegID_ACCION: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ACCION'
    end
    object QMAccionesSegFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAccionesSegHORA_ACCION: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA_ACCION'
      Size = 15
    end
    object QMAccionesSegNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAccionesSegFIN_SEG: TIntegerField
      DisplayLabel = 'Fin Seg.'
      FieldName = 'FIN_SEG'
    end
    object QMAccionesSegID_SEG_SIGUIENTE: TIntegerField
      DisplayLabel = 'Id Seg. Siguiente'
      FieldName = 'ID_SEG_SIGUIENTE'
    end
    object QMAccionesSegFECHA_SEG_SIGUIENTE: TDateTimeField
      DisplayLabel = 'Fec. Seg. Siguiente'
      FieldName = 'FECHA_SEG_SIGUIENTE'
    end
    object QMAccionesSegTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tipo Seg.'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
    object QMAccionesSegDESCRIPCION_SEGUIMIENTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_SEGUIMIENTO'
      Size = 60
    end
    object QMAccionesSegPROGRESO: TIntegerField
      DisplayLabel = 'Progreso'
      FieldName = 'PROGRESO'
    end
    object QMAccionesSegHORARIO_DESDE: TDateTimeField
      DisplayLabel = 'Horario Desde'
      FieldName = 'HORARIO_DESDE'
    end
    object QMAccionesSegHORARIO_HASTA: TDateTimeField
      DisplayLabel = 'Horario Hasta'
      FieldName = 'HORARIO_HASTA'
    end
  end
  object xTipoAccSeg: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TIPO_SEG'
      'FROM CRM_SYS_ACCIONES'
      'WHERE'
      'ACCION = :TIPO_SEG')
    UniDirectional = False
    DataSource = DSxSeguimiento
    Left = 32
    Top = 168
    object xTipoAccSegTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tipo Seg.'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
  end
  object DSxTipoAccSeg: TDataSource
    DataSet = xTipoAccSeg
    Left = 136
    Top = 168
  end
  object xAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO'
      'FROM VER_AGENTES'
      'WHERE'
      'EMPRESA = :EMPRESA_AGENTE AND'
      'AGENTE = :AGENTE')
    UniDirectional = False
    DataSource = DSxAccComercial
    Left = 32
    Top = 312
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 136
    Top = 312
  end
  object xSeguimiento: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT CAB.AGENTE, DET.*, CON.NOMBRE_CORTO, CON.NOMBRE_COMERCIAL' +
        ', CON.NOMBRE_R_SOCIAL, LOC.CODIGO_POSTAL, LOC.TITULO,'
      '       CAB.PROGRESO PROGRESO_ACCION'
      'FROM CRM_CONTACTOS_ACCIONES CAB'
      
        'JOIN CRM_CONTACTOS_ACCIONES_DET DET ON CAB.ID_CONTACTO = DET.ID_' +
        'CONTACTO AND CAB.LINEA = DET.LINEA_CAB'
      'LEFT JOIN CRM_CONTACTOS CON ON CON.ID_CONTACTO = CAB.ID_CONTACTO'
      
        'LEFT JOIN SYS_LOCALIDADES LOC ON CON.DIR_LOCALIDAD = LOC.LOCALID' +
        'AD'
      'WHERE'
      'DET.ID_ACCION_DET = :ID_ACCION_DET')
    SelectSQL.Strings = (
      
        'SELECT CAB.AGENTE, CAB.PROGRESO PROGRESO_ACCION, CAB.ID_ACCION_C' +
        'AB, '
      '       DET.*, '
      
        '       CON.NOMBRE_CORTO, CON.NOMBRE_COMERCIAL, CON.NOMBRE_R_SOCI' +
        'AL, '
      '       LOC.CODIGO_POSTAL, LOC.TITULO       '
      'FROM CRM_CONTACTOS_ACCIONES CAB'
      
        'JOIN CRM_CONTACTOS_ACCIONES_DET DET ON CAB.ID_CONTACTO = DET.ID_' +
        'CONTACTO AND CAB.LINEA = DET.LINEA_CAB'
      'LEFT JOIN CRM_CONTACTOS CON ON CON.ID_CONTACTO = CAB.ID_CONTACTO'
      
        'LEFT JOIN SYS_LOCALIDADES LOC ON CON.DIR_LOCALIDAD = LOC.LOCALID' +
        'AD'
      'WHERE'
      'CAB.EMPRESA_AGENTE = :EMPRESA AND'
      'CAB.AGENTE = :AGENTE'
      'ORDER BY DET.ID_CONTACTO, DET.LINEA_CAB, DET.ORDEN, DET.FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = xSeguimientoAfterOpen
    BeforeClose = xSeguimientoBeforeClose
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object xSeguimientoAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xSeguimientoID_CONTACTO: TIntegerField
      DisplayLabel = 'ID Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object xSeguimientoLINEA_CAB: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_CAB'
    end
    object xSeguimientoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xSeguimientoID_ACCION_DET: TIntegerField
      DisplayLabel = 'ID Seguimiento'
      FieldName = 'ID_ACCION_DET'
    end
    object xSeguimientoID_ACCION: TIntegerField
      DisplayLabel = 'ID Accion'
      FieldName = 'ID_ACCION'
    end
    object xSeguimientoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xSeguimientoHORA_ACCION: TFIBStringField
      DisplayLabel = 'Hora Seg.'
      FieldName = 'HORA_ACCION'
      Size = 15
    end
    object xSeguimientoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xSeguimientoFIN_SEG: TIntegerField
      DisplayLabel = 'Fin Seg.'
      FieldName = 'FIN_SEG'
    end
    object xSeguimientoID_SEG_SIGUIENTE: TIntegerField
      DisplayLabel = 'ID Seg. Siguiente'
      FieldName = 'ID_SEG_SIGUIENTE'
    end
    object xSeguimientoFECHA_SEG_SIGUIENTE: TDateTimeField
      DisplayLabel = 'Fecha Seg. Siguiente'
      FieldName = 'FECHA_SEG_SIGUIENTE'
    end
    object xSeguimientoTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tpo Seg.'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
    object xSeguimientoNOMBRE_CORTO: TFIBStringField
      DisplayLabel = 'Nombre Corto'
      FieldName = 'NOMBRE_CORTO'
      Size = 15
    end
    object xSeguimientoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xSeguimientoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xSeguimientoCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xSeguimientoTITULO: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO'
      Size = 40
    end
    object xSeguimientoDESCRIPCION_SEGUIMIENTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_SEGUIMIENTO'
      Size = 60
    end
    object xSeguimientoDESCRIPCION_ACCION: TFIBStringField
      FieldName = 'DESCRIPCION_ACCION'
      Size = 60
    end
    object xSeguimientoPROGRESO: TIntegerField
      DisplayLabel = 'Progreso'
      FieldName = 'PROGRESO'
    end
    object xSeguimientoHORARIO_DESDE: TDateTimeField
      DisplayLabel = 'Horario Desde'
      FieldName = 'HORARIO_DESDE'
    end
    object xSeguimientoHORARIO_HASTA: TDateTimeField
      DisplayLabel = 'Horario Hasta'
      FieldName = 'HORARIO_HASTA'
    end
    object xSeguimientoPROGRESO_ACCION: TIntegerField
      DisplayLabel = 'Progreso Accion'
      FieldName = 'PROGRESO_ACCION'
    end
    object xSeguimientoID_ACCION_CAB: TIntegerField
      DisplayLabel = 'Id Accion Com.'
      FieldName = 'ID_ACCION_CAB'
    end
  end
  object xPContactes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CRM_CONTACTOS_PERSONAS'
      'WHERE'
      'ID_CONTACTO = :ID_CONTACTO'
      'ORDER BY NUM_PERSONA')
    UniDirectional = False
    DataSource = DSxSeguimiento
    Left = 32
    Top = 216
    object xPContactesID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object xPContactesNUM_PERSONA: TIntegerField
      DisplayLabel = 'Nro. Persona'
      FieldName = 'NUM_PERSONA'
    end
    object xPContactesNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object xPContactesAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
    object xPContactesTELEFONO: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object xPContactesMOVIL: TFIBStringField
      DisplayLabel = 'Movil'
      FieldName = 'MOVIL'
    end
    object xPContactesFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object xPContactesEXTENSION: TFIBStringField
      DisplayLabel = 'Ext.'
      FieldName = 'EXTENSION'
      Size = 5
    end
    object xPContactesEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xPContactesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxPContactes: TDataSource
    DataSet = xPContactes
    Left = 136
    Top = 216
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 320
    Top = 24
  end
end
