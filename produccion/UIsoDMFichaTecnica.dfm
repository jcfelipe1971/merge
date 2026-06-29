object IsoDMFichaTecnica: TIsoDMFichaTecnica
  OldCreateOrder = False
  OnCreate = IsoDMFichaCreate
  OnDestroy = DataModuleDestroy
  Left = 295
  Top = 520
  Height = 571
  Width = 823
  object QMFichaC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO_CAB'
      'WHERE'
      '  ID_ENSAYO=?old_ID_ENSAYO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO_CAB'
      
        '  (ID_ENSAYO,ARTICULO,FECHA_ENSAYO,REVISION,RESPONSABLE,ACTIVO,N' +
        'OTAS,UNIDAD_ENVASE,UNIDAD_TRANSPORTE,LOTE_HOMOGENEO,EMPRESA,TIPO' +
        ',ID_LOTE,CLIENTE,ID_ORDEN,FICHA,REFERENCIA,DESCRIPCION,COLORES,N' +
        'OMBRE_PRODUCTO,APLICACION_PREFERENTE,CAR_NORMAS_UNE)'
      'VALUES'
      
        '  (?ID_ENSAYO,?ARTICULO,?FECHA_ENSAYO,?REVISION,?RESPONSABLE,?AC' +
        'TIVO,?NOTAS,?UNIDAD_ENVASE,?UNIDAD_TRANSPORTE,?LOTE_HOMOGENEO,?E' +
        'MPRESA,0,?ID_LOTE,?CLIENTE,?ID_ORDEN,?FICHA,?REFERENCIA,?DESCRIP' +
        'CION,?COLORES,?NOMBRE_PRODUCTO,?APLICACION_PREFERENTE, ?CAR_NORM' +
        'AS_UNE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO_CAB'
      'WHERE'
      '  ID_ENSAYO=?ID_ENSAYO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO_CAB'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO_CAB'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,FECHA_ENSAYO=?FECHA_ENSAYO '
      '  ,REVISION=?REVISION '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,ACTIVO=?ACTIVO '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDAD_ENVASE=?UNIDAD_ENVASE '
      '  ,UNIDAD_TRANSPORTE=?UNIDAD_TRANSPORTE '
      '  ,LOTE_HOMOGENEO=?LOTE_HOMOGENEO '
      '  ,TIPO=?TIPO'
      '  ,ID_LOTE=?ID_LOTE'
      '  ,CLIENTE=?CLIENTE'
      '  ,ID_ORDEN=?ID_ORDEN'
      '  ,FICHA=?FICHA'
      '  ,REFERENCIA=?REFERENCIA'
      '  ,DESCRIPCION=?DESCRIPCION'
      '  ,COLORES=?COLORES'
      '  ,NOMBRE_PRODUCTO=?NOMBRE_PRODUCTO'
      '  ,APLICACION_PREFERENTE=?APLICACION_PREFERENTE'
      '  ,CAR_NORMAS_UNE=?CAR_NORMAS_UNE'
      'WHERE'
      '  ID_ENSAYO=?ID_ENSAYO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMFichaCAfterOpen
    AfterPost = Graba
    BeforePost = QMFichaCBeforePost
    OnNewRecord = QMFichaCNewRecord
    ClavesPrimarias.Strings = (
      'ID_ENSAYO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 32
    object QMFichaCID_ENSAYO: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ENSAYO'
    end
    object QMFichaCARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMFichaCDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMFichaCDescArtGetText
      Calculated = True
    end
    object QMFichaCFECHA_ENSAYO: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ENSAYO'
    end
    object QMFichaCREVISION: TIntegerField
      DisplayLabel = 'Revision'
      FieldName = 'REVISION'
    end
    object QMFichaCRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMFichaCACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMFichaCDescResp: TStringField
      DisplayLabel = 'Responsable'
      FieldKind = fkCalculated
      FieldName = 'DescResp'
      OnGetText = QMFichaCDescRespGetText
      Calculated = True
    end
    object QMFichaCNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMFichaCUNIDAD_ENVASE: TFIBStringField
      DisplayLabel = 'Unidad Envase'
      FieldName = 'UNIDAD_ENVASE'
      Size = 60
    end
    object QMFichaCUNIDAD_TRANSPORTE: TFIBStringField
      DisplayLabel = 'Unidad Transporte'
      FieldName = 'UNIDAD_TRANSPORTE'
      Size = 60
    end
    object QMFichaCLOTE_HOMOGENEO: TFIBStringField
      DisplayLabel = 'Lote Hogeneo'
      FieldName = 'LOTE_HOMOGENEO'
      Size = 60
    end
    object QMFichaCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFichaCTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 35
    end
    object QMFichaCID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMFichaCCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMFichaCDescCli: TStringField
      DisplayLabel = 'Nombre'
      FieldKind = fkCalculated
      FieldName = 'DescCli'
      OnGetText = QMFichaCDescCliGetText
      Size = 60
      Calculated = True
    end
    object QMFichaCDescLote: TStringField
      DisplayLabel = 'Desc. Lote'
      FieldKind = fkCalculated
      FieldName = 'DescLote'
      OnGetText = QMFichaCDescLoteGetText
      Size = 15
      Calculated = True
    end
    object QMFichaCID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMFichaCFICHA: TFIBStringField
      DisplayLabel = 'Ficha'
      FieldName = 'FICHA'
      Size = 60
    end
    object QMFichaCREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object QMFichaCDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMFichaCCOLORES: TFIBStringField
      DisplayLabel = 'Colores'
      FieldName = 'COLORES'
      Size = 60
    end
    object QMFichaCNOMBRE_PRODUCTO: TFIBStringField
      DisplayLabel = 'Nombre Producto'
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 60
    end
    object QMFichaCAPLICACION_PREFERENTE: TFIBStringField
      DisplayLabel = 'Apl. Preferente'
      FieldName = 'APLICACION_PREFERENTE'
      Size = 60
    end
    object QMFichaCFICHA_ORIGEN: TIntegerField
      DisplayLabel = 'Ficha Orig.'
      FieldName = 'FICHA_ORIGEN'
    end
    object QMFichaCCAR_NORMAS_UNE: TFIBStringField
      DisplayLabel = 'Car. UNE'
      FieldName = 'CAR_NORMAS_UNE'
      Size = 40
    end
  end
  object DSQMFichaC: TDataSource
    DataSet = QMFichaC
    Left = 152
    Top = 32
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 256
    Top = 32
  end
  object QMFichaD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO_DET'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ID_ENSAYO=?old_ID_ENSAYO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO_DET'
      
        '  (DESCRIPCION,ME_UNIDADES_RESULTADO,ME_UNIDADES_MAXIMO,ME_UNIDA' +
        'DES_MEDIO,ME_UNIDADES_MINIMO,LINEA,ID_ENSAYO,ME_IMPRIMIR,EMPRESA' +
        ',VALOR_2,VALOR_1,ME_METODO_ENSAYO,ISO_ENSAYO)'
      'VALUES'
      
        '  (?DESCRIPCION,?ME_UNIDADES_RESULTADO,?ME_UNIDADES_MAXIMO,?ME_U' +
        'NIDADES_MEDIO,?ME_UNIDADES_MINIMO,?LINEA,?ID_ENSAYO,?ME_IMPRIMIR' +
        ',?EMPRESA,?VALOR_2,?VALOR_1,?ME_METODO_ENSAYO,?ISO_ENSAYO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID_ENSAYO=?ID_ENSAYO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO_DET'
      'WHERE EMPRESA=?EMPRESA AND ID_ENSAYO=?ID_ENSAYO'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO_DET'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,ME_UNIDADES_RESULTADO=?ME_UNIDADES_RESULTADO '
      '  ,ME_UNIDADES_MAXIMO=?ME_UNIDADES_MAXIMO '
      '  ,ME_UNIDADES_MEDIO=?ME_UNIDADES_MEDIO '
      '  ,ME_UNIDADES_MINIMO=?ME_UNIDADES_MINIMO '
      '  ,ME_IMPRIMIR=?ME_IMPRIMIR '
      '  ,VALOR_2=?VALOR_2 '
      '  ,VALOR_1=?VALOR_1 '
      '  ,ME_METODO_ENSAYO=?ME_METODO_ENSAYO '
      '  ,ISO_ENSAYO=?ISO_ENSAYO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID_ENSAYO=?ID_ENSAYO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMFichaC
    AfterDelete = Graba
    AfterOpen = QMFichaDAfterOpen
    AfterPost = Graba
    BeforeClose = QMFichaDBeforeClose
    OnNewRecord = QMFichaDNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ID_ENSAYO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 80
    object QMFichaDID_ENSAYO: TIntegerField
      DisplayLabel = 'ID Ensayo'
      FieldName = 'ID_ENSAYO'
    end
    object QMFichaDISO_ENSAYO: TFIBStringField
      DisplayLabel = 'Ensayo'
      FieldName = 'ISO_ENSAYO'
      Size = 3
    end
    object QMFichaDDESCRIPCION: TBlobField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 8
    end
    object QMFichaDVALOR_1: TFIBStringField
      DisplayLabel = 'Valor 1'
      FieldName = 'VALOR_1'
      Size = 60
    end
    object QMFichaDVALOR_2: TFIBStringField
      DisplayLabel = 'Valor 2'
      FieldName = 'VALOR_2'
      Size = 60
    end
    object QMFichaDLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFichaDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFichaDIsoNormativa: TStringField
      DisplayLabel = 'Normativa'
      FieldKind = fkCalculated
      FieldName = 'IsoNormativa'
      OnGetText = QMFichaDIsoNormativaGetText
      Calculated = True
    end
    object QMFichaDDescEnsayo: TStringField
      DisplayLabel = 'Desc. Ensayo'
      FieldKind = fkCalculated
      FieldName = 'DescEnsayo'
      OnGetText = QMFichaDDescEnsayoGetText
      Calculated = True
    end
    object QMFichaDIsoTipoEnsayo: TStringField
      DisplayLabel = 'Tipo Ensayo'
      FieldKind = fkCalculated
      FieldName = 'IsoTipoEnsayo'
      OnGetText = QMFichaDIsoTipoEnsayoGetText
      Calculated = True
    end
    object QMFichaDME_METODO_ENSAYO: TFIBStringField
      DisplayLabel = 'Notas ensayo'
      FieldName = 'ME_METODO_ENSAYO'
      Size = 60
    end
    object QMFichaDME_UNIDADES_MINIMO: TFloatField
      DisplayLabel = 'Uds. Minimo'
      FieldName = 'ME_UNIDADES_MINIMO'
    end
    object QMFichaDME_UNIDADES_MEDIO: TFloatField
      DisplayLabel = 'Uds. Medio'
      FieldName = 'ME_UNIDADES_MEDIO'
    end
    object QMFichaDME_UNIDADES_MAXIMO: TFloatField
      DisplayLabel = 'Uds. Maximo'
      FieldName = 'ME_UNIDADES_MAXIMO'
    end
    object QMFichaDME_UNIDADES_RESULTADO: TFloatField
      DisplayLabel = 'Uds. Resultado'
      FieldName = 'ME_UNIDADES_RESULTADO'
    end
    object QMFichaDME_IMPRIMIR: TIntegerField
      DisplayLabel = 'Imprimir'
      FieldName = 'ME_IMPRIMIR'
    end
    object QMFichaDDescNormativa: TStringField
      DisplayLabel = 'Desc. Normativa'
      FieldKind = fkCalculated
      FieldName = 'DescNormativa'
      OnGetText = QMFichaDDescNormativaGetText
      Calculated = True
    end
  end
  object DSQMFichaD: TDataSource
    DataSet = QMFichaD
    Left = 152
    Top = 80
  end
  object frIsoFichaTecnica: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Z_ESETRI_FICHA_EQ_MEDICION'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 616
    Top = 40
    ReportForm = {19000000}
  end
  object frDBQMDet: TfrDBDataSet
    DataSource = DSxLstDetalle
    Left = 616
    Top = 136
  end
  object SPLineaSegDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) linea from iso_ensayo_det'
      'where (empresa=?empresa and id_ensayo=?id_ensayo)')
    Transaction = TLocal
    AutoTrans = True
    Left = 256
    Top = 80
  end
  object frDBQMCab: TfrDBDataSet
    DataSource = DSxLstCabecera
    Left = 616
    Top = 88
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 336
    Top = 32
  end
  object xIsoEnsayo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO'
      '  (DESCRIPCION,CODIGO,ISO_TIPO_ENSAYO,ISO_NORMATIVAS)'
      'VALUES'
      '  (?DESCRIPCION,?CODIGO,?ISO_TIPO_ENSAYO,?ISO_NORMATIVAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO WHERE CODIGO=?ISO_ENSAYO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,ISO_TIPO_ENSAYO=?ISO_TIPO_ENSAYO '
      '  ,ISO_NORMATIVAS=?ISO_NORMATIVAS '
      'WHERE'
      '  CODIGO=?CODIGO ')
    DataSource = DSQMFichaD
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO'
    UpdateTransaction = TUpdate
    Left = 40
    Top = 128
    object xIsoEnsayoCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xIsoEnsayoISO_TIPO_ENSAYO: TFIBStringField
      DisplayLabel = 'Tipo Ensayo'
      FieldName = 'ISO_TIPO_ENSAYO'
      Size = 3
    end
    object xIsoEnsayoISO_NORMATIVAS: TFIBStringField
      DisplayLabel = 'Normativas'
      FieldName = 'ISO_NORMATIVAS'
      Size = 3
    end
    object xIsoEnsayoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxIsoEnsayo: TDataSource
    DataSet = xIsoEnsayo
    Left = 152
    Top = 128
  end
  object QMFichaArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO_ART'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_ENSAYO=?old_ID_ENSAYO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO_ART'
      '  (EMPRESA,ID_ENSAYO,LINEA,ARTICULO)'
      'VALUES'
      '  (?EMPRESA,?ID_ENSAYO,?LINEA,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO_ART'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_ENSAYO=?ID_ENSAYO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO_ART'
      'where empresa=?empresa and id_ensayo=?id_ensayo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO_ART'
      'SET'
      '  ARTICULO=?ARTICULO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_ENSAYO=?ID_ENSAYO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMFichaC
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMFichaArtBeforePost
    OnNewRecord = QMFichaArtNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_ENSAYO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO_ART'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 176
    object QMFichaArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFichaArtID_ENSAYO: TIntegerField
      DisplayLabel = 'ID Ensayo'
      FieldName = 'ID_ENSAYO'
    end
    object QMFichaArtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFichaArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMFichaArtDescArticulo: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMFichaArtDescArticuloGetText
      Size = 60
      Calculated = True
    end
  end
  object DSQMFichaArt: TDataSource
    DataSet = QMFichaArt
    Left = 152
    Top = 176
  end
  object SPLineaSegArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) linea from iso_ensayo_art'
      'where (empresa=?empresa and id_ensayo=?id_ensayo)')
    Transaction = TLocal
    AutoTrans = True
    Left = 256
    Top = 176
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 128
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select *'
      'From ver_clientes_odbc where '
      'empresa=?empresa and ejercicio=?ejercicio and canal=?canal '
      'and num_cliente=?cliente')
    UniDirectional = False
    Left = 40
    Top = 224
    object xClienteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClienteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xClienteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xClienteNUM_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'NUM_CLIENTE'
    end
    object xClienteNUM_TERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'NUM_TERCERO'
    end
    object xClienteCUENTA_CONTABLE: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CONTABLE'
      Size = 15
    end
    object xClienteNOMBRE_SOCIAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_SOCIAL'
      Size = 60
    end
    object xClienteNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xClienteNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xClienteTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xClienteTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xClienteFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object xClienteE_MAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'E_MAIL'
      Size = 100
    end
    object xClienteWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xClienteBANCO: TFIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 40
    end
    object xClienteENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xClienteSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xClienteDC: TFIBStringField
      DisplayLabel = 'D.C.'
      FieldName = 'DC'
      Size = 2
    end
    object xClienteCC: TFIBStringField
      DisplayLabel = 'Cuenta Corriente'
      FieldName = 'CC'
    end
    object xClienteTIPO_DIRECCION: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DIRECCION'
      Size = 3
    end
    object xClienteDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 40
    end
    object xClienteDIRECCION2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIRECCION2'
      Size = 40
    end
    object xClienteDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xClienteDIR_ESCALERA: TFIBStringField
      DisplayLabel = 'Escalera'
      FieldName = 'DIR_ESCALERA'
      Size = 4
    end
    object xClienteDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xClienteDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xClienteDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xClienteDIR_COMPLETA2: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA2'
      Size = 76
    end
    object xClienteCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xClientePOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object xClientePROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xClientePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object xLstCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO_CAB'
      'WHERE EMPRESA=?EMPRESA AND ID_ENSAYO=?ID_ENSAYO')
    UniDirectional = False
    Left = 400
    Top = 88
    object xLstCabeceraID_ENSAYO: TIntegerField
      DisplayLabel = 'Id. Ensayo'
      FieldName = 'ID_ENSAYO'
    end
    object xLstCabeceraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstCabeceraFECHA_ENSAYO: TDateTimeField
      DisplayLabel = 'Fec. Ensayo'
      FieldName = 'FECHA_ENSAYO'
    end
    object xLstCabeceraREVISION: TIntegerField
      DisplayLabel = 'Revision'
      FieldName = 'REVISION'
    end
    object xLstCabeceraRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xLstCabeceraACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xLstCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xLstCabeceraUNIDAD_ENVASE: TFIBStringField
      DisplayLabel = 'Ud. Envase'
      FieldName = 'UNIDAD_ENVASE'
      Size = 60
    end
    object xLstCabeceraUNIDAD_TRANSPORTE: TFIBStringField
      DisplayLabel = 'Ud. Transporte'
      FieldName = 'UNIDAD_TRANSPORTE'
      Size = 60
    end
    object xLstCabeceraLOTE_HOMOGENEO: TFIBStringField
      DisplayLabel = 'Lote Homogeneo'
      FieldName = 'LOTE_HOMOGENEO'
      Size = 60
    end
    object xLstCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 35
    end
    object xLstCabeceraID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xLstCabeceraID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xLstCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xLstCabeceraFICHA: TFIBStringField
      DisplayLabel = 'Ficha'
      FieldName = 'FICHA'
      Size = 60
    end
    object xLstCabeceraREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object xLstCabeceraDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xLstCabeceraCOLORES: TFIBStringField
      DisplayLabel = 'Colores'
      FieldName = 'COLORES'
      Size = 60
    end
    object xLstCabeceraNOMBRE_PRODUCTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 60
    end
    object xLstCabeceraAPLICACION_PREFERENTE: TFIBStringField
      DisplayLabel = 'Aplic. Preferente'
      FieldName = 'APLICACION_PREFERENTE'
      Size = 60
    end
    object xLstCabeceraFICHA_ORIGEN: TIntegerField
      DisplayLabel = 'Ficha Orig.'
      FieldName = 'FICHA_ORIGEN'
    end
  end
  object DSxLstCabecera: TDataSource
    DataSet = xLstCabecera
    Left = 512
    Top = 88
  end
  object xLstDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select det.ID_ENSAYO, det.ISO_ENSAYO, det.DESCRIPCION, det.VALOR' +
        '_1, det.VALOR_2, det.LINEA,'
      
        '       det.EMPRESA, det.ME_METODO_ENSAYO, det.ME_UNIDADES_MINIMO' +
        ', det.ME_UNIDADES_MEDIO,'
      
        '       det.ME_UNIDADES_MAXIMO, det.ME_UNIDADES_RESULTADO, det.ME' +
        '_IMPRIMIR, tip.codigo, tip.descripcion'
      'from ISO_ENSAYO_DET det'
      '         join iso_ensayo iso on (iso.codigo = det.iso_ensayo)'
      
        '         join iso_tipo_ensayo tip on (tip.codigo = iso.iso_tipo_' +
        'ensayo)'
      
        'where det.EMPRESA=?EMPRESA and det.ID_ENSAYO=?ID_ENSAYO and det.' +
        'ME_IMPRIMIR=1'
      'order by tip.codigo, det.LINEA')
    UniDirectional = False
    DataSource = DSxLstCabecera
    Left = 400
    Top = 136
    object xLstDetalleID_ENSAYO: TIntegerField
      DisplayLabel = 'Id. Ensayo'
      FieldName = 'ID_ENSAYO'
    end
    object xLstDetalleISO_ENSAYO: TFIBStringField
      DisplayLabel = 'Id. Ensayo'
      FieldName = 'ISO_ENSAYO'
      Size = 3
    end
    object xLstDetalleDESCRIPCION: TBlobField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 8
    end
    object xLstDetalleVALOR_1: TFIBStringField
      DisplayLabel = 'Valor 1'
      FieldName = 'VALOR_1'
      Size = 60
    end
    object xLstDetalleVALOR_2: TFIBStringField
      DisplayLabel = 'Valor 2'
      FieldName = 'VALOR_2'
      Size = 60
    end
    object xLstDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstDetalleME_METODO_ENSAYO: TFIBStringField
      DisplayLabel = 'Metodo'
      FieldName = 'ME_METODO_ENSAYO'
      Size = 60
    end
    object xLstDetalleME_UNIDADES_MINIMO: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'ME_UNIDADES_MINIMO'
    end
    object xLstDetalleME_UNIDADES_MEDIO: TFloatField
      DisplayLabel = 'Uds. Med.'
      FieldName = 'ME_UNIDADES_MEDIO'
    end
    object xLstDetalleME_UNIDADES_MAXIMO: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'ME_UNIDADES_MAXIMO'
    end
    object xLstDetalleME_UNIDADES_RESULTADO: TFloatField
      DisplayLabel = 'Uds. Resultado'
      FieldName = 'ME_UNIDADES_RESULTADO'
    end
    object xLstDetalleME_IMPRIMIR: TIntegerField
      DisplayLabel = 'Imprimir'
      FieldName = 'ME_IMPRIMIR'
    end
    object xLstDetalleCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xLstDetalleDESCRIPCION1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION1'
      Size = 60
    end
  end
  object DSxLstDetalle: TDataSource
    DataSet = xLstDetalle
    Left = 512
    Top = 136
  end
  object DSxDescEnsayo: TDataSource
    DataSet = xDescEnsayo
    Left = 152
    Top = 320
  end
  object xDescEnsayo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO'
      '  (DESCRIPCION,CODIGO,ISO_TIPO_ENSAYO,ISO_NORMATIVAS)'
      'VALUES'
      '  (?DESCRIPCION,?CODIGO,?ISO_TIPO_ENSAYO,?ISO_NORMATIVAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT DESCRIPCION FROM ISO_ENSAYO WHERE CODIGO=?ISO_ENSAYO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,ISO_TIPO_ENSAYO=?ISO_TIPO_ENSAYO '
      '  ,ISO_NORMATIVAS=?ISO_NORMATIVAS '
      'WHERE'
      '  CODIGO=?CODIGO ')
    DataSource = DSxLstDetalle
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO'
    UpdateTransaction = TUpdate
    Left = 40
    Top = 320
    object xDescEnsayoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxDescNormativa: TDataSource
    DataSet = xDescNormativa
    Left = 152
    Top = 272
  end
  object xDescNormativa: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_NORMATIVAS'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_NORMATIVAS'
      '  (DESCRIPCION,FECHA_VIGOR,LEY,CODIGO)'
      'VALUES'
      '  (?DESCRIPCION,?FECHA_VIGOR,?LEY,?CODIGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NORMATIVAS'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT LEY FROM ISO_NORMATIVAS NOR, ISO_ENSAYO ENS '
      'WHERE NOR.CODIGO=ENS.ISO_NORMATIVAS'
      'AND ENS.CODIGO=?ISO_ENSAYO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NORMATIVAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,FECHA_VIGOR=?FECHA_VIGOR '
      '  ,LEY=?LEY '
      'WHERE'
      '  CODIGO=?CODIGO ')
    DataSource = DSxLstDetalle
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NORMATIVAS'
    UpdateTransaction = TUpdate
    Left = 40
    Top = 272
    object xDescNormativaLEY: TFIBStringField
      DisplayLabel = 'Ley'
      FieldName = 'LEY'
      Size = 60
    end
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 152
    Top = 224
  end
  object frDBQMArt: TfrDBDataSet
    DataSource = DSxLstArticulos
    Left = 616
    Top = 184
  end
  object xLstArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO_ART'
      'WHERE EMPRESA=?EMPRESA AND ID_ENSAYO=?ID_ENSAYO')
    UniDirectional = False
    DataSource = DSxLstCabecera
    Left = 400
    Top = 184
    object xLstArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstArticulosID_ENSAYO: TIntegerField
      DisplayLabel = 'Id. Ensayo'
      FieldName = 'ID_ENSAYO'
    end
    object xLstArticulosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSxLstArticulos: TDataSource
    DataSet = xLstArticulos
    Left = 512
    Top = 184
  end
  object xLstEnsayo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ENSAYO'
      '  (DESCRIPCION,CODIGO,ISO_TIPO_ENSAYO,ISO_NORMATIVAS)'
      'VALUES'
      '  (?DESCRIPCION,?CODIGO,?ISO_TIPO_ENSAYO,?ISO_NORMATIVAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ENSAYO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ENSAYO WHERE CODIGO=?ISO_ENSAYO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ENSAYO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,ISO_TIPO_ENSAYO=?ISO_TIPO_ENSAYO '
      '  ,ISO_NORMATIVAS=?ISO_NORMATIVAS '
      'WHERE'
      '  CODIGO=?CODIGO ')
    DataSource = DSxLstDetalle
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ENSAYO'
    UpdateTransaction = TUpdate
    Left = 400
    Top = 232
    object xLstEnsayoCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xLstEnsayoISO_TIPO_ENSAYO: TFIBStringField
      DisplayLabel = 'Tipo Ensayo'
      FieldName = 'ISO_TIPO_ENSAYO'
      Size = 3
    end
    object xLstEnsayoISO_NORMATIVAS: TFIBStringField
      DisplayLabel = 'Normativas'
      FieldName = 'ISO_NORMATIVAS'
      Size = 3
    end
    object xLstEnsayoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxLstEnsayo: TDataSource
    DataSet = xLstEnsayo
    Left = 512
    Top = 232
  end
  object xLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select lote'
      'From art_articulos_lotes'
      'where empresa=?empresa and id_lote=?id_lote')
    UniDirectional = False
    DataSource = DSxLstCabecera
    Left = 400
    Top = 280
    object xLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
  end
  object DSxLote: TDataSource
    DataSet = xLote
    Left = 512
    Top = 280
  end
  object xDescArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select titulo'
      'From art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    DataSource = DSxLstCabecera
    Left = 400
    Top = 328
    object xDescArtTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxDescArt: TDataSource
    DataSet = xDescArt
    Left = 512
    Top = 328
  end
end
