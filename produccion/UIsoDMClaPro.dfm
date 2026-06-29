object IsoDMClaPro: TIsoDMClaPro
  OldCreateOrder = False
  OnCreate = DMIsoClaProCreate
  Left = 209
  Top = 222
  Height = 557
  Width = 789
  object DSQMIsoClaPro: TDataSource
    DataSet = QMIsoClaPro
    Left = 136
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 424
    Top = 16
  end
  object xClaManual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_TIPO_CLASIFICACION_MANUAL'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_TIPO_CLASIFICACION_MANUAL'
      '  (DESCRIPCION,TIPO)'
      'VALUES'
      '  (?DESCRIPCION,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_TIPO_CLASIFICACION_MANUAL'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_TIPO_CLASIFICACION_MANUAL'
      'where tipo=?clas_manual')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_TIPO_CLASIFICACION_MANUAL'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    DataSource = DSQMIsoClaPro
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_TIPO_CLASIFICACION_MANUAL'
    UpdateTransaction = TLocal
    Left = 40
    Top = 120
    object xClaManualTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xClaManualDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
  object DSxClaManual: TDataSource
    DataSet = xClaManual
    Left = 136
    Top = 120
  end
  object xNINC: TFIBTableSet
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
      
        '  (NOTAS,TIRAR,RECUPERAR,DEVOLVER,ACEPTAR,OTROS,VBCALIDAD,VBRESD' +
        'EPARTAMENTO,FECHA_INC,RESPONSABLE,NUM_DOC,SERIE_DOC,CLI_PRO_INTE' +
        ',RIC,ESTADO,POR_CLASIFICA,DESCRIPCION,TIPO,EMPRESA,SITUACION,SEC' +
        'CION,CANTIDAD,FECHA_CIERRE)'
      'VALUES'
      
        '  (?NOTAS,?TIRAR,?RECUPERAR,?DEVOLVER,?ACEPTAR,?OTROS,?VBCALIDAD' +
        ',?VBRESDEPARTAMENTO,?FECHA_INC,?RESPONSABLE,?NUM_DOC,?SERIE_DOC,' +
        '?CLI_PRO_INTE,?RIC,?ESTADO,?POR_CLASIFICA,?DESCRIPCION,?TIPO,?EM' +
        'PRESA,?SITUACION,?SECCION,?CANTIDAD,?FECHA_CIERRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NO_CONFORMIDAD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NO_CONFORMIDAD'
      'where empresa=?empresa and cli_pro_inte=?cod')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NO_CONFORMIDAD'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,TIRAR=?TIRAR '
      '  ,RECUPERAR=?RECUPERAR '
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
      '  ,SECCION=?SECCION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC ')
    DataSource = DSQMIsoClaPro
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RIC ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NO_CONFORMIDAD'
    UpdateTransaction = TLocal
    Left = 40
    Top = 168
    object xNINCCLI_PRO_INTE: TIntegerField
      DisplayLabel = 'CLi./Prov. INTE'
      FieldName = 'CLI_PRO_INTE'
    end
  end
  object DSxNINC: TDataSource
    DataSet = xNINC
    Left = 136
    Top = 168
  end
  object QMIsoClaPro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_VER_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_VER_PROVEEDOR'
      
        '  (EMPRESA,'#13#10'PROVEEDOR,ID_PROVEEDOR,CLAS_MANUAL,N_INC,VALOR_INC,' +
        'FACTOR_INC,OBSERVACIONES,ISO9000,FECHA_CERT_ISO,PRODUCTO,'#13#10'FECHA' +
        '_BAJA,FECHA,MOTIVO_BAJA,FECHA_VTO_ISO,BAJA,ISO_APROBADO,ISO_VERI' +
        'FICADO,ISO_VALIDADO,TERCERO,TITULO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROVEEDOR,?ID_PROVEEDOR,?CLAS_MANUAL,?N_INC,?VALO' +
        'R_INC,?FACTOR_INC,?OBSERVACIONES,?ISO9000,?FECHA_CERT_ISO,?PRODU' +
        'CTO,'#13#10'?FECHA_BAJA,?FECHA,?MOTIVO_BAJA,?FECHA_VTO_ISO,?BAJA,?ISO_' +
        'APROBADO,?ISO_VERIFICADO,?ISO_VALIDADO,?TERCERO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_VER_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_VER_PROVEEDOR'
      'WHERE'
      'EMPRESA = ?EMPRESA'
      'ORDER BY EMPRESA,PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_VER_PROVEEDOR'
      'SET'
      '  ID_PROVEEDOR=?ID_PROVEEDOR '
      '  ,CLAS_MANUAL=?CLAS_MANUAL '
      '  ,N_INC=?N_INC '
      '  ,VALOR_INC=?VALOR_INC '
      '  ,FACTOR_INC=?FACTOR_INC '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,ISO9000=?ISO9000 '
      '  ,FECHA_CERT_ISO=?FECHA_CERT_ISO '
      '  ,PRODUCTO=?PRODUCTO '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,FECHA=?FECHA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,FECHA_VTO_ISO=?FECHA_VTO_ISO '
      '  ,BAJA=?BAJA '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,TERCERO=?TERCERO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    AfterDelete = Graba
    AfterOpen = QMIsoClaProAfterOpen
    AfterPost = Graba
    BeforePost = QMIsoClaProBeforePost
    OnNewRecord = QMIsoClaProNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_VER_PROVEEDOR'
    UpdateTransaction = TLocal
    Left = 40
    Top = 24
    object QMIsoClaProEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIsoClaProPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMIsoClaProPROVEEDORChange
    end
    object QMIsoClaProCLAS_MANUAL: TFIBStringField
      DisplayLabel = 'Clas. Manual'
      FieldName = 'CLAS_MANUAL'
      OnChange = QMIsoClaProCLAS_MANUALChange
      Size = 3
    end
    object QMIsoClaProFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMIsoClaProN_INC: TIntegerField
      DisplayLabel = 'Nro. Inc'
      FieldName = 'N_INC'
    end
    object QMIsoClaProVALOR_INC: TIntegerField
      DisplayLabel = 'Valor Inc.'
      FieldName = 'VALOR_INC'
    end
    object QMIsoClaProFACTOR_INC: TFloatField
      DisplayLabel = 'Factor Inc.'
      FieldName = 'FACTOR_INC'
    end
    object QMIsoClaProOBSERVACIONES: TBlobField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QMIsoClaProISO9000: TIntegerField
      DisplayLabel = 'ISO 9000'
      FieldName = 'ISO9000'
    end
    object QMIsoClaProFECHA_CERT_ISO: TDateTimeField
      DisplayLabel = 'Fecha Certif. ISO'
      FieldName = 'FECHA_CERT_ISO'
    end
    object QMIsoClaProPRODUCTO: TFIBStringField
      DisplayLabel = 'Producto'
      FieldName = 'PRODUCTO'
      Size = 60
    end
    object QMIsoClaProFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMIsoClaProMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object QMIsoClaProFECHA_VTO_ISO: TDateTimeField
      DisplayLabel = 'Fecha Vto. ISO'
      FieldName = 'FECHA_VTO_ISO'
    end
    object QMIsoClaProBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMIsoClaProISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprobado'
      FieldName = 'ISO_APROBADO'
    end
    object QMIsoClaProISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verificado'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMIsoClaProISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validad'
      FieldName = 'ISO_VALIDADO'
    end
    object QMIsoClaProTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMIsoClaProTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMIsoClaProID_PROVEEDOR: TIntegerField
      DisplayLabel = 'Id Prov.'
      FieldName = 'ID_PROVEEDOR'
    end
  end
  object QMDetIsoClaPro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CLAS_DET_PROV'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CLAS_DET_PROV'
      
        '  (EMPRESA,'#13#10'PROVEEDOR,LINEA,NUM_PEDIDO,NUM_DIAS_RETRASO,EJERCIC' +
        'IO,NUM_INC,NUM_RECHAZO,FACTOR,DECISIONES,RESPONSABLE,'#13#10'NOTAS,TER' +
        'CERO,IPR_INDICE,FECHA,VAL_CALIDAD_SUMINISTROS,VAL_CALIDAD_PRODUC' +
        'TO,VAL_SERVICIO_ENTREGA,VAL_PRECIO,VAL_VARIOS,COSTE_ACCIONES,'#13#10'F' +
        'ECHA_FIN,TOTAL_COMPRAS_FAC,VAL_MANUAL,VAL_INC_PED,VAL_COSTE,VAL_' +
        'ENTREGAS,ID_PROVEEDOR)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROVEEDOR,?LINEA,?NUM_PEDIDO,?NUM_DIAS_RETRASO,?E' +
        'JERCICIO,?NUM_INC,?NUM_RECHAZO,?FACTOR,?DECISIONES,?RESPONSABLE,' +
        #13#10'?NOTAS,?TERCERO,?IPR_INDICE,?FECHA,?VAL_CALIDAD_SUMINISTROS,?V' +
        'AL_CALIDAD_PRODUCTO,?VAL_SERVICIO_ENTREGA,?VAL_PRECIO,?VAL_VARIO' +
        'S,?COSTE_ACCIONES,'#13#10'?FECHA_FIN,?TOTAL_COMPRAS_FAC,?VAL_MANUAL,?V' +
        'AL_INC_PED,?VAL_COSTE,?VAL_ENTREGAS,?ID_PROVEEDOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CLAS_DET_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CLAS_DET_PROV'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'PROVEEDOR=?PROVEEDOR'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CLAS_DET_PROV'
      'SET'
      '  NUM_PEDIDO=?NUM_PEDIDO '
      '  ,NUM_DIAS_RETRASO=?NUM_DIAS_RETRASO '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,NUM_INC=?NUM_INC '
      '  ,NUM_RECHAZO=?NUM_RECHAZO '
      '  ,FACTOR=?FACTOR '
      '  ,DECISIONES=?DECISIONES '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,NOTAS=?NOTAS '
      '  ,TERCERO=?TERCERO '
      '  ,IPR_INDICE=?IPR_INDICE '
      '  ,FECHA=?FECHA '
      '  ,VAL_CALIDAD_SUMINISTROS=?VAL_CALIDAD_SUMINISTROS '
      '  ,VAL_CALIDAD_PRODUCTO=?VAL_CALIDAD_PRODUCTO '
      '  ,VAL_SERVICIO_ENTREGA=?VAL_SERVICIO_ENTREGA '
      '  ,VAL_PRECIO=?VAL_PRECIO '
      '  ,VAL_VARIOS=?VAL_VARIOS '
      '  ,COSTE_ACCIONES=?COSTE_ACCIONES '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,TOTAL_COMPRAS_FAC=?TOTAL_COMPRAS_FAC '
      '  ,VAL_MANUAL=?VAL_MANUAL '
      '  ,VAL_INC_PED=?VAL_INC_PED '
      '  ,VAL_COSTE=?VAL_COSTE '
      '  ,VAL_ENTREGAS=?VAL_ENTREGAS '
      '  ,ID_PROVEEDOR=?ID_PROVEEDOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMIsoClaPro
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMDetIsoClaProBeforePost
    OnNewRecord = QMDetIsoClaProNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROVEEDOR '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CLAS_DET_PROV'
    UpdateTransaction = TLocal
    Left = 40
    Top = 72
    object QMDetIsoClaProEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetIsoClaProPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMDetIsoClaProPROVEEDORChange
    end
    object QMDetIsoClaProLINEA: TIntegerField
      DisplayLabel = 'L'#237'nia'
      FieldName = 'LINEA'
    end
    object QMDetIsoClaProNUM_PEDIDO: TIntegerField
      DisplayLabel = 'N'#250'm. Pedido'
      FieldName = 'NUM_PEDIDO'
    end
    object QMDetIsoClaProNUM_DIAS_RETRASO: TIntegerField
      DisplayLabel = 'N'#250'm. D'#237'as Retraso'
      FieldName = 'NUM_DIAS_RETRASO'
    end
    object QMDetIsoClaProEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
      OnChange = QMDetIsoClaProEJERCICIOChange
    end
    object QMDetIsoClaProNUM_INC: TIntegerField
      DisplayLabel = 'N'#250'm. Inc.'
      FieldName = 'NUM_INC'
    end
    object QMDetIsoClaProNUM_RECHAZO: TIntegerField
      DisplayLabel = 'N'#250'm. Rechazo'
      FieldName = 'NUM_RECHAZO'
    end
    object QMDetIsoClaProFACTOR: TIntegerField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
    end
    object QMDetIsoClaProDECISIONES: TFIBStringField
      DisplayLabel = 'Decisiones'
      FieldName = 'DECISIONES'
      Size = 60
    end
    object QMDetIsoClaProRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMDetIsoClaProDesc_Ope: TStringField
      DisplayLabel = 'Desc. Ope.'
      FieldKind = fkCalculated
      FieldName = 'Desc_Ope'
      OnGetText = QMDetIsoClaProDesc_OpeGetText
      Size = 60
      Calculated = True
    end
    object QMDetIsoClaProNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetIsoClaProFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetIsoClaProVAL_CALIDAD_SUMINISTROS: TFloatField
      DisplayLabel = 'Val. Calidad Suministro'
      FieldName = 'VAL_CALIDAD_SUMINISTROS'
    end
    object QMDetIsoClaProVAL_CALIDAD_PRODUCTO: TFloatField
      DisplayLabel = 'Val. Calidad Producto'
      FieldName = 'VAL_CALIDAD_PRODUCTO'
    end
    object QMDetIsoClaProVAL_SERVICIO_ENTREGA: TFloatField
      DisplayLabel = 'Val. Servicio Entrega'
      FieldName = 'VAL_SERVICIO_ENTREGA'
    end
    object QMDetIsoClaProVAL_PRECIO: TFloatField
      DisplayLabel = 'Val. Precio'
      FieldName = 'VAL_PRECIO'
    end
    object QMDetIsoClaProVAL_VARIOS: TFloatField
      DisplayLabel = 'Val. Varios'
      FieldName = 'VAL_VARIOS'
    end
    object QMDetIsoClaProCOSTE_ACCIONES: TFloatField
      DisplayLabel = 'Coste Acciones'
      FieldName = 'COSTE_ACCIONES'
    end
    object QMDetIsoClaProFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMDetIsoClaProIPR_INDICE: TFIBStringField
      DisplayLabel = 'IPR '#237'ndice'
      FieldName = 'IPR_INDICE'
    end
    object QMDetIsoClaProTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMDetIsoClaProTOTAL_COMPRAS_FAC: TFloatField
      DisplayLabel = 'Total Compras Fac.'
      FieldName = 'TOTAL_COMPRAS_FAC'
    end
    object QMDetIsoClaProVAL_MANUAL: TFloatField
      DisplayLabel = 'Val. Manual'
      FieldName = 'VAL_MANUAL'
    end
    object QMDetIsoClaProVAL_INC_PED: TFloatField
      DisplayLabel = 'Val. Inc. Ped.'
      FieldName = 'VAL_INC_PED'
    end
    object QMDetIsoClaProVAL_COSTE: TFloatField
      DisplayLabel = 'Val. Coste'
      FieldName = 'VAL_COSTE'
    end
    object QMDetIsoClaProVAL_ENTREGAS: TFloatField
      DisplayLabel = 'Val. Entregas'
      FieldName = 'VAL_ENTREGAS'
    end
    object QMDetIsoClaProID_PROVEEDOR: TIntegerField
      DisplayLabel = 'Id Prov.'
      FieldName = 'ID_PROVEEDOR'
    end
  end
  object DSQMDetIsoClaPro: TDataSource
    DataSet = QMDetIsoClaPro
    Left = 136
    Top = 72
  end
  object SPDadesDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure iso_clasificacion_prov(?empresa,?ejercicio,?ca' +
        'nal,?serie,?tercero,?fecha_ini,?fecha_fin,?linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 112
  end
  object SPDadesDetAct: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure iso_clasificacion_prov_act(?empresa,?ejercicio' +
        ',?canal,?serie,?tercero)')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 160
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select tercero from emp_proveedores'
      'where empresa=?empresa and proveedor=?proveedor')
    UniDirectional = False
    DataSource = DSQMDetIsoClaPro
    Left = 40
    Top = 216
    object xTerceroTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 136
    Top = 216
  end
  object frLstClaprov: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Clasificaci'#243'n Proveedores'
    RebuildPrinter = False
    OnGetValue = frLstClaprovGetValue
    OnBeforePrint = frLstClaprovEnterRect
    OnEnterRect = frLstClaprovEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 512
    Top = 16
    ReportForm = {19000000}
  end
  object xLstCabClaProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT cla.*, ver.titulo FROM ISO_CLAS_PROV cla'
      'join VER_PROVEEDORES_EMPRESA ver on (ver.empresa=cla.empresa and'
      '  ver.proveedor=cla.proveedor)'
      'where cla.empresa=?empresa and cla.proveedor=?proveedor')
    UniDirectional = False
    AfterOpen = xLstCabClaProvAfterOpen
    Left = 40
    Top = 312
    object xLstCabClaProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstCabClaProvPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xLstCabClaProvCLAS_MANUAL: TFIBStringField
      DisplayLabel = 'Clas. Manual'
      FieldName = 'CLAS_MANUAL'
      Size = 3
    end
    object xLstCabClaProvFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xLstCabClaProvN_INC: TIntegerField
      DisplayLabel = 'Nro. Inc.'
      FieldName = 'N_INC'
    end
    object xLstCabClaProvVALOR_INC: TIntegerField
      DisplayLabel = 'Valor Inc.'
      FieldName = 'VALOR_INC'
    end
    object xLstCabClaProvFACTOR_INC: TFloatField
      DisplayLabel = 'Factor Inc.'
      FieldName = 'FACTOR_INC'
    end
    object xLstCabClaProvOBSERVACIONES: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object xLstCabClaProvISO9000: TIntegerField
      DisplayLabel = 'ISO 9000'
      FieldName = 'ISO9000'
    end
    object xLstCabClaProvFECHA_CERT_ISO: TDateTimeField
      DisplayLabel = 'Fec. Cert. ISO'
      FieldName = 'FECHA_CERT_ISO'
    end
    object xLstCabClaProvPRODUCTO: TFIBStringField
      DisplayLabel = 'Producto'
      FieldName = 'PRODUCTO'
      Size = 60
    end
    object xLstCabClaProvBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object xLstCabClaProvFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object xLstCabClaProvMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object xLstCabClaProvFECHA_VTO_ISO: TDateTimeField
      DisplayLabel = 'Fec. Vto. ISO'
      FieldName = 'FECHA_VTO_ISO'
    end
    object xLstCabClaProvISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object xLstCabClaProvISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object xLstCabClaProvISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object xLstCabClaProvTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xLstCabClaProvTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xLstDetClaProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CLAS_DET_PROV'
      'where empresa=?empresa and proveedor=?proveedor')
    UniDirectional = False
    DataSource = DSxLstCabClaProv
    Left = 40
    Top = 360
  end
  object frDBxLstCab: TfrDBDataSet
    DataSource = DSxLstCabClaProv
    Left = 232
    Top = 312
  end
  object frDBxLstDet: TfrDBDataSet
    DataSource = DSxLstDetClaProv
    Left = 232
    Top = 360
  end
  object DSxLstCabClaProv: TDataSource
    DataSet = xLstCabClaProv
    Left = 136
    Top = 312
  end
  object DSxLstDetClaProv: TDataSource
    DataSet = xLstDetClaProv
    Left = 136
    Top = 360
  end
  object xPrimerResponsable: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select first(1) empleado from VER_EMPLEADOS_EF'
      'where empresa=:empresa and ACTIVO=1')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 256
  end
  object xConfigIso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from iso_configuracion')
    UniDirectional = False
    Left = 40
    Top = 264
    object xConfigIsoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xConfigIsoVALORACION_MANUAL: TIntegerField
      DisplayLabel = 'Valoracion Manual'
      FieldName = 'VALORACION_MANUAL'
    end
    object xConfigIsoVALORACION_INC_PED: TIntegerField
      DisplayLabel = 'Valoracion Inc. Ped.'
      FieldName = 'VALORACION_INC_PED'
    end
    object xConfigIsoVALORACION_COSTE: TIntegerField
      DisplayLabel = 'Valoracion Coste'
      FieldName = 'VALORACION_COSTE'
    end
    object xConfigIsoVALORACION_ENTREGAS: TIntegerField
      DisplayLabel = 'Valoracion Entregas'
      FieldName = 'VALORACION_ENTREGAS'
    end
    object xConfigIsoVALOR_INC_PED_A: TIntegerField
      DisplayLabel = 'Valor Inc. Ped. A'
      FieldName = 'VALOR_INC_PED_A'
    end
    object xConfigIsoVALOR_INC_PED_B: TIntegerField
      DisplayLabel = 'Valor Inc. Ped. B'
      FieldName = 'VALOR_INC_PED_B'
    end
    object xConfigIsoVALOR_INC_PED_C: TIntegerField
      DisplayLabel = 'Valor Inc. Ped. C'
      FieldName = 'VALOR_INC_PED_C'
    end
    object xConfigIsoVALOR_COSTE_A: TIntegerField
      DisplayLabel = 'Valor Coste A'
      FieldName = 'VALOR_COSTE_A'
    end
    object xConfigIsoVALOR_COSTE_B: TIntegerField
      DisplayLabel = 'Valor Coste B'
      FieldName = 'VALOR_COSTE_B'
    end
    object xConfigIsoVALOR_COSTE_C: TIntegerField
      DisplayLabel = 'Valor Coste C'
      FieldName = 'VALOR_COSTE_C'
    end
    object xConfigIsoVALOR_ENTREGAS_A: TIntegerField
      DisplayLabel = 'Valor Entregas A'
      FieldName = 'VALOR_ENTREGAS_A'
    end
    object xConfigIsoVALOR_ENTREGAS_B: TIntegerField
      DisplayLabel = 'Valor Entregas B'
      FieldName = 'VALOR_ENTREGAS_B'
    end
    object xConfigIsoVALOR_ENTREGAS_C: TIntegerField
      DisplayLabel = 'Valor Entregas C'
      FieldName = 'VALOR_ENTREGAS_C'
    end
    object xConfigIsoVALOR_MANUAL_A: TIntegerField
      DisplayLabel = 'Valor Manual A'
      FieldName = 'VALOR_MANUAL_A'
    end
    object xConfigIsoVALOR_MANUAL_B: TIntegerField
      DisplayLabel = 'Valor Manual B'
      FieldName = 'VALOR_MANUAL_B'
    end
    object xConfigIsoVALOR_MANUAL_C: TIntegerField
      DisplayLabel = 'Valor Manual C'
      FieldName = 'VALOR_MANUAL_C'
    end
  end
  object DSxConfigIso: TDataSource
    DataSet = xConfigIso
    Left = 136
    Top = 264
  end
  object SPCalcIndice: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure iso_calc_cla_prov (:empresa,:proveedor,:linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 208
  end
  object xLstCabClaTodos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT cla.*, ver.titulo FROM ISO_CLAS_PROV cla'
      'join VER_PROVEEDORES_EMPRESA ver on (ver.empresa=cla.empresa and'
      '  ver.proveedor=cla.proveedor)'
      'where cla.empresa=?empresa ')
    UniDirectional = False
    AfterOpen = xLstCabClaProvAfterOpen
    Left = 40
    Top = 408
    object IntegerField1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Clas. Manual'
      FieldName = 'CLAS_MANUAL'
      Size = 3
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Nro. Inc.'
      FieldName = 'N_INC'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Valor Inc.'
      FieldName = 'VALOR_INC'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Factor Inc.'
      FieldName = 'FACTOR_INC'
    end
    object BlobField1: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'ISO 9000'
      FieldName = 'ISO9000'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Fec. Cert. ISO'
      FieldName = 'FECHA_CERT_ISO'
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Producto'
      FieldName = 'PRODUCTO'
      Size = 60
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'FECHA_BAJA'
    end
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Fec. Vto. ISO'
      FieldName = 'FECHA_VTO_ISO'
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object FIBStringField4: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxLastCabClaTodos: TDataSource
    DataSet = xLstCabClaTodos
    Left = 136
    Top = 408
  end
  object xLstDetClaTodos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CLAS_DET_PROV'
      
        'where empresa=?empresa and ejercicio=?ejercicio and proveedor=?p' +
        'roveedor')
    UniDirectional = False
    DataSource = DSxLastCabClaTodos
    Left = 40
    Top = 456
  end
  object DSxLstDetClaTodos: TDataSource
    DataSet = xLstDetClaTodos
    Left = 136
    Top = 456
  end
  object frDBxLstClaTodos: TfrDBDataSet
    DataSource = DSxLastCabClaTodos
    Left = 328
    Top = 312
  end
  object frDBxLstDetClaTodos: TfrDBDataSet
    DataSource = DSxLstDetClaTodos
    Left = 328
    Top = 360
  end
  object frLstClaTodos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Clasificaci'#243'n Proveedores'
    RebuildPrinter = False
    OnGetValue = frLstClaTodosGetValue
    OnBeforePrint = frLstClaTodosEnterRect
    OnEnterRect = frLstClaTodosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 584
    Top = 16
    ReportForm = {19000000}
  end
end
