object IsoDMPunteo: TIsoDMPunteo
  OldCreateOrder = False
  OnCreate = DMIsoPunteoCreate
  Left = 427
  Top = 221
  Height = 281
  Width = 397
  object QMPunteo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_NO_CONFORMIDAD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RIC=?old_RIC ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_NO_CONFORMIDAD'
      
        '  (NOTAS,TIRAR,RECUPERAR_ISO,DEVOLVER,ACEPTAR,OTROS,VBCALIDAD,VB' +
        'RESDEPARTAMENTO,FECHA_INC,RESPONSABLE,NUM_DOC,SERIE_DOC,CLI_PRO_' +
        'INTE,RIC,ESTADO,POR_CLASIFICA,DESCRIPCION,TIPO,EMPRESA,SITUACION' +
        ',CANTIDAD)'
      'VALUES'
      
        '  (?NOTAS,?TIRAR,?RECUPERAR_ISO,?DEVOLVER,?ACEPTAR,?OTROS,?VBCAL' +
        'IDAD,?VBRESDEPARTAMENTO,?FECHA_INC,?RESPONSABLE,?NUM_DOC,?SERIE_' +
        'DOC,?CLI_PRO_INTE,?RIC,?ESTADO,?POR_CLASIFICA,?DESCRIPCION,?TIPO' +
        ',?EMPRESA,?SITUACION,?CANTIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NO_CONFORMIDAD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NO_CONFORMIDAD'
      'where empresa=?empresa and estado=0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NO_CONFORMIDAD'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,TIRAR=?TIRAR '
      '  ,RECUPERAR_ISO=?RECUPERAR_ISO'
      '  ,DEVOLVER=?DEVOLVER '
      '  ,ACEPTAR=?ACEPTAR '
      '  ,OTROS=?OTROS '
      '  ,VBCALIDAD=?VBCALIDAD '
      '  ,VBRESDEPARTAMENTO=?VBRESDEPARTAMENTO '
      '  ,FECHA_INC=?FECHA_INC '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,NUM_DOC=?NUM_DOC '
      '  ,SERIE_DOC=?SERIE_DOC '
      '  ,CLI_PRO_INTE=?CLI_PRO_INTE '
      '  ,ESTADO=?ESTADO '
      '  ,POR_CLASIFICA=?POR_CLASIFICA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,TIPO=?TIPO '
      '  ,SITUACION=?SITUACION '
      '  ,CANTIDAD=?CANTIDAD '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC ')
    AfterInsert = QMPunteoAfterInsert
    AfterOpen = QMPunteoAfterOpen
    AfterPost = QMPunteoAfterPost
    BeforeDelete = QMPunteoBeforeDelete
    BeforeInsert = QMPunteoBeforeInsert
    OnNewRecord = QMPunteoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RIC ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NO_CONFORMIDAD'
    UpdateTransaction = TLocal
    Left = 64
    Top = 24
    object QMPunteoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPunteoRIC: TIntegerField
      DisplayLabel = 'Ric'
      FieldName = 'RIC'
      ReadOnly = True
    end
    object QMPunteoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPunteoxDescTipo: TStringField
      DisplayLabel = 'Desc. Tipo'
      FieldKind = fkCalculated
      FieldName = 'xDescTipo'
      OnGetText = QMPunteoxDescTipoGetText
      Size = 40
      Calculated = True
    end
    object QMPunteoCLI_PRO_INTE: TIntegerField
      DisplayLabel = 'Cod. Cli/Pro'
      FieldName = 'CLI_PRO_INTE'
    end
    object QMPunteoxDescCliPro: TStringField
      DisplayLabel = 'Desc. Cli/Pro'
      FieldKind = fkCalculated
      FieldName = 'xDescCliPro'
      OnGetText = QMPunteoxDescCliProGetText
      Size = 40
      Calculated = True
    end
    object QMPunteoSITUACION: TFIBStringField
      DisplayLabel = 'Situaci'#243'n'
      FieldName = 'SITUACION'
      Size = 3
    end
    object QMPunteoSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMPunteoNUM_DOC: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_DOC'
    end
    object QMPunteoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object QMPunteoFECHA_INC: TDateTimeField
      DisplayLabel = 'Fecha INC'
      FieldName = 'FECHA_INC'
    end
    object QMPunteoRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMPunteoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMPunteoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPunteoTIRAR: TIntegerField
      DisplayLabel = 'Tirar'
      FieldName = 'TIRAR'
    end
    object QMPunteoRECUPERAR_ISO: TIntegerField
      DisplayLabel = 'Recuperar ISO'
      FieldName = 'RECUPERAR_ISO'
    end
    object QMPunteoDEVOLVER: TIntegerField
      DisplayLabel = 'Devolver'
      FieldName = 'DEVOLVER'
    end
    object QMPunteoACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object QMPunteoOTROS: TIntegerField
      DisplayLabel = 'Otros'
      FieldName = 'OTROS'
    end
    object QMPunteoVBCALIDAD: TIntegerField
      DisplayLabel = 'VB Calidad'
      FieldName = 'VBCALIDAD'
    end
    object QMPunteoVBRESDEPARTAMENTO: TIntegerField
      DisplayLabel = 'VB Dept. '
      FieldName = 'VBRESDEPARTAMENTO'
    end
    object QMPunteoCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMPunteoPOR_CLASIFICA: TIntegerField
      DisplayLabel = '% Clasifica'
      FieldName = 'POR_CLASIFICA'
    end
    object QMPunteoFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMPunteoNDEVOLUCION: TIntegerField
      DisplayLabel = 'Nro. Devoluci'#243'n'
      FieldName = 'NDEVOLUCION'
    end
    object QMPunteoCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMPunteoDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMPunteoEVIDENCIA: TFIBStringField
      DisplayLabel = 'Evidencia'
      FieldName = 'EVIDENCIA'
      Size = 200
    end
    object QMPunteoNDOCCLI: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'NDOCCLI'
    end
    object QMPunteoREFERENCIACLI: TFIBStringField
      DisplayLabel = 'Referencia Cli.'
      FieldName = 'REFERENCIACLI'
      Size = 40
    end
  end
  object DSQMPunteo: TDataSource
    DataSet = QMPunteo
    Left = 168
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 24
  end
  object xDescTipo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_NO_CONFORMIDAD_TIPO'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_NO_CONFORMIDAD_TIPO'
      '  (TIPO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NO_CONFORMIDAD_TIPO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NO_CONFORMIDAD_TIPO'
      'where tipo=?tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NO_CONFORMIDAD_TIPO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    DataSource = DSQMPunteo
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NO_CONFORMIDAD_TIPO'
    UpdateTransaction = TLocal
    Left = 168
    Top = 96
    object xDescTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDescTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
    end
  end
  object DSxDescTipo: TDataSource
    DataSet = xDescTipo
    Left = 272
    Top = 96
  end
  object xDescCliPro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS'
      'where tercero=?cli_pro_inte')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMPunteo
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TERCEROS'
    UpdateTransaction = TLocal
    Left = 168
    Top = 168
    object xDescCliProTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDescCliProNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDescCliProNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xDescCliProDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
  end
  object DSxDescCliPro: TDataSource
    DataSet = xDescCliPro
    Left = 272
    Top = 168
  end
  object QTancarTots: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update iso_no_conformidad'
      'set estado=1'
      'where '
      'vbcalidad=1 and '
      'vbresdepartamento=1')
    Transaction = TLocal
    AutoTrans = True
    Left = 64
    Top = 96
  end
end
