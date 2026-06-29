object IsoDMInc: TIsoDMInc
  OldCreateOrder = False
  OnCreate = DMIsoIncCreate
  Left = 541
  Top = 118
  Height = 559
  Width = 603
  object QMInc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ISO_NO_CONFORMIDAD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RIC=?old_RIC ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ISO_NO_CONFORMIDAD'
      
        '  (EMPRESA,'#13#10'RIC,TIPO,DESCRIPCION_TIPO,CLI_PRO_INTE,NOMBRE_R_SOC' +
        'IAL,SITUACION,SERIE_DOC,NUM_DOC,DESCRIPCION,FECHA_INC,'#13#10'RESPONSA' +
        'BLE,TITULO_RESPONSABLE,POR_CLASIFICA,ESTADO,NOTAS,TIRAR,RECUPERA' +
        'R_ISO,DEVOLVER,ACEPTAR,OTROS,'#13#10'VBCALIDAD,VBRESDEPARTAMENTO,CANTI' +
        'DAD,FECHA_CIERRE,NDEVOLUCION,CONTADOR,DEPARTAMENTO,TITULO_DEPART' +
        'AMENTO,EVIDENCIA,NDOCCLI,'#13#10'REFERENCIACLI,NOTAS_INC,COSTE_TOTAL,L' +
        'INEA,EJERCICIO,CLIPRO,CANAL,COSTE_INC)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?RIC,?TIPO,?DESCRIPCION_TIPO,?CLI_PRO_INTE,?NOMBRE' +
        '_R_SOCIAL,?SITUACION,?SERIE_DOC,?NUM_DOC,?DESCRIPCION,?FECHA_INC' +
        ','#13#10'?RESPONSABLE,?TITULO_RESPONSABLE,?POR_CLASIFICA,?ESTADO,?NOTA' +
        'S,?TIRAR,?RECUPERAR_ISO,?DEVOLVER,?ACEPTAR,?OTROS,'#13#10'?VBCALIDAD,?' +
        'VBRESDEPARTAMENTO,?CANTIDAD,?FECHA_CIERRE,?NDEVOLUCION,?CONTADOR' +
        ',?DEPARTAMENTO,?TITULO_DEPARTAMENTO,?EVIDENCIA,?NDOCCLI,'#13#10'?REFER' +
        'ENCIACLI,?NOTAS_INC,?COSTE_TOTAL,?LINEA,?EJERCICIO,?CLIPRO,?CANA' +
        'L,?COSTE_INC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ISO_NO_CONFORMIDAD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ISO_NO_CONFORMIDAD'
      'WHERE'
      '  EMPRESA=?EMPRESA '
      'order by RIC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ISO_NO_CONFORMIDAD'
      'SET'
      '  TIPO=?TIPO '
      '  ,DESCRIPCION_TIPO=?DESCRIPCION_TIPO '
      '  ,CLI_PRO_INTE=?CLI_PRO_INTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,SITUACION=?SITUACION '
      '  ,SERIE_DOC=?SERIE_DOC '
      '  ,NUM_DOC=?NUM_DOC '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,FECHA_INC=?FECHA_INC '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,TITULO_RESPONSABLE=?TITULO_RESPONSABLE '
      '  ,POR_CLASIFICA=?POR_CLASIFICA '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS '
      '  ,TIRAR=?TIRAR '
      '  ,RECUPERAR_ISO=?RECUPERAR_ISO '
      '  ,DEVOLVER=?DEVOLVER '
      '  ,ACEPTAR=?ACEPTAR '
      '  ,OTROS=?OTROS '
      '  ,VBCALIDAD=?VBCALIDAD '
      '  ,VBRESDEPARTAMENTO=?VBRESDEPARTAMENTO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,NDEVOLUCION=?NDEVOLUCION '
      '  ,CONTADOR=?CONTADOR '
      '  ,DEPARTAMENTO=?DEPARTAMENTO '
      '  ,TITULO_DEPARTAMENTO=?TITULO_DEPARTAMENTO '
      '  ,EVIDENCIA=?EVIDENCIA '
      '  ,NDOCCLI=?NDOCCLI '
      '  ,REFERENCIACLI=?REFERENCIACLI '
      '  ,NOTAS_INC=?NOTAS_INC '
      '  ,COSTE_TOTAL=?COSTE_TOTAL '
      '  ,LINEA=?LINEA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CLIPRO=?CLIPRO '
      '  ,CANAL=?CANAL '
      '  ,COSTE_INC=?COSTE_INC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC ')
    AfterOpen = QMIncAfterOpen
    AfterScroll = QMIncAfterScroll
    BeforeCancel = QMIncBeforeCancel
    BeforeClose = QMIncBeforeClose
    BeforePost = QMIncBeforePost
    OnNewRecord = QMIncNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RIC ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ISO_NO_CONFORMIDAD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMIncEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIncTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMIncTIPOChange
      Size = 3
    end
    object QMIncDESCRIPCION_TIPO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION_TIPO'
    end
    object QMIncCLI_PRO_INTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cli/Prov'
      DisplayWidth = 13
      FieldName = 'CLI_PRO_INTE'
      OnChange = QMIncCLI_PRO_INTEChange
    end
    object QMIncNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMIncSITUACION: TFIBStringField
      DisplayLabel = 'Doc.'
      DisplayWidth = 6
      FieldName = 'SITUACION'
      Size = 3
    end
    object QMIncSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMIncNUM_DOC: TIntegerField
      DisplayLabel = 'N'#186' doc.'
      DisplayWidth = 8
      FieldName = 'NUM_DOC'
    end
    object QMIncFECHA_INC: TDateTimeField
      DisplayLabel = 'Fecha Inc'
      FieldName = 'FECHA_INC'
    end
    object QMIncRESPONSABLE: TIntegerField
      DisplayLabel = 'Resp.'
      DisplayWidth = 10
      FieldName = 'RESPONSABLE'
      OnChange = QMIncRESPONSABLEChange
    end
    object QMIncTITULO_RESPONSABLE: TFIBStringField
      DisplayLabel = 'Nombre Responsable'
      FieldName = 'TITULO_RESPONSABLE'
      Size = 60
    end
    object QMIncESTADO: TIntegerField
      DisplayLabel = 'Pendiente'
      DisplayWidth = 5
      FieldName = 'ESTADO'
    end
    object QMIncDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object QMIncDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      OnChange = QMIncDEPARTAMENTOChange
      Size = 3
    end
    object QMIncTITULO_DEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Desc. Departamento'
      FieldName = 'TITULO_DEPARTAMENTO'
      Size = 40
    end
    object QMIncTIRAR: TIntegerField
      DisplayLabel = 'Tirar'
      FieldName = 'TIRAR'
    end
    object QMIncRECUPERAR_ISO: TIntegerField
      DisplayLabel = 'Recup. ISO'
      FieldName = 'RECUPERAR_ISO'
    end
    object QMIncDEVOLVER: TIntegerField
      Tag = 2
      DisplayLabel = 'Devolver'
      FieldName = 'DEVOLVER'
    end
    object QMIncACEPTAR: TIntegerField
      Tag = 3
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object QMIncOTROS: TIntegerField
      Tag = 4
      DisplayLabel = 'Otros'
      FieldName = 'OTROS'
    end
    object QMIncNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMIncVBCALIDAD: TIntegerField
      DisplayLabel = 'Vb Calidad'
      FieldName = 'VBCALIDAD'
    end
    object QMIncVBRESDEPARTAMENTO: TIntegerField
      DisplayLabel = 'Vb Departamento'
      FieldName = 'VBRESDEPARTAMENTO'
    end
    object QMIncCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMIncPOR_CLASIFICA: TIntegerField
      DisplayLabel = '% Clasif. '
      FieldName = 'POR_CLASIFICA'
    end
    object QMIncFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMIncNDEVOLUCION: TIntegerField
      DisplayLabel = 'Nro. Dev.'
      FieldName = 'NDEVOLUCION'
    end
    object QMIncRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMIncCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMIncEVIDENCIA: TFIBStringField
      DisplayLabel = 'Evidencia'
      FieldName = 'EVIDENCIA'
      Size = 200
    end
    object QMIncNDOCCLI: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'NDOCCLI'
    end
    object QMIncREFERENCIACLI: TFIBStringField
      DisplayLabel = 'Ref. Cli.'
      FieldName = 'REFERENCIACLI'
      Size = 40
    end
    object QMIncNOTAS_INC: TBlobField
      DisplayLabel = 'Notas Inc.'
      FieldName = 'NOTAS_INC'
      Size = 8
    end
    object QMIncCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object QMIncLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMIncEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMIncCLIPRO: TIntegerField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'CLIPRO'
      OnChange = QMIncCLIPROChange
    end
    object QMIncCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMIncCOSTE_INC: TFloatField
      DisplayLabel = 'Coste Inc.'
      FieldName = 'COSTE_INC'
    end
  end
  object DSQMInc: TDataSource
    DataSet = QMInc
    Left = 128
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 424
    Top = 64
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_NO_CONFORMIDAD_ACCIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RIC=?old_RIC AND '
      '  ACCION=?old_ACCION ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_NO_CONFORMIDAD_ACCIONES'
      
        '  (DESCRIPCION,FECHA_ACCION,NUM_DOC,SERIE_DOC,RESPONSABLE_ACCION' +
        ',ACCION,RIC,DEFINICION_ACCION,TIPO_ACCION,EMPRESA,REALIZADO,TIPO' +
        ',CONTADOR,NOTAS,COSTE)'
      'VALUES'
      
        '  (?DESCRIPCION,?FECHA_ACCION,?NUM_DOC,?SERIE_DOC,?RESPONSABLE_A' +
        'CCION,?ACCION,?RIC,?DEFINICION_ACCION,?TIPO_ACCION,?EMPRESA,?REA' +
        'LIZADO,?TIPO,?CONTADOR,?NOTAS,?COSTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NO_CONFORMIDAD_ACCIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC AND '
      '  ACCION=?ACCION ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NO_CONFORMIDAD_ACCIONES'
      'WHERE EMPRESA=?EMPRESA and RIC=?RIC and tipo=?tipo'
      'ORDER BY ACCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NO_CONFORMIDAD_ACCIONES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,FECHA_ACCION=?FECHA_ACCION '
      '  ,NUM_DOC=?NUM_DOC '
      '  ,SERIE_DOC=?SERIE_DOC '
      '  ,RESPONSABLE_ACCION=?RESPONSABLE_ACCION '
      '  ,DEFINICION_ACCION=?DEFINICION_ACCION '
      '  ,TIPO_ACCION=?TIPO_ACCION '
      '  ,REALIZADO=?REALIZADO '
      '  ,TIPO=?TIPO '
      '  ,CONTADOR=?CONTADOR '
      '  ,NOTAS=?NOTAS'
      '  ,COSTE=?COSTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC AND '
      '  ACCION=?ACCION ')
    DataSource = DSQMInc
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RIC '
      'ACCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NO_CONFORMIDAD_ACCIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 112
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleACCION: TIntegerField
      DisplayLabel = 'Accion'
      FieldName = 'ACCION'
    end
    object QMDetalleFECHA_ACCION: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ACCION'
    end
    object QMDetalleTIPO_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Accion'
      FieldName = 'TIPO_ACCION'
      Size = 3
    end
    object QMDetalleDescTipo: TStringField
      DisplayLabel = 'Desc.Tipo Acci'#243'n'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'DescTipo'
      OnGetText = QMDetalleDescTipoGetText
      Size = 40
      Calculated = True
    end
    object QMDetalleDEFINICION_ACCION: TFIBStringField
      DisplayLabel = 'Definici'#243'n de la acci'#243'n'
      DisplayWidth = 30
      FieldName = 'DEFINICION_ACCION'
      Size = 100
    end
    object QMDetalleRESPONSABLE_ACCION: TIntegerField
      DisplayLabel = 'Resp.'
      DisplayWidth = 7
      FieldName = 'RESPONSABLE_ACCION'
    end
    object QMDetalleDescResponsable: TStringField
      DisplayLabel = 'Desc. Responsable'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'DescResponsable'
      OnGetText = QMDetalleDescResponsableGetText
      Size = 40
      Calculated = True
    end
    object QMDetalleSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMDetalleNUM_DOC: TIntegerField
      DisplayLabel = 'Num doc.'
      FieldName = 'NUM_DOC'
    end
    object QMDetalleREALIZADO: TIntegerField
      DisplayLabel = 'Realizado'
      FieldName = 'REALIZADO'
    end
    object QMDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object QMDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMDetalleID_ACCION: TIntegerField
      DisplayLabel = 'ID Accion'
      FieldName = 'ID_ACCION'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 112
  end
  object xDepartamentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_DEPARTAMENTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  DEPARTAMENTO=?old_DEPARTAMENTO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_DEPARTAMENTOS'
      '  (DESCRIPCION,EMPRESA,DEPARTAMENTO)'
      'VALUES'
      '  (?DESCRIPCION,?EMPRESA,?DEPARTAMENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_DEPARTAMENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  DEPARTAMENTO=?DEPARTAMENTO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_DEPARTAMENTOS'
      'where empresa=?empresa and departamento=?departamento')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_DEPARTAMENTOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  DEPARTAMENTO=?DEPARTAMENTO ')
    DataSource = DSQMInc
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'DEPARTAMENTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_DEPARTAMENTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 256
    object xDepartamentosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDepartamentosDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object xDepartamentosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSxDepartamentos: TDataSource
    DataSet = xDepartamentos
    Left = 128
    Top = 256
  end
  object frIsoInc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Accion Correctiva/Preventiva'
    RebuildPrinter = False
    OnGetValue = frIsoIncGetValue
    OnBeforePrint = frIsoIncEnterRect
    OnEnterRect = frIsoIncEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 224
    Top = 16
    ReportForm = {19000000}
  end
  object frDBQMDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 224
    Top = 112
  end
  object QMDetArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_INC_ARTICULO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIC=?old_RIC AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_INC_ARTICULO'
      '  (EMPRESA,TIPO,RIC,LINEA,ARTICULO,CANTIDAD,CONTADOR,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?TIPO,?RIC,?LINEA,?ARTICULO,?CANTIDAD,?CONTADOR,?NOT' +
        'AS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_INC_ARTICULO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_INC_ARTICULO'
      'WHERE EMPRESA=?EMPRESA'
      '     AND  RIC = ?RIC and tipo=?tipo'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_INC_ARTICULO'
      'SET'
      '  TIPO=?TIPO '
      '  ,ARTICULO=?ARTICULO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,CONTADOR=?CONTADOR '
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMInc
    OnNewRecord = QMDetArticulosNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIC '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_INC_ARTICULO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 160
    object QMDetArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetArticulosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDetArticulosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetArticulosDescArticulo: TStringField
      DisplayLabel = 'Descripci'#243'n Art'#237'culo'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMDetArticulosDescArticuloGetText
      Size = 40
      Calculated = True
    end
    object QMDetArticulosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetArticulosCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMDetArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetArticulosCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSQMDetArticulos: TDataSource
    DataSet = QMDetArticulos
    Left = 128
    Top = 160
  end
  object frDBQMDetArticulos: TfrDBDataSet
    DataSource = DSQMDetArticulos
    Left = 224
    Top = 160
  end
  object xTipoDocumento: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_INC_DOCUMENTO_TIPO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_INC_DOCUMENTO_TIPO'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_INC_DOCUMENTO_TIPO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_INC_DOCUMENTO_TIPO'
      'where tipo=?situacion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_INC_DOCUMENTO_TIPO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    DataSource = DSQMInc
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_INC_DOCUMENTO_TIPO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 304
    object xTipoDocumentoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xTipoDocumentoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
  object DSxTipoDocumento: TDataSource
    DataSet = xTipoDocumento
    Left = 128
    Top = 304
  end
  object xFactorCla: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_INC_FACTOR_CLA'
      'WHERE'
      '  COD=?old_COD ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_INC_FACTOR_CLA'
      '  (COD,DESCRIPCION)'
      'VALUES'
      '  (?COD,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_INC_FACTOR_CLA'
      'WHERE'
      '  COD=?COD ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_INC_FACTOR_CLA'
      'where cod=?por_clasifica')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_INC_FACTOR_CLA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  COD=?COD ')
    DataSource = DSQMInc
    ClavesPrimarias.Strings = (
      'COD ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_INC_FACTOR_CLA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 352
    object xFactorClaCOD: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD'
    end
    object xFactorClaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
  object DsxFactorCla: TDataSource
    DataSet = xFactorCla
    Left = 128
    Top = 352
  end
  object frDBQmInc: TfrDBDataSet
    DataSource = DSQMInc
    Left = 224
    Top = 64
  end
  object SPDevolucion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure iso_crear_devolucion_mat(?empresa,?ejercicio,?' +
        'ric)')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 160
  end
  object frIsoResumenInc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Resumen INC'
    RebuildPrinter = False
    OnGetValue = frIsoResumenIncGetValue
    OnBeforePrint = frIsoIncEnterRect
    OnEnterRect = frIsoIncEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 320
    Top = 16
    ReportForm = {19000000}
  end
  object frDBLstResumenInc: TfrDBDataSet
    DataSource = DSQMInc
    Left = 224
    Top = 208
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 424
    Top = 112
  end
end
