object ObrDMObras: TObrDMObras
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 360
  Top = 320
  Height = 554
  Width = 961
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 440
    Top = 8
  end
  object QMCabObras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_CAB_OBRAS'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_CAB_OBRAS'
      
        '  (EMPRESA,CODIGO,DESCRIPCION_OBRA,CLIENTE,DIRECCION,FECHA_INICI' +
        'O,FECHA_PREVISTA_CIERRE,FECHA_CIERRE,ESTADO,FECHA_ULTIMA_IMPUTAC' +
        'ION,CONTROL_ALMACEN,ALMACEN,CONTROL_PARTIDAS,NOTAS,IMAGEN,TERCER' +
        'O,TOTAL_OFERTA_PRES_PED,COSTE_PREV,MARGEN_PREV,TOTAL_FACTURADO,T' +
        'OTAL_PDTE_FACTURAR,TOTAL_COSTES_ALB,TOTAL_COSTES_FAB,TOTAL_COSTE' +
        'S_MAT,TOTAL_COSTES_HORAS,TOTAL_COSTES_TAREAS,TOTAL_COSTES_ALB_PR' +
        'OV,TOTAL_COSTES,MARGEN_BENEFICIO)'
      'VALUES'
      
        '  (?EMPRESA,?CODIGO,?DESCRIPCION_OBRA,?CLIENTE,?DIRECCION,?FECHA' +
        '_INICIO,?FECHA_PREVISTA_CIERRE,?FECHA_CIERRE,?ESTADO,?FECHA_ULTI' +
        'MA_IMPUTACION,?CONTROL_ALMACEN,?ALMACEN,?CONTROL_PARTIDAS,?NOTAS' +
        ',?IMAGEN,?TERCERO,?TOTAL_OFERTA_PRES_PED,?COSTE_PREV,?MARGEN_PRE' +
        'V,?TOTAL_FACTURADO,?TOTAL_PDTE_FACTURAR,?TOTAL_COSTES_ALB,?TOTAL' +
        '_COSTES_FAB,?TOTAL_COSTES_MAT,?TOTAL_COSTES_HORAS,?TOTAL_COSTES_' +
        'TAREAS,?TOTAL_COSTES_ALB_PROV,?TOTAL_COSTES,?MARGEN_BENEFICIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_CAB_OBRAS'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_CAB_OBRAS'
      'where empresa=?empresa'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_CAB_OBRAS'
      'SET'
      '  DESCRIPCION_OBRA=?DESCRIPCION_OBRA '
      '  ,CLIENTE=?CLIENTE '
      '  ,DIRECCION=?DIRECCION '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_PREVISTA_CIERRE=?FECHA_PREVISTA_CIERRE '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,ESTADO=?ESTADO '
      '  ,FECHA_ULTIMA_IMPUTACION=?FECHA_ULTIMA_IMPUTACION '
      '  ,CONTROL_ALMACEN=?CONTROL_ALMACEN '
      '  ,ALMACEN=?ALMACEN '
      '  ,CONTROL_PARTIDAS=?CONTROL_PARTIDAS '
      '  ,NOTAS=?NOTAS '
      '  ,IMAGEN=?IMAGEN '
      '  ,TERCERO=?TERCERO '
      '  ,TOTAL_OFERTA_PRES_PED=?TOTAL_OFERTA_PRES_PED '
      '  ,COSTE_PREV=?COSTE_PREV '
      '  ,MARGEN_PREV=?MARGEN_PREV '
      '  ,TOTAL_FACTURADO=?TOTAL_FACTURADO '
      '  ,TOTAL_PDTE_FACTURAR=?TOTAL_PDTE_FACTURAR '
      '  ,TOTAL_COSTES_ALB=?TOTAL_COSTES_ALB '
      '  ,TOTAL_COSTES_FAB=?TOTAL_COSTES_FAB '
      '  ,TOTAL_COSTES_MAT=?TOTAL_COSTES_MAT '
      '  ,TOTAL_COSTES_HORAS=?TOTAL_COSTES_HORAS '
      '  ,TOTAL_COSTES_TAREAS=?TOTAL_COSTES_TAREAS '
      '  ,TOTAL_COSTES_ALB_PROV=?TOTAL_COSTES_ALB_PROV '
      '  ,TOTAL_COSTES=?TOTAL_COSTES '
      '  ,MARGEN_BENEFICIO=?MARGEN_BENEFICIO '
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMCabObrasAfterOpen
    AfterPost = QMCabObrasAfterPost
    AfterScroll = QMCabObrasAfterScroll
    BeforeClose = QMCabObrasBeforeClose
    BeforePost = QMCabObrasBeforePost
    OnNewRecord = QMCabObrasNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_CAB_OBRAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMCabObrasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabObrasCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMCabObrasDESCRIPCION_OBRA: TFIBStringField
      DisplayLabel = 'Desc. Obra'
      FieldName = 'DESCRIPCION_OBRA'
      Size = 60
    end
    object QMCabObrasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCabObrasCLIENTEChange
    end
    object QMCabObrasDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabObrasFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMCabObrasFECHA_PREVISTA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Prev. Cierre'
      FieldName = 'FECHA_PREVISTA_CIERRE'
    end
    object QMCabObrasFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMCabObrasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabObrasFECHA_ULTIMA_IMPUTACION: TDateTimeField
      DisplayLabel = 'Fec. Ult. Imputacion'
      FieldName = 'FECHA_ULTIMA_IMPUTACION'
    end
    object QMCabObrasCONTROL_ALMACEN: TIntegerField
      DisplayLabel = 'Control Alm.'
      FieldName = 'CONTROL_ALMACEN'
    end
    object QMCabObrasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabObrasCONTROL_PARTIDAS: TIntegerField
      DisplayLabel = 'Control Partidas'
      FieldName = 'CONTROL_PARTIDAS'
    end
    object QMCabObrasNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabObrasIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMCabObrasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabObrasTOTAL_OFERTA_PRES_PED: TFloatField
      DisplayLabel = 'Total Ofer. Pres. Ped.'
      FieldName = 'TOTAL_OFERTA_PRES_PED'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasCOSTE_PREV: TFloatField
      DisplayLabel = 'Coste Prev.'
      FieldName = 'COSTE_PREV'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasMARGEN_PREV: TFloatField
      DisplayLabel = 'Margen Prev.'
      FieldName = 'MARGEN_PREV'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_FACTURADO: TFloatField
      DisplayLabel = 'Total Facturado'
      FieldName = 'TOTAL_FACTURADO'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_PDTE_FACTURAR: TFloatField
      DisplayLabel = 'Total Pend. Fact.'
      FieldName = 'TOTAL_PDTE_FACTURAR'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES_ALB: TFloatField
      DisplayLabel = 'Total Coste Alb.'
      FieldName = 'TOTAL_COSTES_ALB'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES_FAB: TFloatField
      DisplayLabel = 'Total Coste Fab.'
      FieldName = 'TOTAL_COSTES_FAB'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES_MAT: TFloatField
      DisplayLabel = 'Total Coste Mat.'
      FieldName = 'TOTAL_COSTES_MAT'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES_HORAS: TFloatField
      DisplayLabel = 'Total Coste Hora'
      FieldName = 'TOTAL_COSTES_HORAS'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES_TAREAS: TFloatField
      DisplayLabel = 'Total Coste Tarea'
      FieldName = 'TOTAL_COSTES_TAREAS'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES_ALB_PROV: TFloatField
      DisplayLabel = 'Total Coste Alb. Prov.'
      FieldName = 'TOTAL_COSTES_ALB_PROV'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasTOTAL_COSTES: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTES'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasMARGEN_BENEFICIO: TFloatField
      DisplayLabel = 'Margen Ben.'
      FieldName = 'MARGEN_BENEFICIO'
      DisplayFormat = ',##0.00'
    end
    object QMCabObrasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMCabObrasMARGEN_BENEFICIO_PREV_100: TFloatField
      DisplayLabel = 'Margen Ben. Prev.'
      FieldName = 'MARGEN_BENEFICIO_PREV_100'
      DisplayFormat = ',##0.00'
    end
  end
  object DSCabObras: TDataSource
    DataSet = QMCabObras
    Left = 136
    Top = 8
  end
  object DSDetObras: TDataSource
    DataSet = QMDetObras
    Left = 136
    Top = 56
  end
  object DSDetCostAlbCli: TDataSource
    DataSet = QMDetCostAlbCli
    Left = 136
    Top = 104
  end
  object DSDetCostProd: TDataSource
    DataSet = QMDetCostProd
    Left = 136
    Top = 152
  end
  object DSDetCostVar: TDataSource
    DataSet = QMDetCostVar
    Left = 136
    Top = 200
  end
  object DSDetIngr: TDataSource
    DataSet = QMDetIngr
    Left = 136
    Top = 248
  end
  object DSDetostAlbProv: TDataSource
    DataSet = QMDetCostAlbProv
    Left = 136
    Top = 296
  end
  object QMDetCostAlbCli: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DET_COSTES_ALB_CLIENTES'
      'WHERE'
      '  LINEA_DET=?old_LINEA_DET AND '
      '  LINEA=?old_LINEA AND '
      '  CODIGO=?old_CODIGO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DET_COSTES_ALB_CLIENTES'
      
        '  (EMPRESA,CODIGO,LINEA,LINEA_DET,SERIE,RIG,FECHA,IMPORTE_IMPUTA' +
        'DO,ID_S_ALB,CANAL_ALB,EJERCICIO_ALB)'
      'VALUES'
      
        '  (?EMPRESA,?CODIGO,?LINEA,?LINEA_DET,?SERIE,?RIG,?FECHA,?IMPORT' +
        'E_IMPUTADO,?ID_S_ALB,?CANAL_ALB,?EJERCICIO_ALB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DET_COSTES_ALB_CLIENTES'
      'WHERE'
      '  LINEA_DET=?LINEA_DET AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DET_COSTES_ALB_CLIENTES'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DET_COSTES_ALB_CLIENTES'
      'SET'
      '   SERIE=?SERIE '
      '  ,RIG=?RIG '
      '  ,FECHA=?FECHA '
      '  ,IMPORTE_IMPUTADO=?IMPORTE_IMPUTADO '
      '  ,ID_S_ALB=?ID_S_ALB'
      ' ,CANAL_ALB=?CANAL_ALB'
      ' ,EJERCICIO_ALB=?EJERCICIO_ALB'
      'WHERE'
      '  LINEA_DET=?LINEA_DET AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSDetObras
    OnNewRecord = QMDetCostAlbCliNewRecord
    ClavesPrimarias.Strings = (
      'LINEA_DET '
      'LINEA '
      'CODIGO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DET_COSTES_ALB_CLIENTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMDetCostAlbCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetCostAlbCliCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetCostAlbCliLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetCostAlbCliLINEA_DET: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DET'
    end
    object QMDetCostAlbCliSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetCostAlbCliRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
      OnChange = QMDetCostAlbCliRIGChange
    end
    object QMDetCostAlbCliFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMDetCostAlbCliIMPORTE_IMPUTADO: TFloatField
      DisplayLabel = 'Imp. Imputado'
      FieldName = 'IMPORTE_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostAlbCliCANAL_ALB: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ALB'
    end
    object QMDetCostAlbCliID_S_ALB: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S_ALB'
    end
    object QMDetCostAlbCliEJERCICIO_ALB: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ALB'
    end
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'WHERE empresa=?empresa '
      'and ejercicio=?ejercicio'
      'and canal=?canal'
      'and cliente=?cliente'
      '')
    SelectSQL.Strings = (
      'SELECT tercero FROM EMP_CLIENTES'
      'WHERE empresa=?empresa '
      'and cliente=?cliente'
      ''
      '')
    UniDirectional = False
    DataSource = DSCabObras
    Left = 224
    Top = 152
    object xClientesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 320
    Top = 152
  end
  object QMImagenObras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DIB_OBRAS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CODIGO=?old_CODIGO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DIB_OBRAS'
      '  (EMPRESA,CODIGO,LINEA,ID_IMAGEN)'
      'VALUES'
      '  (?EMPRESA,?CODIGO,?LINEA,?ID_IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DIB_OBRAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DIB_OBRAS dib'
      'where empresa=?empresa and codigo=?codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DIB_OBRAS'
      'SET'
      '  ID_IMAGEN=?ID_IMAGEN '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSCabObras
    AfterDelete = GrabaImagen
    AfterEdit = GrabaImagen
    AfterPost = GrabaImagen
    AfterScroll = QMImagenObrasAfterScroll
    OnNewRecord = QMImagenObrasNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CODIGO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DIB_OBRAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 344
    object QMImagenObrasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMImagenObrasCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMImagenObrasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMImagenObrasID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
      OnChange = QMImagenObrasID_IMAGENChange
    end
    object QMImagenObrasNombre: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nombre'
      OnGetText = QMImagenObrasNombreGetText
      Size = 60
      Calculated = True
    end
  end
  object DSImagenObras: TDataSource
    DataSet = QMImagenObras
    Left = 136
    Top = 344
  end
  object QLineaDetObras: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) as NLinea'
      'from obr_det_obras'
      'where (empresa=?empresa and codigo=?codigo)')
    Transaction = TLocal
    AutoTrans = True
    Left = 440
    Top = 104
  end
  object QLineaCostAlbCli: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea_det) as NLineaDet'
      'from obr_det_costes_alb_clientes'
      'where (empresa=?empresa and codigo=?codigo and linea=?linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 440
    Top = 152
  end
  object xAlbaranesCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_cabeceras_albaran'
      
        'where empresa=?empresa and ejercicio=?ejercicio_alb and canal=?c' +
        'anal_alb'
      'and serie=?serie and tipo='#39'ALB'#39' and rig=?rig')
    UniDirectional = False
    DataSource = DSDetCostAlbCli
    Left = 224
    Top = 56
    object xAlbaranesCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlbaranesCliEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAlbaranesCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlbaranesCliSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlbaranesCliTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlbaranesCliRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAlbaranesCliALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlbaranesCliMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAlbaranesCliFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAlbaranesCliTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAlbaranesCliTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAlbaranesCliDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xAlbaranesCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xAlbaranesCliSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlbaranesCliFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xAlbaranesCliCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xAlbaranesCliNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xAlbaranesCliESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xAlbaranesCliBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xAlbaranesCliLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xAlbaranesCliBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xAlbaranesCliI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xAlbaranesCliS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xAlbaranesCliM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xAlbaranesCliC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object xAlbaranesCliAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAlbaranesCliS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xAlbaranesCliS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xAlbaranesCliB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xAlbaranesCliDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xAlbaranesCliDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xAlbaranesCliI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xAlbaranesCliI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xAlbaranesCliB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xAlbaranesCliI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xAlbaranesCliPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xAlbaranesCliI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xAlbaranesCliLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xAlbaranesCliENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xAlbaranesCliTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object xAlbaranesCliI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object xAlbaranesCliP_RETENCION: TFloatField
      DisplayLabel = '% Ret.'
      FieldName = 'P_RETENCION'
    end
    object xAlbaranesCliI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
    end
    object xAlbaranesCliTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object xAlbaranesCliA_IRPF: TIntegerField
      DisplayLabel = 'A. IRPF'
      FieldName = 'A_IRPF'
    end
    object xAlbaranesCliTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object xAlbaranesCliNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xAlbaranesCliPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xAlbaranesCliTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xAlbaranesCliID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xAlbaranesCliALMACEN_DEPOSITO: TFIBStringField
      DisplayLabel = 'Alm. Dep.'
      FieldName = 'ALMACEN_DEPOSITO'
      Size = 3
    end
    object xAlbaranesCliNUM_MOV_DEPOSITO: TIntegerField
      DisplayLabel = 'Nro. Mov. Dep'
      FieldName = 'NUM_MOV_DEPOSITO'
    end
    object xAlbaranesCliDEPOSITO: TIntegerField
      DisplayLabel = 'Deposito'
      FieldName = 'DEPOSITO'
    end
    object xAlbaranesCliDEVOLUCION_DEPOSITO: TIntegerField
      DisplayLabel = 'Dev. Dep'
      FieldName = 'DEVOLUCION_DEPOSITO'
    end
    object xAlbaranesCliIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xAlbaranesCliTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xAlbaranesCliPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object xAlbaranesCliI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xAlbaranesCliI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object xAlbaranesCliRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object xAlbaranesCliINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
    end
    object xAlbaranesCliCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xAlbaranesCliVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
  end
  object DSxAlbaranesCli: TDataSource
    DataSet = xAlbaranesCli
    Left = 320
    Top = 56
  end
  object QLineaCostProd: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea_det) as NLineaDet'
      'from obr_det_costes_prod'
      'where (empresa=?empresa and codigo=?codigo and linea=?linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 440
    Top = 200
  end
  object xOrdenesFab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord'
      
        'where empresa=?empresa and ejercicio=?ejercicio_of and canal=?ca' +
        'nal_of'
      'and series=?serie_of and rig_of=?rig')
    UniDirectional = False
    DataSource = DSDetCostProd
    Left = 224
    Top = 248
    object xOrdenesFabID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xOrdenesFabFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORD'
    end
    object xOrdenesFabCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object xOrdenesFabCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var. Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object xOrdenesFabCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object xOrdenesFabCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste Mo. Real'
      FieldName = 'COSTE_MO_REAL'
    end
    object xOrdenesFabCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object xOrdenesFabCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object xOrdenesFabCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
  end
  object DSxOrdenesFab: TDataSource
    DataSet = xOrdenesFab
    Left = 320
    Top = 248
  end
  object QMDetCostProd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DET_COSTES_PROD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA AND '
      '  LINEA_DET=?old_LINEA_DET ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DET_COSTES_PROD'
      
        '  (FECHA,IMPORTE_MAT_IMPUTADO,SERIE_OF,ID_ORDEN,CODIGO,RIG,CANAL' +
        '_OF,EJERCICIO_OF,EMPRESA,LINEA,LINEA_DET,IMPORTE_FIJO_IMPUTADO,I' +
        'MPORTE_VARIOS_IMPUTADO,IMPORTE_MAQ_IMPUTADO,IMPORTE_TEXT_IMPUTAD' +
        'O,IMPORTE_MO_IMPUTADO)'
      'VALUES'
      
        '  (?FECHA,?IMPORTE_MAT_IMPUTADO,?SERIE_OF,?ID_ORDEN,?CODIGO,?RIG' +
        ',?CANAL_OF,?EJERCICIO_OF,?EMPRESA,?LINEA,?LINEA_DET,?IMPORTE_FIJ' +
        'O_IMPUTADO,?IMPORTE_VARIOS_IMPUTADO,?IMPORTE_MAQ_IMPUTADO,?IMPOR' +
        'TE_TEXT_IMPUTADO,?IMPORTE_MO_IMPUTADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DET_COSTES_PROD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DET_COSTES_PROD'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DET_COSTES_PROD'
      'SET'
      '  FECHA=?FECHA '
      '  ,IMPORTE_MAT_IMPUTADO=?IMPORTE_MAT_IMPUTADO '
      '  ,SERIE_OF=?SERIE_OF '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,RIG=?RIG '
      '  ,CANAL_OF=?CANAL_OF '
      '  ,EJERCICIO_OF=?EJERCICIO_OF '
      '  ,IMPORTE_FIJO_IMPUTADO=?IMPORTE_FIJO_IMPUTADO '
      '  ,IMPORTE_VARIOS_IMPUTADO=?IMPORTE_VARIOS_IMPUTADO '
      '  ,IMPORTE_MAQ_IMPUTADO=?IMPORTE_MAQ_IMPUTADO '
      '  ,IMPORTE_TEXT_IMPUTADO=?IMPORTE_TEXT_IMPUTADO '
      '  ,IMPORTE_MO_IMPUTADO=?IMPORTE_MO_IMPUTADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    DataSource = DSDetObras
    OnNewRecord = QMDetCostProdNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO '
      'LINEA '
      'LINEA_DET ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DET_COSTES_PROD'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMDetCostProdEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetCostProdCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetCostProdLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetCostProdLINEA_DET: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DET'
    end
    object QMDetCostProdRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
      OnChange = QMDetCostProdRIGChange
    end
    object QMDetCostProdFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMDetCostProdID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetCostProdEJERCICIO_OF: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_OF'
    end
    object QMDetCostProdCANAL_OF: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_OF'
    end
    object QMDetCostProdSERIE_OF: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_OF'
      Size = 10
    end
    object QMDetCostProdIMPORTE_MAT_IMPUTADO: TFloatField
      DisplayLabel = 'Importe Mat. Imputado'
      FieldName = 'IMPORTE_MAT_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostProdIMPORTE_FIJO_IMPUTADO: TFloatField
      DisplayLabel = 'Importe Fijo Imputado'
      FieldName = 'IMPORTE_FIJO_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostProdIMPORTE_VARIOS_IMPUTADO: TFloatField
      DisplayLabel = 'Importe Vario Imputado'
      FieldName = 'IMPORTE_VARIOS_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostProdIMPORTE_MAQ_IMPUTADO: TFloatField
      DisplayLabel = 'Importe Maq. Imputado'
      FieldName = 'IMPORTE_MAQ_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostProdIMPORTE_TEXT_IMPUTADO: TFloatField
      DisplayLabel = 'Importe Text Imputado'
      FieldName = 'IMPORTE_TEXT_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostProdIMPORTE_MO_IMPUTADO: TFloatField
      DisplayLabel = 'Importe. M. Obre Imputado'
      FieldName = 'IMPORTE_MO_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
  end
  object QMDetObras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DET_OBRAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DET_OBRAS'
      
        '  (COMENTARIO,TOTAL_OFERTA_PRES_PED,COSTE_PREV,MARGEN_PREV,TOTAL' +
        '_FACTURADO,TOTAL_PDTE_FACTURAR,TOTAL_COSTE_ALB,TOTAL_COSTE_FAB,T' +
        'OTAL_COSTE_ALB_PROV,TOTAL_COSTE_VARIOS,TOTAL_COSTES,MARGEN_BENEF' +
        'ICIO,CODIGO,EMPRESA,LINEA,DESCRIPCION,ORDEN,TOTAL_COSTE_FIJO_OF,' +
        'TOTAL_COSTE_VARIOS_OF,TOTAL_COSTE_MAQ_OF,TOTAL_COSTE_TEXT_OF,TOT' +
        'AL_COSTE_MO_OF,TOTAL_COSTE_MAT_OF,PARTIDA)'
      'VALUES'
      
        '  (?COMENTARIO,?TOTAL_OFERTA_PRES_PED,?COSTE_PREV,?MARGEN_PREV,?' +
        'TOTAL_FACTURADO,?TOTAL_PDTE_FACTURAR,?TOTAL_COSTE_ALB,?TOTAL_COS' +
        'TE_FAB,?TOTAL_COSTE_ALB_PROV,?TOTAL_COSTE_VARIOS,?TOTAL_COSTES,?' +
        'MARGEN_BENEFICIO,?CODIGO,?EMPRESA,?LINEA,?DESCRIPCION,?ORDEN,?TO' +
        'TAL_COSTE_FIJO_OF,?TOTAL_COSTE_VARIOS_OF,?TOTAL_COSTE_MAQ_OF,?TO' +
        'TAL_COSTE_TEXT_OF,?TOTAL_COSTE_MO_OF,?TOTAL_COSTE_MAT_OF,?PARTID' +
        'A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DET_OBRAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DET_OBRAS'
      'where empresa=?empresa and codigo=?codigo'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DET_OBRAS'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      '  ,TOTAL_OFERTA_PRES_PED=?TOTAL_OFERTA_PRES_PED '
      '  ,COSTE_PREV=?COSTE_PREV '
      '  ,MARGEN_PREV=?MARGEN_PREV '
      '  ,TOTAL_FACTURADO=?TOTAL_FACTURADO '
      '  ,TOTAL_PDTE_FACTURAR=?TOTAL_PDTE_FACTURAR '
      '  ,TOTAL_COSTE_ALB=?TOTAL_COSTE_ALB '
      '  ,TOTAL_COSTE_FAB=?TOTAL_COSTE_FAB '
      '  ,TOTAL_COSTE_ALB_PROV=?TOTAL_COSTE_ALB_PROV '
      '  ,TOTAL_COSTE_VARIOS=?TOTAL_COSTE_VARIOS '
      '  ,TOTAL_COSTES=?TOTAL_COSTES '
      '  ,MARGEN_BENEFICIO=?MARGEN_BENEFICIO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,ORDEN=?ORDEN '
      '  ,TOTAL_COSTE_FIJO_OF=?TOTAL_COSTE_FIJO_OF '
      '  ,TOTAL_COSTE_VARIOS_OF=?TOTAL_COSTE_VARIOS_OF '
      '  ,TOTAL_COSTE_MAQ_OF=?TOTAL_COSTE_MAQ_OF '
      '  ,TOTAL_COSTE_TEXT_OF=?TOTAL_COSTE_TEXT_OF '
      '  ,TOTAL_COSTE_MO_OF=?TOTAL_COSTE_MO_OF '
      '  ,TOTAL_COSTE_MAT_OF=?TOTAL_COSTE_MAT_OF '
      '  ,PARTIDA=?PARTIDA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA ')
    DataSource = DSCabObras
    AfterOpen = QMDetObrasAfterOpen
    BeforeClose = QMDetObrasBeforeClose
    OnNewRecord = QMDetObrasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DET_OBRAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMDetObrasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetObrasCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetObrasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetObrasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMDetObrasCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QMDetObrasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetObrasPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      OnChange = QMDetObrasPARTIDAChange
      Size = 3
    end
    object QMDetObrasTOTAL_OFERTA_PRES_PED: TFloatField
      DisplayLabel = 'Total Ofer. Pres. Ped.'
      FieldName = 'TOTAL_OFERTA_PRES_PED'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasCOSTE_PREV: TFloatField
      DisplayLabel = 'Coste Prev.'
      FieldName = 'COSTE_PREV'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasMARGEN_PREV: TFloatField
      DisplayLabel = 'Margen Prev.'
      FieldName = 'MARGEN_PREV'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_FACTURADO: TFloatField
      DisplayLabel = 'Total Facturado'
      FieldName = 'TOTAL_FACTURADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_PDTE_FACTURAR: TFloatField
      DisplayLabel = 'Total Pend. Fact.'
      FieldName = 'TOTAL_PDTE_FACTURAR'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_ALB: TFloatField
      DisplayLabel = 'Total Coste Alb.'
      FieldName = 'TOTAL_COSTE_ALB'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_FAB: TFloatField
      DisplayLabel = 'Total Coste Fab.'
      FieldName = 'TOTAL_COSTE_FAB'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_ALB_PROV: TFloatField
      DisplayLabel = 'Total Coste Alb. Prov.'
      FieldName = 'TOTAL_COSTE_ALB_PROV'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_VARIOS: TFloatField
      DisplayLabel = 'Total Coste Vario'
      FieldName = 'TOTAL_COSTE_VARIOS'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTES: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTES'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasMARGEN_BENEFICIO: TFloatField
      DisplayLabel = 'Margen Ben.'
      FieldName = 'MARGEN_BENEFICIO'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_FIJO_OF: TFloatField
      DisplayLabel = 'Total Coste Fijo'
      FieldName = 'TOTAL_COSTE_FIJO_OF'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_VARIOS_OF: TFloatField
      DisplayLabel = 'Total Coste Vario'
      FieldName = 'TOTAL_COSTE_VARIOS_OF'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_MAQ_OF: TFloatField
      DisplayLabel = 'Total Coste Maq.'
      FieldName = 'TOTAL_COSTE_MAQ_OF'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_TEXT_OF: TFloatField
      DisplayLabel = 'Total Text'
      FieldName = 'TOTAL_COSTE_TEXT_OF'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_MO_OF: TFloatField
      DisplayLabel = 'Total M. Obra'
      FieldName = 'TOTAL_COSTE_MO_OF'
      DisplayFormat = ',##0.00'
    end
    object QMDetObrasTOTAL_COSTE_MAT_OF: TFloatField
      DisplayLabel = 'Total Coste Mat.'
      FieldName = 'TOTAL_COSTE_MAT_OF'
      DisplayFormat = ',##0.00'
    end
  end
  object QMDetCostVar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DET_COSTES_VARIOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA AND '
      '  LINEA_DET=?old_LINEA_DET ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DET_COSTES_VARIOS'
      
        '  (COMENTARIO,IMPORTE_IMPUTADO,CODIGO,EMPRESA,LINEA,LINEA_DET,FE' +
        'CHA)'
      'VALUES'
      
        '  (?COMENTARIO,?IMPORTE_IMPUTADO,?CODIGO,?EMPRESA,?LINEA,?LINEA_' +
        'DET,?FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DET_COSTES_VARIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DET_COSTES_VARIOS'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DET_COSTES_VARIOS'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      '  ,IMPORTE_IMPUTADO=?IMPORTE_IMPUTADO'
      '  ,FECHA=?FECHA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    DataSource = DSDetObras
    OnNewRecord = QMDetCostVarNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO '
      'LINEA '
      'LINEA_DET ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DET_COSTES_VARIOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
    object QMDetCostVarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetCostVarCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetCostVarLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetCostVarLINEA_DET: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DET'
    end
    object QMDetCostVarIMPORTE_IMPUTADO: TFloatField
      DisplayLabel = 'Imp. Imputado'
      FieldName = 'IMPORTE_IMPUTADO'
      DisplayFormat = ',##0.00'
      EditFormat = ',##0.00'
    end
    object QMDetCostVarCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 200
    end
    object QMDetCostVarFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object QLineaCostVar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea_det) as NLineaDet'
      'from obr_det_costes_varios'
      'where (empresa=?empresa and codigo=?codigo and linea=?linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 440
    Top = 248
  end
  object QLineaCostProv: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea_det) as NLineaDet'
      'from obr_det_costes_alb_prov'
      'where (empresa=?empresa and codigo=?codigo and linea=?linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 440
    Top = 296
  end
  object xAlbaranesProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select cab.fecha,det.* from ver_detalle_albaran_prov det'
      'join ver_cabeceras_albaran_prov cab on (det.id_e=cab.id_e)'
      
        'where cab.empresa=?empresa and cab.ejercicio=?ejercicio_alb and ' +
        'cab.canal=?canal_alb'
      
        'and cab.serie=?serie and cab.tipo='#39'ALP'#39' and cab.rig=?rig  and de' +
        't.linea=?linea_coste_imputado')
    UniDirectional = False
    DataSource = DSDetostAlbProv
    Left = 224
    Top = 296
    object xAlbaranesProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlbaranesProvEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAlbaranesProvCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlbaranesProvSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlbaranesProvTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlbaranesProvRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAlbaranesProvLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xAlbaranesProvALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlbaranesProvARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xAlbaranesProvTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAlbaranesProvUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xAlbaranesProvUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
    end
    object xAlbaranesProvPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xAlbaranesProvDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object xAlbaranesProvDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xAlbaranesProvDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xAlbaranesProvP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xAlbaranesProvPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xAlbaranesProvTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xAlbaranesProvP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xAlbaranesProvP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xAlbaranesProvBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xAlbaranesProvI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Descuento'
      FieldName = 'I_DESCUENTO'
    end
    object xAlbaranesProvB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xAlbaranesProvB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xAlbaranesProvC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object xAlbaranesProvC_RECARGO: TFloatField
      DisplayLabel = 'Cuota Rec.'
      FieldName = 'C_RECARGO'
    end
    object xAlbaranesProvT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object xAlbaranesProvM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xAlbaranesProvLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xAlbaranesProvENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xAlbaranesProvM_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object xAlbaranesProvUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xAlbaranesProvNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xAlbaranesProvID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xAlbaranesProvID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object xAlbaranesProvID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xAlbaranesProvID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object xAlbaranesProvFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_DET'
    end
    object xAlbaranesProvFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object xAlbaranesProvSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object xAlbaranesProvNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xAlbaranesProvORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xAlbaranesProvFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxAlbaranesProv: TDataSource
    DataSet = xAlbaranesProv
    Left = 320
    Top = 296
  end
  object QMDetCostAlbProv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DET_COSTES_ALB_PROV'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA AND '
      '  LINEA_DET=?old_LINEA_DET ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DET_COSTES_ALB_PROV'
      
        '  (ID_E_ALB,ID_E_DETALLES_ALB,CANAL_ALB,FECHA,IMPORTE_IMPUTADO,C' +
        'ODIGO,SERIE,RIG,EMPRESA,LINEA,LINEA_DET,LINEA_COSTE_IMPUTADO,DES' +
        'CRIPCION,ARTICULO,EJERCICIO_ALB)'
      'VALUES'
      
        '  (?ID_E_ALB,?ID_E_DETALLES_ALB,?CANAL_ALB,?FECHA,?IMPORTE_IMPUT' +
        'ADO,?CODIGO,?SERIE,?RIG,?EMPRESA,?LINEA,?LINEA_DET,?LINEA_COSTE_' +
        'IMPUTADO,?DESCRIPCION,?ARTICULO,?EJERCICIO_ALB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DET_COSTES_ALB_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DET_COSTES_ALB_PROV'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DET_COSTES_ALB_PROV'
      'SET'
      '  ID_E_ALB=?ID_E_ALB '
      '  ,ID_E_DETALLES_ALB=?ID_E_DETALLES_ALB '
      '  ,CANAL_ALB=?CANAL_ALB '
      '  ,FECHA=?FECHA '
      '  ,IMPORTE_IMPUTADO=?IMPORTE_IMPUTADO '
      '  ,SERIE=?SERIE '
      '  ,RIG=?RIG '
      '  ,LINEA_COSTE_IMPUTADO=?LINEA_COSTE_IMPUTADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,ARTICULO=?ARTICULO '
      '  ,EJERCICIO_ALB=?EJERCICIO_ALB '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    DataSource = DSDetObras
    OnNewRecord = QMDetCostAlbProvNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO '
      'LINEA '
      'LINEA_DET ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DET_COSTES_ALB_PROV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 296
    object QMDetCostAlbProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetCostAlbProvCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetCostAlbProvLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetCostAlbProvLINEA_DET: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DET'
    end
    object QMDetCostAlbProvSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetCostAlbProvRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetCostAlbProvFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMDetCostAlbProvLINEA_COSTE_IMPUTADO: TIntegerField
      DisplayLabel = 'Coste Imputado'
      FieldName = 'LINEA_COSTE_IMPUTADO'
      OnChange = QMDetCostAlbProvLINEA_COSTE_IMPUTADOChange
    end
    object QMDetCostAlbProvARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetCostAlbProvIMPORTE_IMPUTADO: TFloatField
      DisplayLabel = 'Imp. Imputado'
      FieldName = 'IMPORTE_IMPUTADO'
      DisplayFormat = ',##0.00'
    end
    object QMDetCostAlbProvID_E_ALB: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_E_ALB'
    end
    object QMDetCostAlbProvID_E_DETALLES_ALB: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_E_DETALLES_ALB'
    end
    object QMDetCostAlbProvCANAL_ALB: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ALB'
    end
    object QMDetCostAlbProvEJERCICIO_ALB: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ALB'
    end
    object QMDetCostAlbProvDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
  end
  object QLineaIngresos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea_det) as NLineaDet'
      'from obr_det_ingresos'
      'where (empresa=?empresa and codigo=?codigo and linea=?linea)')
    Transaction = TLocal
    AutoTrans = True
    Left = 440
    Top = 344
  end
  object QMDetIngr: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_DET_INGRESOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA AND '
      '  LINEA_DET=?old_LINEA_DET ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_DET_INGRESOS'
      
        '  (FECHA,IMPORTE_FAC,CODIGO,SERIE,RIG,EMPRESA,LINEA,LINEA_DET,CA' +
        'NAL_FAC,ID_S_FAC,EJERCICIO_FAC)'
      'VALUES'
      
        '  (?FECHA,?IMPORTE_FAC,?CODIGO,?SERIE,?RIG,?EMPRESA,?LINEA,?LINE' +
        'A_DET,?CANAL_FAC,?ID_S_FAC,?EJERCICIO_FAC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_DET_INGRESOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_DET_INGRESOS'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_DET_INGRESOS'
      'SET'
      '  FECHA=?FECHA '
      '  ,IMPORTE_FAC=?IMPORTE_FAC '
      '  ,SERIE=?SERIE '
      '  ,RIG=?RIG '
      '  ,CANAL_FAC=?CANAL_FAC '
      '  ,ID_S_FAC=?ID_S_FAC '
      '  ,EJERCICIO_FAC=?EJERCICIO_FAC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  LINEA_DET=?LINEA_DET ')
    DataSource = DSDetObras
    OnNewRecord = QMDetIngrNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO '
      'LINEA '
      'LINEA_DET ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_DET_INGRESOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 248
    object QMDetIngrEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetIngrCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMDetIngrLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetIngrLINEA_DET: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DET'
    end
    object QMDetIngrSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetIngrRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
      OnChange = QMDetIngrRIGChange
    end
    object QMDetIngrFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMDetIngrIMPORTE_FAC: TFloatField
      DisplayLabel = 'Imp. Fac.'
      FieldName = 'IMPORTE_FAC'
      DisplayFormat = ',##0.00'
    end
    object QMDetIngrCANAL_FAC: TIntegerField
      DisplayLabel = 'Canal Fac.'
      FieldName = 'CANAL_FAC'
    end
    object QMDetIngrID_S_FAC: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S_FAC'
    end
    object QMDetIngrEJERCICIO_FAC: TIntegerField
      DisplayLabel = 'Ejercicio Fac.'
      FieldName = 'EJERCICIO_FAC'
    end
  end
  object xFacturasCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_cabeceras_factura'
      
        'where empresa=?empresa and ejercicio=?ejercicio_fac and canal=?c' +
        'anal_fac'
      'and serie=?serie and tipo='#39'FAC'#39' and rig=?rig')
    UniDirectional = False
    DataSource = DSDetIngr
    Left = 224
    Top = 344
    object xFacturasCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFacturasCliEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFacturasCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFacturasCliSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacturasCliTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacturasCliRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xFacturasCliALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xFacturasCliMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xFacturasCliFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xFacturasCliTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xFacturasCliTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xFacturasCliDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xFacturasCliCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xFacturasCliSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xFacturasCliFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xFacturasCliCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xFacturasCliNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xFacturasCliESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xFacturasCliBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xFacturasCliLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xFacturasCliBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xFacturasCliI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xFacturasCliS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xFacturasCliM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xFacturasCliC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object xFacturasCliAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xFacturasCliS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xFacturasCliS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xFacturasCliB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xFacturasCliDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xFacturasCliDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xFacturasCliI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xFacturasCliI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xFacturasCliB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xFacturasCliI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xFacturasCliPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xFacturasCliI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xFacturasCliLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xFacturasCliENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xFacturasCliTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object xFacturasCliI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object xFacturasCliP_RETENCION: TFloatField
      DisplayLabel = '% Ret.'
      FieldName = 'P_RETENCION'
    end
    object xFacturasCliI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
    end
    object xFacturasCliFUERZA_VENCIMIENTOS: TIntegerField
      DisplayLabel = 'Fuerza Venc.'
      FieldName = 'FUERZA_VENCIMIENTOS'
    end
    object xFacturasCliRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xFacturasCliTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object xFacturasCliA_IRPF: TIntegerField
      DisplayLabel = 'A. IRPF'
      FieldName = 'A_IRPF'
    end
    object xFacturasCliTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object xFacturasCliDEVOLUCION: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'DEVOLUCION'
    end
    object xFacturasCliSIN_DETALLE: TIntegerField
      DisplayLabel = 'Sin Det.'
      FieldName = 'SIN_DETALLE'
    end
    object xFacturasCliASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xFacturasCliNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xFacturasCliREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xFacturasCliPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xFacturasCliI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Can.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xFacturasCliTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xFacturasCliID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xFacturasCliPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Autom.'
      FieldName = 'PROCESO_AUTO'
    end
    object xFacturasCliFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object xFacturasCliIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xFacturasCliRECT: TIntegerField
      DisplayLabel = 'Rectificativa'
      FieldName = 'RECT'
    end
    object xFacturasCliID_RECT: TIntegerField
      DisplayLabel = 'ID Rect.'
      FieldName = 'ID_RECT'
    end
    object xFacturasCliTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xFacturasCliPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object xFacturasCliI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xFacturasCliI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object xFacturasCliRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object xFacturasCliINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
    end
    object xFacturasCliCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xFacturasCliVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
  end
  object DSxFacturasCli: TDataSource
    DataSet = xFacturasCli
    Left = 320
    Top = 344
  end
  object frLstObras: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLstObrasGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 568
    Top = 8
    ReportForm = {19000000}
  end
  object frDBLstObras: TfrDBDataSet
    DataSet = xLstObras
    Left = 848
    Top = 56
  end
  object xLstObras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_cab_obras'
      'where empresa=?empresa and codigo=?codigo')
    UniDirectional = False
    DataSource = DSCabObras
    AfterOpen = xLstObrasAfterOpen
    BeforeClose = xLstObrasBeforeClose
    Left = 568
    Top = 56
  end
  object DSxLstObras: TDataSource
    DataSet = xLstObras
    Left = 704
    Top = 56
  end
  object frDBLstDetObras: TfrDBDataSet
    DataSet = xLstDetObras
    Left = 848
    Top = 104
  end
  object xLstDetObras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_det_obras'
      'where empresa=?empresa and codigo=?codigo'
      'order by linea')
    UniDirectional = False
    DataSource = DSxLstObras
    AfterOpen = xLstDetObrasAfterOpen
    BeforeClose = xLstDetObrasBeforeClose
    Left = 568
    Top = 104
  end
  object DSxLstDetObras: TDataSource
    DataSet = xLstDetObras
    Left = 704
    Top = 104
  end
  object frDBLstDetCostesAlbCli: TfrDBDataSet
    DataSet = xLstDetCostesAlbCli
    Left = 848
    Top = 152
  end
  object xLstDetCostesAlbCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_det_costes_alb_clientes'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    DataSource = DSxLstDetObras
    Left = 568
    Top = 152
  end
  object DSxLstDetCostesAlbCli: TDataSource
    DataSet = xLstDetCostesAlbCli
    Left = 704
    Top = 152
  end
  object frDBLstDetCostesAlbProv: TfrDBDataSet
    DataSet = xLstDetCostesAlbProv
    Left = 848
    Top = 200
  end
  object xLstDetCostesAlbProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_det_costes_alb_prov'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    DataSource = DSxLstDetObras
    Left = 568
    Top = 200
  end
  object DSxLstDetCostesAlbProv: TDataSource
    DataSet = xLstDetCostesAlbProv
    Left = 704
    Top = 200
  end
  object frDBLstDetCostesProd: TfrDBDataSet
    DataSet = xLstDetCostesProd
    Left = 848
    Top = 248
  end
  object xLstDetCostesProd: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_det_costes_prod'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    DataSource = DSxLstDetObras
    Left = 568
    Top = 248
  end
  object DSXLstDetCostesProd: TDataSource
    DataSet = xLstDetCostesProd
    Left = 704
    Top = 248
  end
  object frDBLstDetCostesVar: TfrDBDataSet
    DataSet = xLstDetCostesVar
    Left = 848
    Top = 296
  end
  object xLstDetCostesVar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_det_costes_varios'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    DataSource = DSxLstDetObras
    AfterOpen = xLstDetCostesVarAfterOpen
    Left = 568
    Top = 296
  end
  object DSxLstDetCostesVar: TDataSource
    DataSet = xLstDetCostesVar
    Left = 704
    Top = 296
  end
  object frDBLstDetCostesIngr: TfrDBDataSet
    DataSet = xLstDetCostesIngr
    Left = 848
    Top = 344
  end
  object xLstDetCostesIngr: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_det_ingresos'
      'where empresa=?empresa and codigo=?codigo and linea=?linea'
      'order by linea_det')
    UniDirectional = False
    DataSource = DSxLstDetObras
    Left = 568
    Top = 344
  end
  object DSLstDetCostesOngr: TDataSource
    DataSet = xLstDetCostesIngr
    Left = 704
    Top = 344
  end
  object xPartida: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from obr_sys_partida'
      'where partida=?partida')
    UniDirectional = False
    DataSource = DSDetObras
    Left = 224
    Top = 200
    object xPartidaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxPartida: TDataSource
    DataSet = xPartida
    Left = 320
    Top = 200
  end
  object xAlbaranesCliDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select sum(t_coste) as t_coste from ver_detalle_albaran'
      
        'where empresa=?empresa and ejercicio=?ejercicio_alb and canal=?c' +
        'anal_alb'
      'and serie=?serie and tipo='#39'ALB'#39' and rig=?rig')
    UniDirectional = False
    DataSource = DSDetCostAlbCli
    Left = 224
    Top = 104
    object xAlbaranesCliDetT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
  end
  object DSxAlbaranesCliDet: TDataSource
    DataSet = xAlbaranesCliDet
    Left = 320
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
    Left = 440
    Top = 56
  end
end
