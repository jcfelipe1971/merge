object ProDMPauta: TProDMPauta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 317
  Top = 87
  Height = 592
  Width = 638
  object DSCabPauta: TDataSource
    DataSet = QMCabPauta
    Left = 144
    Top = 8
  end
  object QMDetPauta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_DET_PAUTA'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  PAUTA=?old_PAUTA AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_DET_PAUTA'
      
        '  (EMPRESA,PAUTA,LINEA,ORDEN,DESCRIPCION_CONTROL,COTA,INSTRUCCIO' +
        'N_CONTROL,FRECUENCIA,TIPOCONTROL,FRECUENCIA2,FRECUENCIA3,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?PAUTA,?LINEA,?ORDEN,?DESCRIPCION_CONTROL,?COTA,?INS' +
        'TRUCCION_CONTROL,?FRECUENCIA,?TIPOCONTROL,?FRECUENCIA2,?FRECUENC' +
        'IA3,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_DET_PAUTA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  PAUTA=?PAUTA AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_DET_PAUTA'
      'where empresa=?empresa and pauta=?pauta')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_DET_PAUTA'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,DESCRIPCION_CONTROL=?DESCRIPCION_CONTROL '
      '  ,COTA=?COTA '
      '  ,INSTRUCCION_CONTROL=?INSTRUCCION_CONTROL '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,TIPOCONTROL=?TIPOCONTROL '
      '  ,FRECUENCIA2=?FRECUENCIA2'
      '  ,FRECUENCIA3=?FRECUENCIA3'
      '  ,NOTAS =?NOTAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  PAUTA=?PAUTA AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSCabPauta
    AfterPost = QMDetPautaAfterPost
    OnNewRecord = QMDetPautaNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'PAUTA '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_DET_PAUTA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMDetPautaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetPautaPAUTA: TIntegerField
      DisplayLabel = 'Pauta'
      FieldName = 'PAUTA'
    end
    object QMDetPautaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetPautaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetPautaCOTA: TFIBStringField
      DisplayLabel = 'Cota'
      FieldName = 'COTA'
      Size = 25
    end
    object QMDetPautaINSTRUCCION_CONTROL: TFIBStringField
      DisplayLabel = 'Instruccion Control'
      FieldName = 'INSTRUCCION_CONTROL'
      Size = 100
    end
    object QMDetPautaFRECUENCIA: TFIBStringField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
      Size = 40
    end
    object QMDetPautaTIPOCONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPOCONTROL'
      OnChange = QMDetPautaTIPOCONTROLChange
    end
    object QMDetPautaDESCRIPCION_CONTROL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_CONTROL'
      Size = 40
    end
    object QMDetPautaDescTipoControl: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTipoControl'
      OnGetText = QMDetPautaDescTipoControlGetText
      Size = 100
      Calculated = True
    end
    object QMDetPautaFRECUENCIA2: TFIBStringField
      DisplayLabel = 'Frecuencia 2'
      FieldName = 'FRECUENCIA2'
      Size = 40
    end
    object QMDetPautaFRECUENCIA3: TFIBStringField
      DisplayLabel = 'Frecuencia 3'
      FieldName = 'FRECUENCIA3'
      Size = 40
    end
    object QMDetPautaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSDetPauta: TDataSource
    DataSet = QMDetPauta
    Left = 144
    Top = 56
  end
  object QMCabPauta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PAUTA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PAUTA=?old_PAUTA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PAUTA'
      
        '  (EMPRESA,PAUTA,FECHA_CREACION,RESPONSABLE,COMPUESTO,TITULO,CLI' +
        'ENTE,NOMBRE_R_SOCIAL,MATERIAL,CROQUIS,COMENTARIO,NOTAS,FASE,ESCA' +
        'NDALLO,PLANO,PROYECTO,MAQUINA,LINEA_FASE,NUM_UTIL,UBICACION,OPER' +
        'ACION,INDICE,DENOMINACION)'
      'VALUES'
      
        '  (?EMPRESA,?PAUTA,?FECHA_CREACION,?RESPONSABLE,?COMPUESTO,?TITU' +
        'LO,?CLIENTE,?NOMBRE_R_SOCIAL,?MATERIAL,?CROQUIS,?COMENTARIO,?NOT' +
        'AS,?FASE,?ESCANDALLO,?PLANO,?PROYECTO,?MAQUINA,?LINEA_FASE,?NUM_' +
        'UTIL,?UBICACION,?OPERACION,?INDICE,?DENOMINACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PAUTA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PAUTA=?PAUTA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PAUTA'
      'WHERE'
      '  EMPRESA=?EMPRESA'
      'ORDER BY PAUTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PAUTA'
      'SET'
      '  FECHA_CREACION=?FECHA_CREACION '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,TITULO=?TITULO '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,MATERIAL=?MATERIAL '
      '  ,CROQUIS=?CROQUIS '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,NOTAS=?NOTAS '
      '  ,FASE=?FASE '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,PLANO=?PLANO '
      '  ,PROYECTO=?PROYECTO '
      '  ,MAQUINA=?MAQUINA '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,NUM_UTIL=?NUM_UTIL '
      '  ,UBICACION=?UBICACION '
      '  ,OPERACION=?OPERACION '
      '  ,INDICE=?INDICE '
      '  ,DENOMINACION=?DENOMINACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PAUTA=?PAUTA ')
    AfterOpen = QMCabPautaAfterOpen
    AfterPost = QMCabPautaAfterPost
    BeforeClose = QMCabPautaBeforeClose
    BeforePost = QMCabPautaBeforePost
    OnNewRecord = QMCabPautaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PAUTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PAUTA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMCabPautaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabPautaPAUTA: TIntegerField
      DisplayLabel = 'Pauta'
      FieldName = 'PAUTA'
    end
    object QMCabPautaFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMCabPautaRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCabPautaCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMCabPautaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabPautaMATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
      Size = 100
    end
    object QMCabPautaCROQUIS: TIntegerField
      DisplayLabel = 'Croquis'
      FieldName = 'CROQUIS'
    end
    object QMCabPautaNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabPautaFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
    object QMCabPautaESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMCabPautaPLANO: TFIBStringField
      DisplayLabel = 'Plano'
      FieldName = 'PLANO'
      Size = 60
    end
    object QMCabPautaPROYECTO: TFIBStringField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      Size = 100
    end
    object QMCabPautaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMCabPautaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
      OnChange = QMCabPautaLINEA_FASEChange
    end
    object QMCabPautaNUM_UTIL: TFIBStringField
      DisplayLabel = 'Nro. Util'
      FieldName = 'NUM_UTIL'
      Size = 60
    end
    object QMCabPautaUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 60
    end
    object QMCabPautaOPERACION: TFIBStringField
      DisplayLabel = 'Operacion'
      FieldName = 'OPERACION'
      Size = 60
    end
    object QMCabPautaDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION'
      Size = 60
    end
    object QMCabPautaINDICE: TFIBStringField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
      Size = 35
    end
    object QMCabPautaCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 200
    end
    object QMCabPautaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCabPautaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object xTituloTControl: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Descripcion'
      'From Pro_Sys_TipoControl_Pauta'
      'Where (TipoControl=?TipoControl)')
    UniDirectional = False
    DataSource = DSDetPauta
    Left = 248
    Top = 296
    object xTituloTControlDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object QMTControl: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'WHERE'
      '  TIPOCONTROL=?old_TIPOCONTROL ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPOCONTROL_PAUTA'
      '  (NOTAS,TIPOCONTROL,DESCRIPCION)'
      'VALUES'
      '  (?NOTAS,?TIPOCONTROL,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'WHERE'
      '  TIPOCONTROL=?TIPOCONTROL ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'ORDER BY TIPOCONTROL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPOCONTROL_PAUTA'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPOCONTROL=?TIPOCONTROL ')
    ClavesPrimarias.Strings = (
      'TIPOCONTROL ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPOCONTROL_PAUTA'
    UpdateTransaction = TLocal
    Left = 48
    Top = 104
    object QMTControlTIPOCONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPOCONTROL'
    end
    object QMTControlDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMTControlNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSTControl: TDataSource
    DataSet = QMTControl
    Left = 144
    Top = 104
  end
  object frLstPauta: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLstPautaGetValue
    OnBeforePrint = frLstPautaEnterRect
    OnEnterRect = frLstPautaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 528
    Top = 8
    ReportForm = {19000000}
  end
  object frDBLstCabPauta: TfrDBDataSet
    DataSource = DSxLstCabPauta
    Left = 464
    Top = 8
  end
  object xLstCabpauta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT cab.*, ter.nombre_r_social as desc_empleado, art.titulo a' +
        's desc_articulo, tercli.nombre_r_social as desc_cliente,fase.tit' +
        'ulo as desc_fase,esc.descripcion as desc_esc,esc.medida_1 as med' +
        'ida1'
      'FROM PRO_SYS_CAB_PAUTA cab'
      
        'join ope_empleado ope on (cab.empresa=ope.empresa and cab.respon' +
        'sable=ope.empleado)'
      'join sys_terceros ter on (ope.tercero=ter.tercero)'
      
        'join art_articulos art on (cab.empresa=art.empresa and cab.compu' +
        'esto=art.articulo)'
      
        'join emp_clientes cli on (cab.empresa=cli.empresa and cab.client' +
        'e=cli.cliente)'
      'join sys_terceros tercli on (cli.tercero=tercli.tercero)'
      'join pro_sys_fases fase on (cab.fase=fase.fase)'
      
        'join pro_escandallo esc on (cab.empresa = esc.empresa and cab.es' +
        'candallo=esc.escandallo and esc.tipo='#39'EPR'#39') '
      ''
      ''
      ''
      ''
      'where empresa=?empresa and pauta=?pauta')
    UniDirectional = False
    AfterOpen = xLstCabpautaAfterOpen
    Left = 248
    Top = 8
    object xLstCabpautaPAUTA: TIntegerField
      DisplayLabel = 'Pauta'
      FieldName = 'PAUTA'
    end
    object xLstCabpautaCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 60
    end
    object xLstCabpautaFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object xLstCabpautaRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xLstCabpautaCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xLstCabpautaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xLstCabpautaMATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
      Size = 100
    end
    object xLstCabpautaCROQUIS: TIntegerField
      DisplayLabel = 'Croquis'
      FieldName = 'CROQUIS'
    end
    object xLstCabpautaNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xLstCabpautaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstCabpautaFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
    object xLstCabpautaDESC_EMPLEADO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_EMPLEADO'
      Size = 60
    end
    object xLstCabpautaDESC_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_ARTICULO'
      Size = 60
    end
    object xLstCabpautaDESC_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CLIENTE'
      Size = 60
    end
    object xLstCabpautaDESC_FASE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_FASE'
      Size = 40
    end
    object xLstCabpautaESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xLstCabpautaPLANO: TFIBStringField
      DisplayLabel = 'Plano'
      FieldName = 'PLANO'
      Size = 60
    end
    object xLstCabpautaPROYECTO: TFIBStringField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      Size = 100
    end
    object xLstCabpautaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xLstCabpautaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xLstCabpautaNUM_UTIL: TFIBStringField
      DisplayLabel = 'Nro. Util'
      FieldName = 'NUM_UTIL'
      Size = 60
    end
    object xLstCabpautaUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 60
    end
    object xLstCabpautaOPERACION: TFIBStringField
      DisplayLabel = 'Operacion'
      FieldName = 'OPERACION'
      Size = 60
    end
    object xLstCabpautaINDICE: TFIBStringField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
      Size = 35
    end
    object xLstCabpautaDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION'
      Size = 60
    end
    object xLstCabpautaDESC_ESC: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_ESC'
      Size = 100
    end
    object xLstCabpautaMEDIDA1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA1'
    end
  end
  object xLstDetPauta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select det.linea,det.orden,det.descripcion_control,det.cota,det.' +
        'instruccion_control,det.frecuencia,'
      
        'det.tipocontrol,control.descripcion,det.frecuencia2,det.frecuenc' +
        'ia3,det.pauta,'
      'det.empresa,det.notas'
      'from pro_sys_det_pauta det'
      
        'join pro_sys_tipocontrol_pauta control on (det.tipocontrol=contr' +
        'ol.tipocontrol)'
      'where empresa=?empresa and pauta=?pauta'
      'order by empresa,pauta,tipocontrol,orden'
      ''
      
        '/*select det.empresa,det.pauta,det.linea,det.orden,det.descripci' +
        'on_control,det.cota,det.instruccion_control,det.frecuencia,'
      
        'det.tipocontrol,control.descripcion,det.frecuencia2,det.frecuenc' +
        'ia3,dib.id_imagen'
      'from pro_sys_det_pauta det'
      
        'left join pro_sys_tipocontrol_pauta control on (det.tipocontrol=' +
        'control.tipocontrol)'
      'left join pro_sys_dib_pauta dib on '
      
        '      (det.empresa=dib.empresa and det.pauta=dib.pauta and det.t' +
        'ipocontrol=dib.tcontrol)'
      'where empresa=?empresa and pauta=?pauta'
      'order by det.empresa,det.pauta,det.tipocontrol*/')
    UniDirectional = False
    DataSource = DSxLstCabPauta
    AfterOpen = xLstDetPautaAfterOpen
    Left = 248
    Top = 104
    object xLstDetPautaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstDetPautaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xLstDetPautaDESCRIPCION_CONTROL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_CONTROL'
      Size = 40
    end
    object xLstDetPautaCOTA: TFIBStringField
      DisplayLabel = 'Cota'
      FieldName = 'COTA'
      Size = 25
    end
    object xLstDetPautaINSTRUCCION_CONTROL: TFIBStringField
      DisplayLabel = 'Instruccion Control'
      FieldName = 'INSTRUCCION_CONTROL'
      Size = 100
    end
    object xLstDetPautaFRECUENCIA: TFIBStringField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
      Size = 40
    end
    object xLstDetPautaTIPOCONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPOCONTROL'
    end
    object xLstDetPautaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xLstDetPautaFRECUENCIA2: TFIBStringField
      DisplayLabel = 'Frecuencia 2'
      FieldName = 'FRECUENCIA2'
      Size = 40
    end
    object xLstDetPautaFRECUENCIA3: TFIBStringField
      DisplayLabel = 'Frecuencia 3'
      FieldName = 'FRECUENCIA3'
      Size = 40
    end
    object xLstDetPautaPAUTA: TIntegerField
      DisplayLabel = 'Pauta'
      FieldName = 'PAUTA'
    end
    object xLstDetPautaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstDetPautaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxLstCabPauta: TDataSource
    DataSet = xLstCabpauta
    Left = 360
    Top = 8
  end
  object DSxLstDetPauta: TDataSource
    DataSet = xLstDetPauta
    Left = 360
    Top = 104
  end
  object frDBLstDetPauta: TfrDBDataSet
    DataSource = DSxLstDetPauta
    Left = 464
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 584
    Top = 8
  end
  object xTituloFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select fase,tipofase from pro_fases_esc'
      'where empresa=?empresa and escandallo=?escandallo '
      'and linea_fase=?linea_fase')
    UniDirectional = False
    DataSource = DSCabPauta
    Left = 48
    Top = 200
    object xTituloFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xTituloFaseTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
  end
  object DSxTituloFase: TDataSource
    DataSet = xTituloFase
    Left = 144
    Top = 200
  end
  object QMDibPauta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_DIB_PAUTA'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  PAUTA=?old_PAUTA AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_DIB_PAUTA'
      '  (EMPRESA,PAUTA,LINEA,ID_IMAGEN,TCONTROL,PRINCIPAL,ORDEN)'
      'VALUES'
      
        '  (?EMPRESA,?PAUTA,?LINEA,?ID_IMAGEN,?TCONTROL,?PRINCIPAL,?ORDEN' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_DIB_PAUTA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  PAUTA=?PAUTA AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_DIB_PAUTA'
      'where empresa=?empresa and pauta=?pauta')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_DIB_PAUTA'
      'SET'
      '  ID_IMAGEN=?ID_IMAGEN'
      ' ,TCONTROL=?TCONTROL'
      ' ,PRINCIPAL=?PRINCIPAL'
      ' ,ORDEN=?ORDEN'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  PAUTA=?PAUTA AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSCabPauta
    AfterPost = Graba
    AfterScroll = QMDibPautaAfterScroll
    OnNewRecord = QMDibPautaNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'PAUTA '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_DIB_PAUTA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 248
    object QMDibPautaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDibPautaPAUTA: TIntegerField
      DisplayLabel = 'Pauta'
      FieldName = 'PAUTA'
    end
    object QMDibPautaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDibPautaID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object QMDibPautaDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      OnGetText = QMDibPautaDescripcionGetText
      Size = 35
      Calculated = True
    end
    object QMDibPautaTCONTROL: TIntegerField
      DisplayLabel = 'Control'
      FieldName = 'TCONTROL'
      OnChange = QMDibPautaTCONTROLChange
    end
    object QMDibPautaDescTControl: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTControl'
      OnGetText = QMDibPautaDescTControlGetText
      Size = 100
      Calculated = True
    end
    object QMDibPautaPRINCIPAL: TIntegerField
      DisplayLabel = 'Principal'
      FieldName = 'PRINCIPAL'
    end
    object QMDibPautaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSDibPauta: TDataSource
    DataSet = QMDibPauta
    Left = 144
    Top = 248
  end
  object xDescTControl: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT descripcion FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'where tipocontrol=?tcontrol')
    SelectSQL.Strings = (
      'SELECT descripcion FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'where tipocontrol=?tcontrol')
    UniDirectional = False
    DataSource = DSDibPauta
    Left = 48
    Top = 296
    object xDescTControlDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxDescTControl: TDataSource
    DataSet = xDescTControl
    Left = 144
    Top = 296
  end
  object xLstImatgePauta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_imagen from pro_sys_dib_pauta'
      'where empresa=?empresa and pauta=?pauta and principal=1')
    UniDirectional = False
    DataSource = DSxLstCabPauta
    Left = 248
    Top = 56
    object xLstImatgePautaID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
  end
  object DSxLstImatgePauta: TDataSource
    DataSet = xLstCabpauta
    Left = 360
    Top = 56
  end
  object xLstDetImatges: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_imagen from pro_sys_dib_pauta'
      'where empresa=?empresa and pauta=?pauta and orden=2')
    UniDirectional = False
    DataSource = DSxLstCabPauta
    Left = 248
    Top = 152
    object xLstDetImatgesID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
  end
  object DSxLstDetImatges: TDataSource
    DataSet = xLstDetImatges
    Left = 360
    Top = 152
  end
  object frDBLstDetImatges: TfrDBDataSet
    DataSource = DSxLstDetImatges
    Left = 464
    Top = 152
  end
  object xLstDetImatgesOlber: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT PAU.ID_IMAGEN, CONTROL.DESCRIPCION, PAU.TCONTROL, PAU.ORD' +
        'EN'
      'FROM PRO_SYS_DIB_PAUTA PAU'
      
        'JOIN PRO_SYS_TIPOCONTROL_PAUTA CONTROL ON (PAU.TCONTROL = CONTRO' +
        'L.TIPOCONTROL)'
      'WHERE'
      'PAU.EMPRESA = :EMPRESA AND'
      'PAU.PAUTA = :PAUTA AND'
      'PAU.ORDEN <> 1 AND'
      'PAU.ORDEN <> 2'
      'ORDER BY PAU.EMPRESA, PAU.PAUTA, PAU.TCONTROL, PAU.ORDEN ')
    UniDirectional = False
    DataSource = DSxLstCabPauta
    AfterOpen = xLstDetPautaAfterOpen
    Left = 248
    Top = 200
    object xLstDetImatgesOlberID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object xLstDetImatgesOlberDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xLstDetImatgesOlberTCONTROL: TIntegerField
      DisplayLabel = 'Control'
      FieldName = 'TCONTROL'
    end
  end
  object DSxLstDetImatgesOlber: TDataSource
    DataSet = xLstDetImatgesOlber
    Left = 360
    Top = 200
  end
  object frDBDLstOlber: TfrDBDataSet
    DataSource = DSxLstDetImatgesOlber
    Left = 464
    Top = 200
  end
  object xLstImageCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) imagen as id_imagen from ver_articulos_cuentas'
      'where empresa=?empresa and articulo=?compuesto'
      '')
    UniDirectional = False
    DataSource = DSxLstCabPauta
    Left = 248
    Top = 248
    object xLstImageCompuestoID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
  end
  object DsxLstImageCompuesto: TDataSource
    DataSet = xLstCabpauta
    Left = 360
    Top = 248
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 584
    Top = 56
  end
end
